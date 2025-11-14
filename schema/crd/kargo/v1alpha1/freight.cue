package v1alpha1

import "time"

#Freight: {
	_embeddedResource

	// Alias is a human-friendly alias for a piece of Freight. This is
	// an optional
	// field. A defaulting webhook will sync this field with the value
	// of the
	// kargo.akuity.io/alias label. When the alias label is not
	// present or differs
	// from the value of this field, the defaulting webhook will set
	// the label to
	// the value of this field. If the alias label is present and this
	// field is
	// empty, the defaulting webhook will set the value of this field
	// to the value
	// of the alias label. If this field is empty and the alias label
	// is not
	// present, the defaulting webhook will choose an available alias
	// and assign
	// it to both the field and label.
	alias?: string

	// APIVersion defines the versioned schema of this representation
	// of an object.
	// Servers should convert recognized schemas to the latest
	// internal value, and
	// may reject unrecognized values.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
	apiVersion?: string

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

	// Origin describes a kind of Freight in terms of its origin.
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

	// Status describes the current status of this Freight.
	status?: {
		// ApprovedFor describes the Stages for which this Freight has
		// been approved
		// preemptively/manually by a user. This is useful for hotfixes,
		// where one
		// might wish to promote a piece of Freight to a given Stage
		// without
		// transiting the entire pipeline.
		approvedFor?: [string]: {
			// ApprovedAt is the time at which the Freight was approved for
			// the Stage.
			approvedAt?: time.Time
		}

		// CurrentlyIn describes the Stages in which this Freight is
		// currently in use.
		currentlyIn?: [string]: {
			// Since is the time at which the Stage most recently started
			// using the
			// Freight. This can be used to calculate how long the Freight has
			// been in use
			// by the Stage.
			since?: time.Time
		}

		// Metadata is a map of arbitrary metadata associated with the
		// Freight.
		// This is useful for storing additional information about the
		// Freight
		// or Promotion that can be shared across steps or stages.
		metadata?: [string]: null | bool | number | string | [...] | {
			...
		}

		// VerifiedIn describes the Stages in which this Freight has been
		// verified
		// through promotion and subsequent health checks.
		verifiedIn?: [string]: {
			// LongestCompletedSoak represents the longest definite time
			// interval wherein
			// the Freight was in CONTINUOUS use by the Stage. This value is
			// updated as
			// Freight EXITS the Stage. If the Freight is currently in use by
			// the Stage,
			// the time elapsed since the Freight ENTERED the Stage is its
			// current soak
			// time, which may exceed the value of this field.
			longestSoak?: string

			// VerifiedAt is the time at which the Freight was verified in the
			// Stage.
			verifiedAt?: time.Time
		}
	}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "kargo.akuity.io/v1alpha1"
	kind:       "Freight"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]: string
		annotations?: [string]: string
		...
	}
}
