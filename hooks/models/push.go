package models

type Push struct {
        Object_kind             string
        Before                  string
        After                   string
        Ref                     string
        Checkout_sha            string
        Message                 string
        User_id                 int
        User_name               string
        User_email              string
        Project_id              int
        Repository              Repository
        Commits                 []Commits
        Total_commits_count     int
}

type Repository struct {
        Name                    string
        Url                     string
        Description             string
        Homepage                string
        Git_http_url            string
        Git_ssh_url             string
        Visibility_level        int

}

type Commits struct {
        Id                      string
        Message                 string
        Timestamp               string
        Url                     string
        Author                  Author
}

type Author struct {
        Name                    string
        Email                   string
}