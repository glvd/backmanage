package datamodel

import (
	"github.com/glvd/backmanage/data"
	"github.com/glvd/backmanage/model"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
	"github.com/goextension/log"
	"github.com/jinzhu/gorm"
	uuid "github.com/satori/go.uuid"
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

	info.AddField("VideoID", "video_id", db.Varchar).FieldDisplay(func(value types.FieldModel) interface{} {
		fromString, err := uuid.FromString(value.Value)
		if err != nil || uuid.Equal(fromString, uuid.Nil) {
			return "invalid id!"
		}
		return value.Value
	}).FieldSortable().FieldEditAble(editType.Text).FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	info.AddField("Address", "address", db.Varchar)
	info.AddField("Progress", "progress", db.Varchar)
	info.AddField("Status", "status", db.Tinyint)
	info.AddField("CreateTime", "created_at", db.Timestamp).FieldFilterable(types.FilterType{FormType: form.Datetime})
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("video_slices").SetTitle("Slice").SetDescription("Slice")

	//vsTable.GetInfo().SetTabGroups(types.
	//	NewTabGroups("video_no", "intro", "created_at").
	//	AddGroup("source_path", "tags", "actors")).
	//	SetTabHeaders("profile1", "profile2")
	//edit/add form
	formList := vsTable.GetForm()
	formList.SetBeforeInsert(func(values form2.Values) error {
		list := GetVideoList(values.Get("video_id"))
		log.Infow("slice", "list", len(list))
		if len(list) == 0 {
			values.Add("video_id", uuid.Nil.String())
		}
		return nil
	})

	formList.AddField("VideoID", "video_id", db.Varchar, form.Text)
	//formList.AddField("PosterPath", "poster_path", db.Varchar, form.Text)
	//formList.AddField("ThumbPath", "thumb_path", db.Varchar, form.Text)
	formList.AddField("Address", "address", db.Varchar, form.Text)
	//vsTable.GetInfo().SetTabGroups(types.
	//	NewTabGroups("video_no", "intro", "created_at").
	//	AddGroup("source_path", "tags", "actors"))
	//SetTabHeaders("profile1", "profile2")
	formList.SetTable("video_slices").SetTitle("Slice").SetDescription("Slice")
	return
}

// GetVideoList ...
func GetVideoList(id string) []*model.Video {
	videos, err := model.GetVideos(func(db *gorm.DB) *gorm.DB {
		return db.Where("id = ?", id)
	})
	if err != nil {
		return nil
	}

	return videos
}
