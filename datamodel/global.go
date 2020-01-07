package datamodel

import (
	"github.com/glvd/backmanage/model"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
)

// GlobalTable ...
func GlobalTable() (t table.Table) {
	t = table.NewDefaultTable(table.Config{
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

	info := t.GetInfo()
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
	formList := t.GetForm()
	formList.AddField("Tag", "tag", db.Varchar, form.Text)
	formList.AddField("Value", "value", db.Varchar, form.Text)
	formList.SetTable("dhash_globals").SetTitle("Globals").SetDescription("Globals")

	formList.SetPostHook(func(values form2.Values) error {
		model.RefreshGlobal()
		return nil
	})
	return
}
