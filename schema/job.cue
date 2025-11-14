package schema

import batch "github.com/kystverket/driftly/schema/crd/batch/v1"

#Job: batch.#Job & {
	spec: {
		template: {
			spec: {
				restartPolicy: string | *"Never"
			}
		}
	}
}
