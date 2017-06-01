package routers

import (
	"workspace/hooks/controllers"
	"github.com/astaxie/beego"
)

func init() {
    	beego.Router("/", &controllers.MainController{})
	beego.Router("/keys", &controllers.KeyController{})
	beego.Router("/images", &controllers.ImageController{})
	beego.Router("/publish", &controllers.PublishController{})
}
