package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
)

// FileTable ...
func FileTable() (fTable table.Table) {
	fTable = table.NewDefaultTable(table.Config{
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
	info := fTable.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("Address", "address", db.Text)
	info.AddField("Name", "name", db.Text)
	info.AddField("CreateTime", "created_at", db.Timestamp).FieldFilterable(types.FilterType{FormType: form.Datetime})
	info.AddField("UpdateTime", "updated_at", db.Timestamp)

	info.SetTable("file").SetTitle("Files").SetDescription("Files")

	//edit/add form
	formList := fTable.GetForm()

	formList.AddField("Address", "address", db.Varchar, form.File).FieldNotAllowEdit()
	formList.AddField("Name", "name", db.Varchar, form.Text)
	formList.SetTable("file").SetTitle("Files").SetDescription("Files")
	return
}
