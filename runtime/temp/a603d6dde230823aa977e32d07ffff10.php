<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:56:"E:\webproject\mycms/application/index\view\user\add.html";i:1508484970;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1508402278;s:61:"E:\webproject\mycms/application/index\view\public\header.html";i:1508401497;s:69:"E:\webproject\mycms/application/index\view\public\content_header.html";i:1508311287;s:67:"E:\webproject\mycms/application/index\view\public\left_sidebar.html";i:1508317073;s:61:"E:\webproject\mycms/application/index\view\public\footer.html";i:1508402930;}*/ ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- jQuery 3.1.1 -->
  <script src="__ROOT__/public/plugins/jQuery/jquery.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="__ROOT__/public/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="__ROOT__/public/plugins/font-awesome/css/font-awesome.min.css"> 
  <!-- Theme style -->
  <link rel="stylesheet" href="__ROOT__/public/dist/css/AdminLTE.min.css"> 
  <link rel="stylesheet" href="__ROOT__/public/dist/css/skins/_all-skins.min.css">  
  <!--[if lt IE 9]>
  <script src="__ROOT__/public/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="__ROOT__/public/plugins/respond/respond.min.js"></script>
  <![endif]--> 
</head>
<body class="hold-transition skin-blue sidebar-mini fixed">
<div class="wrapper"> 
   <header class="main-header">
    <!-- Logo -->
    <a href="__ROOT__" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>XTS</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>系统室管理</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">导航</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">你有4条新信息</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#"> 
                      <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                      <p style="margin:0;">主题，，，，?</p>
                    </a>
                  </li>
                  <!-- end message --> 
                  <li><!-- start message -->
                    <a href="#"> 
                      <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                      <p style="margin:0;">主题，，，，?</p>
                    </a>
                  </li>

<li><!-- start message -->
                    <a href="#"> 
                      <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                      <p style="margin:0;">主题，，，，?</p>
                    </a>
                  </li>

<li><!-- start message -->
                    <a href="#"> 
                      <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                      <p style="margin:0;">主题，，，，?</p>
                    </a>
                  </li>

                </ul>
              </li>
              <li class="footer"><a href="#">查看全部信息</a></li>
            </ul>
          </li>
           
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
              <span class="hidden-xs">admin</span>
            </a>
            <ul class="dropdown-menu"> 
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">用户管理</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">权限管理</a>
                  </div> 
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">修改密码</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">注销</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-gears"></i>
            </a> 
              <ul class="dropdown-menu">
                <li>版本信息 1.0</li> 
              </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
   <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel" style="height:35px;"> 
        <div class="pull-left  info" >
          <p style="margin: 0;">菜单</p> 
        </div>
      </div> 
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree"> 
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>用户权限</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="<?php echo $user_index; ?>"><a href="<?php echo url('index/user/index'); ?>"><i class="fa fa-circle-o"></i> 用户管理</a></li>
            <li class="<?php echo $user_role; ?>"><a href="<?php echo url('/index/user/role'); ?>"><i class="fa fa-circle-o"></i> 角色管理</a></li>
            <li class="<?php echo $user_permission; ?>"><a href="<?php echo url('index/user/permission'); ?>"><i class="fa fa-circle-o"></i> 权限管理</a></li>
          </ul>
        </li> 
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside> 
  <div class="content-wrapper">   

<link rel="stylesheet" href="__ROOT__/public/static/css/user.css"> 
<style>
.content-header{
    border-bottom: 1px #d2d6de solid;padding-bottom: 10px;
} 
.main-box{margin:20px;background-color:#fff;box-shadow: 0px 0px 1px #73080a; border-radius: 5px;}
.from-box{margin-left:-10px;margin-right: 20px;margin-top:20px;}
</style> 
 
  
<section class="content-header"> 
   <h1>用户管理 <small>新增用户</small></h1> 
  </section> 
  <div class="container"> 
   <div id="indexcontent"> 
    <div class="main-box clearfix "> 
     <div class="col-lg-12"> 
      <form method="post" id="user_add_form" class="form form-horizontal"> 
       <div class="row from-box"> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">用户名</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="text" class="form-control" name="username" id="username" placeholder="用户名"/> 
          <div class="help-block">
            字母/数字/字母数字组合,登陆时使用（<span class="username_block">必填</span>）
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">昵称/备注</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="text" class="form-control" name="user_nick_name" id="user_nick_name" autocomplete="false" value="" /> 
          <div class="help-block">
            昵称
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">密码</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="password" class="form-control" name="password" id="password" autocomplete="false" value="" /> 
          <div class="help-block">
           （<span class="password_block">必填</span>）
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">确认密码</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="password" class="form-control" name="repassword" id="repassword" autocomplete="false" value="" /> 
          <div class="help-block">
            （<span class="repassword_block">必填</span>）
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">邮箱</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="text" class="form-control" name="email" id="email" autocomplete="false" value="" /> 
          <div class="help-block">
            
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <div class="col-lg-offset-2 col-lg-10"> 
          <input type="hidden" name="id" value="" /> 
          <button class="btn btn-success user_add_submit" type="button">确 定</button> 
          <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button> 
         </div> 
        </div> 
       </div> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div>
<script src="__ROOT__/public/static/js/user.js"></script> 
 
  </div>  
  <div class="control-sidebar-bg"></div>
</div>  
<script src="__ROOT__/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<!-- <script src="__ROOT__/public/plugins/fastclick/fastclick.js"></script> -->
<!-- AdminLTE App -->
<script src="__ROOT__/public/dist/js/adminlte.js"></script> 
<script src="__ROOT__/public/plugins/layer/layer.js"></script>
<!-- jvectormap -->
<!-- <script src="__ROOT__/public/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="__ROOT__/public/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script> -->
<!-- SlimScroll 1.3.0 -->
<!-- <script src="__ROOT__/public/plugins/slimScroll/jquery.slimscroll.min.js"></script>  -->
</body>
</html>
  

