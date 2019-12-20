package model

import (
	"fmt"
	"github.com/glvd/go-admin/modules/config"
	"github.com/jinzhu/gorm"
	"github.com/xormsharp/xorm"
	"net/url"
	"reflect"
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

var _db *gorm.DB
var syncTable = make(map[string]interface{})

func init() {

}

// DB ...
func DB() *gorm.DB {
	return _db
}

// InitDatabase ...
func InitDatabase(cfg config.Config) {
	_db = connect(cfg.Databases.GetDefault())
}

func connect(db config.Database) *gorm.DB {
	engine, err := gorm.Open(db.Driver, source(db.User, db.Pwd, db.Host+":"+db.Port, db.Name))
	if err != nil {
		panic(err)
	}
	return engine
}

func source(name, pass, addr, dbname string) string {
	return fmt.Sprintf(mysqlSource, name, pass, addr, dbname, url.QueryEscape("Asia/Shanghai"))
}

// RegisterTable ...
func RegisterTable(v interface{}) {
	name := reflect.TypeOf(v).String()
	syncTable[name] = v
}

// Sync ...
func Sync(engine *xorm.Engine) error {
	for s, i := range syncTable {
		fmt.Println("syncing", s)
		err := engine.Sync2(i)
		if err != nil {
			return err
		}
	}
	return nil
}
