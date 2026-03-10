package v1alpha1

import "time"

#OpenTelemetryCollector: {
	_embeddedResource
	apiVersion?: string
	kind?:       string
	metadata?: {}
	spec?: {
		additionalContainers?: [...{
			args?: [...string]
			command?: [...string]
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
			envFrom?: [...{
				configMapRef?: {
					name?:     string
					optional?: bool
				}
				prefix?: string
				secretRef?: {
					name?:     string
					optional?: bool
				}
			}]
			image?:           string
			imagePullPolicy?: string
			lifecycle?: {
				postStart?: {
					exec?: command?: [...string]
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name!:  string
							value!: string
						}]
						path?: string
						port!: matchN(>=1, [int, string]) & (int | string)
						scheme?: string
					}
					sleep?: seconds!: int64 & int
					tcpSocket?: {
						host?: string
						port!: matchN(>=1, [int, string]) & (int | string)
					}
				}
				preStop?: {
					exec?: command?: [...string]
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name!:  string
							value!: string
						}]
						path?: string
						port!: matchN(>=1, [int, string]) & (int | string)
						scheme?: string
					}
					sleep?: seconds!: int64 & int
					tcpSocket?: {
						host?: string
						port!: matchN(>=1, [int, string]) & (int | string)
					}
				}
			}
			livenessProbe?: {
				exec?: command?: [...string]
				failureThreshold?: int32 & int
				grpc?: {
					port!:    int32 & int
					service?: string
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				initialDelaySeconds?: int32 & int
				periodSeconds?:       int32 & int
				successThreshold?:    int32 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
				terminationGracePeriodSeconds?: int64 & int
				timeoutSeconds?:                int32 & int
			}
			name!: string
			ports?: [...{
				containerPort!: int32 & int
				hostIP?:        string
				hostPort?:      int32 & int
				name?:          string
				protocol?:      string
			}]
			readinessProbe?: {
				exec?: command?: [...string]
				failureThreshold?: int32 & int
				grpc?: {
					port!:    int32 & int
					service?: string
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				initialDelaySeconds?: int32 & int
				periodSeconds?:       int32 & int
				successThreshold?:    int32 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
				terminationGracePeriodSeconds?: int64 & int
				timeoutSeconds?:                int32 & int
			}
			resizePolicy?: [...{
				resourceName!:  string
				restartPolicy!: string
			}]
			resources?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			restartPolicy?: string
			securityContext?: {
				allowPrivilegeEscalation?: bool
				appArmorProfile?: {
					localhostProfile?: string
					type!:             string
				}
				capabilities?: {
					add?: [...string]
					drop?: [...string]
				}
				privileged?:             bool
				procMount?:              string
				readOnlyRootFilesystem?: bool
				runAsGroup?:             int64 & int
				runAsNonRoot?:           bool
				runAsUser?:              int64 & int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
				}
				seccompProfile?: {
					localhostProfile?: string
					type!:             string
				}
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
				}
			}
			startupProbe?: {
				exec?: command?: [...string]
				failureThreshold?: int32 & int
				grpc?: {
					port!:    int32 & int
					service?: string
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				initialDelaySeconds?: int32 & int
				periodSeconds?:       int32 & int
				successThreshold?:    int32 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
				terminationGracePeriodSeconds?: int64 & int
				timeoutSeconds?:                int32 & int
			}
			stdin?:                    bool
			stdinOnce?:                bool
			terminationMessagePath?:   string
			terminationMessagePolicy?: string
			tty?:                      bool
			volumeDevices?: [...{
				devicePath!: string
				name!:       string
			}]
			volumeMounts?: [...{
				mountPath!:         string
				mountPropagation?:  string
				name!:              string
				readOnly?:          bool
				recursiveReadOnly?: string
				subPath?:           string
				subPathExpr?:       string
			}]
			workingDir?: string
		}]
		affinity?: {
			nodeAffinity?: {
				preferredDuringSchedulingIgnoredDuringExecution?: [...{
					preference!: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchFields?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
					}
					weight!: int32 & int
				}]
				requiredDuringSchedulingIgnoredDuringExecution?: nodeSelectorTerms!: [...{
					matchExpressions?: [...{
						key!:      string
						operator!: string
						values?: [...string]
					}]
					matchFields?: [...{
						key!:      string
						operator!: string
						values?: [...string]
					}]
				}]
			}
			podAffinity?: {
				preferredDuringSchedulingIgnoredDuringExecution?: [...{
					podAffinityTerm!: {
						labelSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						matchLabelKeys?: [...string]
						mismatchLabelKeys?: [...string]
						namespaceSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						namespaces?: [...string]
						topologyKey!: string
					}
					weight!: int32 & int
				}]
				requiredDuringSchedulingIgnoredDuringExecution?: [...{
					labelSelector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					matchLabelKeys?: [...string]
					mismatchLabelKeys?: [...string]
					namespaceSelector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					namespaces?: [...string]
					topologyKey!: string
				}]
			}
			podAntiAffinity?: {
				preferredDuringSchedulingIgnoredDuringExecution?: [...{
					podAffinityTerm!: {
						labelSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						matchLabelKeys?: [...string]
						mismatchLabelKeys?: [...string]
						namespaceSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						namespaces?: [...string]
						topologyKey!: string
					}
					weight!: int32 & int
				}]
				requiredDuringSchedulingIgnoredDuringExecution?: [...{
					labelSelector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					matchLabelKeys?: [...string]
					mismatchLabelKeys?: [...string]
					namespaceSelector?: {
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchLabels?: [string]: string
					}
					namespaces?: [...string]
					topologyKey!: string
				}]
			}
		}
		args?: [string]: string
		autoscaler?: {
			behavior?: {
				scaleDown?: {
					policies?: [...{
						periodSeconds!: int32 & int
						type!:          string
						value!:         int32 & int
					}]
					selectPolicy?:               string
					stabilizationWindowSeconds?: int32 & int
				}
				scaleUp?: {
					policies?: [...{
						periodSeconds!: int32 & int
						type!:          string
						value!:         int32 & int
					}]
					selectPolicy?:               string
					stabilizationWindowSeconds?: int32 & int
				}
			}
			maxReplicas?: int32 & int
			metrics?: [...{
				pods?: {
					metric!: {
						name!: string
						selector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
					}
					target!: {
						averageUtilization?: int32 & int
						averageValue?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						type!: string
						value?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
					}
				}
				type!: string
			}]
			minReplicas?:             int32 & int
			targetCPUUtilization?:    int32 & int
			targetMemoryUtilization?: int32 & int
		}
		config!: string
		configmaps?: [...{
			mountpath!: string
			name!:      string
		}]
		deploymentUpdateStrategy?: {
			rollingUpdate?: {
				maxSurge?: matchN(>=1, [int, string]) & (int | string)
				maxUnavailable?: matchN(>=1, [int, string]) & (int | string)
			}
			type?: string
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
		envFrom?: [...{
			configMapRef?: {
				name?:     string
				optional?: bool
			}
			prefix?: string
			secretRef?: {
				name?:     string
				optional?: bool
			}
		}]
		hostNetwork?:     bool
		image?:           string
		imagePullPolicy?: string
		ingress?: {
			annotations?: [string]: string
			hostname?:         string
			ingressClassName?: string
			route?: termination?: "insecure" | "edge" | "passthrough" | "reencrypt"
			ruleType?: "path" | "subdomain"
			tls?: [...{
				hosts?: [...string]
				secretName?: string
			}]
			type?: "ingress" | "route"
		}
		initContainers?: [...{
			args?: [...string]
			command?: [...string]
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
			envFrom?: [...{
				configMapRef?: {
					name?:     string
					optional?: bool
				}
				prefix?: string
				secretRef?: {
					name?:     string
					optional?: bool
				}
			}]
			image?:           string
			imagePullPolicy?: string
			lifecycle?: {
				postStart?: {
					exec?: command?: [...string]
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name!:  string
							value!: string
						}]
						path?: string
						port!: matchN(>=1, [int, string]) & (int | string)
						scheme?: string
					}
					sleep?: seconds!: int64 & int
					tcpSocket?: {
						host?: string
						port!: matchN(>=1, [int, string]) & (int | string)
					}
				}
				preStop?: {
					exec?: command?: [...string]
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name!:  string
							value!: string
						}]
						path?: string
						port!: matchN(>=1, [int, string]) & (int | string)
						scheme?: string
					}
					sleep?: seconds!: int64 & int
					tcpSocket?: {
						host?: string
						port!: matchN(>=1, [int, string]) & (int | string)
					}
				}
			}
			livenessProbe?: {
				exec?: command?: [...string]
				failureThreshold?: int32 & int
				grpc?: {
					port!:    int32 & int
					service?: string
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				initialDelaySeconds?: int32 & int
				periodSeconds?:       int32 & int
				successThreshold?:    int32 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
				terminationGracePeriodSeconds?: int64 & int
				timeoutSeconds?:                int32 & int
			}
			name!: string
			ports?: [...{
				containerPort!: int32 & int
				hostIP?:        string
				hostPort?:      int32 & int
				name?:          string
				protocol?:      string
			}]
			readinessProbe?: {
				exec?: command?: [...string]
				failureThreshold?: int32 & int
				grpc?: {
					port!:    int32 & int
					service?: string
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				initialDelaySeconds?: int32 & int
				periodSeconds?:       int32 & int
				successThreshold?:    int32 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
				terminationGracePeriodSeconds?: int64 & int
				timeoutSeconds?:                int32 & int
			}
			resizePolicy?: [...{
				resourceName!:  string
				restartPolicy!: string
			}]
			resources?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			restartPolicy?: string
			securityContext?: {
				allowPrivilegeEscalation?: bool
				appArmorProfile?: {
					localhostProfile?: string
					type!:             string
				}
				capabilities?: {
					add?: [...string]
					drop?: [...string]
				}
				privileged?:             bool
				procMount?:              string
				readOnlyRootFilesystem?: bool
				runAsGroup?:             int64 & int
				runAsNonRoot?:           bool
				runAsUser?:              int64 & int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
				}
				seccompProfile?: {
					localhostProfile?: string
					type!:             string
				}
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
				}
			}
			startupProbe?: {
				exec?: command?: [...string]
				failureThreshold?: int32 & int
				grpc?: {
					port!:    int32 & int
					service?: string
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				initialDelaySeconds?: int32 & int
				periodSeconds?:       int32 & int
				successThreshold?:    int32 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
				terminationGracePeriodSeconds?: int64 & int
				timeoutSeconds?:                int32 & int
			}
			stdin?:                    bool
			stdinOnce?:                bool
			terminationMessagePath?:   string
			terminationMessagePolicy?: string
			tty?:                      bool
			volumeDevices?: [...{
				devicePath!: string
				name!:       string
			}]
			volumeMounts?: [...{
				mountPath!:         string
				mountPropagation?:  string
				name!:              string
				readOnly?:          bool
				recursiveReadOnly?: string
				subPath?:           string
				subPathExpr?:       string
			}]
			workingDir?: string
		}]
		lifecycle?: {
			postStart?: {
				exec?: command?: [...string]
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				sleep?: seconds!: int64 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
			}
			preStop?: {
				exec?: command?: [...string]
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name!:  string
						value!: string
					}]
					path?: string
					port!: matchN(>=1, [int, string]) & (int | string)
					scheme?: string
				}
				sleep?: seconds!: int64 & int
				tcpSocket?: {
					host?: string
					port!: matchN(>=1, [int, string]) & (int | string)
				}
			}
		}
		livenessProbe?: {
			failureThreshold?:              int32 & int
			initialDelaySeconds?:           int32 & int
			periodSeconds?:                 int32 & int
			successThreshold?:              int32 & int
			terminationGracePeriodSeconds?: int64 & int
			timeoutSeconds?:                int32 & int
		}
		managementState!: "managed" | "unmanaged"
		maxReplicas?:     int32 & int
		minReplicas?:     int32 & int
		mode?:            "daemonset" | "deployment" | "sidecar" | "statefulset"
		nodeSelector?: [string]: string
		observability?: metrics?: {
			DisablePrometheusAnnotations?: bool
			enableMetrics?:                bool
		}
		podAnnotations?: [string]: string
		podDisruptionBudget?: {
			maxUnavailable?: matchN(>=1, [int, string]) & (int | string)
			minAvailable?: matchN(>=1, [int, string]) & (int | string)
		}
		podSecurityContext?: {
			appArmorProfile?: {
				localhostProfile?: string
				type!:             string
			}
			fsGroup?:             int64 & int
			fsGroupChangePolicy?: string
			runAsGroup?:          int64 & int
			runAsNonRoot?:        bool
			runAsUser?:           int64 & int
			seLinuxChangePolicy?: string
			seLinuxOptions?: {
				level?: string
				role?:  string
				type?:  string
				user?:  string
			}
			seccompProfile?: {
				localhostProfile?: string
				type!:             string
			}
			supplementalGroups?: [...int64 & int]
			supplementalGroupsPolicy?: string
			sysctls?: [...{
				name!:  string
				value!: string
			}]
			windowsOptions?: {
				gmsaCredentialSpec?:     string
				gmsaCredentialSpecName?: string
				hostProcess?:            bool
				runAsUserName?:          string
			}
		}
		ports?: [...{
			appProtocol?: string
			hostPort?:    int32 & int
			name?:        string
			nodePort?:    int32 & int
			port!:        int32 & int
			protocol?:    string
			targetPort?: matchN(>=1, [int, string]) & (int | string)
		}]
		priorityClassName?: string
		replicas?:          int32 & int
		resources?: {
			claims?: [...{
				name!:    string
				request?: string
			}]
			limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
		}
		securityContext?: {
			allowPrivilegeEscalation?: bool
			appArmorProfile?: {
				localhostProfile?: string
				type!:             string
			}
			capabilities?: {
				add?: [...string]
				drop?: [...string]
			}
			privileged?:             bool
			procMount?:              string
			readOnlyRootFilesystem?: bool
			runAsGroup?:             int64 & int
			runAsNonRoot?:           bool
			runAsUser?:              int64 & int
			seLinuxOptions?: {
				level?: string
				role?:  string
				type?:  string
				user?:  string
			}
			seccompProfile?: {
				localhostProfile?: string
				type!:             string
			}
			windowsOptions?: {
				gmsaCredentialSpec?:     string
				gmsaCredentialSpecName?: string
				hostProcess?:            bool
				runAsUserName?:          string
			}
		}
		serviceAccount?:        string
		serviceName?:           string
		shareProcessNamespace?: bool
		targetAllocator?: {
			affinity?: {
				nodeAffinity?: {
					preferredDuringSchedulingIgnoredDuringExecution?: [...{
						preference!: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchFields?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
						}
						weight!: int32 & int
					}]
					requiredDuringSchedulingIgnoredDuringExecution?: nodeSelectorTerms!: [...{
						matchExpressions?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
						matchFields?: [...{
							key!:      string
							operator!: string
							values?: [...string]
						}]
					}]
				}
				podAffinity?: {
					preferredDuringSchedulingIgnoredDuringExecution?: [...{
						podAffinityTerm!: {
							labelSelector?: {
								matchExpressions?: [...{
									key!:      string
									operator!: string
									values?: [...string]
								}]
								matchLabels?: [string]: string
							}
							matchLabelKeys?: [...string]
							mismatchLabelKeys?: [...string]
							namespaceSelector?: {
								matchExpressions?: [...{
									key!:      string
									operator!: string
									values?: [...string]
								}]
								matchLabels?: [string]: string
							}
							namespaces?: [...string]
							topologyKey!: string
						}
						weight!: int32 & int
					}]
					requiredDuringSchedulingIgnoredDuringExecution?: [...{
						labelSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						matchLabelKeys?: [...string]
						mismatchLabelKeys?: [...string]
						namespaceSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						namespaces?: [...string]
						topologyKey!: string
					}]
				}
				podAntiAffinity?: {
					preferredDuringSchedulingIgnoredDuringExecution?: [...{
						podAffinityTerm!: {
							labelSelector?: {
								matchExpressions?: [...{
									key!:      string
									operator!: string
									values?: [...string]
								}]
								matchLabels?: [string]: string
							}
							matchLabelKeys?: [...string]
							mismatchLabelKeys?: [...string]
							namespaceSelector?: {
								matchExpressions?: [...{
									key!:      string
									operator!: string
									values?: [...string]
								}]
								matchLabels?: [string]: string
							}
							namespaces?: [...string]
							topologyKey!: string
						}
						weight!: int32 & int
					}]
					requiredDuringSchedulingIgnoredDuringExecution?: [...{
						labelSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						matchLabelKeys?: [...string]
						mismatchLabelKeys?: [...string]
						namespaceSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						namespaces?: [...string]
						topologyKey!: string
					}]
				}
			}
			allocationStrategy?: "least-weighted" | "consistent-hashing" | "per-node"
			enabled?:            bool
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
			filterStrategy?: string
			image?:          string
			nodeSelector?: [string]: string
			observability?: metrics?: {
				DisablePrometheusAnnotations?: bool
				enableMetrics?:                bool
			}
			podDisruptionBudget?: {
				maxUnavailable?: matchN(>=1, [int, string]) & (int | string)
				minAvailable?: matchN(>=1, [int, string]) & (int | string)
			}
			podSecurityContext?: {
				appArmorProfile?: {
					localhostProfile?: string
					type!:             string
				}
				fsGroup?:             int64 & int
				fsGroupChangePolicy?: string
				runAsGroup?:          int64 & int
				runAsNonRoot?:        bool
				runAsUser?:           int64 & int
				seLinuxChangePolicy?: string
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
				}
				seccompProfile?: {
					localhostProfile?: string
					type!:             string
				}
				supplementalGroups?: [...int64 & int]
				supplementalGroupsPolicy?: string
				sysctls?: [...{
					name!:  string
					value!: string
				}]
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
				}
			}
			prometheusCR?: {
				enabled?: bool
				podMonitorSelector?: [string]: string
				scrapeInterval?: string
				serviceMonitorSelector?: [string]: string
			}
			replicas?: int32 & int
			resources?: {
				claims?: [...{
					name!:    string
					request?: string
				}]
				limits?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				requests?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			securityContext?: {
				allowPrivilegeEscalation?: bool
				appArmorProfile?: {
					localhostProfile?: string
					type!:             string
				}
				capabilities?: {
					add?: [...string]
					drop?: [...string]
				}
				privileged?:             bool
				procMount?:              string
				readOnlyRootFilesystem?: bool
				runAsGroup?:             int64 & int
				runAsNonRoot?:           bool
				runAsUser?:              int64 & int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
				}
				seccompProfile?: {
					localhostProfile?: string
					type!:             string
				}
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
				}
			}
			serviceAccount?: string
			tolerations?: [...{
				effect?:            string
				key?:               string
				operator?:          string
				tolerationSeconds?: int64 & int
				value?:             string
			}]
			topologySpreadConstraints?: [...{
				labelSelector?: {
					matchExpressions?: [...{
						key!:      string
						operator!: string
						values?: [...string]
					}]
					matchLabels?: [string]: string
				}
				matchLabelKeys?: [...string]
				maxSkew!:            int32 & int
				minDomains?:         int32 & int
				nodeAffinityPolicy?: string
				nodeTaintsPolicy?:   string
				topologyKey!:        string
				whenUnsatisfiable!:  string
			}]
		}
		terminationGracePeriodSeconds?: int64 & int
		tolerations?: [...{
			effect?:            string
			key?:               string
			operator?:          string
			tolerationSeconds?: int64 & int
			value?:             string
		}]
		topologySpreadConstraints?: [...{
			labelSelector?: {
				matchExpressions?: [...{
					key!:      string
					operator!: string
					values?: [...string]
				}]
				matchLabels?: [string]: string
			}
			matchLabelKeys?: [...string]
			maxSkew!:            int32 & int
			minDomains?:         int32 & int
			nodeAffinityPolicy?: string
			nodeTaintsPolicy?:   string
			topologyKey!:        string
			whenUnsatisfiable!:  string
		}]
		trafficDistribution?: string
		updateStrategy?: {
			rollingUpdate?: {
				maxSurge?: matchN(>=1, [int, string]) & (int | string)
				maxUnavailable?: matchN(>=1, [int, string]) & (int | string)
			}
			type?: string
		}
		upgradeStrategy?: "automatic" | "none"
		volumeClaimTemplates?: [...{
			apiVersion?: string
			kind?:       string
			metadata?: {
				annotations?: [string]: string
				finalizers?: [...string]
				labels?: [string]: string
				name?:      string
				namespace?: string
			}
			spec?: {
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
			status?: {
				accessModes?: [...string]
				allocatedResourceStatuses?: [string]: string
				allocatedResources?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				capacity?: [string]: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
				conditions?: [...{
					lastProbeTime?:      time.Time
					lastTransitionTime?: time.Time
					message?:            string
					reason?:             string
					status!:             string
					type!:               string
				}]
				currentVolumeAttributesClassName?: string
				modifyVolumeStatus?: {
					status!:                          string
					targetVolumeAttributesClassName?: string
				}
				phase?: string
			}
		}]
		volumeMounts?: [...{
			mountPath!:         string
			mountPropagation?:  string
			name!:              string
			readOnly?:          bool
			recursiveReadOnly?: string
			subPath?:           string
			subPathExpr?:       string
		}]
		volumes?: [...{
			awsElasticBlockStore?: {
				fsType?:    string
				partition?: int32 & int
				readOnly?:  bool
				volumeID!:  string
			}
			azureDisk?: {
				cachingMode?: string
				diskName!:    string
				diskURI!:     string
				fsType?:      string
				kind?:        string
				readOnly?:    bool
			}
			azureFile?: {
				readOnly?:   bool
				secretName!: string
				shareName!:  string
			}
			cephfs?: {
				monitors!: [...string]
				path?:       string
				readOnly?:   bool
				secretFile?: string
				secretRef?: name?: string
				user?: string
			}
			cinder?: {
				fsType?:   string
				readOnly?: bool
				secretRef?: name?: string
				volumeID!: string
			}
			configMap?: {
				defaultMode?: int32 & int
				items?: [...{
					key!:  string
					mode?: int32 & int
					path!: string
				}]
				name?:     string
				optional?: bool
			}
			csi?: {
				driver!: string
				fsType?: string
				nodePublishSecretRef?: name?: string
				readOnly?: bool
				volumeAttributes?: [string]: string
			}
			downwardAPI?: {
				defaultMode?: int32 & int
				items?: [...{
					fieldRef?: {
						apiVersion?: string
						fieldPath!:  string
					}
					mode?: int32 & int
					path!: string
					resourceFieldRef?: {
						containerName?: string
						divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
						resource!: string
					}
				}]
			}
			emptyDir?: {
				medium?: string
				sizeLimit?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
			}
			ephemeral?: volumeClaimTemplate?: {
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
			fc?: {
				fsType?:   string
				lun?:      int32 & int
				readOnly?: bool
				targetWWNs?: [...string]
				wwids?: [...string]
			}
			flexVolume?: {
				driver!: string
				fsType?: string
				options?: [string]: string
				readOnly?: bool
				secretRef?: name?: string
			}
			flocker?: {
				datasetName?: string
				datasetUUID?: string
			}
			gcePersistentDisk?: {
				fsType?:    string
				partition?: int32 & int
				pdName!:    string
				readOnly?:  bool
			}
			gitRepo?: {
				directory?:  string
				repository!: string
				revision?:   string
			}
			glusterfs?: {
				endpoints!: string
				path!:      string
				readOnly?:  bool
			}
			hostPath?: {
				path!: string
				type?: string
			}
			image?: {
				pullPolicy?: string
				reference?:  string
			}
			iscsi?: {
				chapAuthDiscovery?: bool
				chapAuthSession?:   bool
				fsType?:            string
				initiatorName?:     string
				iqn!:               string
				iscsiInterface?:    string
				lun!:               int32 & int
				portals?: [...string]
				readOnly?: bool
				secretRef?: name?: string
				targetPortal!: string
			}
			name!: string
			nfs?: {
				path!:     string
				readOnly?: bool
				server!:   string
			}
			persistentVolumeClaim?: {
				claimName!: string
				readOnly?:  bool
			}
			photonPersistentDisk?: {
				fsType?: string
				pdID!:   string
			}
			portworxVolume?: {
				fsType?:   string
				readOnly?: bool
				volumeID!: string
			}
			projected?: {
				defaultMode?: int32 & int
				sources?: [...{
					clusterTrustBundle?: {
						labelSelector?: {
							matchExpressions?: [...{
								key!:      string
								operator!: string
								values?: [...string]
							}]
							matchLabels?: [string]: string
						}
						name?:       string
						optional?:   bool
						path!:       string
						signerName?: string
					}
					configMap?: {
						items?: [...{
							key!:  string
							mode?: int32 & int
							path!: string
						}]
						name?:     string
						optional?: bool
					}
					downwardAPI?: items?: [...{
						fieldRef?: {
							apiVersion?: string
							fieldPath!:  string
						}
						mode?: int32 & int
						path!: string
						resourceFieldRef?: {
							containerName?: string
							divisor?: matchN(>=1, [int, string]) & (int | =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$")
							resource!: string
						}
					}]
					secret?: {
						items?: [...{
							key!:  string
							mode?: int32 & int
							path!: string
						}]
						name?:     string
						optional?: bool
					}
					serviceAccountToken?: {
						audience?:          string
						expirationSeconds?: int64 & int
						path!:              string
					}
				}]
			}
			quobyte?: {
				group?:    string
				readOnly?: bool
				registry!: string
				tenant?:   string
				user?:     string
				volume!:   string
			}
			rbd?: {
				fsType?:  string
				image!:   string
				keyring?: string
				monitors!: [...string]
				pool?:     string
				readOnly?: bool
				secretRef?: name?: string
				user?: string
			}
			scaleIO?: {
				fsType?:           string
				gateway!:          string
				protectionDomain?: string
				readOnly?:         bool
				secretRef!: name?: string
				sslEnabled?:  bool
				storageMode?: string
				storagePool?: string
				system!:      string
				volumeName?:  string
			}
			secret?: {
				defaultMode?: int32 & int
				items?: [...{
					key!:  string
					mode?: int32 & int
					path!: string
				}]
				optional?:   bool
				secretName?: string
			}
			storageos?: {
				fsType?:   string
				readOnly?: bool
				secretRef?: name?: string
				volumeName?:      string
				volumeNamespace?: string
			}
			vsphereVolume?: {
				fsType?:            string
				storagePolicyID?:   string
				storagePolicyName?: string
				volumePath!:        string
			}
		}]
	}
	status?: {
		image?: string
		messages?: [...string]
		replicas?: int32 & int
		scale?: {
			replicas?:       int32 & int
			selector?:       string
			statusReplicas?: string
		}
		version?: string
	}

	_embeddedResource: {
		apiVersion!: string
		kind!:       string
		metadata?: {
			...
		}
	}
	apiVersion: "opentelemetry.io/v1alpha1"
	kind:       "OpenTelemetryCollector"
	metadata!: {
		name!:      string
		namespace!: string
		labels?: [string]: string
		annotations?: [string]: string
		...
	}
}
