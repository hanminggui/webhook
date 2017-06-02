package controllers

import (
	"github.com/astaxie/beego"
	"workspace/hooks/tools"
	"workspace/hooks/models"
        "encoding/json"
        "fmt"
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
        fmt.Println(tools.GetPublish())
        jsonstr,_ := json.Marshal(tools.GetPublish())
	c.Data["publish"] = string(jsonstr)
	c.TplName = "images.tpl"
}

func (c *ImageController) Post() {
        var publish models.Pulish
        json.Unmarshal(c.Ctx.Input.RequestBody, &publish)
        tools.SetPublish(publish)
	c.Get()
}