<?php
error_reporting( E_ALL&~E_NOTICE );
session_start();
if ($_SESSION['username']&&$_SESSION["act"] == "inputhost") {
    require_once 'add.php';
    exit();
}

?><!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
        <title>系统巡检报告</title>  
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> 
            <link rel="stylesheet" type="text/css" href="css/login.css" />

    </head>
    <body>
        <h1>系统巡检报告控制台登录</h1>

        <div class="login" style="margin-top:50px;">

            <div class="header">
                <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a> 
                </div>
            </div>    
            <div id="login_err" class="login_err"></div>

            <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

                <!--登录-->
                <div class="web_login" id="web_login">


                    <div class="login-box">


                        <div class="login_form">
                            <form action="" name="login" accept-charset="utf-8" id="login" class="loginForm" method="post"> 
                                <div class="uinArea" id="uinArea">
                                    <label class="input-tips" for="u">帐号：</label>
                                    <div class="inputOuter" id="uArea">

                                        <input type="text" id="u" name="username" class="inputstyle"/>
                                    </div>
                                </div>
                                <div class="pwdArea" id="pwdArea">
                                    <label class="input-tips" for="p">密码：</label> 
                                    <div class="inputOuter" id="pArea">

                                        <input type="password" id="p" name="password" class="inputstyle"/>
                                    </div>
                                </div>

                                <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue" id="input_go"/></div>
                            </form>
                        </div>

                    </div>

                </div>
                <!--登录end-->
            </div> 

        </div>
        <!--div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div-->
        <script>
            jQuery(function ($) {
                $("#input_go").click(function () {
                    $("#input_go").val("登陆中...");
                    var username = $("input[name=username]").val();
                    if (!username) {
                        $("input[name=username]").focus();
                        return false;
                    }
                    var password = $("input[name=password]").val();
                    if (!password) {
                        $("input[name=password]").focus();
                        return false;
                    }
                    $.ajax({
                        url: 'login.php',
                        type: 'post',
                        data: $("#login").serialize(),
                        success: function (json) {
                            if (json == "10000") {
                                location.reload();
                            } else {
                                $("#input_go").val("登陆");
                                $("#login_err").html(json);
                            }

                        }
                    });
                    return false;
                });

            });
        </script>
    </body></html>