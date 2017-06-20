package controllers

import (
	"github.com/astaxie/beego"
)

type JoinController struct {
	beego.Controller
}

func (c *JoinController) Get() {
	c.TplName = "join.tpl"
}

func (c *JoinController) Post() {
	c.TplName = "join.tpl"
}