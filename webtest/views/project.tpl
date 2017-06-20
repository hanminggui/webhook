<html lang="en">

{{template "components/head.tpl" .}}

<body>
      <div class="container">

          {{template "components/title.tpl" .}}

          <ul class="nav nav-pills" role="tablist">
              <li role="presentation" class="active"><a href="#">基本信息</a></li>
              <li role="presentation"><a href="#">环境 <span class="badge">3</span></a></li>
              <li role="presentation"><a href="#">用例 <span class="badge">618</span></a></li>
          </ul>
          <br>


          <div class="panel panel-default">
              <!-- Default panel contents -->
              <div class="panel-heading">版本控制</div>
cd
              <div class="panel-body">
                  <div class="input-group">
                      <span class="input-group-addon" id="basic-addon3">http格式</span>
                      <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                      <span class="input-group-addon" id="basic-addon4">git地址</span>
                      <button type="button" class="btn btn-primary" style="float: right">更新</button>
                  </div>
              </div>

              <!-- List group -->
              <ul class="list-group">
                  <li class="list-group-item">master  <span class="label label-danger">生产环境</span> </li>
                  <li class="list-group-item">v0.16 <span class="label label-warning">测试环境</span> <span class="label label-info">开发环境</span></li>
                  <li class="list-group-item">v0.16.1</li>
                  <li class="list-group-item">v0.16.2</li>
                  <li class="list-group-item">v0.17</li>
                  <li class="list-group-item">v0.17.1</li>
                  <li class="list-group-item">v0.17.2</li>
              </ul>
          </div>



      </div>

</body>
</html>