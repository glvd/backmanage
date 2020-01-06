package model

import "github.com/jinzhu/gorm"

// VideoInfo ...
type VideoInfo struct {
	gorm.Model
	PosterPath string
	VideoID    string
	VideoNo    string
	Intro      string
	Actors     string
	Tags       string
	SourcePath string
}

func init() {
	RegisterTable(VideoInfo{})
}
