package schema

import kargo "github.com/kystverket/driftly/schema/crd/kargo/v1alpha1"

import "strings"

import "list"

#kargo: {
	// Workaround since CUE does not support passing the parent struct as context
	AppConfig: {
		image: string
		promotion: strategy: string
		service: string
		app:     string
		env:     string
		team:    string
		// Get last part of image path
		container: list.Reverse(strings.Split(image, "/"))[0]
	}

	let C = AppConfig
	_color: {
		dev:  string | *"avocado"
		test: string | *"yellow"
		prod: string | *"red"
	}
	// Only one warehouse is required per app, so we only create if for dev environment
	if C.env == "dev" {
		warehouse: kargo.#Warehouse & {
			metadata: {
				name:      C.service + "-" + C.app
				namespace: C.team + "-kargo"
			}
			spec: {
				interval: "5m0s"
				subscriptions: [{
					image: {
						repoURL:                C.image
						imageSelectionStrategy: C.promotion.strategy
						if C.promotion.strategy == "Lexical" {
							allowTags: "^ts-\\d{6}-\\d{4}"
						}
						if C.promotion.strategy == "SemVer" {
							constraint: "^0.0.0"
						}
						strictSemvers: true
					}
				}]
			}
		}
	}
	stage: kargo.#Stage & {
		metadata: {
			annotations: {
				"kargo.akuity.io/color": _color[C.env]
			}
			labels: {
				"stage": C.env
			}
			name:      C.service + "-" + C.app + "-" + C.env
			namespace: C.team + "-kargo"
		}
		spec: {
			requestedFreight: [{
				origin: {
					kind: "Warehouse"
					name: C.service + "-" + C.app
				}
				sources: {
					direct: C.env == "dev"
					// Test / prod must refer to previus environments
					stages: [
						if C.env == "test" {
							C.service + "-" + C.app + "-dev"
						},
						if C.env == "prod" {
							C.service + "-" + C.app + "-test"
						},
					]
				}
			}]
			vars: [
				{name: "path", value: "_kargo/\(C.team)/\(C.env)/\(C.service)/\(C.app)"},
				{name: "image", value: C.image},
				{name: "version", value: "${{imageFrom(vars.image).Tag}}"},
			]
			promotionTemplate: {
				spec: {
					steps: [{
						task: {
							name: "push-image"
							kind: "ClusterPromotionTask"
						}
					}]
				}
			}
		}

	}
}
