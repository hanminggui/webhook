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
                      <div class="btn-right">
                          <button type="button" class="btn btn-warning btn-xs edit-image new" data-toggle="modal" data-target="#image">新增环境</button>
                          <button type="button" class="btn btn-warning btn-xs edit-bl new" data-toggle="modal" data-target="#bl">新增变量</button>
                      </div>

                  </div>
                  <div class="panel-body">
                      <div class="row" id="imageList">

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
                                          <button type="button" class="btn btn-primary edit-image edit" data-toggle="modal" data-target="#image">编辑</button>
                                          <button type="button" class="btn btn-info" role="button">详情</button>
                                          <button type="button" class="btn btn-warning edit-image copy" data-toggle="modal" data-target="#image">复制</button>
                                          <button type="button" class="btn btn-danger remove-image" role="button">删除</button>
                                      </p>
                                  </div>

                                  <button type="button" class="btn btn-default btn-lg btn-block show-bl">显示变量</button>

                                  <!--变量-->
                                  <div class="hide" id="blList-{{$image.Id}}">
                                      <br>
                                      {{range $index, $variable := $.variables}}
                                      {{if eq $variable.ImageId $image.Id}}
                                      <div class="panel panel-success bls" id="bl-{{$variable.Id}}">
                                          <div class="panel-heading">
                                              <h3 class="panel-title">
                                                  <span>{{$variable.Name}}</span>

                                                  <div class="btn-right">
                                                      <button type="button" class="btn btn-primary btn-xs edit-bl edit" data-toggle="modal" data-target="#bl">编辑</button>
                                                      <button type="button" class="btn btn-warning btn-xs edit-bl copy" data-toggle="modal" data-target="#bl">复制</button>
                                                      <button type="button" class="btn btn-danger btn-xs remove-bl">删除</button>
                                                  </div>
                                              </h3>
                                          </div>
                                          <div class="panel-body">
                                              <span>{{$variable.Value}}</span>
                                          </div>
                                      </div>
                                      {{end}}
                                      {{end}}
                                  </div>
                              </div>
                          </div>
                          {{end}}
                      </div>
                  </div>
              </div>
          </div>

          <div class="content hide" id="content-yl">

              <div class="left3">
                  <div class="left99">
                      <button type="button" class="btn btn-info">新增版本</button>
                      <button type="button" class="btn btn-info">管理</button>
                      <br><br>
                      <a href="#" class="list-group-item cases">
                          <div class="title">
                              <span>1.1</span>
                              <span class="badge">3</span>
                          </div>
                      </a>
                      <div class="content hide">
                          <button type="button" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;监控注册登录流程</button>
                          <button type="button" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;监控商城</button>
                          <button type="button" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;监控社区</button>
                      </div>
    
                      <a href="#" class="list-group-item cases">
                          <div class="title">
                              <span>1.1</span>
                              <span class="badge">3</span>
                          </div>
                      </a>
                      <div class="content hide">
                          <button type="button" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;监控注册登录流程</button>
                          <button type="button" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;监控商城</button>
                          <button type="button" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;监控社区</button>
                      </div>

                  </div>
              </div>
              
              <div class="right7">
                  <div>
                      <label>切换风格：</label>
                      <button type="button" class="switch-style btn btn-default" tcalss="panel panel-default step-title">灰白色</button>
                      <button type="button" class="switch-style btn btn-primary" tcalss="panel panel-primary step-title">深蓝色</button>
                      <button type="button" class="switch-style btn btn-success" tcalss="panel panel-success step-title">浅绿色</button>
                      <button type="button" class="switch-style btn btn-info" tcalss="panel panel-info step-title">浅蓝色</button>
                      <button type="button" class="switch-style btn btn-warning" tcalss="panel panel-warning step-title">橙黄色</button>
                      <button type="button" class="switch-style btn btn-danger" tcalss="panel panel-danger step-title">血红色</button>
                  </div>
                  <br>
                  <div class="panel panel-danger step-title">
                      <div class="panel-heading">
                          <h3 class="panel-title">STEP 1</h3>
                      </div>
                      <div class="panel-body">
                          <!--<span class="label label-default">Default</span>-->
                          <span class="label label-primary action">调用登录接口</span>
                          <span class="label label-success action">验证登录接口返回结果</span>
                          <span class="label label-info action">保存一个变量</span>
                          <span class="label label-warning action">运行代码块</span>
                          <!--<span class="label label-danger">Danger</span>-->
                      </div>
                  </div>
    
                  <div class="panel panel-warning step-title">
                      <div class="panel-heading">
                          <h3 class="panel-title">step 2</h3>
                      </div>
                      <div class="panel-body">
                          <span class="label label-default action">Default</span>
                          <span class="label label-primary action">Primary</span>
                          <span class="label label-success action">Success</span>
                          <span class="label label-info action">Info</span>
                          <span class="label label-warning action">Warning</span>
                          <span class="label label-danger action">Danger</span>
                      </div>
                  </div>
    
                  <div class="panel panel-info step-title">
                      <div class="panel-heading">
                          <h3 class="panel-title">step 3</h3>
                      </div>
                      <div class="panel-body">
                          <span class="label label-default action">Default</span>
                          <span class="label label-primary action">Primary</span>
                          <span class="label label-success action">Success</span>
                          <span class="label label-info action">Info</span>
                          <span class="label label-warning action">Warning</span>
                          <span class="label label-danger action">Danger</span>
                      </div>
                  </div>
    
                  <div class="panel panel-success step-title">
                      <div class="panel-heading">
                          <h3 class="panel-title">step 4</h3>
                      </div>
                      <div class="panel-body">
                          <span class="label label-default action">Default</span>
                          <span class="label label-primary action">Primary</span>
                          <span class="label label-success action">Success</span>
                          <span class="label label-info action">Info</span>
                          <span class="label label-warning action">Warning</span>
                          <span class="label label-danger action">Danger</span>
                      </div>
                  </div>
    
    
                  <div class="panel panel-primary step-title">
                      <div class="panel-heading">
                          <h3 class="panel-title">step 5</h3>
                      </div>
                      <div class="panel-body">
                          <span class="label label-default action">Default</span>
                          <span class="label label-primary action">Primary</span>
                          <span class="label label-success action">Success</span>
                          <span class="label label-info action">Info</span>
                          <span class="label label-warning action">Warning</span>
                          <span class="label label-danger action">Danger</span>
                      </div>
                  </div>
    
                  <div class="panel panel-default step-title">
                      <div class="panel-heading">
                          <h3 class="panel-title">step 5</h3>
                      </div>
                      <div class="panel-body">
                          <span class="label label-default action">Default</span>
                          <span class="label label-primary action">Primary</span>
                          <span class="label label-success action">Success</span>
                          <span class="label label-info action">Info</span>
                          <span class="label label-warning action">Warning</span>
                          <span class="label label-danger action" draggable="true">Danger</span>
                      </div>
                  </div>
                  
                  <ul class="list-group">
                      <li class="list-group-item well step">
                          <label>请求类型</label>
                          <select class="request-type">
                              <option value="GET">GET</option>
                              <option value="POST">POST</option>
                          </select>
                          <label>请求数据类型</label>
                          <select class="date-type">
                              <option value="X-WWW-FORM-URLENCODED">X-WWW-FORM-URLENCODED</option>
                              <option value="JSON">JSON</option>
                          </select>
                          <label>预期响应状态码:</label>
                          <input value="" placeholder="200" class="code-innput">
                          <input type="text" placeholder="URL" class="url-innput form-control">
                          <label>参数</label>
                          <textarea class="form-control" placeholder="参数" rows="2"></textarea>
                      </li>
                      
                      <li class="list-group-item well step">
                          <label>验证</label>
                          <select class="request-type">
                              <option value="POST">返回结果</option>
                              <option value="POST">返回头</option>
                          </select>
                          <label>的</label>
                          <input value="" placeholder="KEY" class="url-innput">
                          <label>字段</label>
                          <select class="date-type">
                              <option value="contain">包含</option>
                              <option value="equal">等于</option>
                              <option value="greater">大于</option>
                              <option value="less">小于</option>
                          </select>
                          <label>预期结果</label>
                          <textarea class="form-control" placeholder="预期结果" rows="2"></textarea>
                      </li>
                      
                      <li class="list-group-item well step">
                          <span>保存一个变量KEY=</span>
                          <input value="" placeholder="KEY" class="key-innput">
                          <span>VALUE=</span>
                          <select class="date-type">
                              <option value="custom">文本</option>
                              <option value="json">返回json里的</option>
                              <option value="variablejj">变量运算</option>
                          </select>
                          <input value="" placeholder="VALUE" class="value-innput">
                      </li>
                  </ul>
                  
              </div>
              <!--<button onclick="toastr.success('注册成功!');">success</button>-->
              <!--<button onclick="toastr.error('报错了');">error</button>-->
              <!--<button onclick="toastr.info('一般信息');">info</button>-->
              <!--<button onclick="toastr.warning('警告');">warning</button>-->
          </div>

      </div>

      <!--环境模板-->
      <div class="col-sm-6 col-md-4 hide" id="imageTem">
          <div class="thumbnail">
              <img src="../static/img/timg.jpg" alt="...">
              <div class="caption">
                  <span class="label label-info btn-right image-branch"></span>
                  <h3 class="imageName"></h3>
                  <pre class="imageDiscrip"></pre>
                  <p>
                      <button type="button" class="btn btn-success">运行</button>
                      <button type="button" class="btn btn-primary edit-image edit" data-toggle="modal" data-target="#image">编辑</button>
                      <button type="button" class="btn btn-info" role="button">详情</button>
                      <button type="button" class="btn btn-warning edit-image copy" data-toggle="modal" data-target="#image">复制</button>
                      <button type="button" class="btn btn-danger remove-image" role="button">删除</button>
                  </p>
              </div>
              <button type="button" class="btn btn-default btn-lg btn-block show-bl">显示变量</button>

              <!--变量-->
              <div class="hide" id="blList-new">
                  <br>
              </div>
          </div>
      </div>

      <!--变量模板-->
      <div class="panel panel-success bls hide" id="blTem">
          <div class="panel-heading">
              <h3 class="panel-title">
                  <span></span>
                  <div class="btn-right">
                      <button type="button" class="btn btn-primary btn-xs edit-bl edit" data-toggle="modal" data-target="#bl">编辑</button>
                      <button type="button" class="btn btn-warning btn-xs edit-bl copy" data-toggle="modal" data-target="#bl">复制</button>
                      <button type="button" class="btn btn-danger btn-xs remove-bl">删除</button>
                  </div>
              </h3>
          </div>
          <div class="panel-body">
              <span></span>
          </div>
      </div>

      <!--<div id="mark-info" class="hide">-->
          <!--aaaaaaa-->
      <!--</div>-->
      
      <div class="container" id="mark-info">
          <h1>Guided tour tooltip</h1>
          <span class="close"></span>
          <div class="slider-container">
              <div class="slider-turn">
                  <p>Guided tour tooltip inspired by Jonathan Moreira</p>
                  <p>
                      Dribbble shot visible at
                      <a href="#" target="_blank" title="Dribbble shot">this link</a>
                  </p>
                  <p>Codepen by Yoann Helin</p>
                  <p>
                      <a href="#" target="_blank" title="Twitter">Twitter : @YoannHELIN</a>
                      <br>
                      <a href="#" target="_blank" title="Book">Book : Yoannhelin.fr</a>
                  </p>
                  <p>Thank you !</p>
              </div>
          </div>
          <div class="bottom">
              <div class="step">
                  <span>Step 1</span>
                  <ul>
                      <li data-num="1" class="active"></li>
                      <li data-num="2"></li>
                      <li data-num="3"></li>
                      <li data-num="4"></li>
                      <li data-num="5"></li>
                  </ul>
              </div>
              <button class="btn">Next</button>
          </div>
      </div>

