package guard

import (
	"github.com/glvd/go-admin/context"
	"github.com/glvd/go-admin/modules/db"
)

// MenuDeleteParam ...
type MenuDeleteParam struct {
	Id string
}

// MenuDelete ...
func MenuDelete(conn db.Connection) context.Handler {
	return func(ctx *context.Context) {

		id := ctx.Query("id")

		if id == "" {
			alertWithTitleAndDesc(ctx, "Menu", "menu", "wrong id", conn)
			ctx.Abort()
			return
		}

		// TODO: check the user permission

		ctx.SetUserValue("delete_menu_param", &MenuDeleteParam{
			Id: id,
		})
		ctx.Next()
	}
}

// GetMenuDeleteParam ...
func GetMenuDeleteParam(ctx *context.Context) *MenuDeleteParam {
	return ctx.UserValue["delete_menu_param"].(*MenuDeleteParam)
}
