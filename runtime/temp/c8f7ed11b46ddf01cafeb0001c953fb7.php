<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:56:"E:\webproject\mycms/application/index\view\tool\sms.html";i:1509607861;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509592605;}*/ ?>
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
  <title><?php echo $title; ?></title>  
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />  
  <script src="__ROOT__/public/plugins/jQuery/jquery.min.js"></script>  
  <link rel="stylesheet" href="__ROOT__/public/plugins/bootstrap/css/bootstrap.min.css" />  
  <link rel="stylesheet" href="__ROOT__/public/plugins/font-awesome/css/font-awesome.min.css" /> 
  <link rel="stylesheet" href="__ROOT__/public/plugins/treeTable/treeTable.css" />  
  <link rel="stylesheet" href="__ROOT__/public/dist/css/AdminLTE.min.css" /> 
  <link rel="stylesheet" href="__ROOT__/public/dist/css/skins/_all-skins.min.css" /> 
  <!--[if lt IE 9]>
  <script src="__ROOT__/public/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="__ROOT__/public/plugins/respond/respond.min.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="__ROOT__/public/static/css/base.css" /> 
   
<link rel="stylesheet" href="__ROOT__/public/static/css/user.css">    
 </head>
 <body class="hold-transition skin-blue sidebar-mini fixed">
  <div class="wrapper"> 
   <header class="main-header"> 
    <a href="__ROOT__" class="logo"> 
     <!-- mini logo for sidebar mini 50x50 pixels --> 
     <span class="logo-mini"><b>XTS</b></span> 
     <!-- logo for regular state and mobile devices --> 
     <span class="logo-lg"><b>系统室管理</b></span> </a> 
    <!-- Header Navbar: style can be found in header.less --> 
    <nav class="navbar navbar-static-top"> 
     <!-- Sidebar toggle button--> 
     <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">导航</span> </a> 
     <div class="navbar-custom-menu"> 
      <ul class="nav navbar-nav"> 
       <li class="dropdown user user-menu"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="hidden-xs"><?php echo $userinfo['user_name']; ?> </span><i class="fa fa-caret-down"></i> </a> 
        <ul class="dropdown-menu" style="width: 30px;overflow: hidden;"> 
         <li> <a href="<?php echo url('Setting/info'); ?>"><i class="fa fa-user"></i> 修改信息</a></li> 
         <li> <a href="<?php echo url('Setting/password'); ?>"><i class="fa fa-lock"></i> 修改密码</a></li> 
         <li><a href="<?php echo url('Publics/logout'); ?>"><i class="fa fa-sign-out"></i> 退出</a></li> 
        </ul> </li> 
      </ul> 
     </div> 
    </nav> 
   </header> 
   <aside class="main-sidebar"> 
    <section class="sidebar"> 
     <div class="user-panel" style="height:35px;"> 
      <div class="pull-left  info"> 
       <p style="margin: 0;"><a href="<?php echo url('publics/login'); ?>" target="_seft">查看登陆页</a> </p> 
      </div> 
     </div> 
     <div id="left_menu_list">
     	<?php echo $menus; ?> 
     </div>
    </section> 
   </aside> 
   <div class="content-wrapper">
   	<div class="content-body">
     
<section class="content-header">
    <h1>
        中间件报警短信黑名单录入
        <small><a class="link" href="<?php echo url('Tool/smsList'); ?>">查看已有规则</a></small>
      </h1>
