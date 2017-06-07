<!--头部-->
<div class="page-header">
    <h1>WebHook <small>{{.pageName}}</small></h1>
</div>
<ul class="nav nav-pills">
    <li role="presentation" {{if eq .pageName "首页"}}class="active"{{end}} ><a href="/">首页</a></li>
    <li role="presentation" {{if eq .pageName "发布"}}class="active"{{end}} ><a href="/publish">发布</a></li>
    <li role="presentation" {{if eq .pageName "配置"}}class="active"{{end}} ><a href="/keys">配置</a></li>
    <li role="presentation" {{if eq .pageName "环境"}}class="active"{{end}} ><a href="/images">环境</a></li>
    <li role="presentation" {{if eq .pageName "工具"}}class="active"{{end}} ><a href="/tools">工具</a></li>
</ul>
<br>