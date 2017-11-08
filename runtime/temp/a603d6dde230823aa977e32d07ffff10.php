<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:56:"E:\webproject\mycms/application/index\view\user\add.html";i:1509606803;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
    <h1>用户管理 <small>新增用户</small></h1>
</section>
<div class="main-box clearfix ">
    <form method="post" id="user_add_form" checkurl="<?php echo url('User/checkusername','',''); ?>" action="<?php echo isset($info['id'])?url('User/editPost'):url('User/addPost'); ?>" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">用户名</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="user_name" id="user_name" placeholder="用户名" value="<?php echo $info['user_name']; ?>"/>
                    <div class="help-block">
                        字母/数字/字母数字组合,登陆时使用（<span class="user_name_block">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">昵称/备注</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="user_nickname" id="user_nickname" value="<?php echo $info['user_nickname']; ?>" />
                    <div class="help-block">
                        昵称(非必填)
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">密码</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="password" class="form-control" name="user_password" id="user_password"  />
                    <div class="help-block">
                        （<span class="user_password_block">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">确认密码</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="password" class="form-control" name="repassword" id="repassword"  />
                    <div class="repassword-block">
                        （<span class="repassword_block">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">邮箱</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="user_email" id="user_email" value="<?php echo $info['user_email']; ?>" />
                    <div class="email-block">
                        （<span class="email_block">非必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">角色</label>
                <div class="col-lg-10 col-sm-10">
                     <select name="role_id" id="role_id" class="form-control">
                       <?php if(is_array($roles) || $roles instanceof \think\Collection || $roles instanceof \think\Paginator): $key = 0; $__LIST__ = $roles;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$roles): $mod = ($key % 2 );++$key;?>
                       <option value="<?php echo $roles['id']; ?>" <?php if($role_ids == $roles['id']): ?> selected <?php endif; ?>><?php echo $roles['role_name']; ?></option>
                       <?php endforeach; endif; else: echo "" ;endif; ?>
                     </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                  <input type="hidden" class="form-control" name="id" id="id" value="<?php echo $info['id']; ?>" />
                    <button class="btn btn-success user_add_submit" type="button">确 定</button>
                    <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
        </div>
    </form>
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