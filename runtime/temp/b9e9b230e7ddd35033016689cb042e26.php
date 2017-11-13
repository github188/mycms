<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"E:\webproject\mycms/application/index\view\tool\file.html";i:1510544641;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
    <h1>
        查询GTP节点文件是否存在
        <!-- <small>后台菜单列表</small> -->
      </h1>
</section>
<div class="box box-primary">
    <div class="box-header with-border">
        <div class="mailbox-controls">
            <button type="button" title="全选" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> 全选
            </button>
            <!-- <button id="trashall" type="button" title="删除" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i> 删除</button>
            <button id="clouse_setInterval" type="button" title="关闭自动刷新" class="btn btn-default btn-sm" data-setintervalid="2"> 关闭自动刷新</button> -->
        </div>
        <div class="box-tools pull-right">
            <form class="form-inline">
                <div class="form-group">
                    <label class="sr-only" for="exampleInputEmail3">节点名称</label>
                    <input class="form-control cloud-control" name="nodename" placeholder="节点名称" type="text">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="exampleInputPassword3">Password</label>
                    <input class="form-control cloud-lg-control" name="sendfile" placeholder="发送目录" type="text">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="exampleInputPassword3">Password</label>
                    <input class="form-control cloud-control" name="filename" placeholder="文件名" type="text">
                </div>
                <button class="btn btn-primary" id="sub_query" type="button">点击查询</button>
            </form>
        </div>
    </div>
    <div class="box-body no-padding">
        <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th> </th>
                        <th>节点名</th>
                        <th style="text-align: center;" align="center">发送目录</th>
                        <th style="text-align: center;" align="center">文件名</th>
                        <th style="text-align: center;" align="center">查询时间</th>
                        <th style="text-align: center;" align="center">查询状态</th>
                        <th style="text-align: center;" align="center">操作</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                    <?php if($data == '0'): ?>
                    <tr id="no_search_data">
                        <td colspan="6">没有查询记录</td>
                    </tr>
                    <?php endif; if(is_array($data) || $data instanceof \think\Collection || $data instanceof \think\Paginator): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?>
                    <tr>
                        <td style="text-align: left;">
                            <input value="<?php echo $data['cloudid']; ?>" type="checkbox"> </td>
                        <td style="text-align: center;" align="center"><?php echo $data['nodename']; ?></td>
                        <td style="text-align: center;" align="center"><?php echo $data['sendfile']; ?></td>
                        <td style="text-align: center;" align="center"><?php echo $data['filename']; ?></td>
                        <td style="text-align: center;" align="center"><?php echo $data['check_time']; ?></td>
                        <td style="text-align: center;" align="center" data-status="<?php echo $data['check_status']; ?>">
                            <?php if($data['check_status'] == '0'): ?> 查询中 <?php else: ?>
                            <span style="color:green;">已完成</span> <?php endif; ?>
                        </td>
                        <td style="text-align: center;" align="center">
                            <div class="btn-group">
                                <button id="show" class="btn btn-primary btn-sm" type="button" title="查看" data-cloudid="<?php echo $data['cloudid']; ?>" data-file="<?php echo $data['recv_filename']; ?>" data-status="<?php echo $data['check_status']; ?>"><i class="fa fa-eye"></i></button>
                                <button id="delete" class="btn btn-primary btn-sm" type="button" data-cloudid="<?php echo $data['cloudid']; ?>" title="删除"><i class="fa fa-trash-o"></i></button>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
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
$("#sub_query").on('click', function() {
    var nodename = $("[name=nodename]").val();
    var filename = $("[name=filename]").val();
    var sendfile = $("[name=sendfile]").val();
    if (!nodename) {
        $("[name=nodename]").focus();
        layer.msg('节点名称不能为空');
        return false;
    }
    if (!sendfile) {
        $("[name=sendfile]").focus();
        layer.msg('发送目录不能为空');
        return false;
    }
    if (!filename) {
        $("[name=filename]").focus();
        layer.msg('文件名不能为空');
        return false;
    }
    var loading = layer.load(1, {
        shade: [0.1, '#000'] //0.1透明度的白色背景
    });
    $.ajax({
            url: '<?php echo url("tool/filePost"); ?>',
            type: 'post',
            data: { 'nodename': nodename, 'filename': filename, 'sendfile': sendfile },
            success: function(json) {
                layer.close(loading);
                console.log(json);
                if (json.code && json.code == 1) {
                    layer.msg(json.msg, { time: 500 }, function() {
                        location.reload();
                    });
                } else {
                    layer.msg(json.msg);
                }
            },
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
})
$(".box-body").on('click', '#show', function() {
    var id = $(this).attr("data-cloudid");
    var status = $(this).attr("data-status");
    var file = $(this).attr("data-file");
    if (status == '0') {
        layer.msg("正在等待返回结果，请稍后再查看...",{time:1000},function(){
            location.reload();
        });
        return false;
    }
    $.ajax({
        url: '<?php echo url("Tool/showRecv"); ?>',
        type: 'post',
        data: { "id": id, "file": file },
        success: function(json) {
            json = eval("(" + json + ")");
            if (json.msg == 'ok') {
                layer.open({
                    type: 1,
                    title: '查询结果',
                    skin: 'show-box', //加上边框
                    area: ['720px', '335px'],
                    content: json.content
                });
                return false;
            }
            layer.msg(json.msg);
        }
    })
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