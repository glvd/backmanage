package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
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
	info.AddField("NodeConfig", "node_config", db.Text)
	info.AddField("NodeAddr", "node_addr", db.Text)
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("nodes").SetTitle("Nodes").SetDescription("Nodes")

	//edit/add form
	formList := videosTable.GetForm()

	formList.AddField("NodeID", "node_id", db.Varchar, form.Text).FieldNotAllowEdit()
	formList.AddField("NodeConfig", "node_config", db.Text, form.TextArea).FieldNotAllowAdd()
	formList.AddField("NodeAddr", "node_addr", db.Text, form.TextArea).FieldNotAllowAdd()
	formList.AddField("CreateTime", "created_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("UpdateTime", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.SetTable("nodes").SetTitle("Nodes").SetDescription("Nodes")

	return
}
