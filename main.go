package main

import (
	_ "github.com/glvd/backmanage/adapter/gin"
	"github.com/glvd/backmanage/datamodel"
	"github.com/glvd/backmanage/echarts"
	"github.com/glvd/backmanage/model"
	"github.com/glvd/go-admin/plugins/admin"
	"github.com/glvd/go-admin/template/chartjs"
	_ "github.com/glvd/themes/adminlte"
	_ "github.com/glvd/themes/sword"
	_ "github.com/go-sql-driver/mysql"
	"github.com/goextension/log"

	"github.com/gin-gonic/gin"
	"github.com/glvd/backmanage/login"
	"github.com/glvd/backmanage/pages"
	"github.com/glvd/go-admin/engine"
	"github.com/glvd/go-admin/modules/config"
	"github.com/glvd/go-admin/template"
	"github.com/glvd/go-admin/template/types"
	template2 "html/template"
	"net/http"
)

func main() {
	r := gin.Default()
	r.Use(func(context *gin.Context) {
		//if context.FullPath() == "/admin/new/files" {
		log.Infow("path", "path", context.Request.URL.Path)
		log.Infow("output", "params", context.Params)
		//}
	})
	eng := engine.Default()

	adminPlugin := admin.NewAdmin(datamodel.Generators)

	// add generator, first parameter is the url prefix of table when visit.
	// example:
	//
	// "user" => http://localhost:9033/admin/info/user
	//
	//adminPlugin.AddGenerator("user", datamodel.GetUserTable)

	template.AddLoginComp(login.GetLoginComponent())
	template.AddComp(chartjs.NewChart())
	template.AddComp(echarts.NewChart())

	//rootPath := "/data/www/go-admin"
	rootPath := "."
	cfg := config.ReadFromJson(rootPath + "/config.json")
	//cfg.CustomFootHtml = template2.HTML(`<div style="display:none;">
	//<script type="text/javascript" src="https://s9.cnzz.com/z_stat.php?id=1278156902&web_id=1278156902"></script>
	//</div>`)
	cfg.CustomHeadHtml = template2.HTML(`<link rel="icon" type="image/png" sizes="32x32" href="//quick.go-admin.cn/official/assets/imgs/icons.ico/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="//quick.go-admin.cn/official/assets/imgs/icons.ico/favicon-64x64.png">
        <link rel="icon" type="image/png" sizes="16x16" href="//quick.go-admin.cn/official/assets/imgs/icons.ico/favicon-16x16.png">`)
	if err := eng.AddConfig(cfg).AddPlugins(adminPlugin).Use(r); err != nil {
		panic(err)
	}

	model.InitDatabase(cfg)

	err := model.Sync(model.DB())
	if err != nil {
		panic(err)
	}
	r.Static("/uploads", rootPath+"/uploads")

	// you can custom your pages like:
	r.GET("/admin", func(ctx *gin.Context) {
		eng.Content(ctx, func(ctx interface{}) (types.Panel, error) {
			return pages.GetServiceDashBoardContent()
		})
	})

	// you can custom your pages like:
	//r.GET("/admin", func(ctx *gin.Context) {
	//	eng.Content(ctx, func(ctx interface{}) (types.Panel, error) {
	//		return pages.GetServiceDashBoardContent()
	//	})
	//})

	r.GET("/admin/dash", func(ctx *gin.Context) {
		eng.Content(ctx, func(ctx interface{}) (panel types.Panel, e error) {
			return pages.GetDashBoardContent()
		})
	})
	r.GET("/pages/video", func(ctx *gin.Context) {
		eng.Content(ctx, func(ctx interface{}) (panel types.Panel, e error) {
			return pages.GetVideoContent()
		})
	})
	r.GET("/admin/form1", func(ctx *gin.Context) {
		eng.Content(ctx, func(ctx interface{}) (types.Panel, error) {
			return pages.GetForm1Content()
		})
	})

	r.GET("/admin/echarts", func(ctx *gin.Context) {
		eng.Content(ctx, func(ctx interface{}) (types.Panel, error) {
			return pages.GetDashBoard3Content()
		})
	})

	r.GET("/", func(ctx *gin.Context) {
		ctx.Redirect(http.StatusMovedPermanently, "/admin")
	})

	e := r.Run(":9033")
	if e != nil {
		panic(e)
	}
}
