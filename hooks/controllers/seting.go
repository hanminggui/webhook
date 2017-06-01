package controllers

import (
	"github.com/astaxie/beego"
	"workspace/hooks/tools"
	"workspace/hooks/models"
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


type ImageController struct {
	beego.Controller
}

func (c *ImageController) Get() {
	c.Data["publish"] = tools.GetPublish()
	c.TplName = "images.tpl"
}

func (c *ImageController) Post() {
	//publish := tools.GetPublish()
        //ps := new(models.PublishSeting)
        //ps.
        //tools.SetPublish(c.get)
	c.Get()
}