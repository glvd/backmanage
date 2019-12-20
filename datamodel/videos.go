package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
)

// GetVideosTable ...
func GetVideosTable() (videosTable table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"

	videosTable = table.NewDefaultTable(cfg)
	info := videosTable.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("Poster", "poster", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "" {
			return ""
		}
		return "<img src=\"/uploads/" + value.Value + "\"/>"
	})
	info.AddField("Added", "added", db.Timestamp)

	info.SetTable("videos").SetTitle("Videos").SetDescription("Videos")

	//edit/add form
	formList := videosTable.GetForm()
	formList.AddField("ID", "id", db.Varchar, form.Text).FieldNotAllowEdit().FieldNotAllowAdd()
	formList.AddField("Poster", "poster", db.Text, form.File)
	formList.AddField("Added", "added", db.Timestamp, form.Datetime)

	formList.SetTable("videos").SetTitle("Videos").SetDescription("Videos")
	return
}
