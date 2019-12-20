package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	uuid "github.com/satori/go.uuid"
)

// GetVideosTable ...
func GetVideosTable() (videosTable table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"

	videosTable = table.NewDefaultTable(cfg)
	info := videosTable.GetInfo()
	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("VID", "vid", db.Varchar)
	info.AddField("Poster", "poster", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "" {
			return ""
		}
		return "<img src=\"/uploads/" + value.Value + "\"/>"
	})
	info.AddField("VideoInfo", "video_info", db.Text)
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("videos").SetTitle("Videos").SetDescription("Videos")

	//edit/add form
	formList := videosTable.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldNotAllowEdit().FieldNotAllowAdd()
	formList.AddField("VID", "vid", db.Varchar, form.Text).FieldNotAllowEdit().FieldDefault(uuid.NewV1().String())
	formList.AddField("Poster", "poster", db.Text, form.File)
	formList.AddField("VideoInfo", "video_info", db.Text, form.TextArea)
	formList.AddField("CreateTime", "created_at", db.Timestamp, form.Datetime).FieldNotAllowEdit().FieldNotAllowAdd()
	formList.AddField("UpdateTime", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowEdit().FieldNotAllowAdd()
	formList.SetTable("videos").SetTitle("Videos").SetDescription("Videos")
	return
}
