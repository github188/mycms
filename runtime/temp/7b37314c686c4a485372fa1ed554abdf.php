<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"E:\webproject\mycms/application/index\view\menu\edit.html";i:1509324338;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509931430;}*/ ?>
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
.content-header {
    border-bottom: 1px #d2d6de solid;
    padding-bottom: 10px;
}

.main-box {
    margin: 20px;
    background-color: #fff;
    box-shadow: 0px 0px 1px #73080a;
    border-radius: 5px;
}

.from-box {
    margin-left: -10px;
    margin-right: 20px;
    margin-top: 20px;
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
    <h1><a class="title" id="add_menu_button" href="<?php echo url('index'); ?>">菜单管理</a> <small><?php echo isset($info['id'])?'编辑':'新增'; ?>菜单</small></h1>
</section>
<div class="main-box clearfix ">
    <form method="post" id="menu_edit_form" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">名称</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="name" value="<?php echo (isset($info['name']) && ($info['name'] !== '')?$info['name']:''); ?>">
                    <div class="help-block">
                        用于导航显示（<span class="title_block text-red">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">上级菜单</label>
                <div class="col-md-6 col-sm-10">
                    <select name="pid" class="form-control">
                        <option value="0">作为一级菜单</option><?php echo $select_category; ?>
                    </select>
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">应用</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="app" value="<?php echo (isset($info['app']) && ($info['app'] !== '')?$info['app']:''); ?>">
                    <div class="help-block">
                        （<span class="text-red">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">控制器</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="controller" value="<?php echo (isset($info['controller']) && ($info['controller'] !== '')?$info['controller']:''); ?>">
                    <div class="help-block">
                        （<span class="text-red">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">方法</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="action" value="<?php echo (isset($info['action']) && ($info['action'] !== '')?$info['action']:''); ?>">
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">参数</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="param" value="<?php echo (isset($info['param']) && ($info['param'] !== '')?$info['param']:''); ?>" />
                    <div class="help-block"> 例:id=3&p=3
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">小图标</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="icon" value="<?php echo (isset($info['icon']) && ($info['icon'] !== '')?$info['icon']:''); ?>" />
                    <div class="help-block">
                        （用于显示在菜单左侧，不填则不显示）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">排序</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="list_order" value="<?php echo (isset($info['list_order']) && ($info['list_order'] !== '')?$info['list_order']:0); ?>" />
                    <div class="help-block">
                        （用于分组显示的顺序）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">状态</label>
                <div class="col-md-6 col-sm-10">
                    <select class="form-control valid" name="status" aria-invalid="false">
                        <option value="1">显示</option>
                        <option value="0" <?php if(isset($info['status']) && $info['status']==0): ?>selected<?php endif; ?>>隐藏</option>
                    </select>
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">类型</label>
                <div class="col-md-6 col-sm-10">
                    <select class="form-control valid" name="type" id="input-type" aria-invalid="false">
                        <option value="1">有界面可访问菜单</option>
                        <option value="2" <?php if(isset($info['type']) && $info['type']==2): ?>selected<?php endif; ?>>无界面可访问菜单</option>
                        <option value="0" <?php if(isset($info['type']) && $info['type']==0): ?>selected<?php endif; ?>>只作为菜单</option>
                    </select>
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">备注</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="remark" value="<?php echo (isset($info['remark']) && ($info['remark'] !== '')?$info['remark']:''); ?>" />
                    <div class="help-block">
                        （菜单详细说明）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:''); ?>">
                    <input type="hidden" name="posturl" value="<?php echo (isset($info['posturl']) && ($info['posturl'] !== '')?$info['posturl']:''); ?>">
                    <button class="btn btn-success add_menu_submit" type="button">确 定</button>
                    <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="__ROOT__/public/static/js/menu.js"></script>
  
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