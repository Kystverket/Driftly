package v1alpha1

import (
	"strings"
	"time"
)

#Stage: {
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

	// Spec describes sources of Freight used by the Stage and how to
	// incorporate
	// Freight into the Stage.
	spec!: {
		// PromotionTemplate describes how to incorporate Freight into the
		// Stage
		// using a Promotion.
		promotionTemplate?: {
			// PromotionTemplateSpec describes the (partial) specification of
			// a Promotion
			// for a Stage. This is a template that can be used to create a
			// Promotion for a
			// Stage.
			spec!: {
				// Steps specifies the directives to be executed as part of a
				// Promotion.
				// The order in which the directives are executed is the order in
				// which they
				// are listed in this field.
				steps?: [...{
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

				// Vars is a list of variables that can be referenced by
				// expressions in
				// promotion steps.
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
		}

		// RequestedFreight expresses the Stage's need for certain pieces
		// of Freight,
		// each having originated from a particular Warehouse. This list
		// must be
		// non-empty. In the common case, a Stage will request Freight
		// having
		// originated from just one specific Warehouse. In advanced cases,
		// requesting
		// Freight from multiple Warehouses provides a method of advancing
		// new
		// artifacts of different types through parallel pipelines at
		// different
		// speeds. This can be useful, for instance, if a Stage is home to
		// multiple
		// microservices that are independently versioned.
		requestedFreight!: [...{
			// Origin specifies from where the requested Freight must have
			// originated.
			// This is a required field.
			origin!: {
				// Kind is the kind of resource from which Freight may have
				// originated. At
				// present, this can only be "Warehouse".
				kind!: "Warehouse"

				// Name is the name of the resource of the kind indicated by the
				// Kind field
				// from which Freight may originate.
				name!: string
			}

			// Sources describes where the requested Freight may be obtained
			// from. This is
			// a required field.
			sources!: {
				// AvailabilityStrategy specifies the semantics for how requested
				// Freight is
				// made available to the Stage. This field is optional. When left
				// unspecified,
				// the field is implicitly treated as if its value were "OneOf".
				//
				// Accepted Values:
				//
				// - "All": Freight must be verified and, if applicable, soaked in
				// all
				// upstream Stages to be considered available for promotion.
				// - "OneOf": Freight must be verified and, if applicable, soaked
				// in at least
				// one upstream Stage to be considered available for promotion.
				// - "": Treated the same as "OneOf".
				availabilityStrategy?: "All" | "OneOf" | ""

				// Direct indicates the requested Freight may be obtained directly
				// from the
				// Warehouse from which it originated. If this field's value is
				// false, then
				// the value of the Stages field must be non-empty. i.e. Between
				// the two
				// fields, at least one source must be specified.
				direct?: bool

				// RequiredSoakTime specifies a minimum duration for which the
				// requested
				// Freight must have continuously occupied ("soaked in") in an
				// upstream Stage
				// before becoming available for promotion to this Stage. This is
				// an optional
				// field. If nil or zero, no soak time is required. Any soak time
				// requirement
				// is in ADDITION to the requirement that Freight be verified in
				// an upstream
				// Stage to become available for promotion to this Stage, although
				// a manual
				// approval for promotion to this Stage will supersede any soak
				// time
				// requirement.
				requiredSoakTime?: =~"^([0-9]+(\\.[0-9]+)?(s|m|h))+$"

				// Stages identifies other "upstream" Stages as potential sources
				// of the
				// requested Freight. If this field's value is empty, then the
				// value of the
				// Direct field must be true. i.e. Between the two fields, at
				// least on source
				// must be specified.
				stages?: [...string]
			}
		}] & [_, ...]

		// Shard is the name of the shard that this Stage belongs to. This
		// is an
		// optional field. If not specified, the Stage will belong to the
		// default
		// shard. A defaulting webhook will sync the value of the
		// kargo.akuity.io/shard label with the value of this field. When
		// this field
		// is empty, the webhook will ensure that label is absent.
		shard?: string

		// Vars is a list of variables that can be referenced anywhere in
		// the
		// StageSpec that supports expressions. For example, the
		// PromotionTemplate
		// and arguments of the Verification.
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

		// Verification describes how to verify a Stage's current Freight
		// is fit for
		// promotion downstream.
		verification?: {
			// AnalysisRunMetadata contains optional metadata that should be
			// applied to
			// all AnalysisRuns.
			analysisRunMetadata?: {
				// Additional annotations to apply to an AnalysisRun.
				annotations?: [string]: string

				// Additional labels to apply to an AnalysisRun.
				labels?: [string]: string
			}

			// AnalysisTemplates is a list of AnalysisTemplates from which
			// AnalysisRuns
			// should be created to verify a Stage's current Freight is fit to
			// be promoted
			// downstream.
			analysisTemplates?: [...{
				// Kind is the type of the AnalysisTemplate. Can be either
				// AnalysisTemplate or
				// ClusterAnalysisTemplate, default is AnalysisTemplate.
				kind?: "AnalysisTemplate" | "ClusterAnalysisTemplate"

				// Name is the name of the AnalysisTemplate in the same
				// project/namespace as
				// the Stage.
				name!: string
			}]

			// Args lists arguments that should be added to all AnalysisRuns.
			args?: [...{
				// Name is the name of the argument.
				name!: string

				// Value is the value of the argument.
				value!: string
			}]
		}
	}

	// Status describes the Stage's current and recent Freight,
	// health, and more.
	status?: {
		// AutoPromotionEnabled indicates whether automatic promotion is
		// enabled
		// for the Stage based on the ProjectConfig.
		autoPromotionEnabled?: bool

		// Conditions contains the last observations of the Stage's
		// current
		// state.
		conditions?: [...{
			// lastTransitionTime is the last time the condition transitioned
			// from one status to another.
			// This should be when the underlying condition changed. If that
			// is not known, then using the time when the API field changed
			// is acceptable.
			lastTransitionTime!: time.Time

			// message is a human readable message indicating details about
			// the transition.
			// This may be an empty string.
			message!: strings.MaxRunes(
					32768)

			// observedGeneration represents the .metadata.generation that the
			// condition was set based upon.
			// For instance, if .metadata.generation is currently 12, but the
			// .status.conditions[x].observedGeneration is 9, the condition
			// is out of date
			// with respect to the current state of the instance.
			observedGeneration?: int64 & int & >=0

			// reason contains a programmatic identifier indicating the reason
			// for the condition's last transition.
			// Producers of specific condition types may define expected
			// values and meanings for this field,
			// and whether the values are considered a guaranteed API.
			// The value should be a CamelCase string.
			// This field may not be empty.
			reason!: strings.MaxRunes(
					1024) & strings.MinRunes(
					1) & =~"^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$"

			// status of the condition, one of True, False, Unknown.
			status!: "True" | "False" | "Unknown"

			// type of condition in CamelCase or in foo.example.com/CamelCase.
			type!: strings.MaxRunes(
				316) & =~"^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$"
		}]

		// CurrentPromotion is a reference to the currently Running
		// promotion.
		currentPromotion?: {
			// FinishedAt is the time at which the Promotion was completed.
			finishedAt?: time.Time

			// Freight is the freight being promoted.
			freight?: {
				// Charts describes specific versions of specific Helm charts.
				charts?: [...{
					// Name specifies the name of the chart.
					name?: string

					// RepoURL specifies the URL of a Helm chart repository. Classic
					// chart
					// repositories (using HTTP/S) can contain differently named
					// charts. When this
					// field points to such a repository, the Name field will specify
					// the name of
					// the chart within the repository. In the case of a repository
					// within an OCI
					// registry, the URL implicitly points to a specific chart and the
					// Name field
					// will be empty.
					repoURL?: string

					// Version specifies a particular version of the chart.
					version?: string
				}]

				// Commits describes specific Git repository commits.
				commits?: [...{
					// Author is the author of the commit.
					author?: string

					// Branch denotes the branch of the repository where this commit
					// was found.
					branch?: string

					// Committer is the person who committed the commit.
					committer?: string

					// ID is the ID of a specific commit in the Git repository
					// specified by
					// RepoURL.
					id?: string

					// Message is the message associated with the commit. At present,
					// this only
					// contains the first line (subject) of the commit message.
					message?: string

					// RepoURL is the URL of a Git repository.
					repoURL?: string

					// Tag denotes a tag in the repository that matched selection
					// criteria and
					// resolved to this commit.
					tag?: string
				}]

				// Images describes specific versions of specific container
				// images.
				images?: [...{
					// Annotations is a map of arbitrary metadata for the image.
					annotations?: [string]: string

					// Digest identifies a specific version of the image in the
					// repository
					// specified by RepoURL. This is a more precise identifier than
					// Tag.
					digest?: string

					// RepoURL describes the repository in which the image can be
					// found.
					repoURL?: string

					// Tag identifies a specific version of the image in the
					// repository specified
					// by RepoURL.
					tag?: string
				}]

				// Name is a system-assigned identifier derived deterministically
				// from
				// the contents of the Freight. I.e., two pieces of Freight can be
				// compared
				// for equality by comparing their Names.
				name?: string

				// Origin describes a kind of Freight in terms of its origin.
				origin?: {
					// Kind is the kind of resource from which Freight may have
					// originated. At
					// present, this can only be "Warehouse".
					kind!: "Warehouse"

					// Name is the name of the resource of the kind indicated by the
					// Kind field
					// from which Freight may originate.
					name!: string
				}
			}

			// Name is the name of the Promotion.
			name!: string

			// Status is the (optional) status of the Promotion.
			status?: {
				// CurrentStep is the index of the current promotion step being
				// executed. This
				// permits steps that have already run successfully to be skipped
				// on
				// subsequent reconciliations attempts.
				currentStep?: int64 & int

				// FinishedAt is the time when the promotion was completed.
				finishedAt?: time.Time

				// Freight is the detail of the piece of freight that was
				// referenced by this promotion.
				freight?: {
					// Charts describes specific versions of specific Helm charts.
					charts?: [...{
						// Name specifies the name of the chart.
						name?: string

						// RepoURL specifies the URL of a Helm chart repository. Classic
						// chart
						// repositories (using HTTP/S) can contain differently named
						// charts. When this
						// field points to such a repository, the Name field will specify
						// the name of
						// the chart within the repository. In the case of a repository
						// within an OCI
						// registry, the URL implicitly points to a specific chart and the
						// Name field
						// will be empty.
						repoURL?: string

						// Version specifies a particular version of the chart.
						version?: string
					}]

					// Commits describes specific Git repository commits.
					commits?: [...{
						// Author is the author of the commit.
						author?: string

						// Branch denotes the branch of the repository where this commit
						// was found.
						branch?: string

						// Committer is the person who committed the commit.
						committer?: string

						// ID is the ID of a specific commit in the Git repository
						// specified by
						// RepoURL.
						id?: string

						// Message is the message associated with the commit. At present,
						// this only
						// contains the first line (subject) of the commit message.
						message?: string

						// RepoURL is the URL of a Git repository.
						repoURL?: string

						// Tag denotes a tag in the repository that matched selection
						// criteria and
						// resolved to this commit.
						tag?: string
					}]

					// Images describes specific versions of specific container
					// images.
					images?: [...{
						// Annotations is a map of arbitrary metadata for the image.
						annotations?: [string]: string

						// Digest identifies a specific version of the image in the
						// repository
						// specified by RepoURL. This is a more precise identifier than
						// Tag.
						digest?: string

						// RepoURL describes the repository in which the image can be
						// found.
						repoURL?: string

						// Tag identifies a specific version of the image in the
						// repository specified
						// by RepoURL.
						tag?: string
					}]

					// Name is a system-assigned identifier derived deterministically
					// from
					// the contents of the Freight. I.e., two pieces of Freight can be
					// compared
					// for equality by comparing their Names.
					name?: string

					// Origin describes a kind of Freight in terms of its origin.
					origin?: {
						// Kind is the kind of resource from which Freight may have
						// originated. At
						// present, this can only be "Warehouse".
						kind!: "Warehouse"

						// Name is the name of the resource of the kind indicated by the
						// Kind field
						// from which Freight may originate.
						name!: string
					}
				}

				// FreightCollection contains the details of the piece of Freight
				// referenced
				// by this Promotion as well as any additional Freight that is
				// carried over
				// from the target Stage's current state.
				freightCollection?: {
					// ID is a unique and deterministically calculated identifier for
					// the
					// FreightCollection. It is updated on each use of the
					// UpdateOrPush method.
					id!: string

					// Freight is a map of FreightReference objects, indexed by their
					// Warehouse
					// origin.
					items?: [string]: {
						// Charts describes specific versions of specific Helm charts.
						charts?: [...{
							// Name specifies the name of the chart.
							name?: string

							// RepoURL specifies the URL of a Helm chart repository. Classic
							// chart
							// repositories (using HTTP/S) can contain differently named
							// charts. When this
							// field points to such a repository, the Name field will specify
							// the name of
							// the chart within the repository. In the case of a repository
							// within an OCI
							// registry, the URL implicitly points to a specific chart and the
							// Name field
							// will be empty.
							repoURL?: string

							// Version specifies a particular version of the chart.
							version?: string
						}]

						// Commits describes specific Git repository commits.
						commits?: [...{
							// Author is the author of the commit.
							author?: string

							// Branch denotes the branch of the repository where this commit
							// was found.
							branch?: string

							// Committer is the person who committed the commit.
							committer?: string

							// ID is the ID of a specific commit in the Git repository
							// specified by
							// RepoURL.
							id?: string

							// Message is the message associated with the commit. At present,
							// this only
							// contains the first line (subject) of the commit message.
							message?: string

							// RepoURL is the URL of a Git repository.
							repoURL?: string

							// Tag denotes a tag in the repository that matched selection
							// criteria and
							// resolved to this commit.
							tag?: string
						}]

						// Images describes specific versions of specific container
						// images.
						images?: [...{
							// Annotations is a map of arbitrary metadata for the image.
							annotations?: [string]: string

							// Digest identifies a specific version of the image in the
							// repository
							// specified by RepoURL. This is a more precise identifier than
							// Tag.
							digest?: string

							// RepoURL describes the repository in which the image can be
							// found.
							repoURL?: string

							// Tag identifies a specific version of the image in the
							// repository specified
							// by RepoURL.
							tag?: string
						}]

						// Name is a system-assigned identifier derived deterministically
						// from
						// the contents of the Freight. I.e., two pieces of Freight can be
						// compared
						// for equality by comparing their Names.
						name?: string

						// Origin describes a kind of Freight in terms of its origin.
						origin?: {
							// Kind is the kind of resource from which Freight may have
							// originated. At
							// present, this can only be "Warehouse".
							kind!: "Warehouse"

							// Name is the name of the resource of the kind indicated by the
							// Kind field
							// from which Freight may originate.
							name!: string
						}
					}

					// VerificationHistory is a stack of recent VerificationInfo. By
					// default,
					// the last ten VerificationInfo are stored.
					verificationHistory?: [...{
						// Actor is the name of the entity that initiated or aborted the
						// Verification process.
						actor?: string

						// AnalysisRun is a reference to the Argo Rollouts AnalysisRun
						// that implements
						// the Verification process.
						analysisRun?: {
							// Name is the name of the AnalysisRun.
							name!: string

							// Namespace is the namespace of the AnalysisRun.
							namespace!: string

							// Phase is the last observed phase of the AnalysisRun referenced
							// by Name.
							phase!: string
						}

						// FinishTime is the time at which the Verification process
						// finished.
						finishTime?: time.Time

						// ID is the identifier of the Verification process.
						id?: string

						// Message may contain additional information about why the
						// verification
						// process is in its current phase.
						message?: string

						// Phase describes the current phase of the Verification process.
						// Generally,
						// this will be a reflection of the underlying AnalysisRun's
						// phase, however,
						// there are exceptions to this, such as in the case where an
						// AnalysisRun
						// cannot be launched successfully.
						phase?: string

						// StartTime is the time at which the Verification process was
						// started.
						startTime?: time.Time
					}]
				}

				// HealthChecks contains the health check directives to be
				// executed after
				// the Promotion has completed.
				healthChecks?: [...{
					// Config is the configuration for the directive.
					config?: null | bool | number | string | [...] | {
						...
					}

					// Uses identifies a runner that can execute this step.
					uses!: strings.MinRunes(
						1)
				}]

				// LastHandledRefresh holds the value of the most recent
				// AnnotationKeyRefresh
				// annotation that was handled by the controller. This field can
				// be used to
				// determine whether the request to refresh the resource has been
				// handled.
				lastHandledRefresh?: string

				// Message is a display message about the promotion, including any
				// errors
				// preventing the Promotion controller from executing this
				// Promotion.
				// i.e. If the Phase field has a value of Failed, this field can
				// be expected
				// to explain why.
				message?: string

				// Phase describes where the Promotion currently is in its
				// lifecycle.
				phase?: string

				// StartedAt is the time when the promotion started.
				startedAt?: time.Time

				// State stores the state of the promotion process between
				// reconciliation
				// attempts.
				state?: null | bool | number | string | [...] | {
					...
				}

				// StepExecutionMetadata tracks metadata pertaining to the
				// execution
				// of individual promotion steps.
				stepExecutionMetadata?: [...{
					// Alias is the alias of the step.
					alias?: string

					// ContinueOnError is a boolean value that, if set to true, will
					// cause the
					// Promotion to continue executing the next step even if this step
					// fails. It
					// also will not permit this failure to impact the overall status
					// of the
					// Promotion.
					continueOnError?: bool

					// ErrorCount tracks consecutive failed attempts to execute the
					// step.
					errorCount?: int32 & int

					// FinishedAt is the time at which the final attempt to execute
					// the step
					// completed.
					finishedAt?: time.Time

					// Message is a display message about the step, including any
					// errors.
					message?: string

					// StartedAt is the time at which the first attempt to execute the
					// step
					// began.
					startedAt?: time.Time

					// Status is the high-level outcome of the step.
					status?: string
				}]
			}
		}

		// FreightHistory is a list of recent Freight selections that were
		// deployed
		// to the Stage. By default, the last ten Freight selections are
		// stored.
		// The first item in the list is the most recent Freight selection
		// and
		// currently deployed to the Stage, subsequent items are older
		// selections.
		freightHistory?: [...{
			// ID is a unique and deterministically calculated identifier for
			// the
			// FreightCollection. It is updated on each use of the
			// UpdateOrPush method.
			id!: string

			// Freight is a map of FreightReference objects, indexed by their
			// Warehouse
			// origin.
			items?: [string]: {
				// Charts describes specific versions of specific Helm charts.
				charts?: [...{
					// Name specifies the name of the chart.
					name?: string

					// RepoURL specifies the URL of a Helm chart repository. Classic
					// chart
					// repositories (using HTTP/S) can contain differently named
					// charts. When this
					// field points to such a repository, the Name field will specify
					// the name of
					// the chart within the repository. In the case of a repository
					// within an OCI
					// registry, the URL implicitly points to a specific chart and the
					// Name field
					// will be empty.
					repoURL?: string

					// Version specifies a particular version of the chart.
					version?: string
				}]

				// Commits describes specific Git repository commits.
				commits?: [...{
					// Author is the author of the commit.
					author?: string

					// Branch denotes the branch of the repository where this commit
					// was found.
					branch?: string

					// Committer is the person who committed the commit.
					committer?: string

					// ID is the ID of a specific commit in the Git repository
					// specified by
					// RepoURL.
					id?: string

					// Message is the message associated with the commit. At present,
					// this only
					// contains the first line (subject) of the commit message.
					message?: string

					// RepoURL is the URL of a Git repository.
					repoURL?: string

					// Tag denotes a tag in the repository that matched selection
					// criteria and
					// resolved to this commit.
					tag?: string
				}]

				// Images describes specific versions of specific container
				// images.
				images?: [...{
					// Annotations is a map of arbitrary metadata for the image.
					annotations?: [string]: string

					// Digest identifies a specific version of the image in the
					// repository
					// specified by RepoURL. This is a more precise identifier than
					// Tag.
					digest?: string

					// RepoURL describes the repository in which the image can be
					// found.
					repoURL?: string

					// Tag identifies a specific version of the image in the
					// repository specified
					// by RepoURL.
					tag?: string
				}]

				// Name is a system-assigned identifier derived deterministically
				// from
				// the contents of the Freight. I.e., two pieces of Freight can be
				// compared
				// for equality by comparing their Names.
				name?: string

				// Origin describes a kind of Freight in terms of its origin.
				origin?: {
					// Kind is the kind of resource from which Freight may have
					// originated. At
					// present, this can only be "Warehouse".
					kind!: "Warehouse"

					// Name is the name of the resource of the kind indicated by the
					// Kind field
					// from which Freight may originate.
					name!: string
				}
			}

			// VerificationHistory is a stack of recent VerificationInfo. By
			// default,
			// the last ten VerificationInfo are stored.
			verificationHistory?: [...{
				// Actor is the name of the entity that initiated or aborted the
				// Verification process.
				actor?: string

				// AnalysisRun is a reference to the Argo Rollouts AnalysisRun
				// that implements
				// the Verification process.
				analysisRun?: {
					// Name is the name of the AnalysisRun.
					name!: string

					// Namespace is the namespace of the AnalysisRun.
					namespace!: string

					// Phase is the last observed phase of the AnalysisRun referenced
					// by Name.
					phase!: string
				}

				// FinishTime is the time at which the Verification process
				// finished.
				finishTime?: time.Time

				// ID is the identifier of the Verification process.
				id?: string

				// Message may contain additional information about why the
				// verification
				// process is in its current phase.
				message?: string

				// Phase describes the current phase of the Verification process.
				// Generally,
				// this will be a reflection of the underlying AnalysisRun's
				// phase, however,
				// there are exceptions to this, such as in the case where an
				// AnalysisRun
				// cannot be launched successfully.
				phase?: string

				// StartTime is the time at which the Verification process was
				// started.
				startTime?: time.Time
			}]
		}]

		// FreightSummary is human-readable text maintained by the
		// controller that
		// summarizes what Freight is currently deployed to the Stage. For
		// Stages that
		// request a single piece of Freight AND the request has been
		// fulfilled, this
		// field will simply contain the name of the Freight. For Stages
		// that request
		// a single piece of Freight AND the request has NOT been
		// fulfilled, or for
		// Stages that request multiple pieces of Freight, this field will
		// contain a
		// summary of fulfilled/requested Freight. The existence of this
		// field is a
		// workaround for kubectl limitations so that this complex but
		// valuable
		// information can be displayed in a column in response to
		// `kubectl get
		// stages`.
		freightSummary?: string

		// Health is the Stage's last observed health.
		health?: {
			// Config is the opaque configuration of all health checks
			// performed on this
			// Stage.
			config?: null | bool | number | string | [...] | {
				...
			}

			// Issues clarifies why a Stage in any state other than Healthy is
			// in that
			// state. This field will always be the empty when a Stage is
			// Healthy.
			issues?: [...string]

			// Output is the opaque output of all health checks performed on
			// this Stage.
			output?: null | bool | number | string | [...] | {
				...
			}

			// Status describes the health of the Stage.
			status?: string
		}

		// LastHandledRefresh holds the value of the most recent
		// AnnotationKeyRefresh
		// annotation that was handled by the controller. This field can
		// be used to
		// determine whether the request to refresh the resource has been
		// handled.
		lastHandledRefresh?: string

		// LastPromotion is a reference to the last completed promotion.
		lastPromotion?: {
			// FinishedAt is the time at which the Promotion was completed.
			finishedAt?: time.Time

			// Freight is the freight being promoted.
			freight?: {
				// Charts describes specific versions of specific Helm charts.
				charts?: [...{
					// Name specifies the name of the chart.
					name?: string

					// RepoURL specifies the URL of a Helm chart repository. Classic
					// chart
					// repositories (using HTTP/S) can contain differently named
					// charts. When this
					// field points to such a repository, the Name field will specify
					// the name of
					// the chart within the repository. In the case of a repository
					// within an OCI
					// registry, the URL implicitly points to a specific chart and the
					// Name field
					// will be empty.
					repoURL?: string

					// Version specifies a particular version of the chart.
					version?: string
				}]

				// Commits describes specific Git repository commits.
				commits?: [...{
					// Author is the author of the commit.
					author?: string

					// Branch denotes the branch of the repository where this commit
					// was found.
					branch?: string

					// Committer is the person who committed the commit.
					committer?: string

					// ID is the ID of a specific commit in the Git repository
					// specified by
					// RepoURL.
					id?: string

					// Message is the message associated with the commit. At present,
					// this only
					// contains the first line (subject) of the commit message.
					message?: string

					// RepoURL is the URL of a Git repository.
					repoURL?: string

					// Tag denotes a tag in the repository that matched selection
					// criteria and
					// resolved to this commit.
					tag?: string
				}]

				// Images describes specific versions of specific container
				// images.
				images?: [...{
					// Annotations is a map of arbitrary metadata for the image.
					annotations?: [string]: string

					// Digest identifies a specific version of the image in the
					// repository
					// specified by RepoURL. This is a more precise identifier than
					// Tag.
					digest?: string

					// RepoURL describes the repository in which the image can be
					// found.
					repoURL?: string

					// Tag identifies a specific version of the image in the
					// repository specified
					// by RepoURL.
					tag?: string
				}]

				// Name is a system-assigned identifier derived deterministically
				// from
				// the contents of the Freight. I.e., two pieces of Freight can be
				// compared
				// for equality by comparing their Names.
				name?: string

				// Origin describes a kind of Freight in terms of its origin.
				origin?: {
					// Kind is the kind of resource from which Freight may have
					// originated. At
					// present, this can only be "Warehouse".
					kind!: "Warehouse"

					// Name is the name of the resource of the kind indicated by the
					// Kind field
					// from which Freight may originate.
					name!: string
				}
			}

			// Name is the name of the Promotion.
			name!: string

			// Status is the (optional) status of the Promotion.
			status?: {
				// CurrentStep is the index of the current promotion step being
				// executed. This
				// permits steps that have already run successfully to be skipped
				// on
				// subsequent reconciliations attempts.
				currentStep?: int64 & int

				// FinishedAt is the time when the promotion was completed.
				finishedAt?: time.Time

				// Freight is the detail of the piece of freight that was
				// referenced by this promotion.
				freight?: {
					// Charts describes specific versions of specific Helm charts.
					charts?: [...{
						// Name specifies the name of the chart.
						name?: string

						// RepoURL specifies the URL of a Helm chart repository. Classic
						// chart
						// repositories (using HTTP/S) can contain differently named
						// charts. When this
						// field points to such a repository, the Name field will specify
						// the name of
						// the chart within the repository. In the case of a repository
						// within an OCI
						// registry, the URL implicitly points to a specific chart and the
						// Name field
						// will be empty.
						repoURL?: string

						// Version specifies a particular version of the chart.
						version?: string
					}]

					// Commits describes specific Git repository commits.
					commits?: [...{
						// Author is the author of the commit.
						author?: string

						// Branch denotes the branch of the repository where this commit
						// was found.
						branch?: string

						// Committer is the person who committed the commit.
						committer?: string

						// ID is the ID of a specific commit in the Git repository
						// specified by
						// RepoURL.
						id?: string

						// Message is the message associated with the commit. At present,
						// this only
						// contains the first line (subject) of the commit message.
						message?: string

						// RepoURL is the URL of a Git repository.
						repoURL?: string

						// Tag denotes a tag in the repository that matched selection
						// criteria and
						// resolved to this commit.
						tag?: string
					}]

					// Images describes specific versions of specific container
					// images.
					images?: [...{
						// Annotations is a map of arbitrary metadata for the image.
						annotations?: [string]: string

						// Digest identifies a specific version of the image in the
						// repository
						// specified by RepoURL. This is a more precise identifier than
						// Tag.
						digest?: string

						// RepoURL describes the repository in which the image can be
						// found.
						repoURL?: string

						// Tag identifies a specific version of the image in the
						// repository specified
						// by RepoURL.
						tag?: string
					}]

					// Name is a system-assigned identifier derived deterministically
					// from
					// the contents of the Freight. I.e., two pieces of Freight can be
					// compared
					// for equality by comparing their Names.
					name?: string

					// Origin describes a kind of Freight in terms of its origin.
					origin?: {
						// Kind is the kind of resource from which Freight may have
						// originated. At
						// present, this can only be "Warehouse".
						kind!: "Warehouse"

						// Name is the name of the resource of the kind indicated by the
						// Kind field
						// from which Freight may originate.
						name!: string
					}
				}

				// FreightCollection contains the details of the piece of Freight
				// referenced
				// by this Promotion as well as any additional Freight that is
				// carried over
				// from the target Stage's current state.
				freightCollection?: {
					// ID is a unique and deterministically calculated identifier for
					// the
					// FreightCollection. It is updated on each use of the
					// UpdateOrPush method.
					id!: string

					// Freight is a map of FreightReference objects, indexed by their
					// Warehouse
					// origin.
					items?: [string]: {
						// Charts describes specific versions of specific Helm charts.
						charts?: [...{
							// Name specifies the name of the chart.
							name?: string

							// RepoURL specifies the URL of a Helm chart repository. Classic
							// chart
							// repositories (using HTTP/S) can contain differently named
							// charts. When this
							// field points to such a repository, the Name field will specify
							// the name of
							// the chart within the repository. In the case of a repository
							// within an OCI
							// registry, the URL implicitly points to a specific chart and the
							// Name field
							// will be empty.
							repoURL?: string

							// Version specifies a particular version of the chart.
							version?: string
						}]

						// Commits describes specific Git repository commits.
						commits?: [...{
							// Author is the author of the commit.
							author?: string

							// Branch denotes the branch of the repository where this commit
							// was found.
							branch?: string

							// Committer is the person who committed the commit.
							committer?: string

							// ID is the ID of a specific commit in the Git repository
							// specified by
							// RepoURL.
							id?: string

							// Message is the message associated with the commit. At present,
							// this only
							// contains the first line (subject) of the commit message.
							message?: string

							// RepoURL is the URL of a Git repository.
							repoURL?: string

							// Tag denotes a tag in the repository that matched selection
							// criteria and
							// resolved to this commit.
							tag?: string
						}]

						// Images describes specific versions of specific container
						// images.
						images?: [...{
							// Annotations is a map of arbitrary metadata for the image.
							annotations?: [string]: string

							// Digest identifies a specific version of the image in the
							// repository
							// specified by RepoURL. This is a more precise identifier than
							// Tag.
							digest?: string

							// RepoURL describes the repository in which the image can be
							// found.
							repoURL?: string

							// Tag identifies a specific version of the image in the
							// repository specified
							// by RepoURL.
							tag?: string
						}]

						// Name is a system-assigned identifier derived deterministically
						// from
						// the contents of the Freight. I.e., two pieces of Freight can be
						// compared
						// for equality by comparing their Names.
						name?: string

						// Origin describes a kind of Freight in terms of its origin.
						origin?: {
							// Kind is the kind of resource from which Freight may have
							// originated. At
							// present, this can only be "Warehouse".
							kind!: "Warehouse"

							// Name is the name of the resource of the kind indicated by the
							// Kind field
							// from which Freight may originate.
							name!: string
						}
					}

					// VerificationHistory is a stack of recent VerificationInfo. By
					// default,
					// the last ten VerificationInfo are stored.
					verificationHistory?: [...{
						// Actor is the name of the entity that initiated or aborted the
						// Verification process.
						actor?: string

						// AnalysisRun is a reference to the Argo Rollouts AnalysisRun
						// that implements
						// the Verification process.
						analysisRun?: {
							// Name is the name of the AnalysisRun.
							name!: string

							// Namespace is the namespace of the AnalysisRun.
							namespace!: string

							// Phase is the last observed phase of the AnalysisRun referenced
							// by Name.
							phase!: string
						}

						// FinishTime is the time at which the Verification process
						// finished.
						finishTime?: time.Time

						// ID is the identifier of the Verification process.
						id?: string

						// Message may contain additional information about why the
						// verification
						// process is in its current phase.
						message?: string

						// Phase describes the current phase of the Verification process.
						// Generally,
						// this will be a reflection of the underlying AnalysisRun's
						// phase, however,
						// there are exceptions to this, such as in the case where an
						// AnalysisRun
						// cannot be launched successfully.
						phase?: string

						// StartTime is the time at which the Verification process was
						// started.
						startTime?: time.Time
					}]
				}

				// HealthChecks contains the health check directives to be
				// executed after
				// the Promotion has completed.
				healthChecks?: [...{
					// Config is the configuration for the directive.
					config?: null | bool | number | string | [...] | {
						...
					}

					// Uses identifies a runner that can execute this step.
					uses!: strings.MinRunes(
						1)
				}]

				// LastHandledRefresh holds the value of the most recent
				// AnnotationKeyRefresh
				// annotation that was handled by the controller. This field can
				// be used to
				// determine whether the request to refresh the resource has been
				// handled.
				lastHandledRefresh?: string

				// Message is a display message about the promotion, including any
				// errors
				// preventing the Promotion controller from executing this
				// Promotion.
				// i.e. If the Phase field has a value of Failed, this field can
				// be expected
				// to explain why.
				message?: string

				// Phase describes where the Promotion currently is in its
				// lifecycle.
				phase?: string

				// StartedAt is the time when the promotion started.
				startedAt?: time.Time

				// State stores the state of the promotion process between
				// reconciliation
				// attempts.
				state?: null | bool | number | string | [...] | {
					...
				}

				// StepExecutionMetadata tracks metadata pertaining to the
				// execution
				// of individual promotion steps.
				stepExecutionMetadata?: [...{
					// Alias is the alias of the step.
					alias?: string

					// ContinueOnError is a boolean value that, if set to true, will
					// cause the
					// Promotion to continue executing the next step even if this step
					// fails. It
					// also will not permit this failure to impact the overall status
					// of the
					// Promotion.
					continueOnError?: bool

					// ErrorCount tracks consecutive failed attempts to execute the
					// step.
					errorCount?: int32 & int

					// FinishedAt is the time at which the final attempt to execute
					// the step
					// completed.
					finishedAt?: time.Time

					// Message is a display message about the step, including any
					// errors.
					message?: string

					// StartedAt is the time at which the first attempt to execute the
					// step
					// began.
					startedAt?: time.Time

					// Status is the high-level outcome of the step.
					status?: string
				}]
			}
		}

		// ObservedGeneration represents the .metadata.generation that
		// this Stage
		// status was reconciled against.
		observedGeneration?: int64 & int
	}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "kargo.akuity.io/v1alpha1"
	kind:       "Stage"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]: string
		annotations?: [string]: string
		...
	}
}
