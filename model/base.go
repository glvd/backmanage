package model

import (
	"github.com/GoAdminGroup/go-admin/modules/db"
)

// Base is base model structure.
type Base struct {
	TableName string

	Conn db.Connection
}

// SetConn ...
func (b Base) SetConn(con db.Connection) Base {
	b.Conn = con
	return b
}

// Table ...
func (b Base) Table(table string) *db.SQL {
	return db.Table(table).WithDriver(b.Conn)
}
