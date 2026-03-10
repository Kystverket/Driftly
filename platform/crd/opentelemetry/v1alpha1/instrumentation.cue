package v1alpha1

#Instrumentation: {
	_embeddedResource
	apiVersion?: string
	kind?:       string
	metadata?: {}
	spec?: {
		apacheHttpd?: {
			attrs?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			configPath?: string
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			image?: string
			resourceRequirements?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			version?: string
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		defaults?: useLabelsForResourceAttributes?: bool
		dotnet?: {
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			image?: string
			resourceRequirements?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		env?: [...{
			name!:  string
			value?: string
			valueFrom?: {
				configMapKeyRef?: {
					key!:      string
					name?:     string
					optional?: bool
				}
				fieldRef?: {
					apiVersion?: string
					fieldPath!:  string
				}
				resourceFieldRef?: {
					containerName?: string
					divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					resource!: string
				}
				secretKeyRef?: {
					key!:      string
					name?:     string
					optional?: bool
				}
			}
		}]
		exporter?: {
			endpoint?: string
			tls?: {
				ca_file?:       string
				cert_file?:     string
				configMapName?: string
				key_file?:      string
				secretName?:    string
			}
		}
		go?: {
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			image?: string
			resourceRequirements?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		imagePullPolicy?: string
		java?: {
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			extensions?: [...{
				dir!:   string
				image!: string
			}]
			image?: string
			resources?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		nginx?: {
			attrs?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			configFile?: string
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			image?: string
			resourceRequirements?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		nodejs?: {
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			image?: string
			resourceRequirements?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		propagators?: [..."tracecontext" | "baggage" | "b3" | "b3multi" | "jaeger" | "xray" | "ottrace" | "none"]
		python?: {
			env?: [...{
				name!:  string
				value?: string
				valueFrom?: {
					configMapKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
					secretKeyRef?: {
						key!:      string
						name?:     string
						optional?: bool
					}
				}
			}]
			image?: string
			resourceRequirements?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			volumeClaimTemplate?: {
				metadata?: {
					annotations?: [string]: string
					finalizers?: [...string]
					labels?: [string]: string
					name?:      string
					namespace?: string
				}
				spec!: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind!:     string
						name!:     string
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind!:      string
						name!:      string
						namespace?: string
					}
					resources?: {
						limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
					selector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					storageClassName?:          string
					volumeAttributesClassName?: string
					volumeMode?:                string
					volumeName?:                string
				}
			}
			volumeLimitSize?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		resource?: {
			addK8sUIDAttributes?: bool
			resourceAttributes?: [string]: string
		}
		sampler?: {
			argument?: string
			type?:     "always_on" | "always_off" | "traceidratio" | "parentbased_always_on" | "parentbased_always_off" | "parentbased_traceidratio" | "jaeger_remote" | "xray"
		}
	}
	status?: {}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "opentelemetry.io/v1alpha1"
	kind:       "Instrumentation"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]:      string
		annotations?: [string]: string
		...
	}
}
