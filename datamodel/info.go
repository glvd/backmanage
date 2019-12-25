package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	"github.com/goextension/log"
)

// InfoTable ...
func InfoTable() (videoInfo table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"
	cfg.Editable = false
	cfg.CanAdd = false
	cfg.Deletable = false
	videoInfo = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     true,
		Editable:   false,
		Deletable:  false,
		Exportable: true,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Int,
			Name: table.DefaultPrimaryKeyName,
		},
	})
	info := videoInfo.GetInfo()
	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("Poster", "poster", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "" {
			return ""
		}
		return "<img src=\"/uploads/" + value.Value + "\"/>"
	})

	info.AddField("VideoNo", "video_no", db.Varchar).FieldEditAble().FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("dhash_video").SetTitle("VideoInfo").SetDescription("VideoInfo")

	//edit/add form
	formList := videoInfo.GetForm()
	formList.SetInsertFn(func(values form2.Values) error {
		log.Infow("file", "path", values.Get("file"))
		return nil
	})
	//formList.SetBeforeUpdate(func(values form2.Values) error {
	//	log.Infow("update", "poster", values.Get("poster"))
	//	if poster := values.Get("poster"); poster == "" {
	//		values.Delete("poster")
	//	}
	//	return nil
	//})
	formList.AddField("File", "file", db.Varchar, form.File).FieldNotAllowEdit()
	//formList.AddField("Poster", "poster", db.Text, form.Text)
	//formList.AddField("VideoNo", "video_no", db.Varchar, form.Text)
	//
	return
}
