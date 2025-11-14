package kube

import schema "github.com/kystverket/driftly/schema"

import "encoding/yaml"

#EscapeExample: schema.#AppSchema & {
	//let C = config
	config: {
		service: "example"
		team:    "fyr"
		app:     "escape"
	}
	// Override any schema field example
	deployment: spec: template: spec: containers: [{
		imagePullPolicy: "Always"
	}]
	//Raw yaml certificate resource
	configMap: yaml.Unmarshal(_data)
	_data: """
		   apiVersion: cert-manager.io/v1
		   kind: Certificate
		   metadata:
		     name: example
		   spec:
		     dnsNames:
		     - example.fyr.svc
		     issuerRef:
		       kind: Issuer
		       name: example-issuer
		     secretName: example-tls
		"""
	// Same cert but in cue
	cueCert: {
		apiVersion: "cert-manager.io/v1"
		kind:       "Certificate"
		metadata: name: "example-cue"
		spec: {
			dnsNames: ["example.fyr.svc"]
			issuerRef: {
				kind: "Issuer"
				name: "example-issuer"
			}
			secretName: "example-tls"
		}
	}
}

escape: schema.#App & {
	dev: #EscapeExample
}
