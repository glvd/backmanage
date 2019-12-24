package datamodel

import (
	"github.com/glvd/backmanage/node"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types/form"
)

// GetNodeTable ...
func GetNodeTable() (videosTable table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"

	videosTable = table.NewDefaultTable(cfg)
	info := videosTable.GetInfo()
	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("NodeID", "node_id", db.Varchar)
	info.AddField("NodeAddr", "node_addr", db.Text)
	info.AddField("NodeStatus", "node_status", db.Int)
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("nodes").SetTitle("Nodes").SetDescription("Nodes")

	//edit/add form
	formList := videosTable.GetForm()
	formList.SetBeforeInsert(func(values form2.Values) error {
		addr := "/ip4/127.0.0.1/tcp/5001"
		if addr2 := values.Get("node_addr"); addr2 != "" {
			addr = addr2
		}
		n, e := node.NewSingleNode(addr)
		node.AddNode(addr, n)
		values.Add("node_id", n.ID().ID)
		if e != nil {
			values.Add("node_status", "0")
		} else {
			values.Add("node_status", "1")
		}
		return nil
	})

	formList.AddField("NodeAddr", "node_addr", db.Varchar, form.Text)
	formList.AddField("NodeID", "node_id", db.Varchar, form.Text).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("NodeStatus", "node_status", db.Int, form.Text).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("CreateTime", "created_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("UpdateTime", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.SetTable("nodes").SetTitle("Nodes").SetDescription("Nodes")

	return
}
