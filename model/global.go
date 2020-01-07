package model

import (
	"github.com/goextension/log"
	"sync"
)

// Global ...
type Global struct {
	Model
	Key   string
	Value string
}

var _global map[string]string
var _globalMutex sync.RWMutex

func init() {
	RegisterTable(Global{})
	_global = make(map[string]string)
}

// RefreshGlobal ...
func RefreshGlobal() {
	_globalMutex.Lock()
	defer _globalMutex.Unlock()
	var globalList []*Global

	db := DB().Find(globalList)
	if db.Error != nil {
		log.Errorw("refresh", "error", db.Error)
		return
	}
	for _, g := range globalList {
		_global[g.Key] = g.Value
	}
}

// LoadGlobal ...
func LoadGlobal(key string) string {
	if v, b := _global[key]; b {
		return v
	}
	return ""
}
