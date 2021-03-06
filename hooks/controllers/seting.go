package controllers

import (
	"github.com/astaxie/beego"
	"workspace/hooks/tools"
	"workspace/hooks/models"
        "encoding/json"
	"io/ioutil"
)


type KeyController struct {
	beego.Controller
}

func (c *KeyController) Get() {
	c.Data["pageName"] = "配置"
	c.Data["pushKey"] = tools.GetKey()
	c.Data["gitHome"] = tools.GetGitHome()
	//tools.Xxx()
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
	c.Data["pageName"] = "环境"
	c.Data["publish"] = &publish
	c.TplName = "images.tpl"
}

func (c *ImageController) Post() {
        var publish models.Pulish
	result,_ := ioutil.ReadAll(c.Ctx.Request.Body)
        json.Unmarshal(result, &publish)
        tools.SetPublish(publish)
	c.Get()
}