<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:58:"E:\webproject\mycms/application/index\view\tool\chart.html";i:1509751281;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509751281;}*/ ?>
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
<!--   <link rel="stylesheet" href="__ROOT__/public/plugins/treeTable/treeTable.css" />   -->
  <link rel="stylesheet" href="__ROOT__/public/dist/css/AdminLTE.min.css" /> 
  <link rel="stylesheet" href="__ROOT__/public/dist/css/skins/_all-skins.min.css" /> 
  <!--[if lt IE 9]>
  <script src="__ROOT__/public/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="__ROOT__/public/plugins/respond/respond.min.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="__ROOT__/public/static/css/base.css" /> 
  <style>
    #left_menu_list>ul{
      margin-bottom: 100px;
    }
  </style>
   
<link rel="stylesheet" href="__ROOT__/public/static/css/user.css">
<style>
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
    <h1>
        设备故障统计分析
        <!-- <small>后台菜单列表</small> -->
      </h1>
    <div class="pull-right action-btn">
        <a class="btn btn-primary" id="add_menu_button" href="<?php echo url('Tool/addEq'); ?>">添加故障信息</a>
        <a class="btn btn-primary" id="add_menu_button" href="<?php echo url('Tool/inputEq'); ?>">导入模板信息</a>
        <a class="btn btn-primary" id="add_menu_button" href="<?php echo url('Tool/editEq'); ?>">修改鼓掌信息</a>
    </div>
</section>
<div class="content">
    <div class="box">
                    <div class="box-header width-border">
                        <h3 class="box-title"><font>本月故障占比图</font></h3> 
                        <div class="pull-right">
                            <select name="monthcharts" class="form-control">
                                <option value="lastweek">最近一周</option>
                                <option value="lastbmonth">最近半月</option>
                                <option value="lastmonth" selected>本月</option> 
                            </select>
                        </div> 
                    </div> 
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-12 col-lg-6"> 
                                <div id="equipment_chart" style="height:300px;"> 
                                </div> 
                            </div>
                            <div class="col-sm-12 col-lg-6">
                                <div id="equipment_locale_chart" style="height:300px;">  
                                </div>
                            </div>
                            <div class="col-sm-12 col-lg-6">
                                <div id="equipment_type_chart"  style="height:300px;"></div>
                            </div>
                            <div class="col-sm-12 col-lg-6">
                                <div id="equipment_brand_chart" style="height:300px;"></div>
                            </div>
                            <div class="col-sm-12 col-lg-6">
                                <div id="equipment_part_chart" style="height:300px;">  
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- 按月统计故障总数  -->
                <div class="box">
                    <div class="box-header width-border">
                        <h3 class="box-title"><font>按月/季度统计故障总数</font></h3> 
                        <div class="pull-right">
                            <div class="input-group">

                            </div>
                            <div class="input-group">
                                <select class="form-control" name="monthx" style="float:left;width:111px;">
                                    <option value="huanjing">环境类型</option> 
                                    <option value="jifang">所在机房</option>
                                    <option value="buwei">故障部位</option>
                                </select>
                                <select class="form-control" name="monthyear" style="float:left;width:85px;">
                                    <option>2017</option>
                                    <option>2016</option> 
                                </select> 
                                <select class="form-control" name="monthselect" style="float:left;width:110px;">
                                    <option value="month">按月查询</option> 
                                    <option value="quarter">按季度查询</option>
                                </select> 
                                <button class="btn btn-success" id="monthbutton" type="button">查询</button> 
                            </div>
                        </div> 
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-12 col-lg-6">
                                <div id="line_part_chart" style="height:300px;">  
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
                <!-- /按月统计故障总数  -->
                <!-- 年度统计故障总数  -->
                <div class="box">
                    <div class="box-header width-border">
                        <div style="float: left;"> 
                            <h3 class="box-title"><font>按年统计故障总数</font></h3> 
                        </div>
                        <div class="pull-right"> 
                            <!-- Date range -->

                            <div class="form-group" style="float: left;margin-left:5px;"> 
                                <!--                                                         <select class="form-control" style="float: left;margin-left:5px;">
                                                                    <option>快捷查询</option>
                                                                    <option>2</option>
                                                                    <option>3</option>
                                                                    <option>4</option>
                                                                    <option>5</option>
                                                                </select> -->
                                <div class="input-group" style="float: left;">
                                    <input type="text" style="width:108px;" class="form-control" id="yearstartdate" placeholder="开始时间"/> 

                                    <input type="text" placeholder="结束时间" style="width:108px;" class="form-control" id="yearenddate"/> 
                                    <button class="btn btn-success" id="yearbutton" type="button">查询</button> 
                                </div>

                                <!-- /.input group -->
                            </div> 

                        </div> 
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-12 col-lg-6">
                                <div id="year_part_chart" style="height:300px;">  
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
                <!-- /年度统计故障总数  -->
</div>
<script type="text/javascript">
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
<!--   <script src="__ROOT__/public/plugins/treeTable/treeTable.js"></script>  -->
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