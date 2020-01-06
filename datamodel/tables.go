package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
)

var globalDB db.Connection

// Generators is a map of table model.
//
// The key of generators is the prefix of table info url.
// The corresponding value is the Form and TableName data.
//
// http://{{config.Domain}}:{{Port}}/{{config.Prefix}}/info/{{key}}
var Generators = map[string]table.Generator{
	"globals": GlobalTable,
	"nodes":   NodeTable,
	"videos":  VideoInfoTable,
	"slices":  VideoSliceTable,
	"files":   FileTable,
}

// SetConnection ...
func SetConnection(conn db.Connection) {
	globalDB = conn
}

// DB ...
func DB() *db.SQL {
	return db.WithDriver(globalDB)
}
