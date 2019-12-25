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
	info.AddField("Poster", "no", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		if value.Value == "" {
			return ""
		}

		return "<img src=\"/uploads/" + value.Value + "\"/>"
	})
	//No           string    `gorm:"no" json:"no"`                         //编号
	//Intro        string    `gorm:"varchar(2048)" json:"intro"`           //简介
	//Alias        []*Alias  `gorm:"many2many:video_aliases" json:"alias"` //别名，片名
	//ThumbHash    string    `gorm:"thumb_hash" json:"thumb_hash"`         //缩略图
	//PosterHash   string    `gorm:"poster_hash" json:"poster_hash"`       //海报地址
	//SourceHash   string    `gorm:"source_hash" json:"source_hash"`       //原片地址
	//M3U8Hash     string    `gorm:"column:m3u8_hash" json:"m3u8_hash"`    //切片地址
	//Key          string    `gorm:"key"  json:"-"`                        //秘钥
	//M3U8         string    `gorm:"column:m3u8" json:"-"`                 //M3U8名
	//Roles        []*Role   `gorm:"many2many:video_roles" json:"role"`    //主演
	//Director     string    `gorm:"director" json:"director"`             //导演
	//Systematics  string    `gorm:"systematics" json:"systematics"`       //分级
	//Season       string    `gorm:"season" json:"season"`                 //季
	//TotalEpisode string    `gorm:"total_episode" json:"total_episode"`   //总集数
	//Episode      string    `gorm:"episode" json:"episode"`               //集数
	//Producer     string    `gorm:"producer" json:"producer"`             //生产商
	//Publisher    string    `gorm:"publisher" json:"publisher"`           //发行商
	//Type         string    `gorm:"column(type)" json:"type"`             //类型：film，FanDrama
	//Format       string    `gorm:"format" json:"format"`                 //输出格式：3D，2D,VR(VR格式：Half-SBS：左右半宽,Half-OU：上下半高,SBS：左右全宽)
	//Language     string    `gorm:"language" json:"language"`             //语言
	//Caption      string    `gorm:"caption" json:"caption"`               //字幕
	//Group        string    `gorm:"group" json:"-"`                       //分组
	//Index        string    `gorm:"index" json:"-"`                       //索引
	//Date         string    `gorm:"'date'" json:"date"`                   //发行日期
	//Sharpness    string    `gorm:"sharpness" json:"sharpness"`           //清晰度
	//Series       string    `gorm:"series" json:"series"`                 //系列
	//Tags         []*Tag    `gorm:"many2many:video_tags" json:"tags"`     //标签
	//Length       string    `gorm:"length" json:"length"`                 //时长
	//Sample       []*Sample `gorm:"foreignkey:id" json:"sample"`          //样板图
	//Uncensored   bool      `gorm:"uncensored" json:"uncensored"`         //有码,无码
	info.AddField("VideoNo", "no", db.Varchar).FieldEditAble().FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	info.AddField("Intro", "intro", db.Varchar).FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	info.AddField("CreateTime", "created_at", db.Timestamp)
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("dhash_videos").SetTitle("VideoInfo").SetDescription("VideoInfo")

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
