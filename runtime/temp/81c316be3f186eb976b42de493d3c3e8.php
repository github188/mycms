<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:65:"E:\webproject\mycms/application/index\view\Tool\gtpfilecheck.html";i:1510564038;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
label {
    padding-right: 0px !important;
    margin-right: -21px !important;
    margin-top: 6px;
}

table {
    margin-top: 5px;
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
        GTP传输失败文件查询 
      </h1>
</section>
<div class="invoice container-fluid">
    <form id="gtp_fail_form" name="inputs" action="<?php echo url('tool/gtpPost'); ?>">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-lg-3 control-label">开始时间</label>
                    <div class="col-lg-8 col-sm-10">
                        <input type="text" class="form-control" name="strtime" id="strtime" placeholder="yy-mm-dd HH:ii:ss" value="">
                        <div class="help-block">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-lg-3 control-label">结束时间</label>
                    <div class="col-lg-9 col-sm-10">
                        <input type="text" class="form-control" name="endtime" id="endtime" placeholder="yy-mm-dd HH:ii:ss" value="">
                        <div class="help-block">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <button class="btn btn-success" id="gtp_fail_file">查 询</button>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-xs-12 action-header">
            <div class="pull-left">
                <!-- <button class="btn  btn-default"><i class="fa fa-square-o"></i> 全 选</button> -->
                <!-- <button class="btn  btn-default"><i class="fa fa-trash-o"></i> 删 除</button> -->
            </div>
        </div>
    </div>
    <div class="row gtp_list">
        <div class="col-xs-12 table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th width="40"></th>
                        <th>
                            <div align="center">开始时间</div>
                        </th>
                        <th>
                            <div align="center"> 结束时间
                            </div>
                        </th>
                        <th>
                            <div align="center">查询时间 </div>
                        </th>
                        <th>
                            <div align="center">查询状态 </div>
                        </th>
                        <th>
                            <div align="center">操作 </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $key = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($key % 2 );++$key;?>
                    <tr>
                        <th width="40">
                            <input type="checkbox" name="ids[]" id="id" value="<?php echo $list['id']; ?>">
                        </th>
                        <td>
                            <div align="center"><?php echo $list['strtime']; ?></div>
                        </td>
                        <td>
                            <div align="center"> <?php echo $list['endtime']; ?>
                            </div>
                        </td>
                        <td>
                            <div align="center"><?php echo $list['indate']; ?></div>
                        </td>
                        <td>
                            <div align="center"><?php echo $list['status']=='N'?'正在查询':'已完成'; ?></div>
                        </td>
                        <td>
                            <div align="center">
                                <div class="btn-group">
                                    <button filename="<?php echo $list['filename']; ?>" id="scan_results" scan-url="<?php echo url('tool/scanResult'); ?>" class="btn btn-primary btn-sm" type="button" title="查看">查看</button>
                                    <button filename="<?php echo $list['filename']; ?>" id="del_results" scan-url="<?php echo url('tool/delResult'); ?>" class="btn btn-primary btn-sm" type="button" title="删除">删除</button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
        </div>
    </div>
    <!--     <div class="row">
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
    </div> -->
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
  
<script type="text/javascript" src="__ROOT__/public/plugins/laydate/laydate.js"></script>
<script>
$(document).ready(function() {
    /**
     * 初始化输入时间
     * @type {String}
     */
    laydate.render({ elem: '#endtime', type: 'datetime', value: new Date() });
    laydate.render({ elem: '#strtime', type: 'datetime', value: new Date() });
    /**
     * 提交
     * @author 钟朝辉 <zzhhuii@qq.com>
     * @date   2017-11-10T11:06:21+0800 
     */
    $("#gtp_fail_file").on('click', function() {
        var strtime = $("input[name=strtime]").val();
        var endtime = $("input[name=endtime]").val();
        var posturl = $("#gtp_fail_form").attr('action');
        if (!strtime) {
            layer.msg("开始时间不能为空！");
            $("#strtime").focus();
            return false;
        }
        if (!endtime) {
            layer.msg("结束时间不能为空！");
            $("#endtime").focus();
            return false;
        }
        var loading = layer.load(1, { shade: [0.1, '#000'] });
        $.ajax({
                url: posturl,
                type: 'POST',
                data: { strtime: strtime, endtime: endtime },
            })
            .done(function(json) {
                layer.close(loading);
                if (json.code == 1) {
                    layer.msg(json.msg, { time: 500 }, function() {
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

        return false;
    });

    function deleteHistoryLog(filename) {
        layer.confirm('结果文件已被清理，是否删除本条记录？', {
                'title': '提示信息',
                'btn': ['删除', '取消']
            },
            function() {
                $.ajax({
                    url: '<?php echo url("tool/delGtpErrHistory"); ?>?filename=' + filename,
                    success: function(json) {
                        layer.closeAll();
                        if (json.code == 1) {
                            layer.msg(json.msg, { time: 500 }, function() {
                                location.reload();
                            });
                        } else {
                            layer.msg(json.msg);
                        }
                    }
                })
            }
        );
    }
    $(".gtp_list").on('click', '#scan_results', function() {
        var filename = $(this).attr("filename");
        $.ajax({
            url: $(this).attr("scan-url") + "?filename=" + filename,
            type: "post",
            success: function(json) {
                if (json.code == 1) {
                    $show = layer.open({ 'title': '查询结果-' + filename, 'area': ['700px', '90%'], 'content': json.msg });
                } else {
                    if (json.msg == 'del') {
                        deleteHistoryLog(filename);
                    } else {
                        layer.msg(json.msg);
                    }
                }
            }
        });
        return false;
    });
    /**
     * 删除GTP传输失败文件查询记录
     * @author 钟朝辉 <zzhhuii@qq.com>
     * @date   2017-11-13T17:04:02+0800 
     */
    $(".gtp_list").on('click', '#del_results', function() {
        var filename = $(this).attr("filename");
        $.ajax({
            url: $(this).attr("scan-url") + "?filename=" + filename,
            type: "post",
            success: function(json) {
                if (json.code == 1) {
                     layer.msg("删除成功",{time:500},function(){
                        location.reload();
                     });
                } 
                 layer.msg(json.msg);
            }
        });
        return false;
    });
    setInterval(function() {
        $.ajax({
            url: '<?php echo url("tool/checkingToTemp"); ?>',
        })
    }, 1000);
    setInterval(function() {
        location.reload();
    }, 30000);
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