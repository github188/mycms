<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"E:\webproject\mycms/application/index\view\link\edit.html";i:1510130223;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
.content-header{
    border-bottom: 1px #d2d6de solid;padding-bottom: 10px;
} 
.main-box{margin:20px;background-color:#fff;box-shadow: 0px 0px 1px #73080a; border-radius: 5px;}
.from-box{margin-left:-10px;margin-right: 20px;margin-top:20px;}
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
   <h1><a href="<?php echo url('Link/index'); ?>" class="link">登陆页面超链</a> <small><?php echo isset($info['id'])?'编辑':'新增'; ?>超链</small></h1> 
   <?php if($info > 0): ?>
   <div class="pull-right  action-btn clearfix"> 
    <a class="btn btn-primary" href="<?php echo url('Link/add'); ?>">新增超链</a> 
   </div> 
   <?php endif; ?>
</section> 
<div class="main-box clearfix ">
    <form method="post" id="add_link_form" action="<?php echo url('Link/addPost'); ?>" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">标题</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="title" value="<?php echo (isset($info['title']) && ($info['title'] !== '')?$info['title']:''); ?>">
                    <div class="help-block">
                         （<span class="title_block text-red">必填</span>）
                    </div>
                </div>
            </div> 
            <div class="form-group">
                <label class="col-lg-2 control-label">链接</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="link" value="<?php echo (isset($info['app']) && ($info['app'] !== '')?$info['app']:''); ?>">
                    <div class="help-block">
                        例如：http://102.200.2.224/report（<span class="title_block text-red">必填</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">打开方式</label>
                <div class="col-md-6 col-sm-10">
                    <select class="form-control valid" name="target" aria-invalid="false">
                        <option value="_blank">在新窗口打开</option>
                        <option value="_self" <?php if(isset($info['status']) && $info['target']=='_self'): ?>selected<?php endif; ?>>在当前窗口</option>
                    </select>
                    <div class="help-block"> 
                    </div>
                </div>
            </div> 
            <div class="form-group">
                <label class="col-lg-2 control-label">图片</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="picture" value="<?php echo (isset($info['picture']) && ($info['picture'] !== '')?$info['picture']:''); ?>" />
                    <div class="help-block">  用于显示在登陆首页，分辨率100*100
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">小图标</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="icon" value="<?php echo (isset($info['icon']) && ($info['icon'] !== '')?$info['icon']:''); ?>" />
                    <div class="help-block">
                        用于显示在菜单左侧，不填则不显示
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">排序</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="list_order" value="<?php echo (isset($info['list_order']) && ($info['list_order'] !== '')?$info['list_order']:0); ?>" />
                    <div class="help-block">
                        用于分组显示的顺序
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
                <label class="col-lg-2 control-label">备注</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="remark" value="<?php echo (isset($info['remark']) && ($info['remark'] !== '')?$info['remark']:''); ?>" />
                    <div class="help-block">
                        菜单详细说明
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:''); ?>"> 
                    <button class="btn btn-success add_link_submit" type="button">提 交</button>
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
    
<script> 
    $(".add_link_submit").on("click",function(){
        var title = $("input[name=title]").val();
        var link = $("input[name=link]").val();
        var posturl = $("#add_link_form").attr("action");
        if(!title){
            $("input[name=title]").focus();
            layer.tips("标题不能为空","input[name=title]",{tips:1});
            return false;
        }
        if(!link){
            $("input[name=link]").focus();
            layer.tips("链接不能为空","input[name=link]",{tips:1});
            return false;
        } 
        var loading = layer.load(1, {
            shade: [0.5, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
            url: posturl,
            type: 'post', 
            data: $("#add_link_form").serialize(),
        })
        .done(function(json) {
            layer.close(loading);
            if (json.code == 1) {
                layer.msg(json.msg,{time:500}, function() {
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