<?php
error_reporting(E_ALL & ~E_NOTICE);
session_start();
if (!$_SESSION['username']||$_SESSION["act"] != "inputhost") {
    header("location:index.php");
    exit();
}
?>
<!DOCTYPE html> 
<html>
    <head>
        <title>修改用户密码</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>  
        <link rel="stylesheet" type="text/css" href="js/jquery.confirm/jquery.confirm.css" /> 
        <style>
            body{
                background: #dadada none repeat scroll 0 0;
            }
            table {
                border-collapse: collapse;
                border-spacing: 0;
            } 
            button, input, select, textarea,table,p {
                font: 12px/1.5 Arial,Helvetica,sans-serif;
            }
            .g {
                clear:both;
                margin: 0 auto;
                width: 1002px;
            }
            .reset-area {
                background-color: #fff;
                margin: 15px auto 0;
                width: 791px;
            }
            .h{
                background-position: 0 0;
                height: 47px;
                padding-left:251px;
                background: #f5f5f5 url("js/jquery.confirm/header_bg.jpg") repeat-x scroll left bottom;
            }
            .b{
                height: auto;
                min-height: 347px;
                padding-top: 9px;
                margin-left:150px;
            }
            .button-submit{
                background-color: rgb(180, 7, 7);
                background-image: none;
                border-color: rgb(180, 7, 7);
                border-radius: 3px;
                border-style: solid;
                border-width: 0 0 2px;
                color: #fff;
                cursor: pointer;
                font-size: 14px;
                font-weight: bold;
                height: 36px;
                padding: 8px 30px;
                text-align: center;
                width: auto;
            }
            .text {
                width: 239px;
                border: 1px solid #bcbcbc;
                border-radius: 4px;
                color: #8b8b8b;
                height: 20px;
                line-height: 20px;
                padding: 6px;
            }
            .vam {
                vertical-align: middle;
            } 
            .header {
                margin: 0 auto;
                width: 791px;
            }
            .userinfo{
                margin:20px auto 10px auto; 
                font-size: 20px;
                font-weight: 900;
                color: #5c5c5c;
                float: right;
            }
            .userinfo span:last-child{
                font-size: 16px;
                margin: auto 20px; 
                cursor: pointer;
            }
            .inputnum{
                /*                float: right;
                                margin-top: -50px;
                                margin-right: 20px;*/
                position: relative;
                left: 490px;
                top:-55px;
                font:12px/1.2 Arial,Helvetica,sans-serif;
            }
            .inputnum input{
                width: 20px;
                border: 1px solid #bcbcbc;
                border-radius: 4px;
                color: #8b8b8b;
                height: 12px; 
                padding: 6px;
            }
            #execadd{
                padding: 1px 8px;
                text-align: center;
                border-radius: 5px; 
                cursor:pointer;
            }
            .fg1{
                width: 800px;
                height: 10px;
                z-index: 1000; 
                background: #dadada none repeat scroll 0 0;
            }
            .fg{
                width: 800px;
                height: 10px;
                z-index: 1000;
                margin-left: -24%; 
                background: #dadada none repeat scroll 0 0;
            } 
