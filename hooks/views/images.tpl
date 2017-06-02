<html lang="en" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Bootstrap Template Page for Go Web Programming</title>
  <script type="text/javascript" src="../static/js/test.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<!--头部-->
<div class="container">
  <div class="page-header">
    <h1>WebHook <small>首页</small></h1>
  </div>
  <ul class="nav nav-pills">
    <li role="presentation"><a href="/">首页</a></li>
    <li role="presentation"><a href="#">发布</a></li>
    <li role="presentation"><a href="/keys">配置</a></li>
    <li role="presentation" class="active" ><a href="/images">环境</a></li>
  </ul>
  <br>

  <!--表单-->
  <form method="get" action="/">

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
          <input type="text" class="form-control" placeholder="项目名称" name="Name-{{$key}}" value={{$val.Name}}>
          <br>
          <input type="submit"  class="btn btn-success" value="提交" >
          <button type="button" class="btn btn-info" onclick="editKeys('edit-project-name-{{$key}}', 'project-name-{{$key}}')">取消</button>
        </div>
      </h1>

      <!--build命令-->
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">构建时需要执行的shell</h3>
        </div>
        <div class="panel-body">
          <div id="code-{{$key}}" style="display:block;" >
            <pre>{{$val.BuildShell}}</pre>
            <button type="button" class="btn btn-info" onclick="editKeys('code-{{$key}}', 'from-{{$key}}')">修改</button>
          </div>
          <div id="from-{{$key}}" style="display:none;" >
            <input type="text" class="form-control" placeholder="构建时需要执行的shell" name="BuildShell-{{$key}}" value={{$val.BuildShell}}>
            <br>
            <input type="submit"  class="btn btn-success" value="提交" >
            <button type="button" class="btn btn-info" onclick="editKeys('from-{{$key}}', 'code-{{$key}}')">取消</button>
          </div>
        </div>
      </div>

      <!--环境-->
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
          <tr id="edit-image-{{$key}}-{{$key_image}}" style="display:none;">
            <th>{{$key_image}}</th>
            <td><input type="text" class="form-control" placeholder="环境名称" name="ImageName-{{$key}}-{{$key_image}}" value={{$val_image.ImageName}}></td>
            <td><input type="text" class="form-control" placeholder="项目分支" name="Branch-{{$key}}-{{$key_image}}" value={{$val_image.Branch}}></td>
            <td><input type="text" class="form-control" placeholder="工作目录" name="BuildTo-{{$key}}-{{$key_image}}" value={{$val_image.BuildTo}}></td>
            <td><input type="submit"  class="btn btn-success" value="提交" ></td>
            <td><button type="button" class="btn btn-info" onclick="editKeys('edit-image-{{$key}}-{{$key_image}}', 'image-{{$key}}-{{$key_image}}')">取消</button></td>
          </tr>
          {{end}}
          <tr id="image-new-{{$key}}" style="display:none;">
            <th>#</th>
            <td><input type="text" class="form-control" placeholder="环境名称" name="ImageName-new-{{$key}}" value='' disabled="true"></td>
            <td><input type="text" class="form-control" placeholder="项目分支" name="Branch-new-{{$key}}" value='' disabled="true"></td>
            <td><input type="text" class="form-control" placeholder="工作目录" name="BuildTo-new-{{$key}}" value='' disabled="true"></td>
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
            <input type="text" class="form-control" placeholder="项目名称" name="Name-new">
          </div>
        </h1>
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">构建时需要执行的shell</h3>
          </div>
          <div class="panel-body">
            <div id="from-new">
              <input type="text" class="form-control" placeholder="构建时需要执行的shell" name="BuildShell-new">
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
              <td><input type="text" class="form-control" placeholder="环境名称" name="ImageName-new" value='' disabled="true"></td>
              <td><input type="text" class="form-control" placeholder="项目分支" name="Branch-new" value='' disabled="true"></td>
              <td><input type="text" class="form-control" placeholder="工作目录" name="BuildTo-new" value='' disabled="true"></td>
              <td><button type="button" class="btn btn-info" onclick="editKeys('image-new', 'image-new-button-new');editDisabled('image-new', true)">取消</button></td>
            </tr>
            </tbody>
          </table>
        </div>
        <div style="text-align: center;">
          <input type="submit"  class="btn btn-success" value="提交" style="margin: auto;">
          <button type="button" class="btn btn-info" onclick="editKeys('project-new','newProject');editDisabled('project-new', true)">取消</button>
        </div>
      </div>
    </div>

  </form>

</div>

<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>