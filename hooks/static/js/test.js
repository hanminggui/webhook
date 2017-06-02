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
