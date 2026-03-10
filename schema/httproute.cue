package schema

import httproute "github.com/kystverket/driftly/schema/crd/httproute/v1"

#HTTPRoute: httproute.#HTTPRoute & {
	_path: string
	// Rewrite path to a diffirent path e.g /backend to /
	_pathRewrite: string
	spec: {
		parentRefs: [{
			group:       "gateway.networking.k8s.io"
			kind:        "Gateway"
			name:        #Organization.gateway.name
			namespace:   #Organization.gateway.namespace
			sectionName: "https"
		}]
		rules: [...] | *[{
			backendRefs: [{
				group:  ""
				weight: 1
			}]
			matches: [{
				path: {
					type:  "PathPrefix"
					value: _path
				}
			}]
			if _pathRewrite != _|_ {
				filters: [{
					type: "URLRewrite"
					urlRewrite: {
						path: {
							type:               "ReplacePrefixMatch"
							replacePrefixMatch: _pathRewrite
						}
					}
				}]
			}
		}]
	}
}
