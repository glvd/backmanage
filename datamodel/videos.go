package datamodel

import (
	"fmt"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
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
	info.AddField("Poster", "poster", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "" {
			return ""
		}
		return "<img src=\"/uploads/" + value.Value + "\"/>"
	})

	info.AddField("VideoNo", "video_no", db.Varchar)
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("videos").SetTitle("Videos").SetDescription("Videos")

	//edit/add form
	formList := videosTable.GetForm()
	formList.SetBeforeInsert(func(values form2.Values) error {
		fmt.Println("hook", values.Get("vid"), values.IsEmpty("vid"))
		if values.IsEmpty("vid") {
			values.Add("vid", uuid.NewV1().String())
		}
		return nil
	})
	formList.AddField("Poster", "poster", db.Text, form.File)
	formList.AddField("VideoNo", "video_no", db.Varchar, form.Text)

	formList.SetTable("videos").SetTitle("Videos").SetDescription("Videos")
	return
}
