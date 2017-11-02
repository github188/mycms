<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:58:"E:\webproject\mycms/application/index\view\role\index.html";i:1509326122;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509592605;}*/ ?>
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
      <td> <?php if($item['id'] != 1): ?>
        <a href="<?php echo url('role/edit',array('id'=>$item['id'])); ?>">编辑</a> <a href="<?php echo url('role/auth',array('id'=>$item['id'])); ?>">授权</a> <a href="<?php echo url('role/del',array('id'=>$item['id'])); ?>" class="confirm ajax-get">删除</a> 
      <?php endif; ?>
      </td> 
     </tr>
    <?php endforeach; endif; else: echo "" ;endif; ?> 
    </tbody> 
   </table>  
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