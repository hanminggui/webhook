package controllers

import (
	"github.com/astaxie/beego"
)

type ProjectController struct {
	beego.Controller
}


func (c *ProjectController) Get() {
	//idStr := c.Ctx.Input.Param(":id")

	c.Data["project"] = &Project{Id:1, Url:"https://github.com/hanminggui/webhook"}

	var images [3]*Image
	images[0] = &Image{Id:1, BranchId:1, Name:"生产环境", Descrip:"生产环境", RunImgUrl:"../static/img/timg.jpg"}
	images[1] = &Image{Id:2, BranchId:1, Name:"测试环境", Descrip:"测试环境", RunImgUrl:"../static/img/timg.jpg"}
	images[2] = &Image{Id:3, BranchId:2, Name:"开发环境", Descrip:"开发环境", RunImgUrl:"../static/img/timg.jpg"}
	c.Data["images"] = &images


	var branchs [3]*Branch
	branchs[0] = &Branch{Id:1, ProjectId:1, Name:"master"}
	branchs[1] = &Branch{Id:2, ProjectId:1, Name:"hook"}
	branchs[2] = &Branch{Id:3, ProjectId:1, Name:"webtest"}
	c.Data["branchs"] = &branchs

	var variables [6]*Variable
	variables[0] = &Variable{Id:1, Name:"第一个变量", Value:"aaa_111", ImageId:1}
	variables[1] = &Variable{Id:2, Name:"第一个变量", Value:"aaa_222", ImageId:2}
	variables[2] = &Variable{Id:3, Name:"第一个变量", Value:"aaa_333", ImageId:3}
	variables[3] = &Variable{Id:4, Name:"user", Value:"user_1", ImageId:1}
	variables[4] = &Variable{Id:5, Name:"user", Value:"user_2", ImageId:2}
	variables[5] = &Variable{Id:6, Name:"user", Value:"user_3", ImageId:3}
	c.Data["variables"] = &variables

	c.TplName = "project.tpl"
}

type Project struct {
	Id		int
	Url 		string
}

type Variable struct {
	Id		int
	Name 		string
	Value		string
	ImageId	int
}

type Image struct {
	Id		int
	RunImgUrl	string
	Name 		string
	Descrip		string
	BranchId	int
}

type Branch struct {
	Id		int
	Name 		string
	ProjectId	int
}