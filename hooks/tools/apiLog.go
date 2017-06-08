package tools

import (
        _ "github.com/go-sql-driver/mysql"
        "fmt"
        "os"
        "encoding/json"
        "path/filepath"
        mysql "database/sql"
        "io/ioutil"
        str "strconv"
        "strings"
)

var (
        DN  = "mysql"
        DSN  = "ivydad_new:264210076li@tcp(rm-2zew9i7896x4v22u4o.mysql.rds.aliyuncs.com:3306)/ivydad?charset=utf8"
        LENGTH  = 1000000         //一个文件存放一百万条数据 大概500M
        NewLog  = "expl_api_log"
        OldLog  = "expl_api_log_history"
)


func get2Id(db *mysql.DB, table string) (int,int) {
        var begin,end int
        brows,err := db.Query("SELECT id FROM " + table + " ORDER BY id ASC LIMIT 1")
        defer brows.Close()
        Check(err)
        for brows.Next(){
                brows.Scan(&begin)
        }
        erows,err := db.Query("SELECT id FROM " + table + " ORDER BY id DESC LIMIT 1")
        defer erows.Close()
        Check(err)
        for erows.Next(){
                erows.Scan(&end)
        }
        return begin,end
}

func writeArray(db *mysql.DB, tableName string, beginId int,  c chan int, number int)  {
        // 文件命名规则  开始idto结束id
        fileName := filepath.Join(workPath, "log", tableName + str.Itoa(number) + ".txt")

        sqlQ := "SELECT * FROM " + tableName + " WHERE id >= "+str.Itoa(beginId)+" AND id < " + str.Itoa(beginId + LENGTH)

        err := ioutil.WriteFile(fileName, []byte("\n"), 0644)
        f , err := os.OpenFile(fileName, os.O_WRONLY|os.O_APPEND, 0666)
        Check(err)
        rows,err := db.Query(sqlQ)
        Check(err)

        fmt.Println(str.Itoa(number) + "协程启动：取出SQL结果、打开文件。读取数据&启动写入协程中")
        tn := 0

        //序列化
        var id       mysql.NullString
        var uuid mysql.NullString
        var target_name mysql.NullString
        var target_class mysql.NullString
        var request_params []byte
        var create_time mysql.NullString
        var ip mysql.NullString
        var response_params mysql.NullString
        var ip_region mysql.NullString

        wc := make(chan int,1024)
        for rows.Next() {

                var apilog Log
                err := rows.Scan(&id, &uuid, &target_name, &target_class, &request_params, &response_params, &ip, &ip_region, &create_time)
                Check(err)
                apilog.Target_name = target_name.String
                apilog.Target_class = target_class.String
                json.Unmarshal(request_params, &apilog.Request_params)
                apilog.Create_time = create_time.String
                apilog.Clientip = strings.Split(ip.String, ",")[0]
                apilog.Duration = 0
                go writetoFile(f, apilog, wc)
                tn ++
        }
        fmt.Println(str.Itoa(number) + "协程取完了所有数据并启动了 "+str.Itoa(tn)+"个子协程：写入文件中")

        for i:=0; i<tn; i++{
               <- wc
        }
        fmt.Println(str.Itoa(number) + "协程所有子协程已完成写入操作")
        rows.Close()
        f.Close()
        c <- number

}


func WriteApiLogToFile() string {
        db,err := mysql.Open(DN, DSN)
        Check(err)
        defer db.Close()

        c := make(chan int,20)
        index := 0

        for nlb,nle := get2Id(db, NewLog); nlb < nle; nlb += LENGTH{
                go writeArray(db, NewLog, nlb, c, index)
                index++
        }

        for olb,ole := get2Id(db, OldLog); olb < ole; olb += LENGTH{
                go writeArray(db, OldLog, olb, c, index)
                index ++
        }

        for i:=0; i<index; i++{
                fmt.Println(str.Itoa(<- c) + "号协程执行完毕")
        }

        fmt.Println("***************************************************************************************************")
        fmt.Println("*************                              writer over                                *************")
        fmt.Println("***************************************************************************************************")

        return "写入完成，共写入" + str.Itoa(index) + "个文件。每个文件" + str.Itoa(LENGTH) + "条数据。 \n 文件目录:" + filepath.Join(workPath, "log")

}

type Log struct {
        Target_name    string  `json:"target_name"`
        Target_class   string  `json:"target_class"`
        Request_params interface{}  `json:"request_params"`
        Create_time    string  `json:"create_time"`
        Clientip       string  `json:"clientip"`
        Duration       int     `json:"duration"`
}

func writetoFile(file *os.File, apilog Log, wc chan int)  {

        //存文件
        byteLog,err := json.Marshal(apilog)
        Check(err)
        //fmt.Println(string(strLog))

        file.WriteString(string(byteLog)  + "\n")
        wc <- 1
}


//func Test() string {
//        db,err := mysql.Open(DN, DSN)
//        Check(err)
//        defer db.Close()
//
//        c := make(chan int,20)
//        index := 0
//
//        LENGTH = 10000
//
//        for nlb,nle := 57600000,57700000; nlb < nle; nlb += LENGTH{
//                go writeArray(db, NewLog, nlb, c, index)
//                index++
//        }
//
//        for i:=0; i<index; i++{
//                fmt.Println(str.Itoa(<- c) + "号协程执行完毕")
//        }
//
//        fmt.Println("***************************************************************************************************")
//        fmt.Println("*************                              writer over                                *************")
//        fmt.Println("***************************************************************************************************")
//
//        return "写入完成，共写入" + str.Itoa(index) + "个文件。每个文件" + str.Itoa(LENGTH) + "条数据。 \n 文件目录:" + filepath.Join(workPath, "log")
//
//}
