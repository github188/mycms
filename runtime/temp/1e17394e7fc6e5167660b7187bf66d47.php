<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"E:\webproject\mycms/application/index\view\user\login.html";i:1509275806;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>登陆</title>
    <link rel="stylesheet" href="__ROOT__/public/report/css/login.css" />
    <style>
    .title {
        background: #6699cc url(__ROOT__/public/report/images/wall_page/<?php echo $img; ?>.jpg) 0px -92px;
    }
    </style>
</head>

<body>
    <img class="background" src="__ROOT__/public/report/images/wall_page/<?php echo $img; ?>.jpg" />
    <div class="loginbox animated-500 fadeInDown">
        <div class="title">
            <div class="logo">
                <i class="icon-cloud"></i>系统室管理后台登陆
            </div>
        </div>
        <div class="form">
            <form>
                <div class="inputs">
                    <div>
                        <span>用户名：</span>
                        <input id="username" name="username" type="text" placeholder="用户名" required="" autocomplete="on" />
                    </div>
                    <div>
                        <span>密码：</span>
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
    <div class="common-footer">
        <span class="copyright-content">推荐使用谷歌/IE9以上的浏览器访问&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://kodcloud.com/" target="_blank" draggable="false"> 下载谷歌浏览器</a> </span>
    </div>
    <script src="__ROOT__/public/plugins/jQuery/jquery.min.js"></script>
    <script src="__ROOT__/public/plugins/layer/layer.js"></script>
    <script>
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
                        location.href = json.url;
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
    </script>
</body>

</html>