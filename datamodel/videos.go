package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
)

// GetVideosTable ...
func GetVideosTable() (videosTable table.Table) {
	cfg := table.DefaultConfig()
	//cfg.PrimaryKey.Type = db.Varchar
	//cfg.PrimaryKey.Name = "id"
	cfg.Editable = false
	cfg.CanAdd = false
	cfg.Deletable = false
	videosTable = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     false,
		Editable:   false,
		Deletable:  false,
		Exportable: true,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Int,
			Name: table.DefaultPrimaryKeyName,
		},
	})
	info := videosTable.GetInfo()
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

	info.SetTable("videos").SetTitle("Videos").SetDescription("Videos")

	//edit/add form
	formList := videosTable.GetForm()
	//formList.SetBeforeUpdate(func(values form2.Values) error {
	//	log.Infow("update", "poster", values.Get("poster"))
	//	if poster := values.Get("poster"); poster == "" {
	//		values.Delete("poster")
	//	}
	//	return nil
	//})
	//formList.AddField("ID", "id", db.Int, form.Default).FieldNotAllowAdd().FieldNotAllowEdit()
	//formList.AddField("Poster", "poster", db.Text, form.Text)
	//formList.AddField("VideoNo", "video_no", db.Varchar, form.Text)
	//
	formList.SetTable("videos").SetTitle("Videos").SetDescription("Videos")
	return
}
