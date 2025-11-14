package schema

import core "github.com/kystverket/driftly/schema/crd/core/v1"

#PodSecurityContext: core.#PodSecurityContext & {
	fsGroup:    int & >=1000 | *10002
	runAsGroup: int & >=1000 | *10002
	runAsUser:  int & >=1000 | *10002

	runAsNonRoot: bool | *true
}
#ContanerSecurityContext: core.#SecurityContext & {
	allowPrivilegeEscalation: bool | *false
	readOnlyRootFilesystem:   bool | *true
	runAsNonRoot:             bool | *true
	runAsGroup:               int & >=1000 | *10002
	runAsUser:                int & >=1000 | *10002

	capabilities: {
		drop: ["ALL"]
		add?: [...string]
	}
	seccompProfile: {
		type: string | *"RuntimeDefault"
	}
}
