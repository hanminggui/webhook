package tools

import (
	"os/exec"
	"bytes"
	"log"
	//"fmt"
)

func Exec_shell(s string) string {
	//fmt.Println("shell begin" + s)
	cmd := exec.Command("/bin/bash", "-c", s)
	var out bytes.Buffer

	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
	//fmt.Printf("%s", out.String())
	return out.String()
}
