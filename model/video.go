package model

import (
	"encoding/json"
	"github.com/glvd/backmanage/data"
	"strconv"
	"strings"
)

// Alias ...
type Alias struct {
	Model `json:"-"`
	Name  string //alias name
}

// Role ...
type Role struct {
	Model `json:"-"`
	Name  string //role name
}

// Tag ...
type Tag struct {
	Model `json:"-"`
	Name  string //tag name
}

// Sample ...
type Sample struct {
	Model   `json:"-"`
	Index   string
	Addr    string //sample address
	VideoID string `gorm:"varchar(36) column:video_id"`
}

// Video ...
type Video struct {
	Model        `json:"-"`
	No           string    `gorm:"no" json:"no"`                                                //编号
	Intro        string    `gorm:"varchar(2048)" json:"intro"`                                  //简介
	Alias        []*Alias  `gorm:"many2many:video_aliases" json:"alias,inline"`                 //别名，片名
	ThumbHash    string    `gorm:"column:thumb_hash" json:"thumb_hash"`                         //缩略图
	PosterHash   string    `gorm:"column:poster_hash" json:"poster_hash"`                       //海报地址
	SourceHash   string    `gorm:"column:source_hash" json:"source_hash"`                       //原片地址
	M3U8Hash     string    `gorm:"column:m3u8_hash" json:"m3u8_hash"`                           //切片地址
	Key          string    `gorm:"key"  json:"-"`                                               //秘钥
	M3U8         string    `gorm:"column:m3u8" json:"-"`                                        //M3U8名
	Roles        []*Role   `gorm:"many2many:video_roles" json:"role"`                           //主演
	Director     string    `gorm:"director" json:"director"`                                    //导演
	Systematics  string    `gorm:"systematics" json:"systematics"`                              //分级
	Season       string    `gorm:"season" json:"season"`                                        //季
	TotalEpisode string    `gorm:"total_episode" json:"total_episode"`                          //总集数
	Episode      string    `gorm:"episode" json:"episode"`                                      //集数
	Producer     string    `gorm:"producer" json:"producer"`                                    //生产商
	Publisher    string    `gorm:"publisher" json:"publisher"`                                  //发行商
	Type         string    `gorm:"column:type" json:"type"`                                     //类型：film，FanDrama
	Format       string    `gorm:"format" json:"format"`                                        //输出格式：3D，2D,VR(VR格式：Half-SBS：左右半宽,Half-OU：上下半高,SBS：左右全宽)
	Language     string    `gorm:"language" json:"language"`                                    //语言
	Caption      string    `gorm:"caption" json:"caption"`                                      //字幕
	Group        string    `gorm:"group" json:"-"`                                              //分组
	Index        string    `gorm:"index" json:"-"`                                              //索引
	Date         string    `gorm:"column:date" json:"date"`                                     //发行日期
	Sharpness    string    `gorm:"sharpness" json:"sharpness"`                                  //清晰度
	Series       string    `gorm:"series" json:"series"`                                        //系列
	Tags         []*Tag    `gorm:"many2many:video_tags" json:"tags"`                            //标签
	Length       string    `gorm:"length" json:"length"`                                        //时长
	Sample       []*Sample `gorm:"foreignkey:video_id;association_foreignkey:id" json:"sample"` //样板图
	Uncensored   bool      `gorm:"uncensored" json:"uncensored"`                                //有码,无码
}

func init() {
	RegisterTable(Video{}, Sample{}, Tag{}, Role{}, Alias{})
}

// JSON ...
func (v *Video) JSON() string {
	m, err := json.Marshal(v)
	if err != nil {
		return ""
	}
	return string(m)
}

// Count ...
func (v *Video) Count() (count int) {
	db := DB().Model(&Video{}).Count(&count)
	if db.Error != nil {
		return -1
	}
	return
}

// CopyInfo ...
func (v *Video) CopyInfo(content *data.Content) error {
	v.No = content.ID
	v.Intro = content.Title
	for _, genre := range content.Genres {
		v.Tags = append(v.Tags, &Tag{
			Name: genre.Content,
		})
	}
	for _, act := range content.Actors {
		v.Roles = append(v.Roles, &Role{
			Model: Model{},
			Name:  act.Name,
		})
	}

	for i, sample := range content.Sample {
		v.Sample = append(v.Sample, &Sample{
			Index: strconv.Itoa(i),
			Addr:  sample.Image,
		})
	}

	v.Season = MustString("", "1")
	v.TotalEpisode = MustString("", "1")
	v.Episode = MustString("", "1")
	v.Producer = content.Studio
	v.Format = MustString("", "2D")
	v.Date = content.ReleaseDate.Format("2006-01-02")
	v.Series = content.MovieSet
	v.Uncensored = content.Uncensored

	return nil
}

// RoleString ...
func (v *Video) RoleString() (s string) {
	var roles []string
	for _, role := range v.Roles {
		roles = append(roles, role.Name)
	}
	return strings.Join(roles, ",")
}

// TagString ...
func (v *Video) TagString() (s string) {
	var tags []string
	for _, tag := range v.Tags {
		tags = append(tags, tag.Name)
	}
	return strings.Join(tags, ",")
}

// InsertVideo ...
func InsertVideo(video *Video) error {
	db := DB().Create(video)
	if db.Error != nil {
		return db.Error
	}
	return nil
}

// GetVideos ...
func GetVideos(limit int, offsets ...int) (v []*Video, e error) {
	offset := -1
	if len(offsets) != 0 {
		offset = offsets[0]
	}
	db := DB().Limit(limit).Offset(offset).Find(&v)
	if db.Error != nil {
		return nil, db.Error
	}
	return
}
