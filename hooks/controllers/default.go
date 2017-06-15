package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	zdb := 1.01
	bj := 10000.0
	ts := 260

	for i:=0; i<ts; i++ {
		bj = bj * zdb
	}
	c.Data["pageName"] = "首页"
	c.Data["q"] = int(bj)
	c.TplName = "index.tpl"
}
