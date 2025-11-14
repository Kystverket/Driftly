package v1alpha1

import (
	"strings"
	"time"
)

#Warehouse: {
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

	// Spec describes sources of artifacts.
	spec!: {
		// FreightCreationPolicy describes how Freight is created by this
		// Warehouse.
		// This field is optional. When left unspecified, the field is
		// implicitly
		// treated as if its value were "Automatic".
		//
		// Accepted values:
		//
		// - "Automatic": New Freight is created automatically when any
		// new artifact
		// is discovered.
		// - "Manual": New Freight is never created automatically.
		freightCreationPolicy?: "Automatic" | "Manual"

		// Interval is the reconciliation interval for this Warehouse. On
		// each
		// reconciliation, the Warehouse will discover new artifacts and
		// optionally
		// produce new Freight. This field is optional. When left
		// unspecified, the
		// field is implicitly treated as if its value were "5m0s".
		interval!: =~"^([0-9]+(\\.[0-9]+)?(s|m|h))+$"

		// Shard is the name of the shard that this Warehouse belongs to.
		// This is an
		// optional field. If not specified, the Warehouse will belong to
		// the default
		// shard. A defaulting webhook will sync this field with the value
		// of the
		// kargo.akuity.io/shard label. When the shard label is not
		// present or differs
		// from the value of this field, the defaulting webhook will set
		// the label to
		// the value of this field. If the shard label is present and this
		// field is
		// empty, the defaulting webhook will set the value of this field
		// to the value
		// of the shard label.
		shard?: string

		// Subscriptions describes sources of artifacts to be included in
		// Freight
		// produced by this Warehouse.
		subscriptions!: [...{
			// Chart describes a subscription to a Helm chart repository.
			chart?: {
				// DiscoveryLimit is an optional limit on the number of chart
				// versions that
				// can be discovered for this subscription. The limit is applied
				// after
				// filtering charts based on the SemverConstraint field.
				// When left unspecified, the field is implicitly treated as if
				// its value
				// were "20". The upper limit for this field is 100.
				discoveryLimit?: int32 & int & <=100 & >=1

				// Name specifies the name of a Helm chart to subscribe to within
				// a classic
				// chart repository specified by the RepoURL field. This field is
				// required
				// when the RepoURL field points to a classic chart repository and
				// MUST
				// otherwise be empty.
				name?: string

				// RepoURL specifies the URL of a Helm chart repository. It may be
				// a classic
				// chart repository (using HTTP/S) OR a repository within an OCI
				// registry.
				// Classic chart repositories can contain differently named
				// charts. When this
				// field points to such a repository, the Name field MUST also be
				// used
				// to specify the name of the desired chart within that
				// repository. In the
				// case of a repository within an OCI registry, the URL implicitly
				// points to
				// a specific chart and the Name field MUST NOT be used. The
				// RepoURL field is
				// required.
				repoURL!: strings.MinRunes(
						1) & =~"^(((https?)|(oci))://)([\\w\\d\\.\\-]+)(:[\\d]+)?(/.*)*$"

				// SemverConstraint specifies constraints on what new chart
				// versions are
				// permissible. This field is optional. When left unspecified,
				// there will be
				// no constraints, which means the latest version of the chart
				// will always be
				// used. Care should be taken with leaving this field unspecified,
				// as it can
				// lead to the unanticipated rollout of breaking changes.
				// More info:
				// https://github.com/masterminds/semver#checking-version-constraints
				semverConstraint?: string
			}

			// Git describes a subscriptions to a Git repository.
			git?: {
				// AllowTags is a regular expression that can optionally be used
				// to limit the
				// tags that are considered in determining the newest commit of
				// interest. The
				// value in this field only has any effect when the
				// CommitSelectionStrategy is
				// Lexical, NewestTag, or SemVer. This field is optional.
				allowTags?: string

				// Branch references a particular branch of the repository. The
				// value in this
				// field only has any effect when the CommitSelectionStrategy is
				// NewestFromBranch or left unspecified (which is implicitly the
				// same as
				// NewestFromBranch). This field is optional. When left
				// unspecified, (and the
				// CommitSelectionStrategy is NewestFromBranch or unspecified),
				// the
				// subscription is implicitly to the repository's default branch.
				branch?: strings.MaxRunes(
						255) & strings.MinRunes(
						1) & =~"^[a-zA-Z0-9]([a-zA-Z0-9._\\/-]*[a-zA-Z0-9_-])?$"

				// CommitSelectionStrategy specifies the rules for how to identify
				// the newest
				// commit of interest in the repository specified by the RepoURL
				// field. This
				// field is optional. When left unspecified, the field is
				// implicitly treated
				// as if its value were "NewestFromBranch".
				//
				// Accepted values:
				//
				// - "NewestFromBranch": Selects the latest commit on the branch
				// specified
				// by the Branch field or the default branch if none is specified.
				// This is
				// the default strategy.
				//
				// - "SemVer": Selects the commit referenced by the semantically
				// greatest
				// tag. The SemverConstraint field can optionally be used to
				// narrow the set
				// of tags eligible for selection.
				//
				// - "Lexical": Selects the commit referenced by the
				// lexicographically
				// greatest tag. Useful when tags embed a _leading_ date or
				// timestamp. The
				// AllowTags and IgnoreTags fields can optionally be used to
				// narrow the set
				// of tags eligible for selection.
				//
				// - "NewestTag": Selects the commit referenced by the most
				// recently created
				// tag. The AllowTags and IgnoreTags fields can optionally be used
				// to
				// narrow the set of tags eligible for selection.
				commitSelectionStrategy?: "Lexical" | "NewestFromBranch" | "NewestTag" | "SemVer"

				// DiscoveryLimit is an optional limit on the number of commits
				// that can be
				// discovered for this subscription. The limit is applied after
				// filtering
				// commits based on the AllowTags and IgnoreTags fields.
				// When left unspecified, the field is implicitly treated as if
				// its value
				// were "20". The upper limit for this field is 100.
				discoveryLimit?: int32 & int & <=100 & >=1

				// ExcludePaths is a list of selectors that designate paths in the
				// repository
				// that should NOT trigger the production of new Freight when
				// changes are
				// detected therein. When specified, changes in the identified
				// paths will not
				// trigger Freight production. When not specified, paths that
				// should trigger
				// Freight production will be defined solely by IncludePaths.
				// Selectors may be
				// defined using:
				// 1. Exact paths to files or directories (ex. "charts/foo")
				// 2. Glob patterns (prefix the pattern with "glob:"; ex.
				// "glob:*.yaml")
				// 3. Regular expressions (prefix the pattern with "regex:" or
				// "regexp:";
				// ex. "regexp:^.*\.yaml$")
				// Paths selected by IncludePaths may be unselected by
				// ExcludePaths. This
				// is a useful method for including a broad set of paths and then
				// excluding a
				// subset of them.
				excludePaths?: [...string]

				// ExpressionFilter is an expression that can optionally be used
				// to limit
				// the commits or tags that are considered in determining the
				// newest commit
				// of interest based on their metadata.
				//
				// For commit-based strategies (NewestFromBranch), the filter
				// applies to
				// commits and has access to commit metadata variables.
				// For tag-based strategies (Lexical, NewestTag, SemVer), the
				// filter applies
				// to tags and has access to tag metadata variables. The filter is
				// applied
				// after AllowTags, IgnoreTags, and SemverConstraint fields.
				//
				// The expression should be a valid expr-lang expression that
				// evaluates to
				// true or false. When the expression evaluates to true, the
				// commit/tag is
				// included in the set that is considered. When the expression
				// evaluates to
				// false, the commit/tag is excluded.
				//
				// Available variables depend on the CommitSelectionStrategy:
				//
				// For NewestFromBranch (commit filtering):
				// - `id`: The ID (sha) of the commit.
				// - `commitDate`: The commit date of the commit.
				// - `author`: The author of the commit message, in the format
				// "Name <email>".
				// - `committer`: The person who committed the commit, in the
				// format
				// "Name <email>".
				// - `subject`: The subject (first line) of the commit message.
				//
				// For Lexical, NewestTag, SemVer (tag filtering):
				// - `tag`: The name of the tag.
				// - `id`: The ID (sha) of the commit associated with the tag.
				// - `creatorDate`: The creation date of an annotated tag, or the
				// commit
				// date of a lightweight tag.
				// - `author`: The author of the commit message associated with
				// the tag,
				// in the format "Name <email>".
				// - `committer`: The person who committed the commit associated
				// with the
				// tag, in the format "Name <email>".
				// - `subject`: The subject (first line) of the commit message
				// associated
				// with the tag.
				// - `tagger`: The person who created the tag, in the format "Name
				// <email>".
				// Only available for annotated tags.
				// - `annotation`: The subject (first line) of the tag annotation.
				// Only
				// available for annotated tags.
				//
				// Refer to the expr-lang documentation for more details on syntax
				// and
				// capabilities of the expression language: https://expr-lang.org.
				expressionFilter?: string

				// IgnoreTags is a list of tags that must be ignored when
				// determining the
				// newest commit of interest. No regular expressions or glob
				// patterns are
				// supported yet. The value in this field only has any effect when
				// the
				// CommitSelectionStrategy is Lexical, NewestTag, or SemVer. This
				// field is
				// optional.
				ignoreTags?: [...string]

				// IncludePaths is a list of selectors that designate paths in the
				// repository
				// that should trigger the production of new Freight when changes
				// are detected
				// therein. When specified, only changes in the identified paths
				// will trigger
				// Freight production. When not specified, changes in any path
				// will trigger
				// Freight production. Selectors may be defined using:
				// 1. Exact paths to files or directories (ex. "charts/foo")
				// 2. Glob patterns (prefix the pattern with "glob:"; ex.
				// "glob:*.yaml")
				// 3. Regular expressions (prefix the pattern with "regex:" or
				// "regexp:";
				// ex. "regexp:^.*\.yaml$")
				//
				// Paths selected by IncludePaths may be unselected by
				// ExcludePaths. This
				// is a useful method for including a broad set of paths and then
				// excluding a
				// subset of them.
				includePaths?: [...string]

				// InsecureSkipTLSVerify specifies whether certificate
				// verification errors
				// should be ignored when connecting to the repository. This
				// should be enabled
				// only with great caution.
				insecureSkipTLSVerify?: bool

				// URL is the repository's URL. This is a required field.
				repoURL!: strings.MinRunes(
						1) & =~"(?:^(ssh|https?)://(?:([\\w-]+)(:(.+))?@)?([\\w-]+(?:\\.[\\w-]+)*)(?::(\\d{1,5}))?(/.*)$)|(?:^([\\w-]+)@([\\w+]+(?:\\.[\\w-]+)*):(/?.*))"

				// SemverConstraint specifies constraints on what new tagged
				// commits are
				// considered in determining the newest commit of interest. The
				// value in this
				// field only has any effect when the CommitSelectionStrategy is
				// SemVer. This
				// field is optional. When left unspecified, there will be no
				// constraints,
				// which means the latest semantically tagged commit will always
				// be used. Care
				// should be taken with leaving this field unspecified, as it can
				// lead to the
				// unanticipated rollout of breaking changes.
				semverConstraint?: string

				// StrictSemvers specifies whether only "strict" semver tags
				// should be
				// considered. A "strict" semver tag is one containing ALL of
				// major, minor,
				// and patch version components. This is enabled by default, but
				// only has any
				// effect when the CommitSelectionStrategy is SemVer. This should
				// be disabled
				// cautiously, as it creates the potential for any tag containing
				// numeric
				// characters only to be mistaken for a semver string containing
				// the major
				// version number only.
				strictSemvers!: bool
			}

			// Image describes a subscription to container image repository.
			image?: {
				// AllowTags is a regular expression that can optionally be used
				// to limit the
				// image tags that are considered in determining the newest
				// version of an
				// image. This field is optional.
				allowTags?: string

				// Constraint specifies constraints on what new image versions are
				// permissible. Acceptable values for this field vary contextually
				// by
				// ImageSelectionStrategy. The field is optional and is ignored by
				// some
				// strategies. When non-empty, the value in this field takes
				// precedence over
				// the value of the deprecated SemverConstraint field.
				constraint?: string

				// DiscoveryLimit is an optional limit on the number of image
				// references
				// that can be discovered for this subscription. The limit is
				// applied after
				// filtering images based on the AllowTags and IgnoreTags fields.
				// When left unspecified, the field is implicitly treated as if
				// its value
				// were "20". The upper limit for this field is 100.
				discoveryLimit?: int32 & int & <=100 & >=1

				// IgnoreTags is a list of tags that must be ignored when
				// determining the
				// newest version of an image. No regular expressions or glob
				// patterns are
				// supported yet. This field is optional.
				ignoreTags?: [...string]

				// ImageSelectionStrategy specifies the rules for how to identify
				// the newest version
				// of the image specified by the RepoURL field. This field is
				// optional. When
				// left unspecified, the field is implicitly treated as if its
				// value were
				// "SemVer".
				//
				// Accepted values:
				//
				// - "Digest": Selects the image currently referenced by the tag
				// specified
				// (unintuitively) by the SemverConstraint field.
				//
				// - "Lexical": Selects the image referenced by the
				// lexicographically greatest
				// tag. Useful when tags embed a leading date or timestamp. The
				// AllowTags
				// and IgnoreTags fields can optionally be used to narrow the set
				// of tags
				// eligible for selection.
				//
				// - "NewestBuild": Selects the image that was most recently
				// pushed to the
				// repository. The AllowTags and IgnoreTags fields can optionally
				// be used
				// to narrow the set of tags eligible for selection. This is the
				// least
				// efficient and is likely to cause rate limiting affecting this
				// Warehouse
				// and possibly others. This strategy should be avoided.
				//
				// - "SemVer": Selects the image with the semantically greatest
				// tag. The
				// AllowTags and IgnoreTags fields can optionally be used to
				// narrow the set
				// of tags eligible for selection.
				imageSelectionStrategy?: "Digest" | "Lexical" | "NewestBuild" | "SemVer"

				// InsecureSkipTLSVerify specifies whether certificate
				// verification errors
				// should be ignored when connecting to the repository. This
				// should be enabled
				// only with great caution.
				insecureSkipTLSVerify?: bool

				// Platform is a string of the form <os>/<arch> that limits the
				// tags that can
				// be considered when searching for new versions of an image. This
				// field is
				// optional. When left unspecified, it is implicitly equivalent to
				// the
				// OS/architecture of the Kargo controller. Care should be taken
				// to set this
				// value correctly in cases where the image referenced by this
				// ImageRepositorySubscription will run on a Kubernetes node with
				// a different
				// OS/architecture than the Kargo controller. At present this is
				// uncommon, but
				// not unheard of.
				platform?: string

				// RepoURL specifies the URL of the image repository to subscribe
				// to. The
				// value in this field MUST NOT include an image tag. This field
				// is required.
				repoURL!: strings.MinRunes(
						1) & =~"^(\\w+([\\.-]\\w+)*(:[\\d]+)?/)?(\\w+([\\.-]\\w+)*)(/\\w+([\\.-]\\w+)*)*$"

				// SemverConstraint specifies constraints on what new image
				// versions are
				// permissible. The value in this field only has any effect when
				// the
				// ImageSelectionStrategy is SemVer or left unspecified (which is
				// implicitly
				// the same as SemVer). This field is also optional. When left
				// unspecified,
				// (and the ImageSelectionStrategy is SemVer or unspecified),
				// there will be no
				// constraints, which means the latest semantically tagged version
				// of an image
				// will always be used. Care should be taken with leaving this
				// field
				// unspecified, as it can lead to the unanticipated rollout of
				// breaking
				// changes.
				// More info:
				// https://github.com/masterminds/semver#checking-version-constraints
				//
				// Deprecated: Use Constraint instead. This field will be removed
				// in v1.9.0
				semverConstraint?: string

				// StrictSemvers specifies whether only "strict" semver tags
				// should be
				// considered. A "strict" semver tag is one containing ALL of
				// major, minor,
				// and patch version components. This is enabled by default, but
				// only has any
				// effect when the ImageSelectionStrategy is SemVer. This should
				// be disabled
				// cautiously, as it is not uncommon to tag container images with
				// short Git
				// commit hashes, which have the potential to contain numeric
				// characters only
				// and could be mistaken for a semver string containing the major
				// version
				// number only.
				strictSemvers!: bool
			}
		}] & [_, ...]
	}

	// Status describes the Warehouse's most recently observed state.
	status?: {
		// Conditions contains the last observations of the Warehouse's
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

		// DiscoveredArtifacts holds the artifacts discovered by the
		// Warehouse.
		discoveredArtifacts?: {
			// Charts holds the charts discovered by the Warehouse for the
			// chart
			// subscriptions.
			charts?: [...{
				// Name is the name of the Helm chart, as specified in the
				// ChartSubscription.
				name?: string

				// RepoURL is the repository URL of the Helm chart, as specified
				// in the
				// ChartSubscription.
				repoURL!: strings.MinRunes(
						1)

				// SemverConstraint is the constraint for which versions were
				// discovered.
				// This field is optional, and only populated if the
				// ChartSubscription
				// specifies a SemverConstraint.
				semverConstraint?: string

				// Versions is a list of versions discovered by the Warehouse for
				// the
				// ChartSubscription. An empty list indicates that the discovery
				// operation was
				// successful, but no versions matching the ChartSubscription
				// criteria were
				// found.
				versions?: [...string]
			}]

			// DiscoveredAt is the time at which the Warehouse discovered the
			// artifacts.
			discoveredAt?: time.Time

			// Git holds the commits discovered by the Warehouse for the Git
			// subscriptions.
			git?: [...{
				// Commits is a list of commits discovered by the Warehouse for
				// the
				// GitSubscription. An empty list indicates that the discovery
				// operation was
				// successful, but no commits matching the GitSubscription
				// criteria were found.
				commits?: [...{
					// Author is the author of the commit.
					author?: string

					// Branch is the branch in which the commit was found. This field
					// is
					// optional, and populated based on the CommitSelectionStrategy of
					// the
					// GitSubscription.
					branch?: string

					// Committer is the person who committed the commit.
					committer?: string

					// CreatorDate is the commit creation date as specified by the
					// commit, or
					// the tagger date if the commit belongs to an annotated tag.
					creatorDate?: time.Time

					// ID is the identifier of the commit. This typically is a SHA-1
					// hash.
					id?: strings.MinRunes(
						1)

					// Subject is the subject of the commit (i.e. the first line of
					// the commit
					// message).
					subject?: string

					// Tag is the tag that resolved to this commit. This field is
					// optional, and
					// populated based on the CommitSelectionStrategy of the
					// GitSubscription.
					tag?: string
				}]

				// RepoURL is the repository URL of the GitSubscription.
				repoURL!: strings.MinRunes(
						1) & =~"(?:^(ssh|https?)://(?:([\\w-]+)(:(.+))?@)?([\\w-]+(?:\\.[\\w-]+)*)(?::(\\d{1,5}))?(/.*)$)|(?:^([\\w-]+)@([\\w+]+(?:\\.[\\w-]+)*):(/?.*))"
			}]

			// Images holds the image references discovered by the Warehouse
			// for the
			// image subscriptions.
			images?: [...{
				// Platform is the target platform constraint of the
				// ImageSubscription
				// for which references were discovered. This field is optional,
				// and
				// only populated if the ImageSubscription specifies a Platform.
				platform?: string

				// References is a list of image references discovered by the
				// Warehouse for
				// the ImageSubscription. An empty list indicates that the
				// discovery
				// operation was successful, but no images matching the
				// ImageSubscription
				// criteria were found.
				references?: [...{
					// Annotations is a map of key-value pairs that provide additional
					// information about the image.
					annotations?: [string]: string

					// CreatedAt is the time the image was created. This field is
					// optional, and
					// not populated for every ImageSelectionStrategy.
					createdAt?: time.Time

					// Digest is the digest of the image.
					digest!: strings.MinRunes(
							1) & =~"^[a-z0-9]+:[a-f0-9]+$"

					// Tag is the tag of the image.
					tag!: strings.MaxRunes(
						128) & strings.MinRunes(
						1) & =~"^[\\w.\\-\\_]+$"
				}]

				// RepoURL is the repository URL of the image, as specified in the
				// ImageSubscription.
				repoURL!: strings.MinRunes(
						1)
			}]
		}

		// LastFreightID is a reference to the system-assigned identifier
		// (name) of
		// the most recent Freight produced by the Warehouse.
		lastFreightID?: string

		// LastHandledRefresh holds the value of the most recent
		// AnnotationKeyRefresh
		// annotation that was handled by the controller. This field can
		// be used to
		// determine whether the request to refresh the resource has been
		// handled.
		lastHandledRefresh?: string

		// ObservedGeneration represents the .metadata.generation that
		// this Warehouse
		// was reconciled against.
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
	kind:       "Warehouse"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]: string
		annotations?: [string]: string
		...
	}
}
