<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:57:"E:\webproject\mycms/application/index\view\role\edit.html";i:1509109349;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509109349;s:61:"E:\webproject\mycms/application/index\view\public\header.html";i:1509152620;s:69:"E:\webproject\mycms/application/index\view\public\content_header.html";i:1509109349;s:67:"E:\webproject\mycms/application/index\view\public\left_sidebar.html";i:1509109349;s:61:"E:\webproject\mycms/application/index\view\public\footer.html";i:1509153573;}*/ ?>
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

<link rel="stylesheet" href="__ROOT__/public/static/css/user.css"> 
<style>
.content-header{
    border-bottom: 1px #d2d6de solid;padding-bottom: 10px;
} 
.main-box{margin:20px;background-color:#fff;box-shadow: 0px 0px 1px #73080a; border-radius: 5px;}
.from-box{margin-left:-10px;margin-right: 20px;margin-top:20px;}
</style> 
 
  
<section class="content-header"> 
   <h1><a href="<?php echo url('role/index'); ?>" class="link">角色管理</a> <small><?php echo isset($info['id'])?'编辑':'新增'; ?>角色</small></h1> 
</section> 
  <div class="container"> 
   <div id="indexcontent"> 
    <div class="main-box clearfix "> 
     <div class="col-lg-12"> 
      <form method="post" id="role_add_form" class="form form-horizontal"> 
       <div class="row from-box"> 
        <div class="form-group"> 
         <label class="col-lg-2 control-label">角色名</label> 
         <div class="col-lg-10 col-sm-10"> 
          <input type="text" class="form-control" name="role_name" id="role_name" placeholder="角色名" value="<?php echo $info['role_name']; ?>" /> 
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
          <button class="btn btn-success role_add_submit" type="button">确 定</button> 
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
        var input = $("[name=role_name]");
        var help = input.siblings(".help-block"); 
        if (!role_name) {
            $("[name=role_name]").focus();
            help.css("color","red");
            return false;
        }  
        $.ajax({
            url: 'checkName?role_name='+role_name,
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
    $(".role_add_submit").on("click",function(){
        var role_name = $("input[name=role_name]").val();
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
  

