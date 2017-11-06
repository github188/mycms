<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"E:\webproject\mycms/application/index\view\user\auth.html";i:1509954317;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509931430;}*/ ?>
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
    <h1>用户管理 <small>新增用户</small></h1>
</section>
<div class="main-box clearfix ">
    <form method="post" id="use_auth_form"  action="<?php echo url('User/authPost'); ?>" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group" id="check_role">
                <label class="col-lg-2 control-label">请选择角色</label>
                <?php if(is_array($roles) || $roles instanceof \think\Collection || $roles instanceof \think\Paginator): $key = 0; $__LIST__ = $roles;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$roles): $mod = ($key % 2 );++$key;?>
                <label class="radio-inline" >
                    <input type="radio" name="role_id" id="role_id<?php echo $roles['id']; ?><?php echo $rule['role_id']; ?>" value="<?php echo $roles['id']; ?>"> <?php echo $roles['role_name']; ?>
                </label>
                <?php endforeach; endif; else: echo "" ;endif; ?>  
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="hidden" class="form-control" name="user_id" id="user_id" value="<?php echo $info['user_id']; ?>" />
                    <button class="btn btn-success use_auth_submit" type="button">确 定</button>
                    <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    $(document).ready(function(){
        $("#check_role input:radio").each(function(index, el) {
            if('<?php echo $info['role_id']; ?>' == $(this).val()){
                $(this).click();
            } 
        });
    });
    $(".use_auth_submit").on("click",function(){
        var id = $("#check_role input:radio:checked").val();
        if(!id){
            layer.msg("请选择角色");
            return false;
        }
        var loading = layer.load(1, {
            shade: [0.1, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
            url: '<?php echo url("index/User/authPost"); ?>',
            type: 'POST',
            data:$("#use_auth_form").serialize(),
        })
        .done(function(json) {
            layer.close(loading);
                if (json.code == 1) {
                    layer.msg(json.msg, {time:500},function() {
                        location.reload();
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
        
        console.log(id);
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