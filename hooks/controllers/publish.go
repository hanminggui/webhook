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
                        if _,err := os.Stat(projectHome); os.IsNotExist(err){
                                res := tools.Exec_shell("cd " + tools.GetGitHome() + " && git clone " + push.Repository.Git_ssh_url + " && cd " + projectHome  + " && git checkout " + push.Ref)
                                fmt.Println(res)
                        }else {
                                res := tools.Exec_shell("cd " + projectHome  + " && git pull origin " + push.Ref+":"+push.Ref + " && git checkout " + push.Ref)
                                fmt.Println(res)
                        }

                        res := tools.Exec_shell("cd " + tools.GetGitHome() + "&& ")
			fmt.Println(res)
			res = tools.Exec_shell("cd tools && pwd")
                        fmt.Println(res)
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
