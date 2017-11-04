<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:64:"E:\webproject\mycms/application/index\view\user\login_index.html";i:1509751281;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>系统室管理系统</title>
    <link rel="stylesheet" href="__ROOT__/public/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="__ROOT__/public/static/css/login.css" />
    <link rel="stylesheet" href="__ROOT__/public/plugins/font-awesome/css/font-awesome.min.css" />
    <!--[if lt IE 9]>
  <script src="__ROOT__/public/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="__ROOT__/public/plugins/respond/respond.min.js"></script>
  <![endif]-->
</head>

<body>
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="item active" style="background:#223240">
                <img src="__ROOT__/public/static/images/login/top1.jpg" width="100%" />
            </div>
        </div>
        <div class="loginbox animated-500 fadeInDown">
            <div class="form">
                <form>
                    <div class="inputs">
                        <div>
                            <input id="username" name="username" type="text" placeholder="用户名" required="" autocomplete="on" />
                        </div>
                        <div>
                            <input id="password" name="password" type="password" placeholder="密码" required="" autocomplete="on" />
                        </div>
                    </div>
                    <div class="actions">
                        <input type="button" id="submit" value="登录" />
                    </div>
                    <div style="clear:both;"></div>
                </form>
            </div>
        </div>
        <div class="advertisement">
            <div class="ad_info">
                <span> 此处放置公告或广告通知等。 </span>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div class="container">
    <h2 class="tab-h2">「系统巡检报告查询」</h2>
    <p class="tab-p">简单的内容管理系统，让巡检更方便，更快捷</p>
    <div style="clear:both;"></div>
        <div class="row">
            <div class="col-md-4 col">
                <div class="media-left">
                    <img src="__ROOT__/public/static/images/login/linux.png" class="media-object" width="100px" alt="Linux系统" />
                    <!-- <i class="fa fa-linux" style="font-size:6em;"></i> -->
                </div>
                <div class="media-body">
                    <h4 class="media-heading">Linux巡检</h4>
                    <p>可查看Linux主机的硬盘使用率、文件系统、系统和应用报错等信息。</p>
                </div>
            </div>
            <div class="col-md-4 col">
                <div class="media-left">
                    <img src="__ROOT__/public/static/images/login/windows_xp.png" class="media-object" width="100px" alt="Linux系统" />
                    <!-- <i class="fa fa-linux" style="font-size:6em;"></i> -->
                </div>
                <div class="media-body">
                    <h4 class="media-heading">Windows巡检</h4>
                    <p>简介。</p>
                </div>
            </div>
            <div class="col-md-4 col">
                <div class="media-left">
                    <img src="__ROOT__/public/static/images/login/tab1-3.png" class="media-object"  onerror="this.src='__ROOT__/public/static/images/login/default.png'" width="100px" alt="Oracle巡检" />
                    <!-- <i class="fa fa-database" style="font-size:6em;width: 100px;"></i> -->
                </div>
                <div class="media-body">
                    <h4 class="media-heading">Oracle巡检</h4>
                    <p> </p>
                </div>
            </div>
            <div class="col-md-4 col">
                <div class="media-left">
                    <img src="__ROOT__/public/static/images/login/tab1-2.png" class="media-object" width="100px" alt="Linux系统" />
                    <!-- <i class="fa fa-road" style="font-size:6em;width: 100px;"></i> -->
                </div>
                <div class="media-body">
                    <h4 class="media-heading">MQ巡检</h4>
                    <p> </p>
                </div>
            </div>
        </div> 
    </div>
    <footer id="footer">
        <div class="container">
            <span class="copyright-content">推荐使用谷歌/IE9以上的浏览器访问&nbsp;  </span>
        </div>
    </footer>
    <script src="__ROOT__/public/plugins/jQuery/jquery.min.js"></script>
    <script src="__ROOT__/public/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="__ROOT__/public/plugins/layer/layer.js"></script>
    <script type="text/javascript">
    $("#submit").click(function() {
        var username = $("#username").val();
        var password = $("#password").val();
        if (!username) {
            layer.tips("请输入用户名", "#username", {
                tips: 1
            });
            $("#username").focus();
            return false;
        }
        if (!password) {
            layer.tips("请输入密码", "#password", {
                tips: 3
            });
            $("#password").focus();
            return false;
        }
        var loading = layer.load(1, {
            shade: [0.5, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
                url: '<?php echo url("index/Publics/doLogin"); ?>',
                type: 'POST',
                data: $("form").serialize(),
            })
            .done(function(json) {
                layer.close(loading);
                if (json.code == 1) {
                    layer.msg(json.msg, function() {
                        
                    });
                    location.href = json.url;
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
    </script>
</body>

</html>