<script>

    $(".action").hover(function(){
        var tip = $("#mark-info");
        $("#mark-info").removeClass("hide")
    },function(){
        $("#mark-info").addClass("hide")
    })

    <!--切换风格-->
    $(function () {
        $(".switch-style").on("click", function () {
            $(".step-title").attr("class", $(this).attr("tcalss"));
        })
    })

    <!--展开/收起版本用例列表-->
    $(function () {
        $(".cases").on("click", function () {
            var cases = $(this).next(".content");
            if(cases.hasClass("hide")){
                $(this).addClass("active");
                cases.removeClass("hide");
            }else {
                $(this).removeClass("active");
                cases.addClass("hide");
            }
        })
    });

    $(function () {
        $(".version").on("click", function () {
            var cases = $(this).find(".cases");
            if(cases.hasClass("hide")){
                cases.removeClass("hide");
            }else {
                cases.addClass("hide");
            }
        })
    });

    <!--监听新增和编辑环境按钮点击事件-->
    $(function () {
        $(".edit-image").on("click", function () {
            if($(this).hasClass("edit")){
                var colIdI = $(this).closest(".col-md-4").attr("id").split("-")[1];
            }else {
                var colIdI = -1;
            }

            $("#imageid").attr("number", colIdI);
            $("#imageName").val($(this).parent("p").siblings(".imageName").text());
            $("#check-branch").val($(this).parent("p").siblings(".image-branch").text());
            $("#imageDiscrip").val($(this).parent("p").siblings(".imageDiscrip").text());
        })
    });
    <!--监听新增、修改环境保存按钮点击事件-->
    $(function () {
        $("#saveImage").on("click", function () {
            var imageId = $("#imageid").attr("number");
            if(imageId == -1){
                var imageId = 4;
                var image = $("#imageTem").clone(true);
                image.attr("id", "image-" + imageId);//id从接口中返回
                image.attr("class", "col-sm-6 col-md-4");
                image.find("#blList-new").attr("id", "blList-" + imageId);
                $("#imageList").append(image);
                $("#check-image").append('<option id="check-image-'+imageId +'" >'+$("#imageName").val()+'</option>');
            }else {
                var image = $("#image-" + $("#imageid").attr("number"));
                $("#check-image-" + imageId).html($("#imageName").val());
            }
            image.find(".image-branch").html($("#check-branch").val());
            image.find(".imageName").html($("#imageName").val());
            image.find(".imageDiscrip").html($("#imageDiscrip").val());
            $("#image").modal('hide');
            toastr.success("保存成功");
        })
    });
    <!--监听删除环境按钮点击事件-->
    $(function () {
        $(".remove-image").on("click", function () {
            $(this).closest(".col-md-4").remove();
        })
    });
    <!--监听显示变量按钮点击事件-->
    $(function () {
        $(".show-bl").on("click", function () {
            var bls = $(this).next();
            if(bls.hasClass("hide")){
                bls.removeClass("hide");
            }else{
                bls.addClass("hide");
            }
        })

    });
    <!--监听删除变量按钮点击事件-->
    $(function () {
        $(".remove-bl").on("click", function () {
            $(this).closest(".bls").remove();
        })
    });
    <!--监听新增和编辑变量按钮点击事件-->
    $(function () {
        $(".edit-bl").on("click", function () {
//            $("#image-id").attr("number", $(this).closest(".col-md-4").attr("id").split("-")[1]);
            if($(this).hasClass("edit")){
                var blId = $(this).closest(".bls").attr("id").split("-")[1];
            }else {
                var blId = -1;
            }

            $("#blid").attr("number", blId);
            $("#bl-key").val($(this).closest(".bls").find(".panel-title > span").text());
            $("#bl-value").val($(this).closest(".bls").find(".panel-body > span").text());
            $("#check-image").val($(this).closest(".col-md-4").find(".imageName").text());
        })
    });
    <!--监听新增、修改变量保存按钮点击事件-->
    $(function () {
        $("#saveBl").on("click", function () {
            var imageId =  $("#check-image").find("option:selected").attr("id").split("-")[2];
            var blId =  $("#blid").attr("number");
            if(blId == -1){
                var bl = $("#blTem").clone(true);
                bl.attr("id", "bl-7");//id从接口中返回
                bl.removeClass("hide");
                $("#blList-" + imageId).append(bl);
            }else {
                var bl = $("#bl-" + blId);
            }

            bl.find(".panel-title > span").text($("#bl-key").val());
            bl.find(".panel-body > span").text($("#bl-value").val());
            bl.find(".image-branch").html($("#check-image").val());

            $("#bl").modal('hide');
            toastr.success("保存成功");

        })
    });

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
          <span class="hide" id="blid" number="-1"></span>
          <span class="hide" id="image-id" number="-1"></span>

          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myblLabel">变量</h4>
                  </div>
                  <div class="modal-body">
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon">环境</span>
                          <select class="form-control" id="check-image">
                              <option>请选择环境</option>
                              {{range .images}}
                              <option id="check-image-{{.Id}}">{{.Name}}</option>
                              {{end}}
                          </select>
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span id="title-bl-name" class="input-group-addon">变量名</span>
                          <input type="text" id="bl-key" class="form-control" placeholder="Key" aria-describedby="sizing-addon1">
                      </div>
                      <br>
                      <div class="input-group input-group-lg">
                          <span class="input-group-addon" id="title-image-1">变量值</span>
                          <input id="bl-value" type="text" class="form-control" placeholder="Value" aria-describedby="sizing-addon1">
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="button" class="btn btn-primary" id="saveBl">保存</button>
                  </div>
              </div>
          </div>
      </div>

</body>
</html>