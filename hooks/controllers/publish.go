package controllers

import (
	"github.com/astaxie/beego"
	"io/ioutil"
	"fmt"
	"encoding/json"
	"workspace/hooks/models"
	"strings"
	"workspace/hooks/tools"
        "path/filepath"
        "os"
)



type PublishController struct {
	beego.Controller
}

func (c *PublishController) Get() {
	c.Data["pageName"] = "发布"
	c.TplName = "publish.tpl"
}

func (c *PublishController) Post() {
        //result,_ := ioutil
	var push models.Push
	result,_ := ioutil.ReadAll(c.Ctx.Request.Body)
	json.Unmarshal(result, &push)

	//fmt.Println(string(result))

	for i := 0; i<len(push.Commits); i++ {
		if strings.Contains(push.Commits[i].Message, tools.GetKey()){
                        projectHome := filepath.Join(tools.GetGitHome(), push.Repository.Name)
                        refs := strings.Split(push.Ref, "/")
                        ref := refs[len(refs)-1]
                        fmt.Println(ref)
                        if _,err := os.Stat(projectHome); os.IsNotExist(err){
                                res := tools.Exec_shell("cd " + tools.GetGitHome() + " && git clone " + push.Repository.Git_ssh_url)
                                fmt.Println(res)
                                fmt.Println("clone完成")
                        }
                        res := tools.Exec_shell("cd " + projectHome  + " && git checkout " + ref + " && git pull")
                        fmt.Println(res)
                        fmt.Println("pull完成")
		}
	}

	//fmt.Println(push.Object_kind)
	//fmt.Println(push.Before)
	//fmt.Println(push.After)
	//fmt.Println(push.Ref)
	//fmt.Println(push.Checkout_sha)
	//fmt.Println(push.Message)
	//fmt.Println(push.User_id)
	//fmt.Println(push.User_name)
	//fmt.Println(push.User_email)
	//fmt.Println(push.Project_id)
	//fmt.Println(push.Repository)
	//fmt.Println(push.Commits)
	//fmt.Println(push.Total_commits_count)
	c.TplName = "publish.tpl"
}
