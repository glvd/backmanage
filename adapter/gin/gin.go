// Copyright 2019 GoAdmin Core Team. All rights reserved.
// Use of this source code is governed by a Apache-2.0 style
// license that can be found in the LICENSE file.

package gin

import (
	"bytes"
	"errors"
	"github.com/GoAdminGroup/go-admin/adapter"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/modules/config"
	"github.com/GoAdminGroup/go-admin/plugins"
	"github.com/GoAdminGroup/go-admin/plugins/admin/models"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/constant"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/gin-gonic/gin"
	"net/http"
	"strings"
)

// Gin structure value is a Gin GoAdmin adapter.
type Gin struct {
	adapter.BaseAdapter
	ctx *gin.Context
	app *gin.Engine
}

func init() {
	engine.Register(new(Gin))
}

// User ...
func (gins *Gin) User(ci interface{}) (models.UserModel, bool) {
	return gins.GetUser(ci, gins)
}

// Use ...
func (gins *Gin) Use(router interface{}, plugs []plugins.Plugin) error {
	return gins.GetUse(router, plugs, gins)
}

// Content ...
func (gins *Gin) Content(ctx interface{}, getPanelFn types.GetPanelFn) {
	gins.GetContent(ctx, getPanelFn, gins)
}

// HandlerFunc ...
type HandlerFunc func(ctx *gin.Context) (types.Panel, error)

// Content ...
func Content(handler HandlerFunc) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		engine.Content(ctx, func(ctx interface{}) (types.Panel, error) {
			return handler(ctx.(*gin.Context))
		})
	}
}

// SetApp ...
func (gins *Gin) SetApp(app interface{}) error {
	var (
		eng *gin.Engine
		ok  bool
	)
	if eng, ok = app.(*gin.Engine); !ok {
		return errors.New("wrong parameter")
	}
	gins.app = eng
	return nil
}

// AddHandler ...
func (gins *Gin) AddHandler(method, path string, plug plugins.Plugin) {
	gins.app.Handle(strings.ToUpper(method), path, func(c *gin.Context) {
		ctx := context.NewContext(c.Request)

		for _, param := range c.Params {
			if c.Request.URL.RawQuery == "" {
				c.Request.URL.RawQuery += strings.Replace(param.Key, ":", "", -1) + "=" + param.Value
			} else {
				c.Request.URL.RawQuery += "&" + strings.Replace(param.Key, ":", "", -1) + "=" + param.Value
			}
		}

		ctx.SetHandlers(plug.GetHandler(c.Request.URL.Path, strings.ToLower(c.Request.Method))).Next()
		for key, head := range ctx.Response.Header {
			c.Header(key, head[0])
		}
		if ctx.Response.Body != nil {
			buf := new(bytes.Buffer)
			_, _ = buf.ReadFrom(ctx.Response.Body)
			c.String(ctx.Response.StatusCode, buf.String())
		} else {
			c.Status(ctx.Response.StatusCode)
		}
	})
}

// Name ...
func (gins *Gin) Name() string {
	return "gin"
}

// SetContext ...
func (gins *Gin) SetContext(contextInterface interface{}) adapter.WebFrameWork {
	var (
		ctx *gin.Context
		ok  bool
	)

	if ctx, ok = contextInterface.(*gin.Context); !ok {
		panic("wrong parameter")
	}

	return &Gin{ctx: ctx}
}

// Redirect ...
func (gins *Gin) Redirect() {
	gins.ctx.Redirect(http.StatusFound, config.Get().Url("/login"))
	gins.ctx.Abort()
}

// SetContentType ...
func (gins *Gin) SetContentType() {
	return
}

// Write ...
func (gins *Gin) Write(body []byte) {
	gins.ctx.Data(http.StatusOK, gins.HTMLContentType(), body)
}

// GetCookie ...
func (gins *Gin) GetCookie() (string, error) {
	return gins.ctx.Cookie(gins.CookieKey())
}

// Path ...
func (gins *Gin) Path() string {
	return gins.ctx.Request.URL.Path
}

// Method ...
func (gins *Gin) Method() string {
	return gins.ctx.Request.Method
}

// PjaxHeader ...
func (gins *Gin) PjaxHeader() string {
	return gins.ctx.Request.Header.Get(constant.PjaxHeader)
}
