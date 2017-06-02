package controllers

import (
	"github.com/astaxie/beego"
	"workspace/hooks/tools"
	"workspace/hooks/models"
        "encoding/json"
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
	publish := tools.GetPublish()
	c.Data["publish"] = &publish
	c.TplName = "images.tpl"
}

func (c *ImageController) Post() {
        var publish models.Pulish
        json.Unmarshal(c.Ctx.Input.RequestBody, &publish)
        tools.SetPublish(publish)
	c.Get()
}