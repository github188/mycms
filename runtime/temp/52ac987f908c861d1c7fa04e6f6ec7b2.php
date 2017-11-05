<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:63:"E:\webproject\mycms/application/index\view\Tool\host_batch.html";i:1509867561;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509752993;}*/ ?>
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
.table-bordered {
    border: 1px solid #2d2d2d;
}
textarea::-webkit-input-placeholder:after{
  display:block;
  content:"line@ \A line#";/*  \A 表示换行  */
  color:red;
}
textarea::-moz-placeholder:after{
  content:"line@ \A line#";/*  \A 表示换行  */
  color:red;
};
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
    <h1>批量添加巡检主机信息</h1>
</section>
<div class="main-box clearfix ">
    <form method="post" id="host_add_form" action="<?php echo isset($info['id'])?url('Host/editPost'):url('Host/batchPost'); ?>" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">系统名称</label>
                <div class="col-lg-10 col-sm-10">
                    <textarea   rows="4" class="form-control" name="data" id="data" placeholder="系统名,位置ID,服务ID,主机名,操作系统类型,[应用值1|应用值2...];" value="<?php echo $info['nodename']; ?>"></textarea>
                    <div class="help-block">
                        <div class="row">
                            <table class="table table-bordered">
                                <tr>
                                    <td>位置ID</td>
                                    <td>操作系统编号对应</td>
                                    <td>应用类型编号对应</td>
                                </tr>
                                <tr>
                                    <td>西三旗=>2，
                                    亦庄中金=>3，
                                    东单=>7，
                                    所有地方=>99，</td>
                                    <td>AIX=>1，
                                    Solaris=>2，
                                    Windows=>4，
                                    Linux=> 8，</td>
                                    <td>MQ=> 1，
                                    WAS=>2，
                                    Oracle=>4，
                                    Tong=>8，
                                    Informix=>16，
                                    CV=>32，
                                    GTP=>64，</td>
                                </tr>
                            </table> 
                            <p class="text-red">数据结尾和多条数据之间用“;”分割。如下：<br>中金CV服务器1,3,0017,hxbackup1,4,[2|32];<br>中金CV服务器2,3,0018,hxbackup2,4,[2|32];</p>
                        </div>
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
                            //location.reload();
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