package datamodel

import (
	"fmt"
	"github.com/GoAdminGroup/go-admin/modules/file"
	"mime/multipart"
)

type base64Upload struct {
	TableName string
	ID        string
	Data      string
}

// Upload ...
func (b base64Upload) Upload(f *multipart.Form) error {
	for s, strings := range f.Value {
		fmt.Println("value", s, strings)
	}
	for s, headers := range f.File {
		fmt.Println("file", s, len(headers))
	}
	return nil
}

// RegisterBase64Upload ...
func RegisterBase64Upload() {
	file.AddUploader("base64", func() file.Uploader {
		return &base64Upload{
			TableName: "uploads",
			ID:        "id",
			Data:      "data",
		}
	})
}
