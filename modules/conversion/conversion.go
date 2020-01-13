package conversion

import (
	"github.com/RichardKnop/machinery/v1/tasks"
	"github.com/glvd/cup/config"
	"github.com/glvd/cup/service"
	"github.com/goextension/log"
)

var _service *service.Service

// Start ...
func Start() {
	cfg := config.Default()

	_service = service.NewService(*cfg)
}

func Send() error {
	signature := &tasks.Signature{
		Name: "slice",
		Args: []tasks.Arg{
			{
				Type:  "[]byte",
				Value: "",
			},
		},
	}
	result, e := _service.Send(signature)
	if e != nil {
		return e
	}
	log.Infow("send:", "result", result)

	return nil
}
