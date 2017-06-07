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
        Check(err)
        for brows.Next(){
                brows.Scan(&begin)
        }
        erows,err := db.Query("SELECT id FROM " + table + " ORDER BY id DESC LIMIT 1")
        Check(err)
        for erows.Next(){
                erows.Scan(&end)
        }
        return begin,end
}

func writeArray(db *mysql.DB, tableName string, beginId int,  c chan int, number int)  {
        // 文件命名规则  开始idto结束id
        fileName := filepath.Join(workPath, "log", str.Itoa(beginId) + "to" + str.Itoa(beginId + LENGTH))
        sql := "SELECT * FROM " + tableName + "WHERE id >="+str.Itoa(beginId)+" and id < " + str.Itoa(beginId + LENGTH)

        err := ioutil.WriteFile(fileName, []byte("\n"), 0644)
        f , err := os.OpenFile(fileName, os.O_WRONLY|os.O_APPEND, 0666)
        Check(err)
        defer f.Close()

        rows,err := db.Query(sql)
        Check(err)

        var id  int
        var uuid mysql.NullString
        var target_name mysql.NullString
        var target_class mysql.NullString
        var request_params mysql.NullString
        var create_time mysql.NullString
        var ip mysql.NullString
        var response_params mysql.NullString
        var ip_region mysql.NullString

        var apilog Log

        for rows.Next() {
                //序列化
                err := rows.Scan(&id, &uuid, &target_name, &target_class, &request_params, &response_params, &ip, &ip_region, &create_time)
                Check(err)
                apilog.Target_name = target_name.String
                apilog.Target_class = target_class.String
                apilog.Request_params = request_params.String
                apilog.Create_time = create_time.String
                apilog.Ip = strings.Split(ip.String, ",")[0]
                apilog.Duration = 0
                //存文件
                apilog.writetoFile(f)
        }
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
        Target_name     string
        Target_class    string
        Request_params  string
        Create_time     string
        Ip              string
        Duration        int
}

func (log *Log) writetoFile(file *os.File)  {
        strLog,err := json.Marshal(log)
        Check(err)
        file.WriteString(string(strLog) + "\n")
}

//
//func TestWriteLog(fileName string)  {
//        f , err := os.OpenFile(filepath.Join(workPath, "log", fileName), os.O_WRONLY|os.O_APPEND, 0666)
//        Check(err)
//        defer f.Close()
//        ci := make(chan int,5000)
//        defer close(ci)
//
//        for i:=0; i<5000; i++ {
//                go testBf(f, ci, i)
//        }
//        for i:=0; i<5000; i++ {
//                <- ci
//                //tId := <- ci
//                //fmt.Println(strconv.Itoa(tId) + "号协程执行完毕")
//        }
//
//        fmt.Println("***************************************************************************************************")
//        fmt.Println("*************                              writer over                                *************")
//        fmt.Println("***************************************************************************************************")
//}
//
//func testBf(f *os.File, c chan int, i int)  {
//        log := new(Log)
//        //log.Api = "I'm api"
//        //log.Name = "I'm name"
//        //log.Runtime = i
//        log.writetoFile(f)
//        c <- i
//}