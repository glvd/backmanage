package datamodel

import (
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
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

	info.SetTable("dhash_globals").SetTitle("Globals").SetDescription("Globals")

	//edit/add form
	formList := gTable.GetForm()
	formList.AddField("Tag", "tag", db.Varchar, form.Text)
	formList.AddField("Value", "value", db.Varchar, form.Text)
	formList.SetTable("dhash_globals").SetTitle("Globals").SetDescription("Globals")
	return
}
