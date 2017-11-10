<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"E:\webproject\mycms/application/index\view\tool\host.html";i:1510301200;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
  <!-- <link rel="stylesheet" href="__ROOT__/public/static/css/base.css" />  -->
  <style>
    #left_menu_list>ul{
      margin-bottom: 100px;
    }
  </style>
   
<link rel="stylesheet" href="__ROOT__/public/static/css/user.css">
<style>
.applist {
    position: initial;
    float: left;
    margin: 5px;
    width: auto;
}

.icheckbox_line-blue {
    padding: 8px 18px 8px 38px !important;
}
</style>
   
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
       <p style="margin: 0;"><a href="<?php echo url('/'); ?>" target="_seft">返回首页</a> </p> 
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
    <h1><a href="<?php echo url('host/index'); ?>"><添加巡检主机信息</a> </h1>
    <div class="pull-right  action-btn clearfix">
        <a class="btn btn-primary" href="<?php echo url('Host/Batch'); ?>">批量处理</a>
    </div>
</section>
<div class="main-box clearfix ">
    <form method="post" id="host_add_form" action="<?php echo isset($info['id'])?url('Host/editPost'):url('Host/addPost'); ?>" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">系统名称</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="nodename" id="nodename" placeholder="系统名称" value="<?php echo $info['nodename']; ?>" />
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">主机名</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="hostname" id="hostname" value="<?php echo $info['hostname']; ?>" />
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">所在地</label>
                <div class="col-lg-10 col-sm-10">
                    <select name="location_id" class="form-control">
                        <option selected value="3">亦庄中金</option>
                        <option value="2">西三旗</option>
                        <option value="7">东单</option>
                    </select>
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">操作系统</label>
                <div class="col-lg-10 col-sm-10">
                    <select name="os_type" class="form-control">
                        <option value="1">AIX</option>
                        <option value="2">Solaris</option>
                        <option value="4">Windows</option>
                        <option value="8">Linux</option>
                    </select>
                    <div class="repassword-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">应用类型</label>
                <div class="col-lg-10 col-sm-10">
                    <div class="applist">
                        <input type="checkbox" name="applist[]" id="MQ" value="1">
                        <label for="MQ">MQ</label>
                    </div>
                    <div class="applist">
                        <input type="checkbox" name="applist[]" id="WAS" value="2">
                        <label for="WAS">WAS</label>
                    </div>
                    <div class="applist">
                        <input type="checkbox" name="applist[]" id="Oracle" value="4">
                        <label for="Oracle">Oracle</label>
                    </div>
                    <div class="applist">
                        <input type="checkbox" name="applist[]" id="TongEASY" value="8">
                        <label for="TongEASY">TongEASY</label>
                    </div>
                    <div class="applist">
                        <input type="checkbox" name="applist[]" id="Informix" value="16">
                        <label for="Informix">Informix</label>
                    </div>
                    <div class="applist">
                        <input type="checkbox" name="applist[]" id="GTP" value="64">
                        <label for="GTP">GTP</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">服务ID</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="server_id" id="server_id" value="<?php echo $info['server_id']; ?>" />
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="hidden" class="form-control" name="id" id="id" value="<?php echo $info['id']; ?>" />
                    <button class="btn btn-success host_add_submit" type="button">确 定</button>
                    <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
        </div>
    </form>
</div>
  
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
  
<link rel="stylesheet" href="__ROOT__/public/plugins/iCheck/all.css" />
<script src="__ROOT__/public/plugins/iCheck/icheck.min.js"></script>
<script>
$(document).ready(function() {
    $('.applist input').each(function() {
        var self = $(this),
            label = self.next(),
            label_text = label.text();
        label.remove();
        self.iCheck({
            checkboxClass: 'icheckbox_line-blue',
            radioClass: 'iradio_line-blue',
            insert: '<div class="icheck_line-icon"></div>' + label_text
        });
    });
    $(".host_add_submit").on("click", function() {
        var posturl = $("#host_add_form").attr("action");
        var loading = layer.load(1, {
            shade: [0.1, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
                url: posturl,
                type: 'post',
                data: $("#host_add_form").serialize(),
            })
            .done(function(json) {
                layer.close(loading);
                if (json.code == 1) {
                    layer.msg(json.msg, function() {
                        location.reload();
                    });
                } else {
                    layer.msg(json.msg);
                }
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
    });
});
</script>
  
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