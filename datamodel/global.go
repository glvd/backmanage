package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
	"log"
)

// GlobalTable ...
func GlobalTable() (gTable table.Table) {
	gTable = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     true,
		Editable:   false,
		Deletable:  true,
		Exportable: true,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Int,
			Name: table.DefaultPrimaryKeyName,
		},
	})
	info := gTable.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("Tag", "tag", db.Text).FieldFilterable(types.FilterType{
		Operator: types.FilterOperatorLike,
	}).FieldEditAble(editType.Text)
	info.AddField("Value", "value", db.Text).FieldFilterable(types.FilterType{
		Operator: types.FilterOperatorLike,
	}).FieldEditAble(editType.Text)
	info.AddField("CreateTime", "created_at", db.Timestamp).FieldFilterable(types.FilterType{FormType: form.DatetimeRange})
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("global").SetTitle("Globals").SetDescription("Globals")

	//edit/add form
	formList := gTable.GetForm()
	formList.SetBeforeInsert(func(values form2.Values) error {
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
	formList.AddField("Tag", "tag", db.Varchar, form.File)
	formList.AddField("Value", "value", db.Varchar, form.Text)
	formList.SetTable("global").SetTitle("Globals").SetDescription("Globals")
	return
}
