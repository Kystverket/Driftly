package kube

import schema "github.com/kystverket/driftly/schema"

// Generator for all example apps
examples: [Name=_]: schema.#App & {
	dev: {
		config: {
			service: "repo"
			team:    "fyr"
		}
	}
}
