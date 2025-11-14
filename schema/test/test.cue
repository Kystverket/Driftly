package kube

import schema "github.com/kystverket/driftly/schema"

#Base: schema.#AppSchema & {
	let C = config
	config: {
		service: "service"
		team:    "fyr"
		app:     "app"
		image:   "ghcr.io/org/notvalidimage"
		ingress: {
			hostname: "testapp.\(C.env).corp.cloud"
			entraID:  true
			cidr: [
				{"10.0.0.0/32"},
				{"10.0.0.0/24"},
			]
		}
		port: 80
		command: ["/app/enstrypiont.sh"]
		managedIdentity: true

		envVars: {}
		envFrom: [{
			configMapRef: {
				name: "configmap"
			}
		}]
		replicas: {
			min: 1
		}
		ingress: {}
		inboundAccess: [{
			service: "fyrlykt"
			app:     "frontend"
			env:     "dev"
		}]
		outboundAccess: [{
			host:        "example.corp"
			hostPattern: "*.example.corp"
			port:        "443"
		}, {
			host: "example.com"
			port: "8080"
		}]
	}
}

// Test various aspects about the schema
testapp: schema.#App & {
	dev: #Base & {
		config: {
			readiness: {}
			liveness: {}
		}
	}
	test: #Base
	prod: #Base & {
		config: replicas: max: 4
	}
}

// Test job and cronjob
testapp: schema.#App & {
	dev: #Base & {
		config: {
			type: "job"
		}
	}
	test: #Base
	prod: #Base & {
		config: replicas: max: 4
	}
}

// Test kargo parameters
kargo: schema.#App & {
	dev: #Base & {
		config: {
			promotion: strategy: "SemVer"
			env: "dev"
		}
	}
	test: #Base & {
		config: {
			promotion: strategy: "Lexical"
		}
	}
	prod: #Base & {
		config: {
			promotion: strategy: "Manual"
			tag: "manual-tag"
		}
	}
}
