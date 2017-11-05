<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"E:\webproject\mycms/application/index\view\tool\smslist.html";i:1509751281;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509752993;}*/ ?>
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
div.dataTables_info {
    padding-top: 8px;
    white-space: nowrap;
}

div.dataTables_paginate {
    margin: 0;
    white-space: nowrap;
    text-align: right;
}

div.dataTables_paginate ul.pagination {
    margin: 2px 0;
    white-space: nowrap;
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
    <h1>
        短信黑名单列表
        <!-- <small>后台菜单列表</small> -->
        <div class="pull-right action-btn">
          <a href="<?php echo url('Tool/sms'); ?>" class="btn btn-primary">添加新规则</a>
        </div>
      </h1>
</section>
<div class="invoice container-fluid">
    <div class="row">
        <div class="col-xs-12 action-header">
            <div class="pull-left">
                <button class="btn  btn-default"><i class="fa fa-square-o"></i> 全 选</button>
                <button class="btn  btn-default"><i class="fa fa-trash-o"></i> 删 除</button>
            </div>
            <div class="pull-right">
                <button class="btn btn-succ">删除</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>级别</th>
                        <th>主题</th>
                        <th>附件</th>
                        <th>日期</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-red">重要</td>
                        <td>文件</td>
                        <td>文件221.pdf</td>
                        <td>20170806 12:11:13</td>
                        <td>查看详情|下载附件</td>
                    </tr>
                    <tr>
                        <td class="text-red">重要</td>
                        <td>文件</td>
                        <td>文件221.pdf</td>
                        <td>20170806 12:11:13</td>
                        <td>查看详情|下载附件</td>
                    </tr>
                    <tr>
                        <td class="text-red">重要</td>
                        <td>文件</td>
                        <td>文件221.pdf</td>
                        <td>20170806 12:11:13</td>
                        <td>查看详情|下载附件</td>
                    </tr>
                    <tr>
                        <td class="text-red">重要</td>
                        <td>文件</td>
                        <td>文件221.pdf</td>
                        <td>20170806 12:11:13</td>
                        <td>查看详情|下载附件</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5">
            <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">第 41-50/共 57 条</div>
        </div>
        <div class="col-xs-7">
            <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                <ul class="pagination">
                    <li class="paginate_button previous" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">上一页</a></li>
                    <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
                    <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
                    <li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">下一页</a></li>
                </ul>
            </div>
        </div>
    </div>
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