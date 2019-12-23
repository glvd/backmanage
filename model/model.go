package model

import (
	"fmt"
	"github.com/glvd/go-admin/modules/config"
	"github.com/jinzhu/gorm"
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
	//设置默认表名前缀
	gorm.DefaultTableNameHandler = func(db *gorm.DB, defaultTableName string) string {
		return "dhash_" + defaultTableName
	}

	return engine
}

func source(name, pass, addr, dbname string) string {
	return fmt.Sprintf(mysqlSource, name, pass, addr, dbname, url.QueryEscape("Asia/Shanghai"))
}

// RegisterTable ...
func RegisterTable(v ...interface{}) {
	var name string
	for _, t := range v {
		name = reflect.TypeOf(t).String()
		syncTable[name] = t
	}

}

// Sync ...
func Sync(db *gorm.DB) error {

	for s, i := range syncTable {
		fmt.Println("syncing", s)
		d := db.AutoMigrate(i)
		if d.Error != nil {
			return d.Error
		}
	}
	return nil
}
