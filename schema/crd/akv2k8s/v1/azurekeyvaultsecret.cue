package v1

import "time"

#AzureKeyVaultSecret: {
	_embeddedResource

	// APIVersion defines the versioned schema of this representation
	// of an object. Servers should convert recognized schemas to the
	// latest internal value, and may reject unrecognized values.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
	apiVersion?: string

	// Kind is a string value representing the REST resource this
	// object represents. Servers may infer this from the endpoint
	// the client submits requests to. Cannot be updated. In
	// CamelCase. More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
	kind?: string
	metadata?: {}

	// AzureKeyVaultSecretSpec is the spec for a AzureKeyVaultSecret
	// resource
	spec!: {
		// AzureKeyVaultOutput defines output sources, currently only
		// support Secret
		output?: {
			// AzureKeyVaultOutputSecret has information needed to output a
			// secret from Azure Key Vault to Kubernetes as a Secret resource
			secret?: {
				// By setting chainOrder to ensureserverfirst the server
				// certificate will be moved first in the chain
				chainOrder?: "ensureserverfirst"

				// The key to use in Kubernetes secret when setting the value from
				// Azure Key Vault object data
				dataKey?: string

				// Name for Kubernetes secret
				name!: string

				// Type of Secret in Kubernetes
				type?: string
			}
			transform?: [...string]
		}

		// AzureKeyVault contains information needed to get the Azure Key
		// Vault secret from Azure Key Vault
		vault!: {
			// Name of the Azure Key Vault
			name!: string

			// AzureKeyVaultObject has information about the Azure Key Vault
			// object to get from Azure Key Vault
			object!: {
				// AzureKeyVaultObjectContentType defines what content type a
				// secret contains, only used when type is multi-key-value-secret
				contentType?: "application/x-json" | "application/x-yaml"

				// The object name in Azure Key Vault
				name!: string

				// AzureKeyVaultObjectType defines which Object type to get from
				// Azure Key Vault
				type!: "secret" | "certificate" | "key" | "multi-key-value-secret"

				// The object version in Azure Key Vault
				version?: string
			}
		}
	}

	// AzureKeyVaultSecretStatus is the status for a
	// AzureKeyVaultSecret resource
	status?: {
		lastAzureUpdate?: time.Time
		secretHash!:      string
		secretName!:      string
	}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "spv.no/v1"
	kind:       "AzureKeyVaultSecret"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]:      string
		annotations?: [string]: string
		...
	}
}
