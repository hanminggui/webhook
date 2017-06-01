<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <script type="text/javascript" src="../static/js/test.js"></script>
  <title>Bootstrap Template Page for Go Web Programming</title>

  <!-- Bootstrap core CSS -->
  <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container">
  <div class="page-header">
    <h1>WebHook <small>配置钥匙</small></h1>
  </div>
  <ul class="nav nav-pills">
    <li role="presentation" ><a href="/">首页</a></li>
    <li role="presentation"><a href="/publish">发布</a></li>
    <li role="presentation " class="active"><a href="#">配置</a></li>
    <li role="presentation"><a href="/images">环境</a></li>
  </ul>
  <br>
  
  <form id="form" action="/keys" method="post">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">git push 时如果commit的备注包含以下内容 则会触发自动部署</h3>
      </div>
      <div class="panel-body">
        <div id="code" style="display:block;" >
          <pre>{{.pushKey}}</pre>
          <button type="button" class="btn btn-info" onclick="editKeys('code', 'from')">修改</button>
        </div>
        <div id="from" style="display:none;" >
          <input type="text" class="form-control" placeholder="Text input" name="pushKey" value={{.pushKey}}>
          <br>
          <input type="submit"  class="btn btn-success" value="提交" >
        </div>
      </div>
    </div>
    
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">存放git项目的根目录</h3>
      </div>
      <div class="panel-body">
        <div id="code2" style="display:block;" >
          <pre>{{.gitHome}}</pre>
          <button type="button" class="btn btn-info" onclick="editKeys('code2','from2')">修改</button>
        </div>
        <div id="from2" style="display:none;" >
          <input type="text" class="form-control" placeholder="Text input" name="gitHome" value={{.gitHome}}>
          <br>
          <input type="submit" class="btn btn-success" value="提交" >
        </div>
      </div>
    </div>
</form>


<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>