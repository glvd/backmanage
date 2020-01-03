package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
)

// Generators is a map of table models.
//
// The key of generators is the prefix of table info url.
// The corresponding value is the Form and TableName data.
//
// http://{{config.Domain}}:{{Port}}/{{config.Prefix}}/info/{{key}}
var Generators = map[string]table.Generator{
	"nodes":  GetNodeTable,
	"videos": VideoTable,
	"slices": VideoSliceTable,
	"files":  FileTable,
}

// Table ...
func Table(table string) *db.SQL {
	return connection().Table(table)
}

func connection() *db.SQL {
	return db.WithDriver(db.GetConnection(services))
}
