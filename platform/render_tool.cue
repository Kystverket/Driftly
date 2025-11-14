package platform

import "encoding/yaml"

import "tool/file"

_data: Apps

command: render: {
	for service, envs in _data
	for env, apps in envs
	for app, manifest in apps {
		(service): (env): (app): {
			if (manifest.apiVersion & string) != _|_ {
				(manifest.metadata.name): {
					dir: file.MkdirAll & {
						path: "_rendered/\(service)/\(env)/\(app)"
						$dep: remove.$done
					}
					render: file.Create & {
						filename: "_rendered/\(service)/\(env)/\(app)/\(manifest.metadata.name).yaml"
						contents: yaml.Marshal(manifest)
						$dep:     dir.$done
					}
				}
			}
		}
	}
	remove: file.RemoveAll & {
		path: "_rendered"
	}
}
