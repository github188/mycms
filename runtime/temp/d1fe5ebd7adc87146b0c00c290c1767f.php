<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:58:"E:\webproject\mycms/application/index\view\user\index.html";i:1508313712;s:61:"E:\webproject\mycms/application/index\view\public\header.html";i:1508311212;s:69:"E:\webproject\mycms/application/index\view\public\content_header.html";i:1508311287;s:67:"E:\webproject\mycms/application/index\view\public\left_sidebar.html";i:1508309396;s:61:"E:\webproject\mycms/application/index\view\public\footer.html";i:1508311453;}*/ ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2  </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- jQuery 3.1.1 -->
  <script src="__ROOT__/public/plugins/jQuery/jquery.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="__ROOT__/public/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="__ROOT__/public/plugins/font-awesome/css/font-awesome.min.css"> 
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
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-gears"></i>
            </a> 
              <ul class="dropdown-menu">
                <li>版本信息 1.0</li> 
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
      <div class="user-panel" style="height:35px"> 
        <div class="pull-left  info">
          <p>菜单</p> 
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
            <li class="active"><a href="<?php echo url('index/user/index'); ?>"><i class="fa fa-circle-o"></i> 用户管理</a></li>
            <li><a href="<?php echo url('/index/user/role'); ?>"><i class="fa fa-circle-o"></i> 角色管理</a></li>
            <li><a href="<?php echo url('index/user/permission'); ?>"><i class="fa fa-circle-o"></i> 权限管理</a></li>
          </ul>
        </li> 
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside> 
  <div class="content-wrapper">  



<link rel="stylesheet" href="__ROOT__/public/static/user/css/user.css"> 
<div class="container"> 
    <div  id="indexcontent">
        <div style="margin:10px;" id="content_allmainview">  
            <!--home--end-->
            <div id="content_users" temp="content"  >
                <div>
                    <ul class="floats">
                        <li class="floats50">
                        <if condition="$add eq ok">
                            <button type="button" onclick="doact('add')" class="btn btn-primary" clickadd="true">
                                <i class="icon-plus"></i>新增用户</button>&nbsp; 
                        </if> 
                        </li>
                        <li class="floats30">
                            <div style="width:250px" class="input-group">
                                <input  placeholder="用户名/昵称" id="SUserKey" class="form-control">
                                <span class="input-group-btn">
                                    <button type="button" click="search" class="btn btn-default">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </li>
                        <li style="text-align:right" class="floats20">
                        <if condition="$delete eq ok">
                            <button  type="button"  id="del_user" class="btn btn-danger"  disabled="">
                                <i class="icon-trash"></i>删除</button>&nbsp;
                        </if>
                        <if condition="$edit eq ok">
                            <button disabled type="button" click="clickwin,1" id="edit_user" class="btn btn-info" clickadd="true">
                                <i class="icon-edit"></i>编辑</button></li>
                        </if>
                    </ul>
                </div>
                <div class="blank10"></div>
                <div id="admin">
                    <div id="tablebody" style="position:relative;">
                        <table style="margin:0px" class="table table-striped table-bordered table-hover"  > 
                            <tr>
                                <th width="40"></th> 
                                <th>
                                    <div align="center">用户名&nbsp;
                                        <i class="icon-sort cursor" lx="desc" tempsort="1"></i></div>
                                </th>
                                <th nowrap="">
                                    <div align="center" >昵称&nbsp;
                                        <i class="icon-sort cursor" lx="desc" tempsort="2"></i></div>
                                </th> 
                                <th nowrap="">
                                    <div align="center" >
                                        <i class="icon-pencil"></i>&nbsp;最近登陆时间&nbsp;
                                        <i class="icon-sort cursor" lx="desc" tempsort="6"></i></div>
                                </th>
                                <th nowrap="">
                                    <div align="center">注册时间&nbsp;
                                        <i class="icon-sort cursor" lx="desc"></i></div>
                                </th>
                                <th nowrap="">
                                    <div align="center" >登录次数&nbsp;
                                        <i class="icon-sort cursor" lx="desc" tempsort="8"></i></div>
                                </th>   
                            </tr> 
                            <tbody id="tableShowUsers">
                            <volist name='users' id='users' key='key'>
                                <tr>
                                    <th width="40">
                                        <?php echo $key; ?>
                                        <input type="hidden" name="userid" value="<?php echo $users['userid']; ?>">
                                        <input type="hidden" name="username" value="<?php echo $users['username']; ?>">
                                    </th> 
                                    <th>
                                        <?php echo $users['username']; ?>
                                    </th>
                                    <th nowrap="">
                                        <?php echo $users['nickname']; ?>
                                    </th> 
                                    <th nowrap="">
                                        <?php echo $users['last_login']; ?>
                                    </th>
                                    <th nowrap="">
                                        <?php echo $users['reg_date']; ?>
                                    </th>
                                    <th nowrap="">
                                        <?php echo $users['logintimes']; ?>
                                    </th>
                                </tr>
                            </volist> </tbody>
                        </table>
                    </div> 
                    <div id="tablefanye">
                    <input type="hidden" name="key" value="0" selected>
                        <div role="toolbar" class="btn-toolbar" style="margin-top:10px">
                            <div class="btn-group">
                                <button class="btn btn-default" title="首页" data-placement="top" data-toggle="tooltip" type="button" id="shouye" disabled="">«</button>
                                <button class="btn btn-default" disabled="" type="button" title="上一页" data-placement="top" data-toggle="tooltip" id="shang">&lt;</button>
                                <button <?php echo $pages['disabled']; ?> class="btn btn-default" type="button" id="pageList">第
                                    <span id="pages">1</span>页/共
                                    <span id="maxpage"><?php echo $pages['page']; ?></span>页
                                    <span class="caret"></span></button>
                                <button <?php echo $pages['disabled']; ?>  class="btn btn-default" title="下一页" data-placement="top" data-toggle="tooltip" type="button" id="next">&gt;</button>
                                <button  <?php echo $pages['disabled']; ?> class="btn btn-default" title="尾页" data-placement="top" data-toggle="tooltip" type="button" id="lastye">»</button></div>
                            <div class="btn-group">
                                <button class="btn btn-default" title="刷新" data-placement="top" data-toggle="tooltip" type="button" id="refresh" onclick="reFreshData();">
                                    <i class="icon-refresh"></i>
                                </button>
                            </div>
                            <div style="float:right; padding-top:3px" class="btn-group">
                                <span>共记录
                                    <span id="zjilu"><?php echo $pages['total']; ?></span>条</span>&nbsp;每页
                                <input type="number" style="width:40px;text-align:center;height:24px;border:1px #dddddd solid;margin:0px 2px;font-size:12px" value="<?php echo $pages['pagesize']; ?>" id="pagesize" onfocus="" onblur="cPageSize(this)" maxlength="3">条&nbsp;</div></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="__PUBLIC__/home/js/user.js"></script>



  </div>  
  <div class="control-sidebar-bg"></div>
</div> 
<!-- Bootstrap 3.3.7 -->
<script src="__ROOT__/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<!-- <script src="__ROOT__/public/plugins/fastclick/fastclick.js"></script> -->
<!-- AdminLTE App -->
<script src="__ROOT__/public/dist/js/adminlte.js"></script>
<!-- Sparkline -->
<!-- <script src="__ROOT__/public/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<!-- <script src="__ROOT__/public/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="__ROOT__/public/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script> -->
<!-- SlimScroll 1.3.0 -->
<!-- <script src="__ROOT__/public/plugins/slimScroll/jquery.slimscroll.min.js"></script>  -->
</body>
</html>