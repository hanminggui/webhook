package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

	beego.GlobalControllerRouter["workspace/api/controllers:BlogController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:BlogController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:BlogController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:BlogController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:BlogController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:BlogController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:BlogController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:BlogController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:BlogController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:BlogController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:CaseController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:CaseController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:FolderController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:FolderController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ImageController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ImageController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:InterfaceController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ModuleController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ParameterController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:ProjectController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:StepController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:StepController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:StepController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:StepController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:StepController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:StepController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:UserController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:UserController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:UserController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:UserController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:UserController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:UserController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:UserController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:UserController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:UserController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:UserController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["workspace/api/controllers:VariableController"] = append(beego.GlobalControllerRouter["workspace/api/controllers:VariableController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

}
