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
                          <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" value="{{.project.Url}}">
                          <span class="input-group-addon" id="basic-addon4">git地址</span>
                          <button type="button" class="btn btn-primary" style="float: right">更新</button>
                      </div>
                  </div>
                  <br>
                  <!-- List group -->
                  <ul class="list-group table-hover">
                      {{range $key, $val := .branchs}}
                      <li class="list-group-item">
                          {{$val.Name}}
                          {{range $.images}}
                              {{if eq .BranchId $val.Id}}
                                <span class="label label-success">
                                    {{.Name}}
                                </span> &nbsp;
                              {{end}}
                          {{end}}
                      </li>
                      {{end}}
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

                          {{range $index, $image := .images}}
                          <div class="col-sm-6 col-md-4" id="image-{{$image.Id}}">
                              <div class="thumbnail">
                                  <img src="{{$image.RunImgUrl}}" alt="...">
                                  <div class="caption">
                                      {{range $index, $branch := $.branchs}}
                                      {{if eq $branch.Id $image.BranchId}}
                                      <span class="label label-info btn-right image-branch">{{$branch.Name}}</span>
                                      {{end}}
                                      {{end}}
                                      <h3 class="imageName">{{$image.Name}}</h3>
                                      <pre class="imageDiscrip">{{$image.Descrip}}</pre>
                                      <p>
                                          <button type="button" class="btn btn-success">运行</button>
                                          <button type="button" class="btn btn-primary edit-image" data-toggle="modal" data-target="#image">
                                              编辑
                                          </button>
                                          <button type="button" class="btn btn-info" role="button">详情</button>
                                          <button type="button" class="btn btn-danger" role="button">删除</button>
                                      </p>
                                  </div>
                              </div>
                          </div>
                          {{end}}
                      </div>
                  </div>
              </div>



              <div class="panel panel-primary">
                  <!-- Default panel contents -->
                  <div class="panel-heading">
                      环境变量
                      <button type="button" class="btn btn-warning btn-xs btn-right" data-toggle="modal" data-target="#bl">
                          新增变量
                      </button>
                  </div>

                  <!-- Table -->
                  <table class="table table-hover" id="bl-tab">
                      <tr id="bl-title">
                          <th id="bl-title-name">变量名</th>
                          {{range .images}}
                          <th id="bl-title-{{.Id}}">{{.Name}}</th>
                          {{end}}
                          <th>操</th>
                          <th>做</th>
                      </tr>
                      {{range .variables}}
                      <tr>

                      </tr>

                      {{end}}
                      <tr id="bl-1">
                          <td>&token</td>
                          <td>token1</td>
                          <td>token2</td>
                          <td>token3</td>
                          <td><button type="button" class="btn btn-primary edit-bl" data-toggle="modal" data-target="#bl">编辑</button></td>

                          <td><button type="button" class="btn btn-danger">删除</button></td>
                      </tr>
                      <tr id="bl-2">
                          <td>&token</td>
                          <td>token1</td>
                          <td>token2</td>
                          <td>token3</td>
                          <td><button type="button" class="btn btn-primary edit-bl" data-toggle="modal" data-target="#bl">编辑</button></td>
        
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
            $("#check-branch").val($(this).parent("p").siblings(".image-branch").text())
            $("#imageDiscrip").val($(this).parent("p").siblings(".imageDiscrip").text());
        })
    })
    <!--监听新增、修改环境保存按钮点击事件-->
    $(function () {
        $("#saveImage").on("click", function () {
            var image = $("#image-" + $("#imageid").attr("number"));
            image.find(".image-branch").html($("#check-branch").val());
            image.find(".imageName").html($("#imageName").val());
            image.find(".imageDiscrip").html($("#imageDiscrip").val());
            $("#image").modal('hide');
            toastr.success("保存成功");
        })
    })


    <!--监听新增和编辑环境按钮点击事件-->
    $(function () {
        $(".edit-bl").on("click", function () {
//            var titles = $("#bl-title").children()
            $("#title-bl-name").html($("#bl-title-name").text());
            $("#title-image-1").html($("#bl-title-1").text());
            $("#title-image-2").html($("#bl-title-2").text());
            $("#title-image-3").html($("#bl-title-3").text());
            
            var bls = $(this).parent().parent().children();
            $("#value-image-name").val(bls[0].val())
            $("#value-image-1").val(bls[1].val())
            $("#value-image-2").val(bls[2].val())
            $("#value-image-3").val(bls[3].val())
            
        })
    })
    <!--监听新增、修改环境保存按钮点击事件-->
    $(function () {
        $("#saveImageaa").on("click", function () {
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
                          <span class="input-group-addon">名称</span>
                          <input id="imageName" type="text" class="form-control" placeholder="环境名称" aria-describedby="sizing-addon1">
                      </div>

                      <br>

                      <div class="input-group input-group-lg">
                          <span class="input-group-addon">分支</span>
                          <select class="form-control" id="check-branch">
                              <option>请选择分支</option>
                              {{range .branchs}}
                              <option>{{.Name}}</option>
                              {{end}}
                          </select>
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
                          <span id="title-bl-name" class="input-group-addon">变量名称</span>
                          <input type="text" id="value-image-name" class="form-control" placeholder="变量名称" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon" id="title-image-1">开发环境</span>
                          <input id="value-image-1" type="text" class="form-control" placeholder="开发环境" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon" id="title-image-2">测试环境</span>
                          <input id="value-image-2" type="text" class="form-control" placeholder="测试环境" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon" id="title-image-3">生产环境</span>
                          <input id="value-image-3" type="text" class="form-control" placeholder="生产环境" aria-describedby="sizing-addon1">
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