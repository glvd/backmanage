package data

import (
	"encoding/json"
	"github.com/goextension/log"
	"io/ioutil"
	"time"
)

// Genre ...
type Genre struct {
	URL     string
	Content string
}

// Sample ...
type Sample struct {
	Index int
	Thumb string
	Image string
	Title string
}

// Star ...
type Star struct {
	Image    string
	StarLink string
	Name     string   //english name
	Alias    []string //other name(katakana,...)
}

// Content ...
type Content struct {
	From          string //where this
	Uncensored    bool
	ID            string
	Title         string
	OriginalTitle string
	Year          string
	ReleaseDate   time.Time
	Studio        string
	MovieSet      string
	Plot          string
	Genres        []*Genre
	Actors        []*Star
	Image         string
	Thumb         string
	Sample        []*Sample
}

// LoadContent ...
func LoadContent(path string) (*Content, error) {
	var content Content
	info, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}
	err = json.Unmarshal(info, &content)
	if err != nil {
		return nil, err
	}
	log.Infof("content:%+v", content)
	return &content, nil
}
