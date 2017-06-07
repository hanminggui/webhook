package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["pageName"] = "首页"
	c.TplName = "index.tpl"
}
