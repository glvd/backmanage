package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	"github.com/google/uuid"
	"log"
)

// FileTable ...
func FileTable() (t table.Table) {
	t = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     true,
		Editable:   false,
		Deletable:  true,
		Exportable: true,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Varchar,
			Name: table.DefaultPrimaryKeyName,
		},
	})
	info := t.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("Address", "address", db.Text).FieldDisplay(func(value types.FieldModel) interface{} {
		return "<a target=\"_blank\" href=\"" + "/uploads/" + value.Value + "\">" + value.Value + "</a>"
	})
	info.AddField("Name", "name", db.Text).FieldFilterable(types.FilterType{
		Operator: types.FilterOperatorLike,
	})
	info.AddField("Size", "size", db.Varchar).FieldSortable()
	info.AddField("CreateTime", "created_at", db.Timestamp).FieldFilterable(types.FilterType{FormType: form.DatetimeRange})
	info.AddField("UpdateTime", "updated_at", db.Timestamp)
	info.SetPreDeleteFn(func(ids []string) error {
		return nil
	})
	info.SetTable("dhash_files").SetTitle("Files").SetDescription("Files")

	//edit/add form
	formList := t.GetForm()
	formList.SetBeforeInsert(func(values form2.Values) error {
		//if values.Get("id") == "" {
		//	values.Add("id", uuid.New().String())
		//}
		log.Printf("f:%+v", values)
		fname := values.Get("_filename_address")
		if fname != "" && values.Get("name") == "" {
			values.Add("name", fname)
		}
		fsize := values.Get("_filesize_address")
		if fsize != "" {
			values.Add("size", fsize)
		}

		return nil
	})
	formList.AddField("ID", "id", db.Varchar, form.Default).FieldDefault(uuid.New().String()).FieldNotAllowEdit()
	formList.AddField("Address", "address", db.Varchar, form.File)
	formList.AddField("Name", "name", db.Varchar, form.Text)
	formList.SetTable("dhash_files").SetTitle("Files").SetDescription("Files")
	return
}
