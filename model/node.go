package model

import "github.com/jinzhu/gorm"

// Node ...
type Node struct {
	gorm.Model
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
