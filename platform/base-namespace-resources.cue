package platform

import (
	akv "github.com/kystverket/driftly/platform/crd/akv2k8s/v1"
	otel_alphav1 "github.com/kystverket/driftly/platform/crd/opentelemetry/v1alpha1"
	schema "github.com/kystverket/driftly/schema"
	cilium "github.com/kystverket/driftly/platform/crd/cilium/v2"
)

baseResources: {
	instrumentation: otel_alphav1.#Instrumentation & {
		metadata: {
			name:      "instrumentation"
			namespace: ""
		}
		spec: {
			go: {}
			python: {}
			dotnet: {}
			nodejs: {}
			exporter: {
				endpoint: "http://otel-collector.observability.svc.cluster.local:4318"
			}
			propagators: [
				"tracecontext",
				"baggage",
			]
			sampler: {
				type:     "parentbased_traceidratio"
				argument: "1"
			}
		}
	}
	pullsecret: akv.#AzureKeyVaultSecret & {
		metadata: {
			name:      schema.#AppSchema.#Base.imagePullSecret
			namespace: ""
		}
		spec: {
			vault: {
				name: schema.#Organization.vault
				object: {
					name: "akv-\(schema.#Organization.pullSecret)"
					type: "secret"
				}
			}
			output: secret: {
				name:    schema.#AppSchema.#Base.imagePullSecret
				dataKey: ".dockerconfigjson"
				type:    "kubernetes.io/dockerconfigjson"
			}
		}
	}
	baseNetworkPolicy: cilium.#CiliumNetworkPolicy & {
		metadata: {
			name:      "base-policy"
			namespace: ""
		}
		spec: {
			endpointSelector: {}
			ingress: [{
				fromEndpoints: [{
					matchLabels: "k8s:io.kubernetes.pod.namespace": "aks-istio-ingress"
				}]
			}, {
				// Allow inbound from apps in same namespace
				fromEndpoints: [{}]
			}]
			egress: [{
				// ALlow DNS
				toEndpoints: [{
					matchLabels: {
						"k8s:io.kubernetes.pod.namespace": "kube-system"
						"k8s:k8s-app":                     "kube-dns"
					}
				}]
				toPorts: [{
					ports: [{
						port:     "53"
						protocol: "ANY"
					}]
					rules: dns: [{matchPattern: "*"}]
				}]
			}, {
				toFQDNs: [{matchName: "login.microsoftonline.com"}]
				toPorts: [{
					ports: [{port: "443"}]
				}]
			}, {
				// Allow outbound to observability collector
				toEndpoints: [{matchLabels: "k8s:io.kubernetes.pod.namespace": "observability"}]
				toPorts: [{
					ports: [{
						port: "4317"
					}, {
						port: "4318"
					}]
				}]
			}, {
				// Allow outbound to apps in same namespace
				toEndpoints: [{}]
			}]
		}
	}
}
