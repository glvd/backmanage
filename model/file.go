package model

import "github.com/jinzhu/gorm"

// File ...
type File struct {
	gorm.Model
	Address string `gorm:"type:text"`
	Size    string `gorm:"not null;default:EMPTY_STRING"`
	Name    string
}

func init() {
	RegisterTable(File{})
}
