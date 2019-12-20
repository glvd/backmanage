package model

import "mime/multipart"

// Uploader 上传引擎
type Uploader interface {
	Upload(*multipart.Form) error
}

// UploaderGenerator 上传引擎生成函数
type UploaderGenerator func() Uploader

// AddUploader 增加引擎接口api
func AddUploader(name string, up UploaderGenerator) {

}
