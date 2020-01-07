package datamodel

import (
	"github.com/glvd/backmanage/model"
	"github.com/glvd/go-admin/modules/db"
	form2 "github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template/types"
	"github.com/glvd/go-admin/template/types/form"
	editType "github.com/glvd/go-admin/template/types/table"
	"github.com/goextension/log"
	"github.com/google/uuid"
)

// GlobalTable ...
func GlobalTable() (t table.Table) {
	t = table.NewDefaultTable(table.Config{
		Driver:     db.DriverMysql,
		CanAdd:     true,
		Editable:   true,
		Deletable:  true,
		Exportable: false,
		Connection: table.DefaultConnectionName,
		PrimaryKey: table.PrimaryKey{
			Type: db.Varchar,
			Name: table.DefaultPrimaryKeyName,
		},
	})

	info := t.GetInfo()
	info.AddField("ID", "id", db.Varchar).FieldSortable()
	info.AddField("Key", "key", db.Text).FieldFilterable(types.FilterType{
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
	formList.SetBeforeInsert(func(values form2.Values) error {
		log.Infow("global insert", "values", values)
		//if values.Get("id") == "" {
		//	values.Add("id", uuid.New().String())
		//}
		return nil
	})
	formList.AddField("ID", "id", db.Varchar, form.Default).FieldDefault(uuid.New().String()).FieldNotAllowEdit()
	formList.AddField("Key", "key", db.Varchar, form.Text)
	formList.AddField("Value", "value", db.Varchar, form.Text)
	formList.SetTable("dhash_globals").SetTitle("Globals").SetDescription("Globals")

	formList.SetPostHook(func(values form2.Values) error {
		model.RefreshGlobal(func(key string, value string) {
			//if key == "proxy" {
			//	scrape.DefaultOption.Proxy = value
			//	scrape.RenewScrape()
			//}
		})
		return nil
	})
	return
}
