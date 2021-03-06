package datamodel

import (
	"github.com/GoAdminGroup/backmanage/modules/node"
	"github.com/GoAdminGroup/go-admin/modules/db"
	form2 "github.com/GoAdminGroup/go-admin/plugins/admin/modules/form"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	editType "github.com/GoAdminGroup/go-admin/template/types/table"
	"github.com/goextension/log"
	"github.com/google/uuid"
)

// NodeTable ...
func NodeTable() (t table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"
	cfg.PrimaryKey.Type = db.Varchar
	t = table.NewDefaultTable(cfg)
	info := t.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("NodeID", "node_id", db.Varchar)
	info.AddField("NodeAddr", "node_addr", db.Text)
	info.AddField("SyncData", "sync", db.Tinyint).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "1" {
			return "sync"
		}
		return "async"
	}).FieldEditAble(editType.Select).FieldEditOptions([]map[string]string{
		{"value": "2", "text": "async"},
		{"value": "1", "text": "sync"},
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions([]map[string]string{
		{"value": "2", "field": "async"},
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
	info.SetTable("dhash_nodes").SetTitle("Nodes").SetDescription("Nodes")

	//edit/add form
	formList := t.GetForm()
	formList.SetBeforeInsert(NodeInfo)
	formList.SetBeforeUpdate(NodeInfo)
	formList.AddField("ID", "id", db.Varchar, form.Default).FieldDefault(uuid.New().String()).FieldNotAllowEdit()
	formList.AddField("NodeAddr", "node_addr", db.Varchar, form.Text)
	formList.AddField("NodeID", "node_id", db.Varchar, form.Text).FieldNotAllowAdd().FieldNotAllowEdit()
	//formList.AddField("NodeStatus", "node_status", db.Int, form.Text).FieldNotAllowAdd().FieldNotAllowEdit()
	formList.AddField("Interval", "interval", db.Int, form.Text).FieldDefault("3")
	formList.AddField("SyncData", "sync", db.Tinyint, form.SelectSingle).
		FieldOptions([]map[string]string{
			{
				"field":    "sync",
				"label":    "同步",
				"value":    "1",
				"selected": "selected",
			}, {
				"field":    "async",
				"label":    "非同步",
				"value":    "2",
				"selected": "",
			},
		})
	//formList.AddField("CreateTime", "created_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit().FieldHide()
	//formList.AddField("UpdateTime", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd().FieldNotAllowEdit().FieldHide()
	formList.SetTable("dhash_nodes").SetTitle("Nodes").SetDescription("Nodes")
	return
}

// NodeInfo ...
func NodeInfo(values form2.Values) error {
	addr := "/ip4/127.0.0.1/tcp/5001"
	if addr2 := values.Get("node_addr"); addr2 != "" {
		addr = addr2
	}
	if values.Get("sync") == "" {
		values.Add("sync", "2")
	}
	values.Add("node_addr", addr)
	values.Add("node_id", "abnormal")
	values.Add("node_status", "0")
	n, e := node.NewSingleNode(addr)
	if e != nil {
		return nil
	}
	nid := n.ID()
	if nid == nil {
		log.Infow("nodeinfo", "null id", nid)
		return nil
	}
	values.Add("node_id", nid.ID)
	node.AddNode(addr, n)
	values.Add("node_status", "1")

	return nil
}
