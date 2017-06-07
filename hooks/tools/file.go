package tools

import (
	"io/ioutil"
	"os"
	"path/filepath"
        "encoding/json"
        "workspace/hooks/models"
        "fmt"
)

const (
	confPath string = "conf"
	keyFile string = "pushKey"
        gitHome string = "gitHome"
        publish string = "publish"
)

var (
	workPath, _ = os.Getwd()
)

func GetKey() string {
        key, err := ioutil.ReadFile(filepath.Join(workPath, confPath, keyFile))
        if err != nil {
                key = []byte("请设置你的pushkey")
                SetKey(string(key))
        }
        return string(key)
}

func SetKey(keys string) {
        d1 := []byte(keys)
        err := ioutil.WriteFile(filepath.Join(workPath, confPath, keyFile), d1, 0644)
        Check(err)
}


func GetGitHome() string {
        home, err := ioutil.ReadFile(filepath.Join(workPath, confPath, gitHome))
        if err != nil {
                home = []byte("/user/local/gitHome")
                SetGitHome(string(home))
        }
        return string(home)
}

func SetGitHome(home string) {
        d1 := []byte(home)
        err := ioutil.WriteFile(filepath.Join(workPath, confPath, gitHome), d1, 0644)
        Check(err)
}

func GetPublish() models.Pulish {
        publishData, err := ioutil.ReadFile(filepath.Join(workPath, confPath, publish))
        //fmt.Println(string(publishData))
        var publish  models.Pulish
        if err != nil {
                publishData = []byte("{}")
                SetPublish(publish)
        }
        jsonerr := json.Unmarshal(publishData, &publish)
        if jsonerr != nil {
                fmt.Println(jsonerr)
        }
	//fmt.Println(publish.PublishSetings)
        return publish
}

func SetPublish(publishData models.Pulish) {
        //d1 := []byte(string(publishData))
        d1,_ := json.Marshal(publishData)
        err := ioutil.WriteFile(filepath.Join(workPath, confPath, publish), d1, 0644)
        Check(err)
}

func Check(e error) {
	if e != nil {
		panic(e)
	}
}
