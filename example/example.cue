package kube

import schema "github.com/kystverket/driftly/schema"

#Example: schema.#AppSchema & {
	let C = config
	config: {
		service: "example"
		team:    "fyr"
		app:     "myapp"
		ingress: hostname: "myapp.\(C.env).\(schema.#Organization.domain)"
		port: 80
		envVars: {
			BASE: "VALUE"
		}
		command: ["/app/enstrypiont.sh"]

		instrumentation: "go"
		replicas: {
			min:                    1
			max:                    5
			cpuThresholdPercentage: 70
		}
		readiness: _
		liveness:  _
	}
}

example: schema.#App & {
	dev: #Example & {
		config: {
			envVars: {
				extra: "extraEnv"
			}
		}
	}
	test: #Example
	prod: #Example
}
