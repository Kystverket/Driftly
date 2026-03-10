package platform

import akv2k8s "github.com/kystverket/driftly/platform/crd/akv2k8s/v1"

import schema "github.com/kystverket/driftly/schema"

apps: {for t in schema.#Organization.teams {
	"\(t.name)": #Apps & {
		config: {
			team: t.name
			roles: {for r in t.roles {
				"\(r.role)": {
					name: r.entraName
					id:   r.entraID
				}
			}
			}
		}
	}
}}

apps: platform: {
	config: {
		team: "platform"
	}
	dev: {
		kyvPlatformDeployKey: akv2k8s.#AzureKeyVaultSecret & {
			metadata: {
				name:      "kyv-platform-deploy-key"
				namespace: "\(config.team)-kargo"
				labels: {
					"kargo.akuity.io/cred-type": "git"
				}
				annotations: {
					"kargo.akuity.io/description": "kyv platform ssh deploy key"
				}
			}
			spec: {
				vault: {
					name: schema.#Organization.vault
					object: {
						name:        "id-platform-private-kargo"
						type:        "multi-key-value-secret"
						contentType: "application/x-json"
					}
				}
				output: {
					secret: {
						name: "kyv-platform-deploy-key"
						type: "Opaque"
					}
				}
			}
		}
	}
}
