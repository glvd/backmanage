package model

// Alias ...
type Alias struct {
	Model
	Name string //alias name
}

// Role ...
type Role struct {
	Model
	Name string //role name
}

// Tag ...
type Tag struct {
	Model
	Name string //tag name
}

// Sample ...
type Sample struct {
	Model
	Index string
	Addr  string //sample address
}

// Video ...
type Video struct {
	Model
	No           string    `gorm:"no" json:"no"`                         //编号
	Intro        string    `gorm:"varchar(2048)" json:"intro"`           //简介
	Alias        []*Alias  `gorm:"many2many:video_aliases" json:"alias"` //别名，片名
	ThumbHash    string    `gorm:"thumb_hash" json:"thumb_hash"`         //缩略图
	PosterHash   string    `gorm:"poster_hash" json:"poster_hash"`       //海报地址
	SourceHash   string    `gorm:"source_hash" json:"source_hash"`       //原片地址
	M3U8Hash     string    `gorm:"column:m3u8_hash" json:"m3u8_hash"`    //切片地址
	Key          string    `gorm:"key"  json:"-"`                        //秘钥
	M3U8         string    `gorm:"column:m3u8" json:"-"`                 //M3U8名
	Roles        []*Role   `gorm:"many2many:video_roles" json:"role"`    //主演
	Director     string    `gorm:"director" json:"director"`             //导演
	Systematics  string    `gorm:"systematics" json:"systematics"`       //分级
	Season       string    `gorm:"season" json:"season"`                 //季
	TotalEpisode string    `gorm:"total_episode" json:"total_episode"`   //总集数
	Episode      string    `gorm:"episode" json:"episode"`               //集数
	Producer     string    `gorm:"producer" json:"producer"`             //生产商
	Publisher    string    `gorm:"publisher" json:"publisher"`           //发行商
	Type         string    `gorm:"column(type)" json:"type"`             //类型：film，FanDrama
	Format       string    `gorm:"format" json:"format"`                 //输出格式：3D，2D,VR(VR格式：Half-SBS：左右半宽,Half-OU：上下半高,SBS：左右全宽)
	Language     string    `gorm:"language" json:"language"`             //语言
	Caption      string    `gorm:"caption" json:"caption"`               //字幕
	Group        string    `gorm:"group" json:"-"`                       //分组
	Index        string    `gorm:"index" json:"-"`                       //索引
	Date         string    `gorm:"'date'" json:"date"`                   //发行日期
	Sharpness    string    `gorm:"sharpness" json:"sharpness"`           //清晰度
	Series       string    `gorm:"series" json:"series"`                 //系列
	Tags         []*Tag    `gorm:"many2many:video_tags" json:"tags"`     //标签
	Length       string    `gorm:"length" json:"length"`                 //时长
	Sample       []*Sample `gorm:"foreignkey:id" json:"sample"`          //样板图
	Uncensored   bool      `gorm:"uncensored" json:"uncensored"`         //有码,无码
}

func init() {
	RegisterTable(Video{}, Sample{}, Tag{}, Role{}, Alias{})
}

// Count ...
func (v *Video) Count() (count int) {
	db := DB().Model(&Video{}).Count(&count)
	if db.Error != nil {
		return -1
	}
	return
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
