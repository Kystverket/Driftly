package platform

import apps "github.com/kystverket/driftly/platform/crd/argocd/v1alpha1"

import akv2k8s "github.com/kystverket/driftly/platform/crd/akv2k8s/v1"

import schema "github.com/kystverket/driftly/schema"

import p "path"

// #App: apps.#ApplicationSet
#App: {
	let C = #Config
	#Config: {
		team:  string
		env:   "dev" | "test" | "prod"
		kargo: bool | *true
		roles: {
			dev: {
				name: string
				id:   string
			}
			admin: {
				name: string
				id:   string
			}
		}
	}
	appset: apps.#ApplicationSet & {
		metadata: {
			name:      C.team + "-" + C.env
			namespace: "argocd"
		}
		spec: {
			goTemplate: true
			goTemplateOptions: ["missingkey=error"]
			generators: [{
				git: {
					repoURL:  "git@github.com:\(schema.#Organization.owner.name)/\(schema.#Organization.owner.repo).git"
					revision: "HEAD"
					directories: [{path: p.Join(["apps/_rendered", C.team, "/**/", C.env, "/*"])}]
				}

			}]
			template: {
				metadata: {
					name: "{{index .path.segments 2}}-{{index .path.segments 4}}-{{index .path.segments 3}}-{{index .path.segments 5}}"
					annotations: {
						"argocd.argoproj.io/manifest-generate-paths": "."
					}
					labels: {
						team: C.team
					}
				}
				spec: {
					project: C.team + "-" + C.env
					source: {
						plugin: {
							name: "kargo-cmp"
							env: [{
								name:  "IMAGE"
								value: "{{index .path.segments 2}}/{{index .path.segments 4}}/{{index .path.segments 3}}/{{index .path.segments 5}}"
							}]
						}
						repoURL:        "git@github.com:\(schema.#Organization.owner.name)/\(schema.#Organization.owner.repo).git"
						targetRevision: "HEAD"
						path:           "{{.path.path}}"
						//directory: recurse: true
					}
					destination: {
						server:    "https://kubernetes.default.svc"
						namespace: "{{index .path.segments 2}}-{{index .path.segments 4}}-{{index .path.segments 3}}"
					}
					ignoreDifferences: [
						{
							group: ""
							kind:  "ServiceAccount"
							jsonPointers: ["/metadata/annotations", "/metadata/labels"]
						},
						{
							group: ""
							kind:  "Secret"
							name:  schema.#Organization.pullSecret
							jsonPointers: ["/data"]
						},
					]
					syncPolicy: {
						automated: {
							enabled:  true
							prune:    true
							selfHeal: true
						}
						managedNamespaceMetadata: {
							labels: {
								"component": "platform-apps"
								"team":      C.team
							}
						}
						syncOptions: ["CreateNamespace=true"]
					}
				}
			}
		}
	}
	if C.kargo & C.env == "dev" {
		// could be imported as CRDs but config is small enough
		kargoProject: {
			apiVersion: "kargo.akuity.io/v1alpha1"
			kind:       "Project"
			metadata: {
				name:      "\(C.team)-kargo"
				namespace: "kargo"
			}
		}
		secret: akv2k8s.#AzureKeyVaultSecret & {
			metadata: {
				name:      "\(schema.#Organization.owner.short)-ghcr"
				namespace: "\(C.team)-kargo"
				labels: {
					"kargo.akuity.io/cred-type": "image"
				}
				annotations: {
					"kargo.akuity.io/description": "Github container registry pull secret"
				}
			}
			spec: {
				output: {
					secret: {
						name: "\(schema.#Organization.owner.short)-ghcr"
						type: "Opaque"
					}
				}
				vault: {
					name: schema.#Organization.vault
					object: {
						name:        "akv-\(schema.#Organization.owner.short)-ghcr-kargo"
						type:        "multi-key-value-secret"
						contentType: "application/x-json"
					}
				}
			}
		}
		kargoProjectConfig: {
			apiVersion: "kargo.akuity.io/v1alpha1"
			kind:       "ProjectConfig"
			// project config must be in project namespace
			metadata: {
				name:      "\(C.team)-kargo"
				namespace: "\(C.team)-kargo"
			}
			spec: promotionPolicies: [{
				stageSelector: matchLabels: {
					stage: "dev"
				}
				autoPromotionEnabled: true
			}]
		}
		// ServiceAccount for dev users mapped via Entra ID (in team project namespace)
		kargoDevServiceAccount: {
			apiVersion: "v1"
			kind:       "ServiceAccount"
			metadata: {
				name:      "\(C.team)-dev"
				namespace: "\(C.team)-kargo"
				annotations: {
					"argocd.argoproj.io/sync-wave": "1"
					"kargo.akuity.io/description":  "Dev team access via Entra ID"
					"rbac.kargo.akuity.io/claims":  "{\"groups\":[\"\(C.roles.dev.id)\"]}"
				}
			}
		}
		// Bind dev ServiceAccount to kargo-viewer role in project namespace
		kargoDevRoleBinding: {
			apiVersion: "rbac.authorization.k8s.io/v1"
			kind:       "RoleBinding"
			metadata: {
				name:      "\(C.team)-dev"
				namespace: "\(C.team)-kargo"
				annotations: {
					"argocd.argoproj.io/sync-wave": "2"
				}
			}
			roleRef: {
				apiGroup: "rbac.authorization.k8s.io"
				kind:     "Role"
				name:     "kargo-promoter"
			}
			subjects: [{
				kind:      "ServiceAccount"
				name:      "\(C.team)-dev"
				namespace: "\(C.team)-kargo"
			}]
		}
		// ServiceAccount for admin users mapped via Entra ID (in team project namespace)
		kargoAdminServiceAccount: {
			apiVersion: "v1"
			kind:       "ServiceAccount"
			metadata: {
				name:      "\(C.team)-admin"
				namespace: "\(C.team)-kargo"
				annotations: {
					"argocd.argoproj.io/sync-wave": "1"
					"kargo.akuity.io/description":  "Admin team access via Entra ID"
					"rbac.kargo.akuity.io/claims":  "{\"groups\":[\"\(C.roles.admin.id)\"]}"
				}
			}
		}
		// Bind admin ServiceAccount to kargo-admin role in project namespace
		kargoAdminRoleBinding: {
			apiVersion: "rbac.authorization.k8s.io/v1"
			kind:       "RoleBinding"
			metadata: {
				name:      "\(C.team)-admin"
				namespace: "\(C.team)-kargo"
				annotations: {
					"argocd.argoproj.io/sync-wave": "2"
				}
			}
			roleRef: {
				apiGroup: "rbac.authorization.k8s.io"
				kind:     "Role"
				name:     "kargo-admin"
			}
			subjects: [{
				kind:      "ServiceAccount"
				name:      "\(C.team)-admin"
				namespace: "\(C.team)-kargo"
			}]
		}
	}
	appproj: apps.#AppProject & {
		metadata: {
			name:      C.team + "-" + C.env
			namespace: "argocd"
			annotations: {
				"argocd.argoproj.io/sync-wave": "-1"
			}
		}
		spec: {
			clusterResourceWhitelist: [
				{
					group: "*"
					kind:  "Namespace"
				},
			]
			description: "team \(C.team)"
			destinations: [
				{
					name:      "*"
					namespace: "\(C.team)-\(C.env)-*"
					server:    "*"
				},
				{
					name:      "*"
					namespace: "\(C.team)-kargo"
					server:    "*"
				},
				{
					name:      "*"
					namespace: schema.#Organization.gateway.namespace
					server:    "*"
				},
			]
			namespaceResourceWhitelist: [{
				group: "*"
				kind:  "*"
			}]
			roles: [
				{
					groups: [C.roles.dev.id]
					name: "dev"
					policies: [
						"p, proj:\(C.team)-\(C.env):dev, applications, get, \(C.team)-\(C.env)/*, allow",
						"p, proj:\(C.team)-\(C.env):dev, logs, get, \(C.team)-\(C.env)/*, allow",
					]
				}, {
					groups: [C.roles.admin.id]
					name: "admin"
					policies: [
						"p, proj:\(C.team)-\(C.env):admin, applications, get, \(C.team)-\(C.env)/*, allow",
						"p, proj:\(C.team)-\(C.env):admin, logs, get, \(C.team)-\(C.env)/*, allow",
					]
				},
			]
			sourceRepos: [
				"https://github.com/\(schema.#Organization.owner.name)/*",
				"git@github.com:\(schema.#Organization.owner.name)/*",
			]
		}
	}
	...
}

#Apps: {
	_config: #App.#Config

	dev: #App & {
		#Config: _config & {
			env: "dev"
		}
		...
	}
	test?: #App & {
		#Config: _config & {
			env: "test"
		}
		...
	}
	prod?: #App & {
		#Config: _config & {
			env: "prod"
		}
		...
	}
}
