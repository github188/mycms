<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:58:"E:\webproject\mycms/application/index\view\user\index.html";i:1509324338;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509592605;}*/ ?>
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
<style>
#tableShowUsers td {
    text-align: center;
}

.overlay {
    display: none;
}

.user_status {
    cursor: pointer;
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
     
<section class="content-header" style="border-bottom: 1px #d2d6de solid;padding-bottom: 10px; ">
    <h1>
        用户管理
        <small>用户列表</small>
      </h1>
    <!--       <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">用户管理</a></li>
        <li class="active">用户列表</li>
      </ol> -->
</section>
<div id="content_users" temp="content">
    <ul class="floats">
        <li class="floats50">
            <if condition="$add eq ok">
                <button type="button" id="user_add_button" class="btn btn-primary">
                    <i class="fa fa-plus"></i>新增用户</button>&nbsp;
            </if>
        </li>
        <!-- <li class="floats30">
                            <div style="width:250px" class="input-group">
                                <input placeholder="用户名/昵称" id="SUserKey" class="form-control">
                                <span class="input-group-btn">
                                    <button type="button" click="search" class="btn btn-default">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </li> -->
    </ul>
    <div class="blank10"></div>
    <div id="admin">
        <div id="tablebody" style="position:relative;">
            <table style="margin:0px;background-color: #fff;" class="table  table-bordered table-hover table-striped dataTable">
                <tr>
                    <th width="40">#</th>
                    <th>
                        <div align="center">用户名&nbsp;</div>
                    </th>
                    <th>
                        <div align="center">昵称&nbsp;</div>
                    </th>
                    <th>
                        <div align="center">最近登陆时间&nbsp;</div>
                    </th>
                    <th>
                        <div align="center">登录次数&nbsp;</div>
                    </th>
                    <th>
                        <div align="center">状态&nbsp;</div>
                    </th>
                    <th>
                        <div align="center">操作&nbsp;</div>
                    </th>
                </tr>
                <tbody id="tableShowUsers">
                    <?php if(is_array($users) || $users instanceof \think\Collection || $users instanceof \think\Paginator): $key = 0; $__LIST__ = $users;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$users): $mod = ($key % 2 );++$key;?>
                    <tr>
                        <td width="40">
                            <?php echo $key; ?>
                            <input type="hidden" name="userid" value="<?php echo $users['id']; ?>">
                            <input type="hidden" name="username" value="<?php echo $users['user_name']; ?>">
                        </td>
                        <td>
                            <?php echo $users['user_name']; ?>
                        </td>
                        <td>
                            <?php echo $users['user_nickname']; ?>
                        </td>
                        <td>
                            <?php if($users['last_login_time'] == 0): ?> 该用户还没登陆过 <?php else: ?> <?php echo date('Y-m-d H:i:s',$users['last_login_time']); endif; ?>
                        </td>
                        <td>
                            <?php echo $users['user_logintimes']; ?>
                        </td>
                        <td>
                            <?php if($users['user_name'] != admin): if($users['user_status'] == 1): ?>
                            <span data-userid="<?php echo $users['id']; ?>" class="label label-primary  user_status">启用</span> <?php else: ?>
                            <span data-userid="<?php echo $users['id']; ?>" class="label label-danger user_status">禁用</span> <?php endif; else: ?>启用 <?php endif; ?>
                            <div class="overlay">
                                <i class="fa fa-refresh fa-spin"></i>
                            </div>
                        </td>
                        <td><?php if($users['user_name'] != 'admin'): ?>
                            <a href="<?php echo url('user/edit',array('id'=>$users['id'])); ?>" class="table-link">
                                            编辑
                                        </a>
                            <a href="<?php echo url('user/auth',array('id'=>$users['id'])); ?>" class="table-link">
                                            授权
                                        </a>
                            <a href="<?php echo url('user/del',array('id'=>$users['id'])); ?>" class="table-link confirm ajax-get">
                                            删除
                                        </a> <?php endif; ?>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div class="pagination"><?php echo $page; ?></div>
        </div>
    </div>
</div>
<script src="__ROOT__/public/static/js/user.js"></script>
  
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