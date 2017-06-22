/**
 * Created by han on 2017/6/20.
 */

/**
 * 切换页签改变页签选中状态 页面中部显示不同内容
 * @param e
 */
function checkLable(e) {
    var elid =  e.getAttribute("id").split("-")[1]
    titles = document.getElementsByClassName("title")
    contents = document.getElementsByClassName("content")
    for(var i=0; i<titles.length; i++){
        if(titles[i].id != "title-" + elid){
            titles[i].setAttribute("class", "title")
        }else {
            titles[i].setAttribute("class", "active title")
        }
    }
    for(var i=0; i<contents.length; i++){
        if(contents[i].id != "content-" + elid){
            contents[i].setAttribute("class", "content hide")
        }else {
            contents[i].setAttribute("class", "content")
        }
    }
}

function editImage(e) {

}