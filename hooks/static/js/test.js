/**
 * Created by han on 2017/5/28.
 */


function editKeys(name,name2) {

    document.getElementById(name).style.display='none'
    document.getElementById(name2).style.display=''

}


function editDisabled(id, status) {
    newInputs = document.getElementById(id).getElementsByTagName("input")
    for (i=0; i<newInputs.length; i++){
        newInputs.item(i).disabled=status;
    }

}

function submitFormToJson() {
    var projectNameId = "edit-project-name-input-"
    var gitUrlId = "edit-url-input-"
    var shellId = "edit-shell-input-"
    var imageNameId = "edit-image-ImageName-"
    var imageBranchId = "edit-image-Branch-"
    var imageBuildId = "edit-image-BuildTo-"

    var data = {}
    data.PublishSetings = []

    var projects = document.getElementsByTagName("form")[0].getElementsByClassName("jumbotron")

    for (var i=0; i<projects.length-1; i++){
        var ps = {}
        ps.Name = document.getElementById(projectNameId + i).value
        ps.Url = document.getElementById(gitUrlId + i).value
        ps.BuildShell = document.getElementById(shellId + i).value
        ps.Images = []
        var images = projects[i].getElementsByClassName("edit-image")
        for (var j=0; j<images.length; j++){
            var image = {}
            image.Branch =  document.getElementById(imageNameId + i + "-" + j).value
            image.BuildTo = document.getElementById(imageBranchId + i + "-" + j).value
            image.ImageName = document.getElementById(imageBuildId + i + "-" + j).value
            ps.Images.push(image)
        }
        if(document.getElementById("image-new-" + i).getAttribute("style") != "display:none;"){
            var image = {}
            image.Branch =  document.getElementById("edit-image-Branch-" + i + "-new").value
            image.BuildTo = document.getElementById("edit-image-BuildTo-" + i + "-new").value
            image.ImageName = document.getElementById("edit-image-ImageName-" + i + "-new").value
            ps.Images.push(image)
        }

        console.log(ps.Images.length)
        data.PublishSetings.push(ps)
    }
    if(document.getElementById("project-new").getAttribute("style") != "display:none;"){
        var newps = {}
        newps.Name = document.getElementById("project-name-input-new").value
        newps.Url = document.getElementById("edit-url-input-new").value
        newps.BuildShell = document.getElementById("shell-input-new").value
        if(document.getElementById("image-new").getAttribute("style") != "display:none;"){
            newps.Images = []
            var image = {}
            image.Branch =  document.getElementById("edit-image-Branch-new").value
            image.BuildTo = document.getElementById("edit-image-BuildTo-new").value
            image.ImageName = document.getElementById("edit-image-ImageName-new").value
            newps.Images.push(image)
        }
        data.PublishSetings.push(newps)
    }

    console.log(JSON.stringify(data))

    fetch('/images', {
        method: 'post',
        headers: {
            // 'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    }).then(function(response){window.location.href=response.url})

    return false;
}