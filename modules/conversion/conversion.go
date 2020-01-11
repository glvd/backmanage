package conversion

import (
	"github.com/glvd/cup/config"
	"github.com/glvd/cup/service"
)

var _service *service.Service

// Start ...
func Start() {
	cfg := config.Default()

	_service = service.NewService(*cfg)
}
