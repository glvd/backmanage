package datamodel

import (
	"github.com/glvd/backmanage/model"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
	"github.com/goextension/log"
	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
	"strings"
)

// VideoSliceTable ...
func VideoSliceTable() (t table.Table) {
	t = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     true,
		Editable:   true,
		Deletable:  true,
		Exportable: false,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Varchar,
			Name: table.DefaultPrimaryKeyName,
		},
	})
	info := t.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	//info.AddField("Poster", "poster_path", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
	//	if value.Value == "" {
	//		return ""
	//	}
	//
	//	img := data.ImageLoad(value.Value)
	//	if img != "" {
	//		img = "data:image/jpg;base64," + img
	//	}
	//	return "<img height=\"120px\" src=\"" + img + "\"/>"
	//})

	info.AddField("VideoID", "video_id", db.Varchar).FieldDisplay(func(value types.FieldModel) interface{} {
		fromString, err := uuid.Parse(value.Value)
		if err != nil || fromString.String() == uuid.Nil.String() {
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

	var videos, addresses []map[string]string
	videosModel, err := DB().Table("dhash_video_infos").Select("id", "video_no", "video_id").OrderBy("created_at", "desc").All()
	if err != nil {
		panic(err)
	}
	for _, m := range videosModel {
		videos = append(videos, map[string]string{
			"field": m["video_no"].(string),
			"value": m["video_id"].(string),
		})
	}

	addressesModel, _ := DB().Table("dhash_files").
		Select("id", "name", "address").
		OrderBy("created_at", "desc").
		All()

	for _, m := range addressesModel {
		addresses = append(addresses, map[string]string{
			"field": m["name"].(string),
			"value": m["address"].(string),
		})
	}

	//edit/add form
	formList := t.GetForm()
	formList.SetBeforeInsert(FilterVideoID())
	formList.SetBeforeUpdate(FilterVideoID())
	formList.AddField("ID", "id", db.Varchar, form.Default).FieldDefault(uuid.New().String()).FieldNotAllowEdit()
	formList.AddField("VideoID", "video_id", db.Varchar, form.SelectSingle).FieldOptions(videos).FieldDisplay(func(model types.FieldModel) interface{} {
		//log.Infow("slice", "model", model)
		return model.Value
	})
	//formList.AddField("PosterPath", "poster_path", db.Varchar, form.Text)
	//formList.AddField("ThumbPath", "thumb_path", db.Varchar, form.Text)
	formList.AddField("Address", "address", db.Varchar, form.SelectSingle).FieldOptions(addresses).FieldDisplay(func(model types.FieldModel) interface{} {
		//log.Infow("slice", "model", model)
		return model.Value
	})
	//t.GetInfo().SetTabGroups(types.
	//	NewTabGroups("video_no", "intro", "created_at").
	//	AddGroup("source_path", "tags", "actors"))
	//SetTabHeaders("profile1", "profile2")
	formList.SetTable("video_slices").SetTitle("Slice").SetDescription("Slice")
	return
}

// GetVideoList ...
func GetVideoList(id string) []*model.VideoDetail {
	videos, err := model.GetVideos(func(db *gorm.DB) *gorm.DB {
		return db.Where("id = ?", id)
	})
	if err != nil {
		return nil
	}

	return videos
}

// FilterVideoID ...
func FilterVideoID() func(values form2.Values) error {
	return func(values form2.Values) error {
		log.Infow("filter", "values", values)
		vid := strings.TrimSpace(values.Get("video_id"))

		list := GetVideoList(vid)
		log.Infow("slice", "list", len(list))
		if len(list) == 0 {
			vid = uuid.Nil.String()
		}
		values.Add("video_id", vid)
		return nil
	}
}
