package routers

import (
	"workspace/webtest/controllers"
	"github.com/astaxie/beego"
)

func init() {
    	beego.Router("/", &controllers.MainController{})
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/join", &controllers.JoinController{})
	beego.Router("/project/:id", &controllers.ProjectController{})
}
