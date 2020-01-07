package model

// VideoSlice ...
type VideoSlice struct {
	Model
	VideoID  string
	Address  string
	Progress string
	Status   int
}

func init() {
	RegisterTable(VideoSlice{})
}
