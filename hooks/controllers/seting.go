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
	c.Data["gitHome"] = tools.GetGitHome()
	c.TplName = "seting.tpl"
}

func (c *KeyController) Post() {
	tools.SetKey(c.GetString("pushKey"))
	tools.SetGitHome(c.GetString("gitHome"))
	c.Get()
}