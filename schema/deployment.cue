package schema

import apps "github.com/kystverket/driftly/schema/crd/apps/v1"

#Deployment: apps.#Deployment & {
	spec: {
		template: {
			spec: {
				containers: [{
					readinessProbe?: {
						failureThreshold:    int & >0 | *10
						initialDelaySeconds: int & >=0 | *20
						periodSeconds:       int & >0 | *5
						timeoutSeconds:      int & >0 | *1
					}
					livenessProbe?: {
						initialDelaySeconds: int & >=0 | *20
						periodSeconds:       int & >0 | *5
						timeoutSeconds:      int & >0 | *1
						failureThreshold:    int & >0 | *10
					}
					resources: {
						requests: {
							"ephemeral-storage": string | *"64Mi"
						}
						limits: {
							"ephemeral-storage": string | *"64Mi"
						}
					}
				}]
			}
		}
	}
}
