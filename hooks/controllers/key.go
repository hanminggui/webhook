package controllers

import (
	"github.com/astaxie/beego"
	"workspace/hooks/tools"
)

type KeyController struct {
	beego.Controller
}

func (c *KeyController) Get() {
	c.Data["pushKey"] = tools.GetKey()
	c.TplName = "key.tpl"
}

func (c *KeyController) Post() {
	tools.SetKey(c.GetString("pushKey"))
	c.Data["pushKey"] = tools.GetKey()
	c.TplName = "key.tpl"
}