</section>
<div class="main-box clearfix ">
    <form method="post" id="user_add_form" checkurl="/mycms/index/user/checkusername" action="/mycms/index/user/addpost.html" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">中间件</label>
                <div class="col-lg-10 col-sm-10">
                    <select name="type" id="type" class="form-control">
                        <option value=''>请选择</option>
                        <option>GTP</option>
                        <option>TongEASY</option>
                        <option>MQ</option>
                    </select>
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">开始时间</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="user_nickname" id="user_nickname" value="">
                    <div class="help-block">
                        （<span class="text-red"> 若为空,则立即生效</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">结束时间</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="password" class="form-control" name="user_password" id="user_password">
                    <div class="help-block">
                        （<span class="text-red"> 若为空,则立即生效</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">过滤关键字</label>
                <div class="col-lg-10 col-sm-10">
                    <textarea class="form-control" id="keywords" name="keywords" cols="50" rows="5"></textarea>
                    <div class="help-block">
                        <p style="font-size:18px;font-weight:800;color:#ffaa22">规则中可以用“+”或“#”联接（+代表“<span>与/and</span>”，#代表“<span>或/or</span>”），<span style="color:red;">关键字为空项则过滤掉所选中间件的所有短信</span>。</p>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">节点提示</label>
                <div class="col-lg-10 col-sm-10">
                    <div class="form-group">
                        <select name="sysname" id="sysname" class="form-control" style="max-width:200px;float:left;">
                            <option>请选择系统</option>
                        </select>
                        <select name="othername" id="othername" class="form-control" style="max-width:200px;float:left;display:none;">
                            <option>------</option>
                        </select>
                    </div>
                    <div class="email-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="hidden" class="form-control" name="id" id="id" value="">
                    <button class="btn btn-success user_add_submit" type="button">提 交</button>
                    <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
$("#sub_query").on('click', function() {
    var nodename = $("[name=nodename]").val();
    var filename = $("[name=filename]").val();
    var sendfile = $("[name=sendfile]").val();
    if (!nodename) {
        $("[name=nodename]").focus();
        layer.msg('节点名称不能为空');
        return false;
    }
    if (!sendfile) {
        $("[name=sendfile]").focus();
        layer.msg('发送目录不能为空');
        return false;
    }
    if (!filename) {
        $("[name=filename]").focus();
        layer.msg('文件名不能为空');
        return false;
    }
    var loading = layer.load(1, {
        shade: [0.1, '#000'] //0.1透明度的白色背景
    });
    $.ajax({
            url: '<?php echo url("tool/filePost"); ?>',
            type: 'post',
            data: { 'nodename': nodename, 'filename': filename, 'sendfile': sendfile },
            success: function(json) {
                layer.close(loading);
                console.log(json);
                if (json.code && json.code == 1) {
                    layer.msg(json.msg, function() {
                        location.reload();
                    });
                } else {
                    layer.msg(json.msg);
                }
            },
        })
        .fail(function(json) {
            layer.close(loading);
            layer.open({
                title: '系统错误',
                area: ['50%', '80%'],
                content: json.responseText
            });
        });
    return false;
})
</script>
  
   	</div> 
   </div>  
  </div> 
  <script src="__ROOT__/public/plugins/bootstrap/js/bootstrap.min.js"></script> 
  <!-- FastClick --> 
  <!-- <script src="__ROOT__/public/plugins/fastclick/fastclick.js"></script> --> 
  <!-- AdminLTE App --> 
  <script src="__ROOT__/public/dist/js/adminlte.js"></script> 
  <script src="__ROOT__/public/plugins/layer/layer.js"></script> 
  <script src="__ROOT__/public/plugins/treeTable/treeTable.js"></script> 
  <!-- jvectormap --> 
  <!-- <script src="__ROOT__/public/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="__ROOT__/public/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script> --> 
  <!-- SlimScroll 1.3.0 --> 
  <script src="__ROOT__/public/plugins/slimScroll/jquery.slimscroll.min.js"></script>  
     
  <script type="text/javascript">
  	$(function(){ 
  	  $("#left_menu_list").slimScroll({
           height: '100%',
           alwaysVisible: false,
       }); 
  	  $(".content-body").slimScroll({
           height: ($(window).height()-50),
           alwaysVisible: true,
           size: '8px'
       });  
  	  })
  </script>
 </body>
</html>