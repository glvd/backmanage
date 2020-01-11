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
	s := &tasks.Signature{
		UUID:                        "",
		Name:                        "",
		RoutingKey:                  "",
		ETA:                         nil,
		GroupUUID:                   "",
		GroupTaskCount:              0,
		Args:                        nil,
		Headers:                     nil,
		Priority:                    0,
		Immutable:                   false,
		RetryCount:                  0,
		RetryTimeout:                0,
		OnSuccess:                   nil,
		OnError:                     nil,
		ChordCallback:               nil,
		BrokerMessageGroupId:        "",
		SQSReceiptHandle:            "",
		StopTaskDeletionOnError:     false,
		IgnoreWhenTaskNotRegistered: false,
	}
	result, e := _service.Send(s)
	if e != nil {
		return e
	}
	log.Infow("send:", "result", result)
	return nil
}
