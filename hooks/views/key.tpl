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
  </ul>
  <br>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h3 class="panel-title">git push 时如果commit的备注包含以下内容 则会触发自动部署</h3>

    </div>
    <div class="panel-body">
      <div id="code" style="display:block;" >
        <pre>{{.pushKey}}</pre>
        <button type="button" class="btn btn-info" onclick="editKeys()">修改</button>
      </div>


      <form id="form" style="display:none;" action="/keys" method="post">
        <input type="text" class="form-control" placeholder="Text input" name="pushKey" value={{.pushKey}}>
        <br>
        <input type="submit"  class="btn btn-success" value="提交" >
      </form>
    </div>
  </div>


</div>

<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>