<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"E:\webproject\mycms/application/index\view\role\edit.html";i:1510213317;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
   <h1><a href="<?php echo url('role/index'); ?>" class="link"><角色管理</a> <small><?php echo isset($info['id'])?'编辑':'新增'; ?>角色</small></h1> 
   <?php if($info > 0): ?>
   <div class="pull-right  action-btn clearfix"> 
    <a class="btn btn-primary" href="<?php echo url('Role/add'); ?>">新增角色</a> 
   </div> 
   <?php endif; ?>
</section> 
  <div class="container"> 
   <div id="indexcontent"> 
    <div class="main-box clearfix "> 
     <div class="col-lg-12"> 
      <form method="post" id="role_add_form" check-name="<?php echo url('role/checkName'); ?>" class="form form-horizontal"> 
       <div class="row from-box"> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">角色名</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="text"  class="form-control" name="role_name" id="role_name" placeholder="角色名" value="<?php echo $info['role_name']; ?>" /> 
          <div class="help-block">（必填） 
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">说明</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="text" class="form-control" name="description" id="description"  value="" /> 
          <div class="help-block"> 
          </div> 
         </div> 
        </div>  
        <div class="form-group"> 
         <label class="col-lg-2 control-label">启用</label> 
         <div class="col-lg-10 col-sm-10"> 
          <select name="status" id="status" class="form-control">
              <option value="1">是</option> 
              <option value="0" <?php if(isset($info)&& $info['status'] ==0): ?>selected<?php endif; ?>>否</option> 
            {if condition="$info.status"}
          </select>
          <div class="email-block">
             
          </div> 
         </div> 
        </div> 
        <div class="form-group"> 
         <div class="col-lg-offset-2 col-lg-10">  
            <input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:''); ?>">
          <button class="btn btn-success role_edit_submit" type="button">提 交</button> 
          <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button> 
         </div> 
        </div> 
       </div> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div>
<script>
        /**
         * 检测角色是否存在
         * @author 钟朝辉 <zzhhuii@qq.com>
         * @date   2017-10-26T14:55:22+0800 
         */
        function check_role(){
        var role_name = $("[name=role_name]").val();
        var curl = $("#role_add_form").attr('check-name'); 
        var role_id = $("input[name=id]").val();
        var input = $("[name=role_name]");
        var help = input.siblings(".help-block"); 
        if (!role_name) {
            $("[name=role_name]").focus();
            help.css("color","red");
            return false;
        }  
        $.ajax({
            url: curl+'?role_name='+role_name+'&id='+role_id,
            type: 'POST',
            success:function(json){ 
                if(json.code==1){
                    if(json.msg=='ok'){
                        help.find('i,.text-red').remove();
                        help.append('<i class="fa fa-check text-green"></i>'); 
                    }
                }else{
                    help.find('i,.text-red').remove();
                    help.append('<span class="text-red">'+json.msg+'</span><i class="fa fa-close text-red"></i>');
                    $("[name=role_name]").focus();
                    return false;
                }
            }
        }) 
    }
    $("[name=role_name]").on("blur",function(){
        check_role(); 
    });
    $(".role_edit_submit").on("click",function(){
        var role_name = $("input[name=role_name]").val();
        var role_id = $("input[name=id]").val();
        if(!role_name){
            $("input[name=role_name]").focus();
            return false;
        } 
        $.ajax({
            url: 'add',
            type: 'post', 
            data: $("#role_add_form").serialize(),
        })
        .done(function(json) {
            if(json.msg.xdebug_message){
                //layer.alert(json.msg.xdebug_message);
                layer.open({
                  type: 1,
                  //skin: 'layui-layer-rim', //加上边框
                  area: ['60%', 'auto'], //宽高
                  content: json.msg.xdebug_message
                });
                return false;
            }  
            if(json.code==1){
                layer.msg("操作成功",function(){
                    location.href=json.url;
                })
            }else{
                layer.msg(json.msg)
            } 
        }); 
        return false;
    });
</script>
  
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