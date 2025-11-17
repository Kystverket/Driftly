package schema

import (
	core "github.com/kystverket/driftly/schema/crd/core/v1"
	cilium "github.com/kystverket/driftly/schema/crd/cilium/v2"
	istio "github.com/kystverket/driftly/schema/crd/istio/v1"
	autoscaling "github.com/kystverket/driftly/schema/crd/autoscaling/v2"
	akv "github.com/kystverket/driftly/schema/crd/akv2k8s/v1"
	"strings"
	"net"
)

_validKubernetesName: string & =~"^[a-z0-9]([-a-z0-9]*[a-z0-9])?$" & strings.MaxRunes(63)
#AppSchema: {
	let C = config

	// Base configuration for application 
	config: {
		// Team responsible for the application
		team!: "teamFOO" | "teamBAR" | "fyr"
		// Deployment environment
		env!: "dev" | "test" | "prod"
		// Service (usually git repo)
		service!: string & _validKubernetesName
		// App (usually the conatiner image built)
		app!:  string & _validKubernetesName
		image: string | *"ghcr.io/\(#Organization.owner.name)/\(service)/\(app)"
		tag:   string | *"latest"
		envVars?: [string]: string
		port: int & >0 | *8080
		type: *"deployment" | "job" | "cronJob"
		ingress?: {
			hostname: string & =~"^[a-z-]+.\(C.env).\(#Organization.domain)"
			// whitelisting if only accessible for specific IPs
			cidr: [...net.IPCIDR] | *[]
			entraID: bool | *false
		}
		managedIdentity:  bool | *false
		createPullSecret: bool | *true
		instrumentation?: "go" | "python" | "nodejs" | "dotnet"

		// Promotion strategy for the application
		// Manual: No promotion, tags must be specified in tag fields
		// SemVer: Kargo will monitor github container registry for new semver tags 
		// Lexical (default): Kargo will monitor github container registry for timestamp based tags
		// https://docs.kargo.io/user-guide/how-to-guides/working-with-warehouses/
		promotion: {
			strategy: "Manual" | "SemVer" | *"Lexical"
		}
		// Argo cmp expects this tag to identify which apps are managed by be updated
		if C.promotion.strategy != "Manual" {
			tag: "replacedbyargocmp"
		}

		command?: [...string]
		envFrom?: [...core.#EnvFromSource]

		//inbound from another app
		inboundAccess?: [...{
			service!: string & _validKubernetesName
			app!:     string & _validKubernetesName
			env:      "dev" | "test" | "prod" | *C.env
			port:     string & =~"^[0-9]+$" | *"\(C.port)"
		}]

		//outbound to an external address

		outboundAccess?: [...{
			host?:        string & =~"^([a-zA-Z0-9.-]+)$"
			hostPattern?: string & =~"^([a-zA-Z0-9.*-]+)$"
			port:         string & =~"^[0-9]+$" | *"443"

			matchN(>=2, [
				{host!: string},
				{hostPattern!: string},
				{port!: string},
			]) | error("At least two of fields in OutboundAccess must be defined")
		}]

		replicas: {
			min:                    int & >=1 | *1
			max:                    int & >=min | *min
			cpuThresholdPercentage: int & >0 & <=100 | *80
		}

		readiness?: {
			port: int & >0 | *C.port
			path: string | *"/isready"
		}
		liveness?: {
			port: int & >0 | *C.port
			path: string | *"/isalive"
		}

	}

	// Templates to be reused across resources
	#Base: {
		imagePullSecret: "\(#Organization.pullSecret)"

		Labels: {
			service: C.service
			app:     C.app
			env:     C.env
			team:    C.team
			...
		}

		Metadata: {
			name:      C.app
			namespace: C.team + "-" + C.env + "-" + C.service
			labels:    Labels
			...
		}

		PodTemplate: core.#PodTemplateSpec & {
			metadata: labels: Labels
			spec: {
				securityContext: #PodSecurityContext
				affinity: {
					podAntiAffinity: {
						requiredDuringSchedulingIgnoredDuringExecution: [{
							labelSelector: {
								matchLabels: {
									Labels
								}
							}
							topologyKey: "kubernetes.io/hostname"
						}]
					}
				}
				imagePullSecrets: [{
					name: imagePullSecret
				}]
				containers: [{
					image: C.image + ":" + C.tag
					name:  C.app

					securityContext: #ContanerSecurityContext

					if C.envVars != _|_ {
						env: [for k, v in C.envVars {
							name:  k
							value: v
						}]
					}
					if C.envFrom != _|_ {
						envFrom: C.envFrom
					}
					if C.command != _|_ {
						command: C.command
					}

					if C.readiness != _|_ {
						readinessProbe: {
							httpGet: {
								port: C.readiness.port
								path: C.readiness.path
							}
						}
					}
					if C.liveness != _|_ {
						livenessProbe: {
							httpGet: {
								port: C.liveness.port
								path: C.liveness.path
							}
						}
					}
				}]
			}
		}
	}

	if C.type == "deployment" {
		deployment: #Deployment & {
			metadata: #Base.Metadata
			spec: {
				replicas: C.replicas.min
				selector: matchLabels: #Base.Labels
				template: #Base.PodTemplate & {}
			}
		}
	}
	if C.type == "job" {
		// Job should disable auetoscaling
		config: replicas: {
			max: 1
			min: 1
		}
		job: #Job & {
			metadata: #Base.Metadata
			spec: {
				template: #Base.PodTemplate & {}
			}
		}
	}
	if C.ingress != _|_ {
		ingress: {
			httpRoute: #HTTPRoute & {
				metadata: #Base.Metadata
				spec: {
					hostnames: [C.ingress.hostname]
					rules: [{
						backendRefs: [{
							name: C.app
							port: C.port
						}]
					}]
				}
			}
		}
		if C.ingress.entraID {
			istioEntraIDPolicy: istio.#AuthorizationPolicy & {
				metadata: {
					name:      #Base.Metadata.name + "-entraid"
					namespace: #Organization.gateway.namespace
					labels:    #Base.Metadata.labels
				}
				spec: {
					action: "CUSTOM"
					provider: name: "oauth2-proxy"
					rules: [{
						to: [{
							operation: hosts: [C.ingress.hostname + "/*", C.ingress.hostname]
						}]
					}]
				}
			}
		}
		if len(C.ingress.cidr) > 0 {
			istioWhitelistPolicy: istio.#AuthorizationPolicy & {
				metadata: {
					name:      #Base.Metadata.name + "-whitelist"
					namespace: #Base.Metadata.namespace
					labels:    #Base.Metadata.labels
				}
				spec: {
					action: "DENY"
					provider: name: "oauth2-proxy"
					rules: [{
						to: [{
							operation: hosts: [C.ingress.hostname + "/*"]
						}]
						from: [{
							source: {
								notRemoteIpBlocks: [for cidr in C.ingress.cidr {
									cidr
								}]
							}
						}]
					}]
				}
			}
		}
	}
	if C.createPullSecret {
		pullsecret: akv.#AzureKeyVaultSecret & {
			metadata: {
				name:      #Base.imagePullSecret
				namespace: #Base.Metadata.namespace
				labels:    #Base.Labels
			}
			spec: {
				vault: {
					name: #Organization.vault
					object: {
						name: "akv-\(#Organization.pullSecret)"
						type: "secret"
					}
				}
				output: secret: {
					name:    #Base.imagePullSecret
					dataKey: ".dockerconfigjson"
					type:    "kubernetes.io/dockerconfigjson"
				}
			}
		}
	}
	if C.port != _|_ {
		#Base: PodTemplate: spec: containers: [{
			ports: [{
				containerPort: C.port
			}]
		}]
		service: core.#Service & {
			metadata: #Base.Metadata
			spec: {
				type:     "ClusterIP"
				selector: #Base.Labels
				ports: [{
					name:       "http-\(C.app)"
					port:       C.port
					targetPort: C.port
					protocol:   "TCP"
				}]
			}
		}
	}

	if C.replicas.max > C.replicas.min {
		autoscaler: autoscaling.#HorizontalPodAutoscaler & {
			metadata: #Base.Metadata
			spec: {
				metrics: [{
					type: "Resource"
					resource: {
						name: "cpu"
						target: {
							averageUtilization: C.replicas.cpuThresholdPercentage
							type:               "Utilization"
						}
					}
				}]
				scaleTargetRef: {
					kind:       "Deployment"
					name:       C.app
					apiVersion: "apps/v1"
				}
				minReplicas: C.replicas.min
				maxReplicas: C.replicas.max
			}
		}
	}

	// Setup SA and mounting of serviceaccount
	if C.managedIdentity {
		serviceAccount: core.#ServiceAccount & {
			metadata: #Base.Metadata
			metadata: labels: "\(#Organization.owner.short)-managed-identity": "true"
		}
		#Base: PodTemplate: {
			spec: serviceAccountName: C.app
			metadata: labels: "azure.workload.identity/use": "true"
		}
	}
	if C.instrumentation != _|_ {
		#Base: PodTemplate: {
			metadata: annotations: "instrumentation.opentelemetry.io/inject-\(C.instrumentation)": "true"
			spec: containers: [{
				env: [{
					name:  "OTEL_EXPORTER_OTLP_ENDPOINT"
					value: "http://otel-collector.\(#Organization.observability.namespace):4317"
				}, {
					name:  "OTEL_RESOURCE_ATTRIBUTES"
					value: "deployment.environment.name=\(C.env),service.name=\(C.app),service.namespace=\(C.service)"
				}]
			}]
		}
	}
	kargo?: #kargo
	// Add kargo resources if not manual
	if C.promotion.strategy != "Manual" {
		// Workaround since CUE does not support passing the parent struct as context
		kargo: #kargo & {
			AppConfig: {
				image: C.image
				promotion: strategy: C.promotion.strategy
				service: C.service
				app:     C.app
				env:     C.env
				team:    C.team
			}
		}
	}

	// Inbound access from other apps
	if C.inboundAccess != _|_ {
		ciliumInboundPolicy: cilium.#CiliumNetworkPolicy & {
			apiVersion: "cilium.io/v2"
			kind:       "CiliumNetworkPolicy"
			metadata: {
				name:      "inbound-" + C.app + "-" + C.env
				namespace: #Base.Metadata.namespace
				labels:    #Base.Labels
			}
			spec: {
				endpointSelector: {
					matchLabels: {
						service: C.service
						app:     C.app
						env:     C.env
					}
				}
				ingress: [for r in C.inboundAccess {
					fromEndpoints: [{
						{
							matchLabels: {
								service: r.service
								app:     r.app
								env:     r.env
							}
						}
					}]
					toPorts: [{
						ports: [{
							port: r.port
						}]
					}]
				}]
			}
		}
	}

	// Outbound access
	if C.outboundAccess != _|_ {
		ciliumOutboundPolicy: cilium.#CiliumNetworkPolicy & {
			apiVersion: "cilium.io/v2"
			kind:       "CiliumNetworkPolicy"
			metadata: {
				name:      "outbund-" + C.app + "-" + C.env
				namespace: #Base.Metadata.namespace
				labels:    #Base.Labels
			}
			spec: {
				endpointSelector: {
					matchLabels: {
						service: C.service
						app:     C.app
						env:     C.env
					}
				}
				egress: [for r in C.outboundAccess {
					{
						toFQDNs: [
							if r.host != _|_ {
								{matchName: r.host}
							},
							if r.hostPattern != _|_ {
								{matchPattern: r.hostPattern}
							},
						]
						toPorts: [{
							ports: [{
								port: r.port
							}]
						}]
					}
				}]
			}
		}
	}

	// allow adding more resources to the app
	...
}

#App: {
	dev?: #AppSchema & {
		config: {
			env: "dev"
		}
	}
	test?: #AppSchema & {
		config: {
			env: "test"
		}
	}
	prod?: #AppSchema & {
		config: {
			env: "prod"
		}
	}
}
