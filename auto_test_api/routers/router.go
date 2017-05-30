// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"workspace/auto_test_api/controllers"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",

		beego.NSNamespace("/case",
			beego.NSInclude(
				&controllers.CaseController{},
			),
		),

		beego.NSNamespace("/folder",
			beego.NSInclude(
				&controllers.FolderController{},
			),
		),

		beego.NSNamespace("/image",
			beego.NSInclude(
				&controllers.ImageController{},
			),
		),

		beego.NSNamespace("/project",
			beego.NSInclude(
				&controllers.ProjectController{},
			),
		),

		beego.NSNamespace("/step",
			beego.NSInclude(
				&controllers.StepController{},
			),
		),

		beego.NSNamespace("/variable",
			beego.NSInclude(
				&controllers.VariableController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
