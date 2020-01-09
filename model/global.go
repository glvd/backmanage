package model

import (
	"github.com/goextension/log"
	"strconv"
	"sync"
)

// Global ...
type Global struct {
	Model
	Key     string
	Value   string
	Comment string
}

var _global map[string]string
var _globalMutex sync.RWMutex

func init() {
	RegisterTable(Global{})
	_global = make(map[string]string)
}

// RefreshGlobal ...
func RefreshGlobal(f func(key string, value string)) {
	_globalMutex.Lock()
	defer _globalMutex.Unlock()
	var globalList []*Global

	db := DB().Find(&globalList)
	if db.Error != nil {
		log.Errorw("refresh", "error", db.Error)
		return
	}
	for _, g := range globalList {
		_global[g.Key] = g.Value
		if f != nil {
			f(g.Key, g.Value)
		}
	}
}

// GlobalOnStart ...
func GlobalOnStart() {
	RefreshGlobal(nil)
}

// LoadGlobal ...
func LoadGlobal(key string) string {
	return LoadGlobalD(key, "")
}

// LoadGlobalD ...
func LoadGlobalD(key string, d string) string {
	if v, b := _global[key]; b {
		return v
	}
	return d
}

// LoadGlobalInt ...
func LoadGlobalInt(key string) int64 {
	return LoadGlobalIntD(key, 0)

}

// LoadGlobalIntD ...
func LoadGlobalIntD(key string, d int64) int64 {
	if v, b := _global[key]; b {
		i, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return d
		}
		return i
	}
	return d
}
