<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:59:"E:\webproject\mycms/application/index\view\index\index.html";i:1509109349;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509109349;s:61:"E:\webproject\mycms/application/index\view\public\header.html";i:1509152620;s:69:"E:\webproject\mycms/application/index\view\public\content_header.html";i:1509285965;s:67:"E:\webproject\mycms/application/index\view\public\left_sidebar.html";i:1509291168;s:61:"E:\webproject\mycms/application/index\view\public\footer.html";i:1509153573;}*/ ?>
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
  <link rel="stylesheet" href="__ROOT__/public/plugins/treeTable/treeTable.css"> 
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
                                <li>
                                    <!-- start message -->
                                    <a href="#">
                                        <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                                        <p style="margin:0;">主题，，，，?</p>
                                    </a>
                                </li>
                                <!-- end message -->
                                <li>
                                    <!-- start message -->
                                    <a href="#">
                                        <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                                        <p style="margin:0;">主题，，，，?</p>
                                    </a>
                                </li>
                                <li>
                                    <!-- start message -->
                                    <a href="#">
                                        <h4 style="margin:0;">
                        From:总行魏中伟
                        <small><i class="fa fa-clock-o"></i> 5分钟前</small>
                      </h4>
                                        <p style="margin:0;">主题，，，，?</p>
                                    </a>
                                </li>
                                <li>
                                    <!-- start message -->
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
              <span class="hidden-xs"><?php echo $userinfo['user_name']; ?> </span><i class="fa fa-caret-down"></i>
            </a>
                    <ul class="dropdown-menu" style="width: 30px;overflow: hidden;"> 
                        <li>
                            <a href="<?php echo url('Setting/info'); ?>"><i class="fa fa-user"></i> 修改信息</a></li>
                        <li>
                            <a href="<?php echo url('Setting/password'); ?>"><i class="fa fa-lock"></i> 修改密码</a></li>
                        <li><a href="<?php echo url('Publics/logout'); ?>"><i class="fa fa-sign-out"></i> 退出</a></li>
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
<!--       <ul class="sidebar-menu" data-widget="tree"> 
        <li class="active treeview">
          <a href="<?php echo url('index/menu/index'); ?>">
            <i class="fa fa-dashboard"></i> <span>用户权限</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="<?php echo $user_menu; ?>"><a href="<?php echo url('index/menu/index'); ?>"><i class="fa fa-circle-o"></i> 菜单管理</a></li>
            <li class="<?php echo $user_index; ?>"><a href="<?php echo url('index/user/index'); ?>"><i class="fa fa-circle-o"></i> 用户管理</a></li>
            <li class="<?php echo $user_role; ?>"><a href="<?php echo url('/index/role/index'); ?>"><i class="fa fa-circle-o"></i> 角色管理</a></li>
            <li class="<?php echo $user_permission; ?>"><a href="<?php echo url('index/auth/index'); ?>"><i class="fa fa-circle-o"></i> 权限管理</a></li>
          </ul>
        </li> 
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>数据库管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="<?php echo $user_index; ?>"><a href="<?php echo url('index/user/index'); ?>"><i class="fa fa-circle-o"></i> 数据备份</a></li> 
          </ul>
        </li> 
      </ul> -->
      <?php echo $menus; ?>
    </section>
    <!-- /.sidebar -->
  </aside> 
  <div class="content-wrapper">   
  

    <section class="content-header">
      <h1>
        系统室 
      </h1>     
    </section>

    <div class="pad margin no-print">
      <div class="callout callout-info" style="margin-bottom: 0!important;">
        <h4><i class="fa fa-info text-red"></i> 最新信息:</h4>
        系统最新信息.
      </div>
    </div>

    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> 公告
            <small class="pull-right">列表</small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
 

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>级别</th>
              <th>主题</th>
              <th>附件</th>
              <th>日期</th>
              <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td class="text-red">重要</td>
              <td>文件</td>
              <td>文件221.pdf</td>
              <td>20170806 12:11:13</td>
              <td>查看详情|下载附件</td>
            </tr>
            <tr>
              <td class="text-red">重要</td>
              <td>文件</td>
              <td>文件221.pdf</td>
              <td>20170806 12:11:13</td>
              <td>查看详情|下载附件</td>
            </tr>
            <tr>
              <td class="text-red">重要</td>
              <td>文件</td>
              <td>文件221.pdf</td>
              <td>20170806 12:11:13</td>
              <td>查看详情|下载附件</td>
            </tr>
            <tr>
              <td class="text-red">重要</td>
              <td>文件</td>
              <td>文件221.pdf</td>
              <td>20170806 12:11:13</td>
              <td>查看详情|下载附件</td>
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
        <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> 报警信息
            <small class="pull-right"><button class='btn btn-link'>点击查看更多</button></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>级别</th>
              <th>系统名称</th>
              <th>报警内容</th>
              <th>报警日期</th>
              <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td class="text-red">重要</td>
              <td>外汇卡</td>
              <td>磁盘空间满，<span class="text-red">100%</span></td>
              <td>20170806 12:11:13</td>
              <td><button type="button" class="btn">查看详情</button></td>
            </tr>
            <tr>
              <td class="text-red">重要</td>
              <td>外汇卡</td>
              <td>磁盘空间满，<span class="text-red">100%</span></td>
              <td>20170806 12:11:13</td>
              <td><button type="button" class="btn">查看详情</button></td>
            </tr>
            <tr>
              <td class="text-red">重要</td>
              <td>外汇卡</td>
              <td>磁盘空间满，<span class="text-red">100%</span></td>
              <td>20170806 12:11:13</td>
              <td><button type="button" class="btn">查看详情</button></td>
            </tr>
            <tr>
              <td class="text-red">重要</td>
              <td>外汇卡</td>
              <td>磁盘空间满，<span class="text-red">100%</span></td>
              <td>20170806 12:11:13</td>
              <td><button type="button" class="btn">查看详情</button></td>
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12"> 
          <button type="button" class="btn btn-success pull-right"><i class="fa fa-windows"></i> Windows巡检 
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class="fa fa-linux"></i> Linux巡检 
          </button>
        </div>
      </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
 
  </div>  
  <div class="control-sidebar-bg"></div>
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
<!-- <script src="__ROOT__/public/plugins/slimScroll/jquery.slimscroll.min.js"></script>  -->
</body>
</html>
  

