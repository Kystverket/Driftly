package kube

import schema "github.com/kystverket/driftly/schema"

examples: full: schema.#App & {
	// Define a reusable base for all environments
	_base: schema.#AppSchema & {
		config: {
			service: "repo"
			team:    "fyr"
			app:     "full"
			image:   "ghcr.io/\(schema.#Organization.owner.name)/\(service)/example-frontend"
			envVars: {
				API_ENDPOINT: "http://backend:5000"
				ENV:          config.env
			}
			port: 3000
			ingress: {
				// fullexample.dev/test/prod.corp.cloud
				hostname:    "fullexample.\(config.env).\(schema.#Organization.domain)"
				path:        "/"
				pathRewrite: "/frontend"
			}
			// Provision managed identity in azure to allow access to other PaaS services
			managedIdentity: true
			instrumentation: "nodejs"
			command: ["/app/entrypoint.sh"]
			// Allow connection from other service in the cluster
			inboundAccess: [{
				team:    "fyr"
				service: "otherservice"
				app:     "otherapp"
			}]
			outboundAccess: [
				// Host
				{host: "api.example.com"},
				// Pattern
				{hostPattern: "*.example.com"},
				// Or just full internet access
				{allowInternet: true},
			]
			readiness: {
				path: "/isready"
			}
			liveness: {
				path: "/isalive"
			}
		}

	}
	dev: {
		_base
		config: {
			ingress: {
				// Allow access from specific CIDR ranges (e.g., office network or VPN)
				cidr: [
					"10.100.100.10/32",
				]
				// Lock dev and test behind  entraID authentication
				entraID: true
			}
		}
	}
	test: {
		_base
		config: {
			ingress: {
				// Allow access from specific CIDR ranges (e.g., office network or VPN)
				cidr: [
					"10.100.100.10/32",
				]
				// Lock dev and test behind  entraID authentication
				entraID: true
			}
		}
	}
	prod: _base & {
		config: {
			replicas: {
				min:                    3
				max:                    5
				cpuThresholdPercentage: 90
			}
		}
	}
}
