package v1alpha1

import "time"

#ApplicationSet: {
	_embeddedResource
	"apiVersion"?: string
	"kind"?:       string
	"metadata"!: {}
	"spec"!: {
		"applyNestedSelectors"?: bool
		"generators"!: [...{
			"clusterDecisionResource"?: {
				"configMapRef"!: string
				"labelSelector"?: {
					"matchExpressions"?: [...{
						"key"!:      string
						"operator"!: string
						"values"?: [...string]
					}]
					"matchLabels"?: {
						[string]: string
					}
				}
				"name"?:                string
				"requeueAfterSeconds"?: int64 & int
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
				"values"?: {
					[string]: string
				}
			}
			"clusters"?: {
				"flatList"?: bool
				"selector"?: {
					"matchExpressions"?: [...{
						"key"!:      string
						"operator"!: string
						"values"?: [...string]
					}]
					"matchLabels"?: {
						[string]: string
					}
				}
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
				"values"?: {
					[string]: string
				}
			}
			"git"?: {
				"directories"?: [...{
					"exclude"?: bool
					"path"!:    string
				}]
				"files"?: [...{
					"exclude"?: bool
					"path"!:    string
				}]
				"pathParamPrefix"?:     string
				"repoURL"!:             string
				"requeueAfterSeconds"?: int64 & int
				"revision"!:            string
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
				"values"?: {
					[string]: string
				}
			}
			"list"?: {
				"elements"?: [...null | bool | number | string | [...] | {
					...
				}]
				"elementsYaml"?: string
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
			}
			"matrix"?: {
				"generators"!: [...{
					"clusterDecisionResource"?: {
						"configMapRef"!: string
						"labelSelector"?: {
							"matchExpressions"?: [...{
								"key"!:      string
								"operator"!: string
								"values"?: [...string]
							}]
							"matchLabels"?: {
								[string]: string
							}
						}
						"name"?:                string
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"clusters"?: {
						"flatList"?: bool
						"selector"?: {
							"matchExpressions"?: [...{
								"key"!:      string
								"operator"!: string
								"values"?: [...string]
							}]
							"matchLabels"?: {
								[string]: string
							}
						}
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"git"?: {
						"directories"?: [...{
							"exclude"?: bool
							"path"!:    string
						}]
						"files"?: [...{
							"exclude"?: bool
							"path"!:    string
						}]
						"pathParamPrefix"?:     string
						"repoURL"!:             string
						"requeueAfterSeconds"?: int64 & int
						"revision"!:            string
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"list"?: {
						"elements"?: [...null | bool | number | string | [...] | {
							...
						}]
						"elementsYaml"?: string
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
					}
					"matrix"?: null | bool | number | string | [...] | {
						...
					}
					"merge"?: null | bool | number | string | [...] | {
						...
					}
					"plugin"?: {
						"configMapRef"!: "name"!: string
						"input"?: {
							"parameters"?: [string]: null | bool | number | string | [...] | {
								...
							}
						}
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"pullRequest"?: {
						"azuredevops"?: {
							"api"?: string
							"labels"?: [...string]
							"organization"!: string
							"project"!:      string
							"repo"!:         string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"bitbucket"?: {
							"api"?: string
							"basicAuth"?: {
								"passwordRef"!: {
									"key"!:        string
									"secretName"!: string
								}
								"username"!: string
							}
							"bearerToken"?: {
								"tokenRef"!: {
									"key"!:        string
									"secretName"!: string
								}
							}
							"owner"!: string
							"repo"!:  string
						}
						"bitbucketServer"?: {
							"api"!: string
							"basicAuth"?: {
								"passwordRef"!: {
									"key"!:        string
									"secretName"!: string
								}
								"username"!: string
							}
							"bearerToken"?: {
								"tokenRef"!: {
									"key"!:        string
									"secretName"!: string
								}
							}
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"insecure"?: bool
							"project"!:  string
							"repo"!:     string
						}
						"filters"?: [...{
							"branchMatch"?:       string
							"targetBranchMatch"?: string
						}]
						"gitea"?: {
							"api"!:      string
							"insecure"?: bool
							"labels"?: [...string]
							"owner"!: string
							"repo"!:  string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"github"?: {
							"api"?:           string
							"appSecretName"?: string
							"labels"?: [...string]
							"owner"!: string
							"repo"!:  string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"gitlab"?: {
							"api"?: string
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"insecure"?: bool
							"labels"?: [...string]
							"project"!:          string
							"pullRequestState"?: string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"scmProvider"?: {
						"awsCodeCommit"?: {
							"allBranches"?: bool
							"region"?:      string
							"role"?:        string
							"tagFilters"?: [...{
								"key"!:   string
								"value"?: string
							}]
						}
						"azureDevOps"?: {
							"accessTokenRef"!: {
								"key"!:        string
								"secretName"!: string
							}
							"allBranches"?:  bool
							"api"?:          string
							"organization"!: string
							"teamProject"!:  string
						}
						"bitbucket"?: {
							"allBranches"?: bool
							"appPasswordRef"!: {
								"key"!:        string
								"secretName"!: string
							}
							"owner"!: string
							"user"!:  string
						}
						"bitbucketServer"?: {
							"allBranches"?: bool
							"api"!:         string
							"basicAuth"?: {
								"passwordRef"!: {
									"key"!:        string
									"secretName"!: string
								}
								"username"!: string
							}
							"bearerToken"?: {
								"tokenRef"!: {
									"key"!:        string
									"secretName"!: string
								}
							}
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"insecure"?: bool
							"project"!:  string
						}
						"cloneProtocol"?: string
						"filters"?: [...{
							"branchMatch"?: string
							"labelMatch"?:  string
							"pathsDoNotExist"?: [...string]
							"pathsExist"?: [...string]
							"repositoryMatch"?: string
						}]
						"gitea"?: {
							"allBranches"?: bool
							"api"!:         string
							"insecure"?:    bool
							"owner"!:       string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"github"?: {
							"allBranches"?:   bool
							"api"?:           string
							"appSecretName"?: string
							"organization"!:  string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"gitlab"?: {
							"allBranches"?: bool
							"api"?:         string
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"group"!:                 string
							"includeSharedProjects"?: bool
							"includeSubgroups"?:      bool
							"insecure"?:              bool
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
							"topic"?: string
						}
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"selector"?: {
						"matchExpressions"?: [...{
							"key"!:      string
							"operator"!: string
							"values"?: [...string]
						}]
						"matchLabels"?: {
							[string]: string
						}
					}
				}]
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
			}
			"merge"?: {
				"generators"!: [...{
					"clusterDecisionResource"?: {
						"configMapRef"!: string
						"labelSelector"?: {
							"matchExpressions"?: [...{
								"key"!:      string
								"operator"!: string
								"values"?: [...string]
							}]
							"matchLabels"?: {
								[string]: string
							}
						}
						"name"?:                string
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"clusters"?: {
						"flatList"?: bool
						"selector"?: {
							"matchExpressions"?: [...{
								"key"!:      string
								"operator"!: string
								"values"?: [...string]
							}]
							"matchLabels"?: {
								[string]: string
							}
						}
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"git"?: {
						"directories"?: [...{
							"exclude"?: bool
							"path"!:    string
						}]
						"files"?: [...{
							"exclude"?: bool
							"path"!:    string
						}]
						"pathParamPrefix"?:     string
						"repoURL"!:             string
						"requeueAfterSeconds"?: int64 & int
						"revision"!:            string
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"list"?: {
						"elements"?: [...null | bool | number | string | [...] | {
							...
						}]
						"elementsYaml"?: string
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
					}
					"matrix"?: null | bool | number | string | [...] | {
						...
					}
					"merge"?: null | bool | number | string | [...] | {
						...
					}
					"plugin"?: {
						"configMapRef"!: "name"!: string
						"input"?: {
							"parameters"?: [string]: null | bool | number | string | [...] | {
								...
							}
						}
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"pullRequest"?: {
						"azuredevops"?: {
							"api"?: string
							"labels"?: [...string]
							"organization"!: string
							"project"!:      string
							"repo"!:         string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"bitbucket"?: {
							"api"?: string
							"basicAuth"?: {
								"passwordRef"!: {
									"key"!:        string
									"secretName"!: string
								}
								"username"!: string
							}
							"bearerToken"?: {
								"tokenRef"!: {
									"key"!:        string
									"secretName"!: string
								}
							}
							"owner"!: string
							"repo"!:  string
						}
						"bitbucketServer"?: {
							"api"!: string
							"basicAuth"?: {
								"passwordRef"!: {
									"key"!:        string
									"secretName"!: string
								}
								"username"!: string
							}
							"bearerToken"?: {
								"tokenRef"!: {
									"key"!:        string
									"secretName"!: string
								}
							}
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"insecure"?: bool
							"project"!:  string
							"repo"!:     string
						}
						"filters"?: [...{
							"branchMatch"?:       string
							"targetBranchMatch"?: string
						}]
						"gitea"?: {
							"api"!:      string
							"insecure"?: bool
							"labels"?: [...string]
							"owner"!: string
							"repo"!:  string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"github"?: {
							"api"?:           string
							"appSecretName"?: string
							"labels"?: [...string]
							"owner"!: string
							"repo"!:  string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"gitlab"?: {
							"api"?: string
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"insecure"?: bool
							"labels"?: [...string]
							"project"!:          string
							"pullRequestState"?: string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"scmProvider"?: {
						"awsCodeCommit"?: {
							"allBranches"?: bool
							"region"?:      string
							"role"?:        string
							"tagFilters"?: [...{
								"key"!:   string
								"value"?: string
							}]
						}
						"azureDevOps"?: {
							"accessTokenRef"!: {
								"key"!:        string
								"secretName"!: string
							}
							"allBranches"?:  bool
							"api"?:          string
							"organization"!: string
							"teamProject"!:  string
						}
						"bitbucket"?: {
							"allBranches"?: bool
							"appPasswordRef"!: {
								"key"!:        string
								"secretName"!: string
							}
							"owner"!: string
							"user"!:  string
						}
						"bitbucketServer"?: {
							"allBranches"?: bool
							"api"!:         string
							"basicAuth"?: {
								"passwordRef"!: {
									"key"!:        string
									"secretName"!: string
								}
								"username"!: string
							}
							"bearerToken"?: {
								"tokenRef"!: {
									"key"!:        string
									"secretName"!: string
								}
							}
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"insecure"?: bool
							"project"!:  string
						}
						"cloneProtocol"?: string
						"filters"?: [...{
							"branchMatch"?: string
							"labelMatch"?:  string
							"pathsDoNotExist"?: [...string]
							"pathsExist"?: [...string]
							"repositoryMatch"?: string
						}]
						"gitea"?: {
							"allBranches"?: bool
							"api"!:         string
							"insecure"?:    bool
							"owner"!:       string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"github"?: {
							"allBranches"?:   bool
							"api"?:           string
							"appSecretName"?: string
							"organization"!:  string
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
						}
						"gitlab"?: {
							"allBranches"?: bool
							"api"?:         string
							"caRef"?: {
								"configMapName"!: string
								"key"!:           string
							}
							"group"!:                 string
							"includeSharedProjects"?: bool
							"includeSubgroups"?:      bool
							"insecure"?:              bool
							"tokenRef"?: {
								"key"!:        string
								"secretName"!: string
							}
							"topic"?: string
						}
						"requeueAfterSeconds"?: int64 & int
						"template"?: {
							"metadata"!: {
								"annotations"?: [string]: string
								"finalizers"?: [...string]
								"labels"?: {
									[string]: string
								}
								"name"?:      string
								"namespace"?: string
							}
							"spec"!: {
								"destination"!: {
									"name"?:      string
									"namespace"?: string
									"server"?:    string
								}
								"ignoreDifferences"?: [...{
									"group"?: string
									"jqPathExpressions"?: [...string]
									"jsonPointers"?: [...string]
									"kind"!: string
									"managedFieldsManagers"?: [...string]
									"name"?:      string
									"namespace"?: string
								}]
								"info"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"project"!:              string
								"revisionHistoryLimit"?: int64 & int
								"source"?: {
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}
								"sourceHydrator"?: {
									"drySource"!: {
										"path"!:           string
										"repoURL"!:        string
										"targetRevision"!: string
									}
									"hydrateTo"?: {
										"targetBranch"!: string
									}
									"syncSource"!: {
										"path"!:         string
										"targetBranch"!: string
									}
								}
								"sources"?: [...{
									"chart"?: string
									"directory"?: {
										"exclude"?: string
										"include"?: string
										"jsonnet"?: {
											"extVars"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
											"libs"?: [...string]
											"tlas"?: [...{
												"code"?:  bool
												"name"!:  string
												"value"!: string
											}]
										}
										"recurse"?: bool
									}
									"helm"?: {
										"apiVersions"?: [...string]
										"fileParameters"?: [...{
											"name"?: string
											"path"?: string
										}]
										"ignoreMissingValueFiles"?: bool
										"kubeVersion"?:             string
										"namespace"?:               string
										"parameters"?: [...{
											"forceString"?: bool
											"name"?:        string
											"value"?:       string
										}]
										"passCredentials"?:      bool
										"releaseName"?:          string
										"skipCrds"?:             bool
										"skipSchemaValidation"?: bool
										"skipTests"?:            bool
										"valueFiles"?: [...string]
										"values"?: string
										"valuesObject"?: {
											...
										}
										"version"?: string
									}
									"kustomize"?: {
										"apiVersions"?: [...string]
										"commonAnnotations"?: {
											[string]: string
										}
										"commonAnnotationsEnvsubst"?: bool
										"commonLabels"?: {
											[string]: string
										}
										"components"?: [...string]
										"forceCommonAnnotations"?:  bool
										"forceCommonLabels"?:       bool
										"ignoreMissingComponents"?: bool
										"images"?: [...string]
										"kubeVersion"?:           string
										"labelIncludeTemplates"?: bool
										"labelWithoutSelector"?:  bool
										"namePrefix"?:            string
										"nameSuffix"?:            string
										"namespace"?:             string
										"patches"?: [...{
											"options"?: [string]: bool
											"patch"?: string
											"path"?:  string
											"target"?: {
												"annotationSelector"?: string
												"group"?:              string
												"kind"?:               string
												"labelSelector"?:      string
												"name"?:               string
												"namespace"?:          string
												"version"?:            string
											}
										}]
										"replicas"?: [...{
											"count"!: matchN(>=1, [int, string]) & (int | string)
											"name"!: string
										}]
										"version"?: string
									}
									"name"?: string
									"path"?: string
									"plugin"?: {
										"env"?: [...{
											"name"!:  string
											"value"!: string
										}]
										"name"?: string
										"parameters"?: [...{
											"array"?: [...string]
											"map"?: {
												[string]: string
											}
											"name"?:   string
											"string"?: string
										}]
									}
									"ref"?:            string
									"repoURL"!:        string
									"targetRevision"?: string
								}]
								"syncPolicy"?: {
									"automated"?: {
										"allowEmpty"?: bool
										"enabled"?:    bool
										"prune"?:      bool
										"selfHeal"?:   bool
									}
									"managedNamespaceMetadata"?: {
										"annotations"?: [string]: string
										"labels"?: {
											[string]: string
										}
									}
									"retry"?: {
										"backoff"?: {
											"duration"?:    string
											"factor"?:      int64 & int
											"maxDuration"?: string
										}
										"limit"?: int64 & int
									}
									"syncOptions"?: [...string]
								}
							}
						}
						"values"?: {
							[string]: string
						}
					}
					"selector"?: {
						"matchExpressions"?: [...{
							"key"!:      string
							"operator"!: string
							"values"?: [...string]
						}]
						"matchLabels"?: {
							[string]: string
						}
					}
				}]
				"mergeKeys"!: [...string]
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
			}
			"plugin"?: {
				"configMapRef"!: "name"!: string
				"input"?: {
					"parameters"?: [string]: null | bool | number | string | [...] | {
						...
					}
				}
				"requeueAfterSeconds"?: int64 & int
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
				"values"?: {
					[string]: string
				}
			}
			"pullRequest"?: {
				"azuredevops"?: {
					"api"?: string
					"labels"?: [...string]
					"organization"!: string
					"project"!:      string
					"repo"!:         string
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
				}
				"bitbucket"?: {
					"api"?: string
					"basicAuth"?: {
						"passwordRef"!: {
							"key"!:        string
							"secretName"!: string
						}
						"username"!: string
					}
					"bearerToken"?: {
						"tokenRef"!: {
							"key"!:        string
							"secretName"!: string
						}
					}
					"owner"!: string
					"repo"!:  string
				}
				"bitbucketServer"?: {
					"api"!: string
					"basicAuth"?: {
						"passwordRef"!: {
							"key"!:        string
							"secretName"!: string
						}
						"username"!: string
					}
					"bearerToken"?: {
						"tokenRef"!: {
							"key"!:        string
							"secretName"!: string
						}
					}
					"caRef"?: {
						"configMapName"!: string
						"key"!:           string
					}
					"insecure"?: bool
					"project"!:  string
					"repo"!:     string
				}
				"filters"?: [...{
					"branchMatch"?:       string
					"targetBranchMatch"?: string
				}]
				"gitea"?: {
					"api"!:      string
					"insecure"?: bool
					"labels"?: [...string]
					"owner"!: string
					"repo"!:  string
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
				}
				"github"?: {
					"api"?:           string
					"appSecretName"?: string
					"labels"?: [...string]
					"owner"!: string
					"repo"!:  string
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
				}
				"gitlab"?: {
					"api"?: string
					"caRef"?: {
						"configMapName"!: string
						"key"!:           string
					}
					"insecure"?: bool
					"labels"?: [...string]
					"project"!:          string
					"pullRequestState"?: string
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
				}
				"requeueAfterSeconds"?: int64 & int
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
				"values"?: {
					[string]: string
				}
			}
			"scmProvider"?: {
				"awsCodeCommit"?: {
					"allBranches"?: bool
					"region"?:      string
					"role"?:        string
					"tagFilters"?: [...{
						"key"!:   string
						"value"?: string
					}]
				}
				"azureDevOps"?: {
					"accessTokenRef"!: {
						"key"!:        string
						"secretName"!: string
					}
					"allBranches"?:  bool
					"api"?:          string
					"organization"!: string
					"teamProject"!:  string
				}
				"bitbucket"?: {
					"allBranches"?: bool
					"appPasswordRef"!: {
						"key"!:        string
						"secretName"!: string
					}
					"owner"!: string
					"user"!:  string
				}
				"bitbucketServer"?: {
					"allBranches"?: bool
					"api"!:         string
					"basicAuth"?: {
						"passwordRef"!: {
							"key"!:        string
							"secretName"!: string
						}
						"username"!: string
					}
					"bearerToken"?: {
						"tokenRef"!: {
							"key"!:        string
							"secretName"!: string
						}
					}
					"caRef"?: {
						"configMapName"!: string
						"key"!:           string
					}
					"insecure"?: bool
					"project"!:  string
				}
				"cloneProtocol"?: string
				"filters"?: [...{
					"branchMatch"?: string
					"labelMatch"?:  string
					"pathsDoNotExist"?: [...string]
					"pathsExist"?: [...string]
					"repositoryMatch"?: string
				}]
				"gitea"?: {
					"allBranches"?: bool
					"api"!:         string
					"insecure"?:    bool
					"owner"!:       string
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
				}
				"github"?: {
					"allBranches"?:   bool
					"api"?:           string
					"appSecretName"?: string
					"organization"!:  string
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
				}
				"gitlab"?: {
					"allBranches"?: bool
					"api"?:         string
					"caRef"?: {
						"configMapName"!: string
						"key"!:           string
					}
					"group"!:                 string
					"includeSharedProjects"?: bool
					"includeSubgroups"?:      bool
					"insecure"?:              bool
					"tokenRef"?: {
						"key"!:        string
						"secretName"!: string
					}
					"topic"?: string
				}
				"requeueAfterSeconds"?: int64 & int
				"template"?: {
					"metadata"!: {
						"annotations"?: [string]: string
						"finalizers"?: [...string]
						"labels"?: {
							[string]: string
						}
						"name"?:      string
						"namespace"?: string
					}
					"spec"!: {
						"destination"!: {
							"name"?:      string
							"namespace"?: string
							"server"?:    string
						}
						"ignoreDifferences"?: [...{
							"group"?: string
							"jqPathExpressions"?: [...string]
							"jsonPointers"?: [...string]
							"kind"!: string
							"managedFieldsManagers"?: [...string]
							"name"?:      string
							"namespace"?: string
						}]
						"info"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"project"!:              string
						"revisionHistoryLimit"?: int64 & int
						"source"?: {
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}
						"sourceHydrator"?: {
							"drySource"!: {
								"path"!:           string
								"repoURL"!:        string
								"targetRevision"!: string
							}
							"hydrateTo"?: {
								"targetBranch"!: string
							}
							"syncSource"!: {
								"path"!:         string
								"targetBranch"!: string
							}
						}
						"sources"?: [...{
							"chart"?: string
							"directory"?: {
								"exclude"?: string
								"include"?: string
								"jsonnet"?: {
									"extVars"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
									"libs"?: [...string]
									"tlas"?: [...{
										"code"?:  bool
										"name"!:  string
										"value"!: string
									}]
								}
								"recurse"?: bool
							}
							"helm"?: {
								"apiVersions"?: [...string]
								"fileParameters"?: [...{
									"name"?: string
									"path"?: string
								}]
								"ignoreMissingValueFiles"?: bool
								"kubeVersion"?:             string
								"namespace"?:               string
								"parameters"?: [...{
									"forceString"?: bool
									"name"?:        string
									"value"?:       string
								}]
								"passCredentials"?:      bool
								"releaseName"?:          string
								"skipCrds"?:             bool
								"skipSchemaValidation"?: bool
								"skipTests"?:            bool
								"valueFiles"?: [...string]
								"values"?: string
								"valuesObject"?: {
									...
								}
								"version"?: string
							}
							"kustomize"?: {
								"apiVersions"?: [...string]
								"commonAnnotations"?: {
									[string]: string
								}
								"commonAnnotationsEnvsubst"?: bool
								"commonLabels"?: {
									[string]: string
								}
								"components"?: [...string]
								"forceCommonAnnotations"?:  bool
								"forceCommonLabels"?:       bool
								"ignoreMissingComponents"?: bool
								"images"?: [...string]
								"kubeVersion"?:           string
								"labelIncludeTemplates"?: bool
								"labelWithoutSelector"?:  bool
								"namePrefix"?:            string
								"nameSuffix"?:            string
								"namespace"?:             string
								"patches"?: [...{
									"options"?: [string]: bool
									"patch"?: string
									"path"?:  string
									"target"?: {
										"annotationSelector"?: string
										"group"?:              string
										"kind"?:               string
										"labelSelector"?:      string
										"name"?:               string
										"namespace"?:          string
										"version"?:            string
									}
								}]
								"replicas"?: [...{
									"count"!: matchN(>=1, [int, string]) & (int | string)
									"name"!: string
								}]
								"version"?: string
							}
							"name"?: string
							"path"?: string
							"plugin"?: {
								"env"?: [...{
									"name"!:  string
									"value"!: string
								}]
								"name"?: string
								"parameters"?: [...{
									"array"?: [...string]
									"map"?: {
										[string]: string
									}
									"name"?:   string
									"string"?: string
								}]
							}
							"ref"?:            string
							"repoURL"!:        string
							"targetRevision"?: string
						}]
						"syncPolicy"?: {
							"automated"?: {
								"allowEmpty"?: bool
								"enabled"?:    bool
								"prune"?:      bool
								"selfHeal"?:   bool
							}
							"managedNamespaceMetadata"?: {
								"annotations"?: [string]: string
								"labels"?: {
									[string]: string
								}
							}
							"retry"?: {
								"backoff"?: {
									"duration"?:    string
									"factor"?:      int64 & int
									"maxDuration"?: string
								}
								"limit"?: int64 & int
							}
							"syncOptions"?: [...string]
						}
					}
				}
				"values"?: {
					[string]: string
				}
			}
			"selector"?: {
				"matchExpressions"?: [...{
					"key"!:      string
					"operator"!: string
					"values"?: [...string]
				}]
				"matchLabels"?: {
					[string]: string
				}
			}
		}]
		"goTemplate"?: bool
		"goTemplateOptions"?: [...string]
		"ignoreApplicationDifferences"?: [...{
			"jqPathExpressions"?: [...string]
			"jsonPointers"?: [...string]
			"name"?: string
		}]
		"preservedFields"?: {
			"annotations"?: [...string]
			"labels"?: [...string]
		}
		"strategy"?: {
			"rollingSync"?: "steps"?: [...{
				"matchExpressions"?: [...{
					"key"?:      string
					"operator"?: string
					"values"?: [...string]
				}]
				"maxUpdate"?: matchN(>=1, [int, string]) & (int | string)
			}]
			"type"?: string
		}
		"syncPolicy"?: {
			"applicationsSync"?:            "create-only" | "create-update" | "create-delete" | "sync"
			"preserveResourcesOnDeletion"?: bool
		}
		"template"!: {
			"metadata"!: {
				"annotations"?: [string]: string
				"finalizers"?: [...string]
				"labels"?: {
					[string]: string
				}
				"name"?:      string
				"namespace"?: string
			}
			"spec"!: {
				"destination"!: {
					"name"?:      string
					"namespace"?: string
					"server"?:    string
				}
				"ignoreDifferences"?: [...{
					"group"?: string
					"jqPathExpressions"?: [...string]
					"jsonPointers"?: [...string]
					"kind"!: string
					"managedFieldsManagers"?: [...string]
					"name"?:      string
					"namespace"?: string
				}]
				"info"?: [...{
					"name"!:  string
					"value"!: string
				}]
				"project"!:              string
				"revisionHistoryLimit"?: int64 & int
				"source"?: {
					"chart"?: string
					"directory"?: {
						"exclude"?: string
						"include"?: string
						"jsonnet"?: {
							"extVars"?: [...{
								"code"?:  bool
								"name"!:  string
								"value"!: string
							}]
							"libs"?: [...string]
							"tlas"?: [...{
								"code"?:  bool
								"name"!:  string
								"value"!: string
							}]
						}
						"recurse"?: bool
					}
					"helm"?: {
						"apiVersions"?: [...string]
						"fileParameters"?: [...{
							"name"?: string
							"path"?: string
						}]
						"ignoreMissingValueFiles"?: bool
						"kubeVersion"?:             string
						"namespace"?:               string
						"parameters"?: [...{
							"forceString"?: bool
							"name"?:        string
							"value"?:       string
						}]
						"passCredentials"?:      bool
						"releaseName"?:          string
						"skipCrds"?:             bool
						"skipSchemaValidation"?: bool
						"skipTests"?:            bool
						"valueFiles"?: [...string]
						"values"?: string
						"valuesObject"?: {
							...
						}
						"version"?: string
					}
					"kustomize"?: {
						"apiVersions"?: [...string]
						"commonAnnotations"?: {
							[string]: string
						}
						"commonAnnotationsEnvsubst"?: bool
						"commonLabels"?: {
							[string]: string
						}
						"components"?: [...string]
						"forceCommonAnnotations"?:  bool
						"forceCommonLabels"?:       bool
						"ignoreMissingComponents"?: bool
						"images"?: [...string]
						"kubeVersion"?:           string
						"labelIncludeTemplates"?: bool
						"labelWithoutSelector"?:  bool
						"namePrefix"?:            string
						"nameSuffix"?:            string
						"namespace"?:             string
						"patches"?: [...{
							"options"?: [string]: bool
							"patch"?: string
							"path"?:  string
							"target"?: {
								"annotationSelector"?: string
								"group"?:              string
								"kind"?:               string
								"labelSelector"?:      string
								"name"?:               string
								"namespace"?:          string
								"version"?:            string
							}
						}]
						"replicas"?: [...{
							"count"!: matchN(>=1, [int, string]) & (int | string)
							"name"!: string
						}]
						"version"?: string
					}
					"name"?: string
					"path"?: string
					"plugin"?: {
						"env"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"name"?: string
						"parameters"?: [...{
							"array"?: [...string]
							"map"?: {
								[string]: string
							}
							"name"?:   string
							"string"?: string
						}]
					}
					"ref"?:            string
					"repoURL"!:        string
					"targetRevision"?: string
				}
				"sourceHydrator"?: {
					"drySource"!: {
						"path"!:           string
						"repoURL"!:        string
						"targetRevision"!: string
					}
					"hydrateTo"?: {
						"targetBranch"!: string
					}
					"syncSource"!: {
						"path"!:         string
						"targetBranch"!: string
					}
				}
				"sources"?: [...{
					"chart"?: string
					"directory"?: {
						"exclude"?: string
						"include"?: string
						"jsonnet"?: {
							"extVars"?: [...{
								"code"?:  bool
								"name"!:  string
								"value"!: string
							}]
							"libs"?: [...string]
							"tlas"?: [...{
								"code"?:  bool
								"name"!:  string
								"value"!: string
							}]
						}
						"recurse"?: bool
					}
					"helm"?: {
						"apiVersions"?: [...string]
						"fileParameters"?: [...{
							"name"?: string
							"path"?: string
						}]
						"ignoreMissingValueFiles"?: bool
						"kubeVersion"?:             string
						"namespace"?:               string
						"parameters"?: [...{
							"forceString"?: bool
							"name"?:        string
							"value"?:       string
						}]
						"passCredentials"?:      bool
						"releaseName"?:          string
						"skipCrds"?:             bool
						"skipSchemaValidation"?: bool
						"skipTests"?:            bool
						"valueFiles"?: [...string]
						"values"?: string
						"valuesObject"?: {
							...
						}
						"version"?: string
					}
					"kustomize"?: {
						"apiVersions"?: [...string]
						"commonAnnotations"?: {
							[string]: string
						}
						"commonAnnotationsEnvsubst"?: bool
						"commonLabels"?: {
							[string]: string
						}
						"components"?: [...string]
						"forceCommonAnnotations"?:  bool
						"forceCommonLabels"?:       bool
						"ignoreMissingComponents"?: bool
						"images"?: [...string]
						"kubeVersion"?:           string
						"labelIncludeTemplates"?: bool
						"labelWithoutSelector"?:  bool
						"namePrefix"?:            string
						"nameSuffix"?:            string
						"namespace"?:             string
						"patches"?: [...{
							"options"?: [string]: bool
							"patch"?: string
							"path"?:  string
							"target"?: {
								"annotationSelector"?: string
								"group"?:              string
								"kind"?:               string
								"labelSelector"?:      string
								"name"?:               string
								"namespace"?:          string
								"version"?:            string
							}
						}]
						"replicas"?: [...{
							"count"!: matchN(>=1, [int, string]) & (int | string)
							"name"!: string
						}]
						"version"?: string
					}
					"name"?: string
					"path"?: string
					"plugin"?: {
						"env"?: [...{
							"name"!:  string
							"value"!: string
						}]
						"name"?: string
						"parameters"?: [...{
							"array"?: [...string]
							"map"?: {
								[string]: string
							}
							"name"?:   string
							"string"?: string
						}]
					}
					"ref"?:            string
					"repoURL"!:        string
					"targetRevision"?: string
				}]
				"syncPolicy"?: {
					"automated"?: {
						"allowEmpty"?: bool
						"enabled"?:    bool
						"prune"?:      bool
						"selfHeal"?:   bool
					}
					"managedNamespaceMetadata"?: {
						"annotations"?: [string]: string
						"labels"?: {
							[string]: string
						}
					}
					"retry"?: {
						"backoff"?: {
							"duration"?:    string
							"factor"?:      int64 & int
							"maxDuration"?: string
						}
						"limit"?: int64 & int
					}
					"syncOptions"?: [...string]
				}
			}
		}
		"templatePatch"?: string
	}
	"status"?: {
		"applicationStatus"?: [...{
			"application"!:        string
			"lastTransitionTime"?: time.Time
			"message"!:            string
			"status"!:             string
			"step"!:               string
			"targetRevisions"!: [...string]
		}]
		"conditions"?: [...{
			"lastTransitionTime"?: time.Time
			"message"!:            string
			"reason"!:             string
			"status"!:             string
			"type"!:               string
		}]
		"resources"?: [...{
			"group"?: string
			"health"?: {
				"lastTransitionTime"?: time.Time
				"message"?:            string
				"status"?:             string
			}
			"hook"?:                         bool
			"kind"?:                         string
			"name"?:                         string
			"namespace"?:                    string
			"requiresDeletionConfirmation"?: bool
			"requiresPruning"?:              bool
			"status"?:                       string
			"syncWave"?:                     int64 & int
			"version"?:                      string
		}]
	}

	_embeddedResource: {
		"apiVersion"!: string
		"kind"!:       string
		"metadata"?: {
			...
		}
	}
	apiVersion: "argoproj.io/v1alpha1"
	kind:       "ApplicationSet"
	metadata!: {
		"name"!:      string
		"namespace"!: string
		"labels"?: {
			[string]: string
		}
		"annotations"?: {
			[string]: string
		}
		...
	}
}
