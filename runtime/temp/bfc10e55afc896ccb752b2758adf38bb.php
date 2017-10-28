<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:58:"E:\webproject\mycms/application/index\view\role\index.html";i:1509175718;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509109349;s:61:"E:\webproject\mycms/application/index\view\public\header.html";i:1509152620;s:69:"E:\webproject\mycms/application/index\view\public\content_header.html";i:1509109349;s:67:"E:\webproject\mycms/application/index\view\public\left_sidebar.html";i:1509109349;s:61:"E:\webproject\mycms/application/index\view\public\footer.html";i:1509153573;}*/ ?>
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
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside> 
  <div class="content-wrapper">   

 <style>
 	.content-header{
 		border-bottom: 1px #d2d6de solid;padding-bottom: 10px; 
 	}
 	.action-btn{
		float: right;
        background: transparent;
        margin-top: 0;
        margin-bottom: 0;
        font-size: 12px;
        padding: 7px 5px;
        position: absolute;
        top: 5px;
        right: 10px;
        border-radius: 2px;
 	}
 </style>
 
  
<section class="content-header"> 
   <h1> 角色管理 <small>角色列表</small> </h1>  
   <div class="pull-right  action-btn clearfix"> 
    <a class="btn btn-primary" href="<?php echo url('add'); ?>">新增角色</a> 
   </div> 
   <div class="clearfix"></div>
  </section> 
  <div class="main-box-body"> 
   <table class="table  table-bordered table-hover table-striped"> 
    <thead> 
     <tr> 
      <th width="30"><input class="checkbox check-all" type="checkbox" /></th> 
      <th width="60">ID</th> 
      <th>角色</th> 
      <th>描述</th> 
      <th>状态</th> 
      <th>操作</th> 
     </tr> 
    </thead> 
    <tbody>
    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?> 
     <tr> 
      <td><input class="ids row-selected" type="checkbox" name="ids[]" value="<?php echo $item['id']; ?>" /></td> 
      <td><?php echo $item['id']; ?></td> 
      <td><a href="#" class="editable editable-click" data-id="<?php echo $item['id']; ?>" data-name="role_name" data-pk="<?php echo $item['id']; ?>" data-url="<?php echo url('edit'); ?>"><?php echo $item['role_name']; ?></a></td> 
      <td><?php echo $item['description']; ?></td> 
      <td> <?php if($item['status'] == '0'): ?> <span class="label label-danger">禁用</span> <?php elseif($item['status'] == '1'): ?> <span class="label label-primary">启用</span> <?php endif; ?> </td> 
      <td> <a href="<?php echo url('role/edit',array('id'=>$item['id'])); ?>">编辑</a> <a href="<?php echo url('role/auth',array('id'=>$item['id'])); ?>">授权</a> <a href="<?php echo url('role/del',array('id'=>$item['id'])); ?>" class="confirm ajax-get">删除</a> </td> 
     </tr>
    <?php endforeach; endif; else: echo "" ;endif; ?> 
    </tbody> 
   </table>  
  </div>
 
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
  

