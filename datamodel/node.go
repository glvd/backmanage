package datamodel

import (
	"github.com/glvd/backmanage/node"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
)

// GetNodeTable ...
func GetNodeTable() (nodeTable table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"

	nodeTable = table.NewDefaultTable(cfg)
	info := nodeTable.GetInfo()
	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("NodeID", "node_id", db.Varchar)
	info.AddField("NodeAddr", "node_addr", db.Text)
	info.AddField("SyncData", "sync", db.Tinyint).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "0" {
			return "async"
		}
		return "sync"
	}).FieldEditAble(editType.Select).FieldEditOptions([]map[string]string{
		{"value": "0", "text": "async"},
		{"value": "1", "text": "sync"},
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions([]map[string]string{
		{"value": "0", "field": "async"},
		{"value": "1", "field": "sync"},
	}) //.FieldFilterOptionExt(map[string]interface{}{"allowClear": true})
	info.AddField("NodeStatus", "node_status", db.Int).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "0" {
			return "abnormal"
		}
		return "normal"
	})
	info.AddField("Interval", "interval", db.Int).FieldDisplay(func(value types.FieldModel) interface{} {
		return value.Value + " sec"
	})
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)
	info.SetTable("nodes").SetTitle("Nodes").SetDescription("Nodes")

	//edit/add form
	formList := nodeTable.GetForm()
	formList.SetBeforeInsert(NodeInfo)
	formList.SetBeforeUpdate(NodeInfo)
	formList.AddField("ID", "id", db.Int, form.Default).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("NodeAddr", "node_addr", db.Varchar, form.Text)
	formList.AddField("NodeID", "node_id", db.Varchar, form.Text).FieldNotAllowAdd().FieldNotAllowEdit()
	//formList.AddField("NodeStatus", "node_status", db.Int, form.Text).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("Interval", "interval", db.Int, form.Text).FieldDefault("3")
	formList.AddField("SyncData", "sync", db.Tinyint, form.Radio).
		FieldOptions([]map[string]string{
			{
				"field":    "sync",
				"label":    "同步",
				"value":    "1",
				"selected": "checked",
			}, {
				"field":    "sync",
				"label":    "非同步",
				"value":    "0",
				"selected": "",
			},
		})
	//formList.AddField("CreateTime", "created_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit().FieldHide()
	//formList.AddField("UpdateTime", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit().FieldHide()
	formList.SetTable("nodes").SetTitle("Nodes").SetDescription("Nodes")
	return
}

// NodeInfo ...
func NodeInfo(values form2.Values) error {
	addr := "/ip4/127.0.0.1/tcp/5001"
	if addr2 := values.Get("node_addr"); addr2 != "" {
		addr = addr2
	}
	values.Add("node_addr", addr)
	n, e := node.NewSingleNode(addr)
	if e != nil {
		values.Add("node_status", "0")
		return nil
	}

	if n.ID() == nil {
		values.Add("node_status", "0")
		return nil
	}
	values.Add("node_id", n.ID().ID)
	node.AddNode(addr, n)
	values.Add("node_status", "1")
	return nil
}
