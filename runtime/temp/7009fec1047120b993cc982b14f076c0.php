<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:58:"E:\webproject\mycms/application/index\view\tool\addeq.html";i:1509677153;s:59:"E:\webproject\mycms/application/index\view\public\base.html";i:1509672427;}*/ ?>
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
 <div class="main-box clearfix ">
    <form id="inputs" name="inputs">
                    <ul class="shop-list">
                        <li class="list"><label class="shop-list-tit"><span>发现日期</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="hapend_date" name="hapend_date" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                                </div>
                            </div></li>
                    </ul>
                    <div class="slice"></div>
                    <ul class="shop-list"> 
                        <li class="list"><label class="shop-list-tit"><span>序列号</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="codeid"  name="codeid">
                                </div>
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>所在机房</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div  id="jifang"> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金421</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金422</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金433</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金434</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金725</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金726</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金727</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">中金736</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">西三旗</span></a></span> 
                                        <span><a href="javascript:void(0);" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>                           
                                    </div> 
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>环境类型</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div  id="huanjing" name="huanjing">  
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">测试/准生产</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">生产</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">灾备</span></a></span>

                                    </div> 
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>业务名称</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="yewu" name="yewu">
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>设备类型</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div   id="e_type" name="e_type">
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">小型机</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">PC服务器</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">存储</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">其它</span></a></span>
                                    </div>
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>设备品牌</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div id="e_pinpai">
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">IBM </span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">华为</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">联想</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">浪潮</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">EMC </span></a></span>
                                    </div>
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>设备型号</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="e_xinghao" name="e_xinghao">
                                </div> 
                            </div></li> 
                        <li class="list"><label class="shop-list-tit"><span>IP地址</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="ip" name="ip">
                                </div> 
                            </div></li> 
                    </ul>
                    <div class="slice"></div>
                    <ul class="shop-list">
                        <li class="list"><label class="shop-list-tit"><span>预警情况</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div  id="yujing">
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">监控</span></a></span>
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">巡检</span></a></span> 
                                    </div>
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>故障部位</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div  id="buwei">
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">CPU</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">内存</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">硬盘</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">电源</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">风扇</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">其它</span></a></span>
                                    </div>
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>是否需要停机</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div  id="istingji">
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">在线更换</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">停机更换</span></a></span> 
                                        <span><a href="javascript:void(0);" class="b-item"><span class="text">已经宕机</span></a></span> 
                                    </div>
                                </div> 
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>设备使用年限</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <div class="input-group" style="width:60px;"> 
                                        <input  type="text" class="form-control cover_padding_6_10" id="syears" name="syears">
                                        <div class="input-group-addon cover_padding_6_3">年</div>
                                    </div>
                                </div> 
                            </div></li>
                    </ul>
                    <div class="slice"></div>
                    <ul class="shop-list">
                        <li class="list"><label class="shop-list-tit"><span>处理人员</span></label>
                            <div class="shop-list-con">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="chuli" name="chuli">
                                </div>
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>处理结果</span></label>
                            <div class="shop-list-con" style="position: static;">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="result" name="result">
                                </div>
                            </div></li>
                        <li class="list"><label class="shop-list-tit"><span>恢复日期</span></label>
                            <div class="shop-list-con" style="position: static;">
                                <div class="shop-ui-block ui-block-auto">
                                    <input type="text" class="form-control" id="huifu_date" name="huifu_date" placeholder="2017-04-02" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"> 
                                </div>
                            </div></li>
                    </ul> 

                    <div class="shop-submit-wrap">
                        <div class="shop-submit"> 
                            <a class="shop-btn" href="javascript:void(0)">提交</a>
                        </div>
                    </div>
                </form>
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