package kube

import schema "github.com/kystverket/driftly/schema"

#ExampleJob: schema.#AppSchema & {
	config: {
		service: "example"
		team:    "fyr"
		app:     "myapp-job"
		command: ["/app/enstrypiont.sh"]
		type: "job"
		promotion: {
			strategy: "Manual"
		}
		createPullSecret: false
	}
}

exampleJob: schema.#App & {
	dev: #ExampleJob
}
