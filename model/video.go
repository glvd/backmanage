package model

import (
	"github.com/jinzhu/gorm"
)

// Video ...
type Video struct {
	gorm.Model
	No           string   `gorm:"no" json:"no"`                       //编号
	Intro        string   `gorm:"varchar(2048)" json:"intro"`         //简介
	Alias        []string `gorm:"json" json:"alias"`                  //别名，片名
	ThumbHash    string   `gorm:"thumb_hash" json:"thumb_hash"`       //缩略图
	PosterHash   string   `gorm:"poster_hash" json:"poster_hash"`     //海报地址
	SourceHash   string   `gorm:"source_hash" json:"source_hash"`     //原片地址
	M3U8Hash     string   `gorm:"m3u8_hash" json:"m3u8_hash"`         //切片地址
	Key          string   `gorm:"key"  json:"-"`                      //秘钥
	M3U8         string   `gorm:"m3u8" json:"-"`                      //M3U8名
	Role         []string `gorm:"json" json:"role"`                   //主演
	Director     string   `gorm:"director" json:"director"`           //导演
	Systematics  string   `gorm:"systematics" json:"systematics"`     //分级
	Season       string   `gorm:"season" json:"season"`               //季
	TotalEpisode string   `gorm:"total_episode" json:"total_episode"` //总集数
	Episode      string   `gorm:"episode" json:"episode"`             //集数
	Producer     string   `gorm:"producer" json:"producer"`           //生产商
	Publisher    string   `gorm:"publisher" json:"publisher"`         //发行商
	Type         string   `gorm:"type" json:"type"`                   //类型：film，FanDrama
	Format       string   `gorm:"format" json:"format"`               //输出格式：3D，2D,VR(VR格式：Half-SBS：左右半宽,Half-OU：上下半高,SBS：左右全宽)
	Language     string   `gorm:"language" json:"language"`           //语言
	Caption      string   `gorm:"caption" json:"caption"`             //字幕
	Group        string   `gorm:"group" json:"-"`                     //分组
	Index        string   `gorm:"index" json:"-"`                     //索引
	Date         string   `gorm:"'date'" json:"date"`                 //发行日期
	Sharpness    string   `gorm:"sharpness" json:"sharpness"`         //清晰度
	Series       string   `gorm:"series" json:"series"`               //系列
	Tags         []string `gorm:"json tags" json:"tags"`              //标签
	Length       string   `gorm:"length" json:"length"`               //时长
	Sample       []string `gorm:"json sample" json:"sample"`          //样板图
	Uncensored   bool     `gorm:"uncensored" json:"uncensored"`       //有码,无码
}

func init() {
	RegisterTable(Video{})
}
