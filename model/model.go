package model

import (
	"fmt"
	"github.com/glvd/go-admin/modules/config"
	"github.com/jinzhu/gorm"
	uuid "github.com/satori/go.uuid"
	"net/url"
	"reflect"
	"time"
)

const mysqlSource = "%s:%s@tcp(%s)/%s?loc=%s&charset=utf8mb4&parseTime=true"

// Model base model definition, including fields `ID`, `CreatedAt`, `UpdatedAt`, `DeletedAt`, which could be embedded in your model
//    type User struct {
//      gorm.Model
//    }
type Model struct {
	ID        int        `gorm:"primary_key"`
	CreatedAt time.Time  `gorm:"default:CURRENT_TIMESTAMP"`
	UpdatedAt time.Time  `gorm:"default:CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0)"`
	DeletedAt *time.Time `sql:"index"`
}

// Options ...
type Options func(db *gorm.DB) *gorm.DB

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

// BeforeCreate ...
func (m *Model) BeforeCreate(scope *gorm.Scope) error {
	if _, b := scope.Get("ID"); !b {
		return scope.SetColumn("ID", uuid.NewV1().String())
	}
	return nil
}

// MustString ...
func MustString(v string, d string) string {
	if v == "" {
		return d
	}
	return v
}

// Limit ...
func Limit(i int) Options {
	return func(db *gorm.DB) *gorm.DB {
		return db.Limit(i)
	}
}

// Offset ...
func Offset(i int) Options {
	return func(db *gorm.DB) *gorm.DB {
		return db.Offset(i)
	}
}
