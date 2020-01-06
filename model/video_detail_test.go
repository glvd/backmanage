package model

import (
	"github.com/glvd/go-admin/modules/config"
	_ "github.com/go-sql-driver/mysql"
	"testing"
)

func init() {
	cfg := config.ReadFromJson(`D:\workspace\golang\project\backmanage` + "/config.json")
	InitDatabase(cfg)

	err := Sync(DB())
	if err != nil {
		panic(err)
	}
}

// TestInsertVideo ...
func TestInsertVideo(t *testing.T) {
	type args struct {
		video *VideoDetail
	}
	tests := []struct {
		name    string
		args    args
		wantErr bool
	}{
		{
			name: "",
			args: args{
				video: &VideoDetail{
					No:    "1",
					Intro: "",
					Alias: []*Alias{{
						Name: "alias1",
					}},
					ThumbHash:    "",
					PosterHash:   "",
					SourceHash:   "",
					M3U8Hash:     "",
					Key:          "",
					M3U8:         "",
					Roles:        nil,
					Director:     "",
					Systematics:  "",
					Season:       "",
					TotalEpisode: "",
					Episode:      "",
					Producer:     "",
					Publisher:    "",
					Type:         "",
					Format:       "",
					Language:     "",
					Caption:      "",
					Group:        "",
					Index:        "",
					Date:         "",
					Sharpness:    "",
					Series:       "",
					Tags:         nil,
					Length:       "",
					Sample: []*Sample{
						{
							Index: "1",
							Addr:  "SampleLink",
						},
					},
					Uncensored: false,
				},
			},
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if err := InsertVideo(tt.args.video); (err != nil) != tt.wantErr {
				t.Errorf("InsertVideo() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}

// TestVideo_JSON ...
func TestVideo_JSON(t *testing.T) {
	type fields struct {
	}
	tests := []struct {
		name   string
		fields fields
		want   string
	}{
		{},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			var v VideoDetail
			find := DB().Preload("Alias").Preload("Roles").Preload("Sample").Preload("Tags").Where("id = ?", "0f74afdb-286b-11ea-8520-00155d012d1c").Find(&v)
			if got := find.Error; got != nil {
				t.Errorf("Find() = %v, want %v", got, nil)
			}
			if got := v.JSON(); got != "" {
				t.Logf("JSON() = %v", got)
			}
		})
	}
}
