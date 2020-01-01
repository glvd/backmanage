package node

import "sync"
import "github.com/robfig/cron/v3"

// Nodes ...
type Nodes struct {
	v sync.Map
	s sync.Map
}

var nodes Nodes
var nodeCron = cron.New()

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

// Start ...
func Start() {
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

// Status ...
func (n *Nodes) Status(name string) {

}
