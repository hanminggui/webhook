package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
)

type ProjectController struct {
	beego.Controller
}


func (c *ProjectController) Get() {
	idStr := c.Ctx.Input.Param(":id")
	fmt.Println(idStr)
	c.TplName = "project.tpl"
}