/*            #loginout{
                background-color: rgb(251, 155, 155);
                background-image: none;
                border-color: rgb(10, 7, 7);
                border-radius: 3px;
                border-style: solid;
                border-width: 0 0 2px;
                color: #fff;
                cursor: pointer;
                font-size: 14px;
                font-weight: bold;
                height: 36px;
                margin-left: 54px;
                padding: 8px 14px;
                text-align: center;
                width: auto;
            }*/
            #goindex{
                float: left;
                margin-left: -54px;
                margin-top: 26px;
            }
            #goindex a,#loginout{
                background-color: rgb(251, 155, 155);
                background-image: none;
                border-color: rgb(10, 7, 7);
                border-radius: 3px;
                border-style: solid;
                border-width: 0 0 2px;
                color: #fff;
                cursor: pointer;
                font-size: 14px;
                font-weight: bold;
                height: 36px;
                margin-left: 54px;
                padding: 8px 14px;
                text-align: center;
                width: auto;
                text-decoration: none;
            }
        </style>
    </head>
    <body >
        <div class="header">
            <div id="goindex"><a href="index.php">返回首页</a></div> 
            <div class="userinfo">
                <span>用户名：</span><?= $_SESSION['username']; ?>
                <button id="loginout">注销</button>
            </div>
        </div>
        <div class="g">
            <div class="reset-area">
                <div class="h">
                    <h1><span>修改用户密码</span></h1>                    
                </div>
                <div class='fg1'></div>
                <div class="b">
                    <form method="post" name="changepwd" action="changepwd">
                        <div class="tables"> 
                            <table width="525" height="240" id="formtable"> 
                                <tr>
                                    <th align="right">原密码：</th>
                                    <td colspan="4">  
                                        <input value="" onblur="onblure(this);" class="text vam" type="password" name="oldpassword" id="oldpassword">
                                        <span id="pwdts" style="color:red;"></span>
                                    </td>
                                </tr>                            
                                <tr>
                                    <th width="90"  align="right">新密码：</th>
                                    <td colspan="4"> 
                                        <input class="text" type="password" name="newpassword1" value=""/>
                                        <span style="color:red;"></span>
                                    </td>
                                </tr> 
                                <tr>
                                    <th align="right">确认新密码：</th>
                                    <td colspan="4"> 
                                        <input class="text vam" type="password" name="newpassword2" id="newpassword2" onblur="pp(this)"> <span  id="newpassword2" style="color:red;"></span> </td>

                                </tr>
                            </table> 
                        </div>   
                        <div style="margin-left:150px;"> 
                            <input class="button-submit" type="reset" name="button2" id="button2" value="重置" /> 
                            <input class="button-submit" type="button" name="button" id="submit" value="提交" />  
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <script>
            function onblure(e) {
                var old = $(e).val();
                if (old) {
                    $(e).css("border-color", "#bcbcbc");
                    var data = {"oldpassword": old};
                    $.ajax({
                        url: "login.php?action=changepwd",
                        data: data,
                        type: "post",
                        success: function (json) {
                            if (json != "10000") {
                                $("#pwdts").html("密码错误");
                                $("#pwdts").css("color", "red");
                                console.log(json);
                            } else {
                                $("#pwdts").html("正确");
                                $("#pwdts").css("color", "blue");
                            }
                        }
                    })
                } else {
                    $(e).css("border-color", "red");
                }

            }
            function pp() {
                var newpassword1 = $("[name=newpassword1]").val();
                var newpassword2 = $("[name=newpassword2]").val();
                if (newpassword1 !== newpassword2) {
                    $("[name=newpassword2]").focus();
                    $("span#newpassword2").html("两次新密码输入不一致");
                    $("[name=newpassword2]").css("border-color", "red")
                    return false;
                } else {
                    $("span#newpassword2").html("");
                    $("[name=newpassword2]").css("border-color", "#bcbcbc");
                }
            }
            jQuery(function ($) {
                $("#loginout").click(function () {
                    location.href = "loginout.php";
                });
                //提交表单
                $("#submit").click(function () {
                    var old = $("#oldpassword").val();
                    if (!old) {
                        $("#oldpassword").focus();
                        alert("请输入原密码");
                        return false;
                    }
                    var newpassword1 = $("[name=newpassword1]").val();
                    if (!newpassword1) {
                        $("[name=newpassword1]").focus();
                        alert("请输入新密码");
                        return false;
                    }
                    var newpassword2 = $("[name=newpassword2]").val();
                    if (!newpassword2) {
                        $("[name=newpassword2]").focus();
                        alert("请再次输入新密码");
                        return false;
                    }
                    if (newpassword1 !== newpassword2) {
                        $("[name=newpassword2]").focus();
                        $("[name=newpassword2]").css("border-color", "red");
                        $("span#newpassword2").html("两次新密码输入不一致");
                        return false;
                    }
                    $.ajax({
                        url: "login.php?action=docpwd",
                        data: $("[name=changepwd]").serialize(),
                        type: "post",
                        success: function (json) {
                            if (json === "10000") {
                                alert("修改成功");
                                location.href = "loginout.php";
                            }
                            console.log(json);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
