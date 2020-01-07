package model

// File ...
type File struct {
	UUIDModel
	Address string `gorm:"type:text"`
	Size    string `gorm:"not null;default:''"`
	Name    string `gorm:"not null;default:''"`
}

func init() {
	RegisterTable(File{})
}
