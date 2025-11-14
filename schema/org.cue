package schema

#Organization: {
	// Github organization
	owner: {
		name:  "kystverket"
		short: "kyv"
		repo:  "driftly"
	}
	pullSecret: "corp-pull"
	domain:     "corp.cloud"
	vault:      "kv-corp-prod"
	gateway: {
		name:      "gateway"
		namespace: "aks-istio-ingress"
	}
	observability: {
		namespace: "observability"
	}
}
