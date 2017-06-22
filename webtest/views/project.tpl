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

              <div class="panel panel-primary">
                  <div class="panel-heading">
                      环境
                      <button type="button" class="btn btn-warning btn-xs btn-right edit-image" data-toggle="modal" data-target="#image">
                          新增环境
                      </button>
                  </div>
                  <div class="panel-body">
                      <div class="row">
                          <div class="col-sm-6 col-md-4" id="image-1">
                              <div class="thumbnail">
                                  <img src="../static/img/timg.jpg" alt="...">
                                  <div class="caption">
                                      <h3 class="imageName">开发环境</h3>
                                      <pre class="imageDiscrip">想嘻嘻嘻行行行寻寻</pre>
                                      <p>
                                          <button type="button" class="btn btn-primary edit-image" data-toggle="modal" data-target="#image">
                                              编辑
                                          </button>
                                          <button type="button" class="btn btn-info" role="button">详情</button>
                                          <button type="button" class="btn btn-danger" role="button">删除</button>
                                      </p>
                                  </div>
                              </div>
                          </div>
                          <div class="col-sm-6 col-md-4" id="image-2">
                              <div class="thumbnail">
                                  <img src="../static/img/timg.jpg" alt="...">
                                  <div class="caption">
                                      <h3 class="imageName">开发环境</h3>
                                      <pre class="imageDiscrip">想嘻嘻嘻行行行寻寻</pre>
                                      <p>
                                          <button type="button" class="btn btn-primary edit-image" data-toggle="modal" data-target="#image">
                                              编辑
                                          </button>
                                          <button type="button" class="btn btn-info" role="button">详情</button>
                                          <button type="button" class="btn btn-danger" role="button">删除</button>
                                      </p>
                                  </div>
                              </div>
                          </div>
                          <div class="col-sm-6 col-md-4" id="image-3">
                              <div class="thumbnail">
                                  <img src="../static/img/timg.jpg" alt="...">
                                  <div class="caption">
                                      <h3 class="imageName">开发环境</h3>
                                      <pre class="imageDiscrip">想嘻嘻嘻行行行寻寻</pre>
                                      <p>
                                          <button type="button" class="btn btn-primary edit-image" data-toggle="modal" data-target="#image">
                                              编辑
                                          </button>
                                          <button type="button" class="btn btn-info" role="button">详情</button>
                                          <button type="button" class="btn btn-danger" role="button">删除</button>
                                      </p>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>



              <div class="panel panel-primary">
                  <!-- Default panel contents -->
                  <div class="panel-heading">
                      环境变量
                      <button type="button" class="btn btn-warning btn-xs btn-right" data-toggle="modal" data-target="#bl">
                          新增环境
                      </button>
                  </div>

                  <!-- Table -->
                  <table class="table table-hover">
                      <tr>
                          <th>变量名</th>
                          <th>开发环境</th>
                          <th>测试环境</th>
                          <th>生产环境</th>
                          <th>操</th>
                          <th>做</th>
                      </tr>
                      <tr>
                          <td>&token</td>
                          <td>token1</td>
                          <td>token2</td>
                          <td>token3</td>
                          <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bl">编辑</button></td>

                          <td><button type="button" class="btn btn-danger">删除</button></td>
                      </tr>
                  </table>
              </div>

          </div>

          <div class="content hide" id="content-yl">

              <button onclick="toastr.success('注册成功!');">success</button>
              <button onclick="toastr.error('报错了');">error</button>
              <button onclick="toastr.info('一般信息');">info</button>
              <button onclick="toastr.warning('警告');">warning</button>
              用例
          </div>


      </div>


<script>
    <!--监听新增和编辑环境按钮点击事件-->
    $(function () {
        $(".edit-image").on("click", function () {
            var colId =  $(this).closest(".col-md-4").attr("id");
            if(colId != null){
                var colIdI = colId.split("-")[1];
            }else {
                var colIdI = -1;
            }
            $("#imageid").attr("number", colIdI);
            $("#imageName").val($(this).parent("p").siblings(".imageName").text());
            $("#imageDiscrip").val($(this).parent("p").siblings(".imageDiscrip").text());
        })
    })
    <!--监听修改环境保存按钮点击事件-->
    $(function () {
        $("#saveImage").on("click", function () {
            var image = $("#image-" + $("#imageid").attr("number"));
            image.find(".imageName").html($("#imageName").val());
            image.find(".imageDiscrip").html($("#imageDiscrip").val());
            $("#image").modal('hide');
            toastr.success("保存成功");
        })
    })

</script>


      <!-- Modal -->
      <div class="modal fade bs-example-modal-sm" id="image" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <span class="hide" id="imageid" number="-1"></span>
          <div class="modal-dialog modal-sm" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myModalLabel">环境</h4>
                  </div>
                  <div class="modal-body">
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon" id="sizing-addon1">名称</span>
                          <input id="imageName" type="text" class="form-control" placeholder="环境名称" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <textarea id="imageDiscrip" class="form-control" placeholder="环境说明" rows="10"></textarea>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="button" class="btn btn-primary" id="saveImage">保存</button>
                  </div>
              </div>
          </div>
      </div>

      <!-- Modal -->
      <div class="modal fade" id="bl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myblLabel">环境</h4>
                  </div>
                  <div class="modal-body">
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon">变量名称</span>
                          <input type="text" class="form-control" placeholder="变量名称" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon">开发环境</span>
                          <input type="text" class="form-control" placeholder="开发环境" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon">测试环境</span>
                          <input type="text" class="form-control" placeholder="测试环境" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon">生产环境</span>
                          <input type="text" class="form-control" placeholder="生产环境" aria-describedby="sizing-addon1">
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="button" class="btn btn-primary">保存</button>
                  </div>
              </div>
          </div>
      </div>



</body>
</html>