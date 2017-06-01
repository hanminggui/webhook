package models


type Pulish struct {
        PublishSetings          []PublishSeting
}

type PublishSeting struct {
        Repository              Repository
        Images                  []Image
        BuildShell              string
        Name                    string
}

type Image struct {
        Branch                  string
        BuildTo                 string
        ImageName               string
}
