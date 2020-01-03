package guard

import (
	"github.com/glvd/go-admin/context"
	"github.com/glvd/go-admin/modules/auth"
	"github.com/glvd/go-admin/modules/config"
	"github.com/glvd/go-admin/modules/db"
	"github.com/glvd/go-admin/modules/language"
	"github.com/glvd/go-admin/modules/service"
	"github.com/glvd/go-admin/plugins/admin/modules"
	"github.com/glvd/go-admin/plugins/admin/modules/form"
	"github.com/glvd/go-admin/plugins/admin/modules/parameter"
	"github.com/glvd/go-admin/plugins/admin/modules/response"
	"github.com/glvd/go-admin/plugins/admin/modules/table"
	"github.com/glvd/go-admin/template"
	template2 "html/template"
	"mime/multipart"
	"strings"
)

// ShowFormParam ...
type ShowFormParam struct {
	Panel  table.Table
	Id     string
	Prefix string
	Param  parameter.Parameters
}

// GetUrl ...
func (e *ShowFormParam) GetUrl() string {
	return config.Get().Url("/edit/" + e.Prefix)
}

// GetInfoUrl ...
func (e *ShowFormParam) GetInfoUrl() string {
	return config.Get().Url("/info/" + e.Prefix + e.Param.GetRouteParamStrWithoutId())
}

// ShowForm ...
func ShowForm(conn db.Connection) context.Handler {
	return func(ctx *context.Context) {

		prefix := ctx.Query("__prefix")
		panel := table.Get(prefix)

		if !panel.GetEditable() {
			alert(ctx, panel, "operation not allow", conn)
			ctx.Abort()
			return
		}

		id := ctx.Query(panel.GetPrimaryKey().Name)
		if id == "" {
			alert(ctx, panel, "wrong "+panel.GetPrimaryKey().Name, conn)
			ctx.Abort()
			return
		}

		ctx.SetUserValue("show_form_param", &ShowFormParam{
			Panel:  panel,
			Id:     id,
			Prefix: prefix,
			Param: parameter.GetParam(ctx.Request.URL.Query(), panel.GetInfo().DefaultPageSize, panel.GetPrimaryKey().Name,
				panel.GetInfo().GetSort()),
		})
		ctx.Next()
	}
}

// GetShowFormParam ...
func GetShowFormParam(ctx *context.Context) *ShowFormParam {
	return ctx.UserValue["show_form_param"].(*ShowFormParam)
}

// EditFormParam ...
type EditFormParam struct {
	Panel        table.Table
	Id           string
	Prefix       string
	Param        parameter.Parameters
	Path         string
	MultiForm    *multipart.Form
	PreviousPath string
	Alert        template2.HTML
	FromList     bool
}

// Value ...
func (e EditFormParam) Value() form.Values {
	return e.MultiForm.Value
}

// GetEditUrl ...
func (e EditFormParam) GetEditUrl() string {
	return e.getUrl("edit")
}

// GetUpdateUrl ...
func (e EditFormParam) GetUpdateUrl() string {
	return config.Get().Url("/update/" + e.Prefix)
}

// HasAlert ...
func (e EditFormParam) HasAlert() bool {
	return e.Alert != template2.HTML("")
}

// GetNewUrl ...
func (e EditFormParam) GetNewUrl() string {
	return e.getUrl("new")
}

// GetExportUrl ...
func (e EditFormParam) GetExportUrl() string {
	return config.Get().Url("/export/" + e.Prefix + e.Param.GetRouteParamStr())
}

// GetDeleteUrl ...
func (e EditFormParam) GetDeleteUrl() string {
	return config.Get().Url("/delete/" + e.Prefix)
}

// GetUrl ...
func (e *EditFormParam) GetUrl() string {
	return config.Get().Url("/edit/" + e.Prefix)
}

// GetInfoUrl ...
func (e *EditFormParam) GetInfoUrl() string {
	return config.Get().Url("/info/" + e.Prefix + e.Param.GetRouteParamStrWithoutId())
}

func (e EditFormParam) getUrl(kind string) string {
	return config.Get().Url("/info/" + e.Prefix + "/" + kind + e.Param.GetRouteParamStr())
}

// IsManage ...
func (e EditFormParam) IsManage() bool {
	return e.Prefix == "manager"
}

// IsRole ...
func (e EditFormParam) IsRole() bool {
	return e.Prefix == "roles"
}

// EditForm ...
func EditForm(srv service.List) context.Handler {
	return func(ctx *context.Context) {
		prefix := ctx.Query("__prefix")
		previous := ctx.FormValue("_previous_")
		panel := table.Get(prefix)
		multiForm := ctx.Request.MultipartForm

		conn := db.GetConnection(srv)

		if !panel.GetEditable() {
			alert(ctx, panel, "operation not allow", conn)
			ctx.Abort()
			return
		}
		token := ctx.FormValue("_t")

		if !auth.GetService(srv.Get("auth")).CheckToken(token) {
			alert(ctx, panel, "edit fail, wrong token", conn)
			ctx.Abort()
			return
		}

		fromList := modules.IsInfoUrl(previous)

		param := parameter.GetParamFromUrl(previous, fromList, panel.GetInfo().DefaultPageSize,
			panel.GetPrimaryKey().Name, panel.GetInfo().GetSort())

		if fromList {
			previous = config.Get().Url("/info/" + prefix + param.GetRouteParamStrWithoutId())
		}

		ctx.SetUserValue("edit_form_param", &EditFormParam{
			Panel:        panel,
			Id:           multiForm.Value[panel.GetPrimaryKey().Name][0],
			Prefix:       prefix,
			Param:        param,
			Path:         strings.Split(previous, "?")[0],
			MultiForm:    multiForm,
			PreviousPath: previous,
			FromList:     fromList,
		})
		ctx.Next()
	}
}

// GetEditFormParam ...
func GetEditFormParam(ctx *context.Context) *EditFormParam {
	return ctx.UserValue["edit_form_param"].(*EditFormParam)
}

func alert(ctx *context.Context, panel table.Table, msg string, conn db.Connection) {
	response.Alert(ctx, config.Get(), panel.GetInfo().Description, panel.GetInfo().Title, msg, conn)
}

func alertWithTitleAndDesc(ctx *context.Context, title, desc, msg string, conn db.Connection) {
	response.Alert(ctx, config.Get(), desc, title, msg, conn)
}

func getAlert(msg string) template2.HTML {
	return template.Get(config.Get().Theme).Alert().
		SetTitle(template2.HTML(`<i class="icon fa fa-warning"></i> ` + language.Get("error") + `!`)).
		SetTheme("warning").
		SetContent(template2.HTML(msg)).
		GetContent()
}