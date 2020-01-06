package model

import (
	"github.com/jinzhu/gorm"
)

// VideoSlice ...
type VideoSlice struct {
	gorm.Model
	VideoID  string
	Address  string
	Progress string
	Status   int
}

func init() {
	RegisterTable(VideoSlice{})
}
