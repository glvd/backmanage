package model

// VideoInfo ...
type VideoInfo struct {
	Model
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
