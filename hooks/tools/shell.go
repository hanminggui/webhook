package tools

import (
	"os/exec"
	"bytes"
	"log"
	//"fmt"
	"fmt"
)

func Exec_shell(s string) string {
	fmt.Println("shell : " + s)
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
func Exec_shell2(s string) string {
	cmd := exec.Command("/bin/bash", "-c", s)
	out, err := cmd.Output()
	if err != nil {
		log.Fatal(err)
	}
	return string(out)
}