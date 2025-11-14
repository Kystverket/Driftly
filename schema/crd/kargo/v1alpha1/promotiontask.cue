package v1alpha1

import "strings"

#PromotionTask: {
	_embeddedResource

	// APIVersion defines the versioned schema of this representation
	// of an object.
	// Servers should convert recognized schemas to the latest
	// internal value, and
	// may reject unrecognized values.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
	apiVersion?: string

	// Kind is a string value representing the REST resource this
	// object represents.
	// Servers may infer this from the endpoint the client submits
	// requests to.
	// Cannot be updated.
	// In CamelCase.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
	kind?: string
	metadata?: {}

	// Spec describes the composition of a PromotionTask, including
	// the
	// variables available to the task and the steps.
	spec!: {
		// Steps specifies the directives to be executed as part of this
		// PromotionTask. The steps as defined here are inflated into a
		// Promotion when it is built from a PromotionTemplate.
		steps!: [...{
			// As is the alias this step can be referred to as.
			as?: string

			// Config is opaque configuration for the PromotionStep that is
			// understood
			// only by each PromotionStep's implementation. It is legal to
			// utilize
			// expressions in defining values at any level of this block.
			// See https://docs.kargo.io/user-guide/reference-docs/expressions
			// for details.
			config?: null | bool | number | string | [...] | {
				...
			}

			// ContinueOnError is a boolean value that, if set to true, will
			// cause the
			// Promotion to continue executing the next step even if this step
			// fails. It
			// also will not permit this failure to impact the overall status
			// of the
			// Promotion.
			continueOnError?: bool

			// If is an optional expression that, if present, must evaluate to
			// a boolean
			// value. If the expression evaluates to false, the step will be
			// skipped.
			// If the expression does not evaluate to a boolean value, the
			// step will be
			// considered to have failed.
			if?: string

			// Retry is the retry policy for this step.
			retry?: {
				// ErrorThreshold is the number of consecutive times the step must
				// fail (for
				// any reason) before retries are abandoned and the entire
				// Promotion is marked
				// as failed.
				//
				// If this field is set to 0, the effective default will be a
				// step-specific
				// one. If no step-specific default exists (i.e. is also 0), the
				// effective
				// default will be the system-wide default of 1.
				//
				// A value of 1 will cause the Promotion to be marked as failed
				// after just
				// a single failure; i.e. no retries will be attempted.
				//
				// There is no option to specify an infinite number of retries
				// using a value
				// such as -1.
				//
				// In a future release, Kargo is likely to become capable of
				// distinguishing
				// between recoverable and non-recoverable step failures. At that
				// time, it is
				// planned that unrecoverable failures will not be subject to this
				// threshold
				// and will immediately cause the Promotion to be marked as failed
				// without
				// further condition.
				errorThreshold?: int32 & int

				// Timeout is the soft maximum interval in which a step that
				// returns a Running
				// status (which typically indicates it's waiting for something to
				// happen)
				// may be retried.
				//
				// The maximum is a soft one because the check for whether the
				// interval has
				// elapsed occurs AFTER the step has run. This effectively means a
				// step may
				// run ONCE beyond the close of the interval.
				//
				// If this field is set to nil, the effective default will be a
				// step-specific
				// one. If no step-specific default exists (i.e. is also nil), the
				// effective
				// default will be the system-wide default of 0.
				//
				// A value of 0 will cause the step to be retried indefinitely
				// unless the
				// ErrorThreshold is reached.
				timeout?: string
			}

			// Task is a reference to a PromotionTask that should be inflated
			// into a
			// Promotion when it is built from a PromotionTemplate.
			task?: {
				// Kind is the type of the PromotionTask. Can be either
				// PromotionTask or
				// ClusterPromotionTask, default is PromotionTask.
				kind?: "PromotionTask" | "ClusterPromotionTask"

				// Name is the name of the (Cluster)PromotionTask.
				name!: strings.MaxRunes(
					253) & strings.MinRunes(
					1) & =~"^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$"
			}

			// Uses identifies a runner that can execute this step.
			uses?: strings.MinRunes(
				1)

			// Vars is a list of variables that can be referenced by
			// expressions in
			// the step's Config. The values override the values specified in
			// the
			// PromotionSpec.
			vars?: [...{
				// Name is the name of the variable.
				name!: strings.MinRunes(
					1) & =~"^[a-zA-Z_]\\w*$"

				// Value is the value of the variable. It is allowed to utilize
				// expressions
				// in the value.
				// See https://docs.kargo.io/user-guide/reference-docs/expressions
				// for details.
				value?: string
			}]
		}] & [_, ...]

		// Vars specifies the variables available to the PromotionTask.
		// The
		// values of these variables are the default values that can be
		// overridden by the step referencing the task.
		vars?: [...{
			// Name is the name of the variable.
			name!: strings.MinRunes(
				1) & =~"^[a-zA-Z_]\\w*$"

			// Value is the value of the variable. It is allowed to utilize
			// expressions
			// in the value.
			// See https://docs.kargo.io/user-guide/reference-docs/expressions
			// for details.
			value?: string
		}]
	}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "kargo.akuity.io/v1alpha1"
	kind:       "PromotionTask"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]: string
		annotations?: [string]: string
		...
	}
}
