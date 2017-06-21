<html lang="en">

{{template "components/head.tpl" .}}

<body>
      <div class="container">

          {{template "components/title.tpl" .}}

          <ul class="nav nav-pills" role="tablist">
              <li role="presentation" id="title-jbxx" class="active title" onclick="checkLable(this)"><a href="#">基本信息</a></li>
              <li role="presentation" id="title-hg" class="title" onclick="checkLable(this)"><a href="#">环境 <span class="badge">3</span></a></li>
              <li role="presentation" id="title-yl" class="title" onclick="checkLable(this)"><a href="#">用例 <span class="badge">618</span></a></li>
          </ul>

          <br>

          <div class="content" id="content-jbxx">
              <div class="panel panel-primary">
                  <!-- Default panel contents -->
                  <div class="panel-heading">版本控制</div>
                  <div class="panel-body">
                      <div class="input-group">
                          <span class="input-group-addon" id="basic-addon3">http格式</span>
                          <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                          <span class="input-group-addon" id="basic-addon4">git地址</span>
                          <button type="button" class="btn btn-primary" style="float: right">更新</button>
                      </div>
                  </div>

                  <!-- List group -->
                  <ul class="list-group table-hover">
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

          <div class="content hide" id="content-hg">


              <div class="row">
                  <div class="col-sm-6 col-md-4">
                      <div class="thumbnail">
                          <img src="../static/img/timg.jpg" alt="...">
                          <div class="caption">
                              <h3>开发环境</h3>
                              <p>想嘻嘻嘻行行行寻寻</p>
                              <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                          </div>
                      </div>
                  </div>
                  <div class="col-sm-6 col-md-4">
                      <div class="thumbnail">
                          <img src="../static/img/timg.jpg" alt="...">
                          <div class="caption">
                              <h3>测试环境</h3>
                              <p>想嘻嘻嘻行行行寻寻</p>
                              <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                          </div>
                      </div>
                  </div>
                  <div class="col-sm-6 col-md-4">
                      <div class="thumbnail">
                          <img src="../static/img/timg.jpg" alt="...">
                          <div class="caption">
                              <h3>生产环境</h3>
                              <p>想嘻嘻嘻行行行寻寻</p>
                              <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                          </div>
                      </div>
                  </div>
              </div>


              <div class="panel panel-primary">
                  <!-- Default panel contents -->
                  <div class="panel-heading">环境变量</div>

                  <!-- Table -->
                  <table class="table table-hover">
                      <tr>
                          <th>#</th>
                          <th>变量名</th>
                          <th>开发环境</th>
                          <th>测试环境</th>
                          <th>生产环境</th>
                      </tr>
                      <tr>
                          <td>删除</td>
                          <td>&token</td>
                          <td>token1</td>
                          <td>token2</td>
                          <td>token3</td>
                          <td>编辑</td>
                      </tr>
                  </table>
              </div>

          </div>

          <div class="content hide" id="content-yl">

              用例
          </div>


      </div>

</body>
</html>