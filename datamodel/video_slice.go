package datamodel

import (
	"github.com/glvd/backmanage/data"
	"github.com/glvd/backmanage/model"
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
)

// VideoSliceTable ...
func VideoSliceTable() (vsTable table.Table) {
	vsTable = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     true,
		Editable:   false,
		Deletable:  true,
		Exportable: true,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Int,
			Name: table.DefaultPrimaryKeyName,
		},
	})
	info := vsTable.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("Poster", "poster_path", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "" {
			return ""
		}

		img := data.ImageLoad(value.Value)
		if img != "" {
			img = "data:image/jpg;base64," + img
		}
		return "<img height=\"120px\" src=\"" + img + "\"/>"
	})

	info.AddField("VideoID", "video_id", db.Varchar).FieldSortable().FieldEditAble(editType.Text).FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	info.AddField("Address", "address", db.Varchar)
	info.AddField("Progress", "progress", db.Varchar)
	info.AddField("Status", "status", db.Varchar)
	info.AddField("CreateTime", "created_at", db.Timestamp).FieldFilterable(types.FilterType{FormType: form.Datetime})
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("videos").SetTitle("Videos").SetDescription("Videos")

	//vsTable.GetInfo().SetTabGroups(types.
	//	NewTabGroups("video_no", "intro", "created_at").
	//	AddGroup("source_path", "tags", "actors")).
	//	SetTabHeaders("profile1", "profile2")
	//edit/add form
	formList := vsTable.GetForm()
	formList.SetBeforeInsert(VideoInsert)

	formList.AddField("VideoNo", "video_no", db.Varchar, form.SelectSingle).FieldOptions(GetVideoList())
	//formList.AddField("PosterPath", "poster_path", db.Varchar, form.Text)
	//formList.AddField("ThumbPath", "thumb_path", db.Varchar, form.Text)

	formList.AddField("Address", "address", db.Varchar, form.TextArea)
	//vsTable.GetInfo().SetTabGroups(types.
	//	NewTabGroups("video_no", "intro", "created_at").
	//	AddGroup("source_path", "tags", "actors"))
	//SetTabHeaders("profile1", "profile2")
	formList.SetTable("videos").SetTitle("Videos").SetDescription("Videos")
	return
}

// GetVideoList ...
func GetVideoList() []map[string]string {
	videos, err := model.GetVideos(500)
	if err != nil {
		return nil
	}
	var r []map[string]string
	for _, video := range videos {
		r = append(r, map[string]string{
			"field": "video_no",
			"label": video.No,
			//"value":    "1",
			//"selected": "selected",
		})
	}
	return r
}
