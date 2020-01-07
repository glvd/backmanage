package model

// Node ...
type Node struct {
	Model
	Sync       int
	NodeType   string
	NodeID     string
	NodeStatus int
	NodeAddr   string
	Interval   int
}

func init() {
	RegisterTable(Node{})
}
