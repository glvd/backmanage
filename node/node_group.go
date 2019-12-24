package node

import "sync"

// Nodes ...
type Nodes struct {
	v sync.Map
}

var nodes Nodes

// AddNode ...
func AddNode(name string, node Node) {
	nodes.Add(name, node)
}

// GetNode ...
func GetNode(name string) Node {
	return nodes.Get(name)
}

// DeleteNode ...
func DeleteNode(name string) {
	nodes.Del(name)
}

// Get ...
func (n *Nodes) Get(name string) Node {
	if load, ok := n.v.Load(name); ok {
		return (load).(Node)
	}
	return nil
}

// Add ...
func (n *Nodes) Add(name string, node Node) {
	n.v.Store(name, node)
}

// Del ...
func (n *Nodes) Del(name string) {
	n.v.Delete(name)
}
