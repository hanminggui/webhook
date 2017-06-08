package controllers

import (
	"github.com/astaxie/beego"
	"workspace/hooks/tools"
)



type ToolsController struct {
	beego.Controller
}

func (c *ToolsController) Get() {
	c.Data["pageName"] = "工具"
	c.Data["driver"] = tools.DN
	c.Data["conn"] = tools.DSN
	c.Data["newtable"] = tools.NewLog
	c.Data["oldtable"] = tools.OldLog
        c.Data["length"] = tools.LENGTH

        c.TplName = "tools.tpl"
}

func (c *ToolsController) Post() {
	if c.GetString("driver") != "" && c.GetString("conn") != "" && c.GetString("newtable") != "" && c.GetString("oldtable") != ""{
		tools.DN = c.GetString("driver")
		tools.DSN = c.GetString("conn")
		tools.NewLog = c.GetString("newtable")
		tools.OldLog = c.GetString("oldtable")
                tools.LENGTH,_ = c.GetInt("length")
	}
	res := tools.WriteApiLogToFile()
	//res := tools.Test()
	c.Data["result"] = res
	c.TplName = "log.tpl"
}
