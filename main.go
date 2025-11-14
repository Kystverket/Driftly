package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/yaml"
)

type RenderPlan struct {
	Service   string
	Team      string
	App       string
	Env       string
	Resources []cue.Value
	err       error
}

var (
	r           []RenderPlan
	currentPlan *RenderPlan
)

func getCueFiles(dir string) []string {
	var files []string
	err := filepath.Walk(dir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			panic(err)
		}
		if !info.IsDir() && strings.HasSuffix(path, ".cue") {
			files = append(files, path)
		}
		return nil
	})
	if err != nil {
		panic(err)
	}
	return files
}

// Get kubernetes manifests
func parseResources(v cue.Value) bool {
	resource := v.LookupPath(cue.ParsePath("apiVersion"))
	if resource.Exists() {
		currentPlan.Resources = append(currentPlan.Resources, v)
		return false
	}
	return true
}

// Find config fields and create the build plan
func parseConfig(v cue.Value) bool {
	config := v.LookupPath(cue.ParsePath("config"))
	if config.Exists() {
		plan := RenderPlan{}
		var err error
		compileError := v.Validate(
			cue.All(),
			cue.Attributes(true),
			cue.Definitions(true),
			cue.InlineImports(true),
			cue.Concrete(true),
			cue.Final(),
			cue.DisallowCycles(true),
			cue.Hidden(true),
			cue.Optional(true),
		)
		if compileError != nil {
			plan.err = compileError
			r = append(r, plan)
			return false
		}

		plan.Team, err = config.LookupPath(cue.ParsePath("team")).String()
		if err != nil {
			plan.err = err
		}
		plan.Service, err = config.LookupPath(cue.ParsePath("service")).String()
		if err != nil {
			plan.err = err
		}
		plan.Env, err = config.LookupPath(cue.ParsePath("env")).String()
		if err != nil {
			plan.err = err
		}
		plan.App, err = config.LookupPath(cue.ParsePath("app")).String()
		if err != nil {
			plan.err = err
		}

		// Append resources to the current build plan
		r = append(r, plan)
		currentPlan = &r[len(r)-1]
		v.Walk(parseResources, nil)
		currentPlan = nil
		return false
	}
	return true
}

func parseCue(files []string) error {
	ctx := cuecontext.New()
	instances := load.Instances(files, nil)
	values, err := ctx.BuildInstances(instances)
	if err != nil {
		panic(err)
	}

	// Parse the values
	for _, value := range values {
		_, err := yaml.Encode(value)
		if err != nil {
			return err
		}
		value.Walk(parseConfig, nil)
	}
	return nil
}

func renderResults(outputDir string) {
	if !strings.Contains(outputDir, "_rendered") {
		fmt.Printf("error: outputDir must contain '_rendered' in its path\n")
		return
	}
	os.RemoveAll(outputDir)
	for _, plan := range r {
		if plan.err != nil {
			fmt.Printf("error: %v\n", plan.err)
			continue
		}
		path := filepath.Join(outputDir, plan.Team, plan.Service, plan.Env, plan.App)

		// remove existing _rendered
		os.MkdirAll(path, 0755)

		for _, v := range plan.Resources {
			name, err := v.LookupPath(cue.ParsePath("metadata.name")).String()
			if err != nil {
				fmt.Printf("error getting resource name: %v\n", err)
				continue
			}

			kind, err := v.LookupPath(cue.ParsePath("kind")).String()
			if err != nil {
				fmt.Printf("error getting resource kind: %v\n", err)
				continue
			}

			filename := filepath.Join(path, strings.ToLower(kind+"-"+name+".yaml"))

			c, err := yaml.Encode(v)
			if err != nil {
				fmt.Printf("error encoding resource to YAML: %v\n", err)
				continue
			}

			// Write YAML to file
			if err := os.WriteFile(filename, c, 0644); err != nil {
				fmt.Printf("error writing file %s: %v\n", filename, err)
				continue
			}

			fmt.Printf("Created: %s\n", filename)
		}
	}
}

func main() {
	dir := flag.String("dir", "", "Directory to scan for CUE files and render")
	flag.Parse()
	if *dir == "" {
		*dir = "apps"
	}
	outputDir := filepath.Join(*dir, "_rendered")
	files := getCueFiles(*dir)
	err := parseCue(files)
	if err != nil {
		fmt.Printf("error parsing CUE files: %v\n", err)
		os.Exit(1)
	}
	renderResults(outputDir)
}
