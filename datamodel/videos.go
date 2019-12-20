package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
)

// GetVideosTable ...
func GetVideosTable() (videosTable table.Table) {
	videosTable = table.NewDefaultTable(table.DefaultConfig())

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
	formList := videosTable.GetForm()
	formList.AddField("ID", "id", db.Varchar, form.Text).FieldNotAllowEdit().FieldHide()
	formList.AddField("Poster", "poster", db.Text, form.File)
	formList.AddField("Added", "added", db.Timestamp, form.Datetime)

	formList.SetTable("videos").SetTitle("Videos").SetDescription("Videos")
	return
}
