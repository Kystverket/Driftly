package kube

import schema "github.com/kystverket/driftly/schema"

examples: minimal: schema.#App & {
	dev: {
		config: {
			service: "repo"
			team:    "fyr"
			app:     "minimal"
		}
	}
}
