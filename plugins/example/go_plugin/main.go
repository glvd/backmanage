package main

import (
	"github.com/glvd/go-admin/context"
	c "github.com/glvd/go-admin/modules/config"
	"github.com/glvd/go-admin/plugins"
	e "github.com/glvd/go-admin/plugins/example"
)

// Example ...
type Example struct {
	app *context.App
}

// Plugin ...
var Plugin Example

var config c.Config

// InitPlugin ...
func (example Example) InitPlugin() {
	config = c.Get()
	Plugin.app = e.InitRouter(config.Prefix())
	e.SetConfig(config)
}

// GetRequest ...
func (example Example) GetRequest() []context.Path {
	return example.app.Requests
}

// GetHandler ...
func (example Example) GetHandler(url, method string) context.Handlers {
	return plugins.GetHandler(url, method, example.app)
}
