<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:56:"E:\webproject\mycms/application/index\view\tool\sms.html";i:1510204938;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1510114736;}*/ ?>
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
        中间件报警短信黑名单录入
        <small><a class="link" href="<?php echo url('Tool/smsList'); ?>">查看已有规则</a></small>
      </h1>
</section>
<div class="main-box clearfix ">
    <form method="post" id="sms_form" action="<?php echo url('tool/smsPost'); ?>" class="form form-horizontal">
        <div class="row from-box">
            <div class="form-group">
                <label class="col-lg-2 control-label">中间件</label>
                <div class="col-lg-10 col-sm-10">
                    <select name="type" id="type" class="form-control">
                        <option value=''>请选择</option>
                        <option value='GTP'>GTP</option>
                        <option value='TE'>TongEASY</option>
                        <option value='MQ'>MQ</option>
                    </select>
                    <div class="help-block">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">开始时间</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="strtime" id="strtime" value="">
                    <div class="help-block">
                        （<span class="text-red"> 若为空,则立即生效</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">结束时间</label>
                <div class="col-lg-10 col-sm-10">
                    <input type="text" class="form-control" name="endtime" id="endtime">
                    <div class="help-block">
                        （<span class="text-red"> 若为空,则立即生效</span>）
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">过滤关键字</label>
                <div class="col-lg-10 col-sm-10">
                    <textarea class="form-control" id="keywords" name="keywords" cols="50" rows="5"></textarea>
                    <div class="help-block">
                        <p style="font-size:18px;font-weight:800;color:#ffaa22">规则中可以用“+”或“#”联接（+代表“<span>与/and</span>”，#代表“<span>或/or</span>”），<span style="color:red;">关键字为空项则过滤掉所选中间件的所有短信</span>。</p>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">节点提示</label>
                <div class="col-lg-10 col-sm-10">
                    <div class="form-group">
                        <select name="sysname" id="sysname" class="form-control" style="max-width:200px;float:left;">
                            <option>请选择系统</option>
                        </select>
                        <select name="othername" id="othername" class="form-control" style="max-width:200px;float:left;display:none;">
                            <option>------</option>
                        </select>
                    </div>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="hidden" class="form-control" name="id" id="id" value="">
                    <button class="btn btn-success sms_add_submit" type="button">提 交</button>
                    <button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
/**
 * 获取当前时间 
 */
var date = new Date();
var hours = minutes = secondes = '';
if (date.getHours() < 10) {
    hours = '0' + date.getHours();
} else {
    hours = date.getHours();
}
if (date.getMinutes() < 10) {
    minutes = '0' + date.getMinutes();
} else {
    minutes = date.getMinutes();
}
if (date.getSeconds() < 10) {
    secondes = '0' + date.getSeconds();
} else {
    secondes = date.getSeconds();
}
var nowdate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + " " + hours + ':' + minutes + ':' + secondes;
$("#strtime,#endtime").val(nowdate);
/**
 * 提交规则
 * @author 钟朝辉 <zzhhuii@qq.com>
 * @date   2017-11-09T09:51:49+0800              
 */
$(".sms_add_submit").click(function() {
    var type = $("#type").val();
    if (!type || type == "请选择") {
        layer.msg("<span style='color:red'>请选择中间件！</span>");
        $("#type").focus();
        return false;
    }
    var loading = layer.load(1, {
        shade: [0.1, '#000'] //0.1透明度的白色背景
    });
    var url = $("#sms_form").attr('action');
    $.ajax({
            url: url,
            type: "post",
            data: $("#sms_form").serialize(),
        })
        .done(function(json) {
            layer.close(loading);
            if (json.code == 1) {
                layer.msg(json.msg,{time:500}, function() {
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
$(document).ready(function() {
    /**
     * 提示系统节点名
     * @author 钟朝辉 <zzhhuii@qq.com>
     * @date   2017-11-09T09:55:20+0800 
     */
    $("#type").on("change", function() {
        var v = $(this).val();
        $("#othername").hide();
        if (v == "请选择" || v == undefined) {
            $("#sysname").html('<option>请选择系统</option>');
            return false;
        }
        var get_nodes = '<?php echo url("tool/getSmsNode"); ?>'; 
        $.ajax({
                url: get_nodes + "?type=" + v,
                type: 'post',
            })
            .done(function(json) { 
                if (json.code == 1) {
                    if (json.data) {
                        var def = '';
                        if (v == 'TE') {
                            def = 'sys_name';
                        } else {
                            def = 'sysname';
                        }
                        options(json.data, 'sysname', def, '请选择系统');
                    } else {
                        $("#othername").html('<option>------</option>');
                    }
                } else {
                    layer.msg(json.msg);
                }
            })
            .fail(function(json) { 
                layer.open({
                    title: '系统错误',
                    area: ['50%', '80%'],
                    content: json.responseText
                });
            });
    });
    /**
     * 根据系统名查找节点名
     * @author 钟朝辉 <zzhhuii@qq.com>
     * @date   2017-11-09T11:32:38+0800 
     */
    $("#sysname").on("change", function() {
        var v = $(this).val();
        var t = $("#type").val();
        if (v == "请选择系统" || v == undefined) {
            $("#sysname").html('<option>请选择系统</option>');
            $("#othername").hide();
            return false;
        }
        var def = sel = '';
        if (t == 'MQ') {
            def = '队列管理器名';
            sel = 'qmname';
        } else if (t == 'GTP') {
            def = '节点名称';
            sel = 'nodename';
        } else if (t == 'TE') {
            def = '节点名称';
            sel = 'node_name';
        } else {
            def = '------';
        }
        var tag = $(this).parent().siblings(".help-block");
        var text = tag.html(); 
        if (text&&text!=' ') {
            text = text + '#';
        }
        console.log(text);
        var url = '<?php echo url("tool/getSmsNodeName"); ?>';
        tag.html(text + v); 
        $.ajax({
                url: url + '?sysname=' + v + '&type=' + t,
            })
            .done(function(json) { 
                if (json.code == 1) {
                    if (json.data) {
                        options(json.data, "othername", sel, def);
                    } else {
                        $("#othername").html('<option>------</option>');
                    } 
                } else {
                    layer.msg(json.msg);
                }
            })
            .fail(function(json) { 
                layer.open({
                    title: '系统错误',
                    area: ['50%', '80%'],
                    content: json.responseText
                });
            });
    });
      $("#othername").on("change",function(){
        var v = $(this).val(); 
        var tag = $(this).parent().siblings(".help-block");
        var text = tag.html();
        tag.html(text+'#'+v);
    })
    /**
     * 生成select选项
     * @author 钟朝辉 <zzhhuii@qq.com>
     * @date   2017-11-09T11:32:06+0800 
     */
    function options(data, wh, ckey, option) {
        if (data) {
            var ops = '<option>' + option + '</option>';
            for (var i = 0; i < data.length; i++) {
                ops += "<option>" + data[i][ckey] + "</option>";
            }
            $("#" + wh).html(ops);
            $("#" + wh).show();
        } else {
            $("#" + wh).html("<option>" + option + "</option>");
            $("#othername").hide();
        }
        return false;
    }
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
  
<script type="text/javascript" src="__ROOT__/public/plugins/laydate/laydate.js"></script>
<script>
laydate.render({ elem: '#endtime', type: 'datetime' });
laydate.render({ elem: '#strtime', type: 'datetime' });
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