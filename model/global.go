package model

import "github.com/jinzhu/gorm"

// Global ...
type Global struct {
	gorm.Model
	Tag   string
	Value string
}

func init() {
	RegisterTable(Global{})
}
