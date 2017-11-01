<?php
error_reporting(E_ALL & ~E_NOTICE);
session_start();
if ((!$_SESSION['username'])||$_SESSION["act"] != "inputhost") {
    header("location:index.php");
    exit();
}
$indexdata = fopen("data/data.txt", "r");
$ii = 0;
$dataarr = "";
$nu_0 = 0;
$nu_l = 0;
if ($indexdata) {
    while (($datainfo = fgets($indexdata)) != FALSE) {
        if ($datainfo == "" || $datainfo == null)
            continue;
        $dataarr = array();
        $dataarr = explode(",", trim($datainfo));
        $start = substr($dataarr[2], 0, 1);
        if ($start == "0" && $nu < substr($dataarr[2], 1, 3)) {
            $nu_0 = (int) substr($dataarr[2], 1, 3) + 1;
            if ($nu_0 < 10) {
                $nu_0 = "00" . $nu_0;
            } elseif ($nu_0 > 9 && $nu_0 < 100) {
                $nu_0 = "0" . $nu_0;
            }
        }
        if (($start == "L" || $start == "l") && $nu_l <= substr($dataarr[2], 1, 3)) {
            $nu_l = (int) substr($dataarr[2], 1, 3) + 1;
            if ($nu_l < 10) {
                $nu_l = "00" . $nu_l;
            } elseif ($nu_l > 9 && $nu_l < 100) {
                $nu_l = "0" . $nu_l;
            } else {
                
            }
        }
        $ii = $ii + 1;
    }
}
?>
<!DOCTYPE html> 
<html>
    <head>
        <title>系统巡检报添加主机信息</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="js/bootstrap/css/bootstrap.min.css" />
        <!--<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>  -->
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <!--<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>  -->
        <link rel="stylesheet" type="text/css" href="js/jquery.confirm/jquery.confirm.css" /> 
        <script>  
            $.ajax({
                    url: 'pddx.php',
                    success: function (json) {  
                    if(json){
                        //location.reload();
                    }
                        // if(json=="1"){
                        //   $('#goindex').css('display', 'block');
                        //   $('#datatoindex').css("display","none");
                        // }else{
                        //   $('#datatoindex').css("display","block");
                        //   $('#goindex').css("display","none");
                        // }
                        // json=eval("("+json+")");
                        // if(json.code=="10001"){
                        //     $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                        //     $("#commonmodal").modal("show");
                        // }
                        
                        // $("#commonmodal").on('hidden.bs.modal', function () {
                        //     location.reload();
                        // });
                    }
                }); 
        </script>
        <style>
            body{
                background: #dadada none repeat scroll 0 0;
            }
            table {
                border-collapse: collapse;
                border-spacing: 0; 
            } 
            table tr input{
                padding:0;margin:0;
            }
            button, input, select, textarea,table,p {
                font: 12px/1.5 Arial,Helvetica,sans-serif;
            }
            .g {
                clear:both;
                margin: 0 auto;
                width: 80%;
                overflow: hidden;
            }
            .reset-area {
                background-color: #fff;
                margin: 15px auto 0;
                width: 100%;
            }
            .h{
                background-position: 0 0;
                height: 47px;
                text-align: center;
                background: #f5f5f5 url("js/jquery.confirm/header_bg.jpg") repeat-x scroll left bottom;
            }
            .b{
                height: auto;
                min-height: 347px;
                padding-top: 9px;
                text-align: center;
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
                width: 80%;
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
                position: relative;
                left: 35%;
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
                width: 100%;
                height: 10px;
                z-index: 1000; 
                background: #dadada none repeat scroll 0 0;
            }
            .fg{ 
                height: 10px;
                z-index: 1000;
                margin-left: -16%;
                width: 116%;
                background: #dadada none repeat scroll 0 0;
            } 
            .userinfo a{
                text-decoration: none;
            }
            #loginout{
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
            }
            #shownote{
                background-color: #f5f5f5 ;
                display: none;
                float: left;
                font-size: 12px;
                height: 24px;
                margin-right: -147px;
                margin-top: -24px;
                padding-left: 18px;
                padding-top: 4px;
                width: 120px;
            }
            #goindex{
                float: left;
                margin-left: -54px;
                margin-top: 26px;
            }
            #datatoindex{
                float: left; 
                margin-top: 26px;
            }
            #goindex a, #datatoindex a,#loginout{
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
            hr{
                margin-top: 30px;
            }
            #footer{
                text-align: center;
                width: 100%;
                font-family: 12px/1.5 Arial,Helvetica,sans-serif;
                color: #5889A2;
            }
            #footer span{
                color: #CC0295;
            }
        </style>
    </head>
    <body >
        <div class="header">
            <!-- <div id="goindex"><a href="javascript:;" target="_blank">从index.html到data.txt</a></div>
            &nbsp;&nbsp;&nbsp;
            <div id="datatoindex" ><a href="javascript:;" target="_blank">从data更新到index.html</a></div> -->
            <div class="userinfo">
                <span>用户名：</span><a href="changepwd.php"><?= $_SESSION['username']; ?></a>
                <div id="shownote">点击用户名修改密码</div>
                <button id="loginout">注销</button>
            </div>
        </div>
        <div class="g">
            <div class="reset-area">
                <div class="h">
                    <h1><span>系统巡检系统添加主机信息</span></h1>                    
                </div>
                <div class='fg1'></div>
                <div class="b">
                    <form method="post" name="addNodeForm" action="doAddNode">
                        <div class="tables">
                            <h2>主机1</h2>
                            <div class="inputnum" style="font-size: 16px;" id ="inputnum">
                                插入<input  style="padding:0;margin:0;height: 26px;" type="text"  name="innum" value="1" >台主机<button id ="execadd">执行</button>

                            </div> 
                            <table width="525" height="240" align="center" style="font-size: 16px;"   id="formtable"> 
                                <tr>
                                    <th align="right">系统名称：</th>
                                    <td align="left" colspan="4">  
                                        <input value="例如：集中监控系统1" onfocus="namefocus(this);" onblur="nameblur(this);" class="text vam" type="text"  style="padding:0;margin:0;"  name="nodename[]" id="nodename">
                                        <span style="color:red;"></span>
                                    </td>
                                </tr>                            
                                <tr>
                                    <th width="90"  align="right">主机名：</th>
                                    <td align="left" colspan="4"> 
                                        <input class="text" type="text" name="hostname[]" value="例如：hxkjkap1" onfocus="hostfocus(this);"  style="padding:0;margin:0;" onblur="hostblur(this);" id="hostname" />
                                        <span style="color:red;"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th align="right">所在地：</th>
                                    <td align="left" colspan="4"><select name="location_id[]">
                                            <option selected value="3">亦庄中金</option>
                                            <option  value="2">西三旗</option>
                                            <option value="7">东单</option>  
                                        </select></td>

                                </tr>
                                <tr>
                                    <th align="right">操作系统：</th>
                                    <td align="left" colspan="4"><select name="os_type[]"> 
                                            <option value="1">AIX</option>
                                            <option value="2">Solaris</option>
                                            <option value="4">Windows</option>
                                            <option value="8">Linux</option>
                                        </select></td>

                                </tr>
                                <tr>
                                    <th align="right">应用类型：</th>
                                    <td align="left" colspan="4">  
                                        <input type="checkbox" name="applist[0][]"  value="1">MQ
                                        <input type="checkbox" name="applist[0][]"  value="2">WAS
                                        <input type="checkbox" name="applist[0][]"  value="4">Oracle
                                        <input type="checkbox" name="applist[0][]"  value="8">TongEASY
                                        <input type="checkbox" name="applist[0][]"  value="16">Informix
                                        <input type="checkbox" name="applist[0][]"  value="64">GTP </td>

                                </tr>
                                <tr>
                                    <th align="right">服务ID：</th>
                                    <td align="left"  colspan="4"> 
                                        <input style="padding:0;margin:0;" class="text vam" type="text" name="server_id[]" id="server_id" onblur="chserverid(this)"> <span style="color:red;">&nbsp;例如：<span>L</span><span id="l_num"><?= $nu_l; ?></span>或0<span id="o_num"><?= $nu_0; ?></span>或<?= $ii; ?></span></td>

                                </tr>
                            </table> 
                        </div>   
                        <div style="margin-left:150px;"> 
                            <input class="button-submit" type="reset" name="button2" id="button2" value="重置" /> 
                            <input class="button-submit" type="button" name="button" id="button" value="提交" />  
                        </div>
                    </form>
                </div>
            </div>
            <hr>
            <div id="footer">使用<span>IE9+，Firebox，chrome</span>等浏览器可同时添加多条数据</div>
        </div>

        <div id="commonmodal" class="modal fade" style="display:none;">
            <!-- 窗口声明 -->
            <div class="modal-dialog modal-lg"  style="width:403px;margin:200px auto;">
                <!-- 内容声明 -->
                <div class="modal-content">
                    <div class="modal-header" style="font-size:16px;font-weight:bold;color:white;padding-left:8px;background: #157fcc none repeat scroll 0 0;height: 48px; line-height: 48px;  overflow: hidden;">
                        <button class="close" data-dismiss="modal"><span>&times;</span>
                        </button>
                        <h4 style="font-size:28px;font-weight:bold;margin-top: -20px;" class="modal-tittle panel-heading">信息提示</h4>
                    </div>
                    <div class="modal-body" style="text-align: center;font-size:18px;font-weight:bold;">
                        加载中.....
                    </div>
                    <div class="modal-footer">
                        <span id="msgview"></span>&nbsp;
                        <span id="button">
                            <button class="btn btn-primary" data-dismiss="modal">关闭</button>
                        </span>
                    </div>
                </div> 
            </div>
        </div> 
        <script>
            window.onscroll = function () {
                var inputnum = document.getElementById("inputnum");
                var height = inputnum.offsetTop;
                var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
                if (scrollTop > height && scrollTop > "161") {
                    inputnum.style.position = "fixed";
                    inputnum.style.top = "0px";
                    inputnum.style.left = "72%";
                } else {
                    inputnum.style.position = "relative";
                    inputnum.style.top = "-55px";
                    inputnum.style.left = "35%";
                }
                //console.log(height+","+scrollTop);
            };
            function chserverid(e) {
                var val = $(e).val();
                if (!val) {
                    $(e).css("border-color", "red");
                } else {
                    $(e).css({"color": "#000", "border-color": "#bcbcbc"});
                }
            }
            function hostfocus(e) {
                var val = $(e).val();
                if (!val || val == "例如：hxkjkap1") {
                    $(e).val("");
                }
            }
            function hostblur(e) {
                var val = $(e).val();
                if (!val) {
                    $(e).val("例如：hxkjkap1");
                    $(e).css({"color": "#8b8b8b", "border-color": "red"});
                } else {
                    $(e).css({"color": "#000", "border-color": "#bcbcbc"});
                }
            }
            function namefocus(e) {
                var val = $(e).val();
                if (!val || val == "例如：集中监控系统1") {
                    $(e).val("");
                }
            }
            function nameblur(e) {
                var val = $(e).val();
                if (!val) {
                    $(e).val("例如：集中监控系统1");
                    $(e).css({"color": "#8b8b8b", "border-color": "red"});
                } else {
                    $(e).css({"color": "#000", "border-color": "#bcbcbc"});
                }
            }
            function execdelect(zj) {
                var tagg = zj;
                var divs = $(tagg).siblings(".divt");
                var divnum = divs.length;
                var l_num = $(".tables #l_num").html();
                var o_num = $(".tables #o_num").html();
                var i = 2;
                $(tagg).remove();
                $(divs).each(function () {
                    l_num = Number(l_num) + 1;
                    o_num = Number(o_num) + 1;
                    if (l_num < 10) {
                        l_num = "00" + l_num;
                    } else if (l_num > 9 && l_num < 100) {
                        l_num = "0" + l_num;
                    }
                    if (o_num < 10) {
                        o_num = "00" + o_num;
                    } else if (o_num > 9 && o_num < 100) {
                        o_num = "0" + o_num;
                    }
                    $(this).children("h2").html("主机" + i);
                    $(this).find("table span #l_num").html(l_num);
                    $(this).find("table span #o_num").html(o_num);
                    $(this).find("[type=checkbox]").each(function () {
                        $(this).attr("name", "applist[" + (i - 1) + "][]"); 
                    }); 
                    i = i + 1;
                }); 
                return false;
            }
            jQuery(function ($) {
                var userAgent = window.navigator.userAgent.toLowerCase();
                //var bro = $.support;
                 var bro = $.browser;
                bro.ie9 = bro.msie && /msie 9\.0/i.test(userAgent);
                bro.ie8 = bro.msie && /msie 8\.0/i.test(userAgent);
                bro.ie7 = bro.msie && /msie 7\.0/i.test(userAgent);
                bro.ie6 = bro.msie && /msie 6\.0/i.test(userAgent);
                var isie = bro.ie6 || bro.ie7 || bro.ie8 || bro.ie9;
                if (isie) {
                    $("#inputnum").hide();
                }
                $(".userinfo a").hover(function () {
                    $("#shownote").show();
                });
                $(".userinfo a").mouseout(function () {
                    $("#shownote").hide();
                });
                //添加主机信息
                $("#execadd").click(function () {
                    var nurow = $("[name=innum]").val();
                    var tablesnum = $(".tables table").length;
                    var l_num = $("#l_num").html();
                    var o_num = $("#o_num").html();
                    l_num = Number(l_num) + tablesnum;
                    o_num = Number(o_num) + tablesnum;
                    if (l_num < 10) {
                        l_num = "00" + l_num;
                    } else if (l_num > 9 && l_num < 100) {
                        l_num = "0" + l_num;
                    }
                    if (o_num < 10) {
                        o_num = "00" + o_num;
                    } else if (o_num > 9 && o_num < 100) {
                        o_num = "0" + o_num;
                    } 
                    for (var i = 1; i <= nurow; i++) {
                        tablesnum = tablesnum + 1;
                        var html = "<div class='divt' id='zj" + tablesnum + "'><div class='fg'></div>";
                        html += "<h2>主机" + tablesnum + "</h2>";
                        html += "<div class='inputnum'><span onclick='execdelect(zj" + tablesnum + ")' id ='execdelect'>删除</span></div>";
                        html += "<table style='font-size: 16px;' width='525' align='center' height='240'>";
                        var tablecont = $("#formtable").html();
                        //console.log(tablecont);
                        var replacec = 'name="applist[' + (tablesnum - 1) + '][]"';
                        html += tablecont.replace(/name="applist\[[0-9]\]\[\]"/g, replacec);
                        html = html.replace(/<span(.)id="l_num">([0-9]{3})<\/span>/, "<span id='l_num'>" + l_num + "<\/span>");
                        html = html.replace(/<span(.)id="o_num">([0-9]{3})<\/span>/, "<span id='o_num'>" + o_num + "<\/span>");
                        html += "</table></div>";
                        $(".tables").append(html);
                    }
                    return false;
                });
                $("#loginout").click(function () {
                    location.href = "loginout.php";
                });
                //提交表单
                $("[name=button]").click(function () {
                    var mag = true;
                    $("[name=addNodeForm]").find("#nodename").each(function () {
                        var nodename = $(this).val();
                        var zhujin = $(this).parents("table").siblings("h2").html();
                        if (!nodename || nodename === "例如：集中监控系统1") {
                            alert(zhujin + "  系统名称不能为空");
                            $(this).focus();
                            $(this).css("border-color", "red");
                            mag = false;
                            return false;
                        } else {
                            mag = true;
                        }
                    });
                    if (!mag) {
                        return false;
                    }
                    $("[name=addNodeForm]").find("#hostname").each(function () {
                        var hostname = $(this).val();
                        var zhujin = $(this).parents("table").siblings("h2").html();
                        if (!hostname || hostname === "例如：hxkjkap1") {
                            alert(zhujin + "  主机名称不能为空");
                            $(this).focus();
                            $(this).css("border-color", "red");
                            mag = false;
                            return false;
                        } else {
                            mag = true;
                        }
                    });
                    if (!mag) {
                        return false;
                    }
                    $("[name=addNodeForm]").find("#server_id").each(function () {
                        var hostname = $(this).val();
                        var zhujin = $(this).parents("table").siblings("h2").html();
                        if (!hostname) {
                            alert(zhujin + "  SERVERID不能为空");
                            $(this).focus();
                            $(this).css("border-color", "red");
                            mag = false;
                            return false;
                        } else {
                            mag = true;
                        }
                    });
                    if (mag) {
                        $.ajax({
                            url: 'data.php',
                            type: 'post',
                            data: $("[name=addNodeForm]").serialize(),
                            success: function (json) {
                                $.confirm({
                                    'title': '添加主机提示',
                                    'message': json,
                                    'buttons': {
                                        'Yes': {
                                            'class': 'blue',
                                            'action': function () {
//                                    elem.slideUp();
                                                $.ajax({
                                                    url: 'doaddnode.php',
                                                    type: 'post',
                                                    data: $("[name=addNodeForm]").serialize(),
                                                    success: function (json) {
                                                        json = eval("(" + json + ")");
                                                        if (json.code == '10000') {
                                                            alert(json.message);
                                                            //clearForm("[name=addNodeForm]");
                                                            location.reload();
                                                        } else {
                                                            alert(json.message);
                                                        }
                                                    }
                                                });
                                            }
                                        },
                                        'No': {
                                            'class': 'gray',
                                            'action': function () {}
                                        }
                                    }
                                });
                            }
                        });
                    }
                    return false;
                });
            });
            //清空表单
            function clearForm(form) {
                $(':input', form).each(function () {
                    var type = this.type;
                    var tag = this.tagName.toLowerCase();
                    if (type == 'text' || type == 'password' || tag == 'textarea')
                        this.value = "";
                    else if (type == 'checkbox' || type == 'radio')
                        this.checked = false;
                    else if (tag == 'select')
                        this.selectedIndex = tag;
                });
            } 
        </script>  
        <script type="text/javascript" src="js/jquery.confirm/jquery.confirm.js"></script>
    </body>
</html>
