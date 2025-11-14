package v1

import (
	"list"
	"strings"
	"struct"
	"time"
)

#AuthorizationPolicy: {
	_embeddedResource
	spec?: matchN(1, [matchN(0, [null | bool | number | string | [...] | {
		provider!: _
	}]) & {}, {
		provider!: _
	}]) & {
		action?: "ALLOW" | "DENY" | "AUDIT" | "CUSTOM"
		provider?: name?: string
		rules?: list.MaxItems(512) & [...{
			from?: list.MaxItems(512) & [...{
				source?: {
					ipBlocks?: [...string]
					namespaces?: [...string]
					notIpBlocks?: [...string]
					notNamespaces?: [...string]
					notPrincipals?: [...string]
					notRemoteIpBlocks?: [...string]
					notRequestPrincipals?: [...string]
					notServiceAccounts?: list.MaxItems(16) & [...strings.MaxRunes(
						320)]
					principals?: [...string]
					remoteIpBlocks?: [...string]
					requestPrincipals?: [...string]
					serviceAccounts?: list.MaxItems(16) & [...strings.MaxRunes(
						320)]
				}
			}]
			to?: [...{
				operation?: {
					hosts?: [...string]
					methods?: [...string]
					notHosts?: [...string]
					notMethods?: [...string]
					notPaths?: [...string]
					notPorts?: [...string]
					paths?: [...string]
					ports?: [...string]
				}
			}]
			when?: [...{
				key!: string
				notValues?: [...string]
				values?: [...string]
			}]
		}]
		selector?: matchLabels?: struct.MaxFields(
			4096) & {
				[string]: strings.MaxRunes(
						63)
			}
		targetRef?: {
			group?:     strings.MaxRunes(
					253) & =~"^$|^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$"
			kind!:      strings.MaxRunes(
					63) & strings.MinRunes(
					1) & =~"^[a-zA-Z]([-a-zA-Z0-9]*[a-zA-Z0-9])?$"
			name!:      strings.MaxRunes(
					253) & strings.MinRunes(
					1)
			namespace?: string
		}
		targetRefs?: list.MaxItems(16) & [...{
			group?:     strings.MaxRunes(
					253) & =~"^$|^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$"
			kind!:      strings.MaxRunes(
					63) & strings.MinRunes(
					1) & =~"^[a-zA-Z]([-a-zA-Z0-9]*[a-zA-Z0-9])?$"
			name!:      strings.MaxRunes(
					253) & strings.MinRunes(
					1)
			namespace?: string
		}]
	}
	status?: {
		conditions?: [...{
			lastProbeTime?:      time.Time
			lastTransitionTime?: time.Time
			message?:            string
			observedGeneration?: matchN(>=1, [int, string]) & (int | string)
			reason?: string
			status?: string
			type?:   string
		}]
		observedGeneration?: matchN(>=1, [int, string]) & (int | string)
		validationMessages?: [...{
			documentationUrl?: string
			level?:            "UNKNOWN" | "ERROR" | "WARNING" | "INFO"
			type?: {
				code?: string
				name?: string
			}
		}]
		...
	}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "security.istio.io/v1"
	kind:       "AuthorizationPolicy"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]: string
		annotations?: [string]: string
		...
	}
}
