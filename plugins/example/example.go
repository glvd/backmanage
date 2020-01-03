package example

import (
	"github.com/glvd/go-admin/context"
	c "github.com/glvd/go-admin/modules/config"
	"github.com/glvd/go-admin/modules/service"
	"github.com/glvd/go-admin/plugins"
)

// Example ...
type Example struct {
	app *context.App
}

// NewExample ...
func NewExample() *Example {
	return Plug
}

// Plug ...
var Plug = new(Example)

var config c.Config

// SetConfig ...
func SetConfig(cfg c.Config) {
	config = cfg
}

var services service.List

// InitPlugin ...
func (example *Example) InitPlugin(srv service.List) {
	config = c.Get()

	Plug.app = InitRouter(config.Prefix(), srv)
	services = srv
}

// GetRequest ...
func (example *Example) GetRequest() []context.Path {
	return example.app.Requests
}

// GetHandler ...
func (example *Example) GetHandler(url, method string) context.Handlers {
	return plugins.GetHandler(url, method, example.app)
}
