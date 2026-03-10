package schema

#Role: {
	entraName: string
	entraID:   string
	role:      "dev" | "admin"
}

#Team: {
	name: string
	roles: [...#Role]
}

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
	teams: [...#Team] & [
		{
			name: "fyr"
			roles: [
				{
					entraName: "aaaa"
					entraID:   "aaaaaa-aaaa--aaaa-aaaaaaa"
					role:      "dev"
				},
				{
					entraName: "aaaa"
					entraID:   "aaaaaa-aaaa--aaaa-aaaaaaa"
					role:      "admin"
				},
			]
		},
	]
}
