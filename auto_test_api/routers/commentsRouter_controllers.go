package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:StepController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/auto_test_api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

}
