package kube

import schema "github.com/kystverket/driftly/schema"

examples: job: schema.#App & {
	dev: {
		config: {
			service: "repo"
			team:    "fyr"
			app:     "job-example"
			type:    "job"
		}
	}
}
