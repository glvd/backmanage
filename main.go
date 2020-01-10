package main

import (
	_ "github.com/GoAdminGroup/backmanage/adapter/gin"
	"github.com/GoAdminGroup/backmanage/datamodel"
	"github.com/GoAdminGroup/backmanage/echarts"
	"github.com/GoAdminGroup/backmanage/model"
	"github.com/GoAdminGroup/go-admin/plugins/admin"
	"github.com/GoAdminGroup/go-admin/template/chartjs"
	_ "github.com/GoAdminGroup/themes/adminlte"
	_ "github.com/GoAdminGroup/themes/sword"
	_ "github.com/go-sql-driver/mysql"
	"github.com/goextension/log"

	"github.com/GoAdminGroup/backmanage/login"
	"github.com/GoAdminGroup/backmanage/pages"
	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/modules/config"
	"github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/gin-gonic/gin"
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
	//logger.OpenSQLLog()
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
	model.InitDatabase(cfg)

	err := model.Sync(model.DB())
	model.GlobalOnStart()
	if err := eng.AddConfig(cfg).ResolveConnection(datamodel.SetConnection, config.DriverMysql).AddPlugins(adminPlugin).Use(r); err != nil {
		panic(err)
	}

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

	//r.GET("/admin/dash", func(ctx *gin.Context) {
	//	eng.Content(ctx, func(ctx interface{}) (panel types.Panel, e error) {
	//		return pages.GetDashBoardContent()
	//	})
	//})
	//r.GET("/pages/video", func(ctx *gin.Context) {
	//	eng.Content(ctx, func(ctx interface{}) (panel types.Panel, e error) {
	//		return pages.GetVideoContent()
	//	})
	//})
	//r.GET("/admin/form1", func(ctx *gin.Context) {
	//	eng.Content(ctx, func(ctx interface{}) (types.Panel, error) {
	//		return pages.GetForm1Content()
	//	})
	//})

	//r.GET("/admin/echarts", func(ctx *gin.Context) {
	//	eng.Content(ctx, func(ctx interface{}) (types.Panel, error) {
	//		return pages.GetDashBoard3Content()
	//	})
	//})

	r.GET("/", func(ctx *gin.Context) {
		ctx.Redirect(http.StatusMovedPermanently, "/admin")
	})

	e := r.Run(":9033")
	if e != nil {
		panic(e)
	}
}
