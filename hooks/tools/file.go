package tools

import (
	"io/ioutil"
	"os"
	"path/filepath"
        "encoding/json"
        "workspace/hooks/models"
        "fmt"
	"strconv"
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



//test

type Log struct {
        Api             string
        Name            string
        Runtime         int
}

func (log *Log) writetoFile(file *os.File)  {
        strLog,err := json.Marshal(log)
        Check(err)
        file.WriteString(string(strLog) + "\n")
}

func TestWriteLog()  {
        f , err := os.OpenFile(filepath.Join(workPath, "log", "test.log"), os.O_WRONLY|os.O_APPEND, 0666)
        Check(err)
        defer f.Close()
	ci := make(chan int,5000)
	defer close(ci)

        for i:=0; i<5000; i++ {
                go testBf(f, ci, i)
        }
	for i:=0; i<5000; i++ {
		tId := <- ci
		fmt.Println(strconv.Itoa(tId) + "号协程执行完毕")
	}

	fmt.Println("***************************************************************************************************")
	fmt.Println("*************                              writer over                                *************")
	fmt.Println("***************************************************************************************************")
}

func testBf(f *os.File, c chan int, i int)  {
	log := new(Log)
	log.Api = "I'm api"
	log.Name = "I'm name"
	log.Runtime = i
	log.writetoFile(f)
	c <- i
}