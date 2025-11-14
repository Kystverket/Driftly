package schema

import httproute "github.com/kystverket/driftly/schema/crd/httproute/v1"

#HTTPRoute: httproute.#HTTPRoute & {
	spec: {
		parentRefs: [{
			group:       "gateway.networking.k8s.io"
			kind:        "Gateway"
			name:        #Organization.gateway.name
			namespace:   #Organization.gateway.namespace
			sectionName: "https"
		}]
		rules: [{
			backendRefs: [{
				group:  ""
				weight: 1
			}]
			matches: [{
				path: {
					type:  "PathPrefix"
					value: "/"
				}
			}]
		}]
	}
}
