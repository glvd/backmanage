package model

import (
	"fmt"
	"github.com/glvd/go-admin/modules/config"
	"github.com/xormsharp/xorm"
	"net/url"
	"time"
)

const mysqlSource = "%s:%s@tcp(%s)/%s?loc=%s&charset=utf8mb4&parseTime=true"

// Model ...
type model struct {
	ID        string     `xorm:"id pk"`
	CreatedAt time.Time  `xorm:"created_at created"`
	UpdatedAt time.Time  `xorm:"updated_at updated"`
	DeletedAt *time.Time `xorm:"deleted_at deleted"`
	Version   int        `xorm:"version"`
}

// Model ...
type Model struct {
	model `xorm:"extends"`
}

var _db *xorm.Engine

// DB ...
func DB() *xorm.Engine {
	return _db
}

// InitDatabase ...
func InitDatabase(cfg config.Config) {
	_db = connect(cfg.Databases.GetDefault())
}

func connect(db config.Database) *xorm.Engine {
	engine, err := xorm.NewEngine(db.Driver, source(db.User, db.Pwd, db.Host+":"+db.Port, db.Name))
	if err != nil {
		panic(err)
	}
	return engine
}

func source(name, pass, addr, dbname string) string {
	return fmt.Sprintf(mysqlSource, name, pass, addr, dbname, url.QueryEscape("Asia/Shanghai"))
}
