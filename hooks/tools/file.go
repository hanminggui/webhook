package tools

import (
	"io/ioutil"
	"os"
	"fmt"
	"path/filepath"
)

const (
	confPath string = "conf"
	keyFile string = "pushKey"
)

var (
	workPath, _ = os.Getwd()
)

func GetKey() string {
	fmt.Println(workPath)
	fmt.Println(filepath.Join(workPath, confPath, keyFile))
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

func Check(e error) {
	if e != nil {
		panic(e)
	}
}