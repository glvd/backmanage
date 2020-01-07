package model

// Global ...
type Global struct {
	Model
	Tag   string
	Value string
}

func init() {
	RegisterTable(Global{})
}
