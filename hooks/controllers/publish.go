package controllers

import (
	"github.com/astaxie/beego"
)

type PublishController struct {
	beego.Controller
}

func (c *PublishController) Get() {
	c.TplName = "publish.tpl"
}

func (c *PublishController) Post() {
	
	c.TplName = "publish.tpl"
}