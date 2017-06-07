<html lang="en">

{{template "components/head.tpl" .}}

<body>

  <div class="container">
    {{template "components/title.tpl" .}}

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
            <button type="button" class="btn btn-info" onclick="editKeys('from','code')">取消</button>
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
            <button type="button" class="btn btn-info" onclick="editKeys('from2','code2')">取消</button>
          </div>
        </div>
      </div>
    </form>
  </div>

<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>