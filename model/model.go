package model

import "time"

// Model ...
type model struct {
	ID        string     `xorm:"id pk"`
	CreatedAt time.Time  `xorm:"created_at created"`
	UpdatedAt time.Time  `xorm:"updated_at updated"`
	DeletedAt *time.Time `xorm:"deleted_at deleted"`
	Version   int        `xorm:"version"`
}

// Model ...
type Model struct {
	model `xorm:"extends"`
}
