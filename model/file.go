package model

import "github.com/jinzhu/gorm"

// File ...
type File struct {
	gorm.Model
	Address string
	Size    string
	Name    string
}

func init() {
	RegisterTable(File{})
}
