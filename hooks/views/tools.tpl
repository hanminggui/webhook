<html lang="en">

{{template "components/head.tpl" .}}

<body>

  <div class="container">
    {{template "components/title.tpl" .}}

    <form action="/tools" method="post" id="push">
      sql驱动
      <input type="text" class="form-control" placeholder="sql驱动" name="driver" value={{.driver}}>
      <br>
      sql连接URL
      <input type="text" class="form-control" placeholder="sql连接URL" name="conn" value={{.conn}}>
      <br>
      sql新表名
      <input type="text" class="form-control" placeholder="sql新表名" name="newtable" value={{.newtable}}>
      <br>
      sql旧表明
      <input type="text" class="form-control" placeholder="sql旧表明" name="oldtable" value={{.oldtable}}>
      <br>
      一个文件里存放log数量
      <input type="text" class="form-control" placeholder="一个文件里存放log数量" name="length" value={{.length}}>
      <br>
      <input type="submit" class="btn btn-success"  value="开始" onclick="editKeys('push', 'load')">
    </form>

    <div id="load" style="display:none;">
      <h1>正在写入数据 请勿刷新页面</h1>
      <img src="./../static/img/timg.gif">
    </div>



  </div>

<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>