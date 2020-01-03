package plugins

import "testing"

// TestLoadFromPlugin ...
func TestLoadFromPlugin(t *testing.T) {
	LoadFromPlugin("./example/go_plugin/plugin.so")
}
