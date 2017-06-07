<html lang="en" xmlns:v-bind="http://www.w3.org/1999/xhtml">
{{template "components/head.tpl" .}}

<body>

<!--begin-->
  <div class="container">
    {{template "components/title.tpl" .}}

    <!--表单-->
    <form method="post" action="/images" onsubmit="return submitFormToJson();">

      <!--已存在的项目-->
      {{range $key, $val := .publish.PublishSetings}}
      <div class="jumbotron" id="project-{{$key}}">

        <!--项目名称-->
        <h1>
          <div id="project-name-{{$key}}">
            {{$val.Name}}
            <button type="button" class="btn btn-info" onclick="editKeys('project-name-{{$key}}', 'edit-project-name-{{$key}}')">修改</button>
          </div>
          <div id="edit-project-name-{{$key}}" style="display:none;" >
            <input id="edit-project-name-input-{{$key}}" type="text" class="form-control" placeholder="项目名称" name="Name" value={{$val.Name}}>
            <br>
            <input type="submit"  class="btn btn-success" value="提交" >
            <button type="button" class="btn btn-info" onclick="editKeys('edit-project-name-{{$key}}', 'project-name-{{$key}}')">取消</button>
          </div>
        </h1>

        <!--git Url-->
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">git Url</h3>
          </div>
          <div class="panel-body">
            <div id="url-{{$key}}" style="display:block;" >
              <pre>{{$val.Url}}</pre>
              <button type="button" class="btn btn-info" onclick="editKeys('url-{{$key}}', 'edit-url-{{$key}}')">修改</button>
            </div>
            <div id="edit-url-{{$key}}" style="display:none;" >
              <input type="text" id="edit-url-input-{{$key}}" class="form-control" placeholder="构建时需要执行的shell" name="Url" value={{$val.Url}}>
              <br>
              <input type="submit"  class="btn btn-success" value="提交" >
              <button type="button" class="btn btn-info" onclick="editKeys('edit-url-{{$key}}', 'url-{{$key}}')">取消</button>
            </div>
          </div>
        </div>

        <!--build命令-->
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">构建时需要执行的shell</h3>
          </div>
          <div class="panel-body">
            <div id="shell-{{$key}}" style="display:block;" >
              <pre>{{$val.BuildShell}}</pre>
              <button type="button" class="btn btn-info" onclick="editKeys('shell-{{$key}}', 'edit-shell-{{$key}}')">修改</button>
            </div>
            <div id="edit-shell-{{$key}}" style="display:none;" >
              <input type="text" id="edit-shell-input-{{$key}}" class="form-control" placeholder="构建时需要执行的shell" name="BuildShell" value={{$val.BuildShell}}>
              <br>
              <input type="submit"  class="btn btn-success" value="提交" >
              <button type="button" class="btn btn-info" onclick="editKeys('edit-shell-{{$key}}', 'shell-{{$key}}')">取消</button>
            </div>
          </div>
        </div>

        <!--环境-->
        <div id="image-{{$key}}" class="panel panel-primary">
          <!-- Default panel contents -->
          <div class="panel-heading">环境</div>
          <!-- Table -->
            <table class="table">
              <tr>
                <th>#</th>
                <th>环境名称</th>
                <th>项目分支</th>
                <th>工作目录</th>
                <th><button type="button" class="btn btn-info" onclick="editKeys('image-new-button-{{$key}}', 'image-new-{{$key}}');editDisabled('image-new-{{$key}}', false)" id="image-new-button-{{$key}}">新增</button></th>
              </tr>
              <tbody>
              {{range $key_image, $val_image := $val.Images}}
              <tr id="image-{{$key}}-{{$key_image}}">
                <th>{{$key_image}}</th>
                <td>{{$val_image.ImageName}}</td>
                <td>{{$val_image.Branch}}</td>
                <td>{{$val_image.BuildTo}}</td>
                <td><button type="button" class="btn btn-info" onclick="editKeys('image-{{$key}}-{{$key_image}}', 'edit-image-{{$key}}-{{$key_image}}')">修改</button></td>
              </tr>
              <tr id="edit-image-{{$key}}-{{$key_image}}" class="edit-image" name="edit-image" style="display:none;">
                <th>{{$key_image}}</th>
                <td><input type="text" id="edit-image-ImageName-{{$key}}-{{$key_image}}" class="form-control" placeholder="环境名称" name="ImageName" value={{$val_image.ImageName}}></td>
                <td><input type="text" id="edit-image-Branch-{{$key}}-{{$key_image}}" class="form-control" placeholder="项目分支" name="Branch" value={{$val_image.Branch}}></td>
                <td><input type="text" id="edit-image-BuildTo-{{$key}}-{{$key_image}}" class="form-control" placeholder="工作目录" name="BuildTo" value={{$val_image.BuildTo}}></td>
                <td><input type="submit"  class="btn btn-success" value="提交" ></td>
                <td><button type="button" class="btn btn-info" onclick="editKeys('edit-image-{{$key}}-{{$key_image}}', 'image-{{$key}}-{{$key_image}}')">取消</button></td>
              </tr>
              {{end}}
              <tr id="image-new-{{$key}}" name="edit-image" style="display:none;">
                <th>#</th>
                <td><input type="text" id="edit-image-ImageName-{{$key}}-new" class="form-control" placeholder="环境名称" name="ImageName" value='' disabled="true"></td>
                <td><input type="text" id="edit-image-Branch-{{$key}}-new" class="form-control" placeholder="项目分支" name="Branch" value='' disabled="true"></td>
                <td><input type="text" id="edit-image-BuildTo-{{$key}}-new" class="form-control" placeholder="工作目录" name="BuildTo" value='' disabled="true"></td>
                <td><input type="submit"  class="btn btn-success" value="提交" ></td>
                <td><button type="button" class="btn btn-info" onclick="editKeys('image-new-{{$key}}', 'image-new-button-{{$key}}');editDisabled('image-new-{{$key}}', true)">取消</button></td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      {{end}}


      <!--新建项目-->
      <div class="jumbotron">
        <div style="text-align: center;" id="newProject">
          <h1 style="margin: auto;"  onclick="editKeys('newProject','project-new');editDisabled('project-new', false)">new</h1>
        </div>

        <div id="project-new" style="display:none;">
          <h1>
            <div id="project-name-new">
              <input type="text" id="project-name-input-new" class="form-control" placeholder="项目名称" name="Name" disabled="true">
            </div>
          </h1>

          <!--git Url-->
          <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">git Url</h3>
            </div>
            <div class="panel-body">
              <div id="edit-url-new">
                <input type="text" id="edit-url-input-new" class="form-control" placeholder="git url" name="Url">
              </div>
            </div>
          </div>

          <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">构建时需要执行的shell</h3>
            </div>
            <div class="panel-body">
              <div id="shell-new">
                <input type="text" id="shell-input-new" class="form-control" placeholder="构建时需要执行的shell" name="BuildShell"  disabled="true">
              </div>
            </div>
          </div>
          <div class="panel panel-primary">
            <!-- Default panel contents -->
            <div class="panel-heading">环境</div>
            <!-- Table -->
            <table class="table">
              <tr>
                <th>#</th>
                <th>环境名称</th>
                <th>项目分支</th>
                <th>工作目录</th>
                <th><button type="button" class="btn btn-info" onclick="editKeys('image-new-button-new', 'image-new');editDisabled('image-new', false)" id="image-new-button-new">新增</button></th>
              </tr>
              <tbody>
              <tr id="image-new" style="display:none;">
                <th>#</th>
                <td><input type="text" id="edit-image-ImageName-new" class="form-control" placeholder="环境名称" name="ImageName" value='' disabled="true"></td>
                <td><input type="text" id="edit-image-Branch-new" class="form-control" placeholder="项目分支" name="Branch" value='' disabled="true"></td>
                <td><input type="text" id="edit-image-BuildTo-new" class="form-control" placeholder="工作目录" name="BuildTo" value='' disabled="true"></td>
                <td><button type="button" class="btn btn-info" onclick="editKeys('image-new', 'image-new-button-new');editDisabled('image-new', true)">取消</button></td>
              </tr>
              </tbody>
            </table>
          </div>
          <div style="text-align: center;">
            <input type="submit"  class="btn btn-success" value="提交" style="margin: auto;" >
            <button type="button" class="btn btn-info" onclick="editKeys('project-new','newProject');editDisabled('project-new', true)">取消</button>
          </div>
        </div>
      </div>
    </form>

  </div>

<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>