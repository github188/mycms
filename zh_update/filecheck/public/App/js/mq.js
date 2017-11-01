/**
 * MQ页面操作js
 */

jQuery(function ($) {
    var height = $(window).height();
    $("#cmdResult").height(height - 100);
    $("#Checkall").click(function () {
        $("[name=checkbox[]]:checkbox").attr("checked", true);
    });
    $("#noCheckall").click(function () {
        $("[name=checkbox[]]:checkbox").attr("checked", false);
    });
    //反选
    $("#CheckR").click(function () {
        $("[name=checkbox[]]:checkbox").each(function () {
            $(this).attr("checked", !$(this).attr("checked"));
        });
    });
    $("#MqAllExport").click(function () {
        var arr = new Array();
        var i = 0;
        $("[name=checkbox[]]:checked").each(function () {
            arr[i] = $(this).val();
            i++;
        });
        if (arr[0]) {
            window.location = "/index.php/Home/Mq/ExportAll?mq_id=" + arr;
        } else {
            alert("请选择要导出的数据");
        }
        return false;
    });
    //simselecte
    $("#simbutton").click(function () {
        var dates = $("[name=dates]").val();
        var beginTime = $("input[name=beginTime]").val();
        var beginHour = $("[name=beginHour]").val();
        var beginMinute = $("[name=beginMinute]").val();
        var endTime = $("[name=endTime]").val();
        var endHour = $("[name=endHour]").val();
        var endMinute = $("[name=endMinute]").val();
        var simkey = $("[name=simkey]").val();
        var simquery = $("[name=simquery]").val();
        if (beginTime || endTime) {
            if (!beginTime) {
                alert("开始时间不能为空！");
                $("[name=beginTime]").focus();
                return false;
            }
            if (!endTime) {
                alert("结束时间不能为空！");
                $("[name=endTime]").focus();
                return false;
            }
            var begindate = beginTime + " " + beginHour + ":" + beginMinute + ":00";
            var enddate = endTime + " " + endHour + ":" + endMinute + ":00";
            if (begindate > enddate) {
                alert("开始时间不能大于结束时间！");
                return false;
            }
        }
//        if (!beginTime && !endTime && !simkey) {
//            alert("请输入查询条件");
//            return false;
//        }
        $.ajax({
            url: "SimDoS",
            data: $("#simForm").serialize(),
            type: "post",
            success: function (json) {
                $("#simtbody").html();
                $("#simtbody").html(json);
            }
        });
        return false;
    });
    $("#simExportE").click(function () {
        var arr = new Array();
        var i = 0;
        $("[name=checkbox[]]:checked").each(function () {
            arr[i] = $(this).val();
            i++;
        });
        if (arr[0]) {
            window.location = "/index.php/Home/Mq/ExportAll?mq_id=" + arr;
        } else {
            alert("请选择要导出的数据");
        }
        return false;
    });
    //SYN
    $("#synbutton").click(function () {
        var arr = new Array();
        var i = 0;
        var dates = $("[name=dates]").val();
        var beginTime = $("input[name=beginTime]").val();
        var beginHour = $("[name=beginHour]").val();
        var beginMinute = $("[name=beginMinute]").val();
        var endTime = $("[name=endTime]").val();
        var endHour = $("[name=endHour]").val();
        var endMinute = $("[name=endMinute]").val();
        var simkey = $("[name=simkey]").val();
        var simquery = $("[name=simquery]").val();
        if (beginTime || endTime) {
            if (!beginTime) {
                alert("开始时间不能为空！");
                $("[name=beginTime]").focus();
                return false;
            }
            if (!endTime) {
                alert("结束时间不能为空！");
                $("[name=endTime]").focus();
                return false;
            }
            var begindate = beginTime + " " + beginHour + ":" + beginMinute + ":00";
            var enddate = endTime + " " + endHour + ":" + endMinute + ":00";
            if (begindate > enddate) {
                alert("开始时间不能大于结束时间！");
                return false;
            }
        }
        $("#synForm [name=show_key[]]:checked").each(function () {
            arr[i] = $(this).val();
            i++;
        });
        if (!arr[0]) {
            alert("请选择要查询的字段");
            return false;
        }
        $.ajax({
            url: "SynDoS?key=" + arr,
            data: $("#synForm").serialize(),
            type: "post",
            success: function (json) {
                $("#synShowD").html();
                $("#synShowD").html(json); 
            }
        }); 
        return false;
    });
    //导出Excel
    $("#SynExportE").click(function () {
        var arr = new Array();
        var i = j = 0;
        $(".che [name=checkbox[]]:checked").each(function () {
            arr[i] = $(this).val();
            i++;
        });
        var keys = new Array();
        $("[name=show_key[]]:checked").each(function () {
            keys[j] = $(this).val();
            j++;
        });
        console.log(arr);

        var data = $("#synForm").serialize()
        if (arr[0]) {
            window.location = "/index.php/Home/Mq/ExportPart?mq_id=" + arr + "&&" + data;
        } else {
            alert("请选择要导出的数据");
        }
        return false;
    });
    //下载
    $("#DLMqs").click(function () {
        var dir = $("[name=downdir]").val()
        if (!dir) {
            console.log("adasdsa");
            return false;
        }

        window.location = "download?dirurl=" + dir;

    });
    //返回
    $("#reDir").click(function () {
        var rooturl = $("[name=rooturl]").val()
        var churl = $("[name=churl]").val();
        var dir = $("[name=dirurl]").val();
        var dirnum = parseInt($("[name=dirnum]").val());
        var file = "";
        if (dirnum == 1) {
            file = rooturl;
            dirnum = 0;
        } else if (dirnum >= 2) {
            file = churl;
            dirnum = 1;
        } else {
            alert("这是根目录");
            return false;
        }
        console.log(file);
        $.ajax({
            url: 'CheckStatus?dir=' + file,
            type: 'post',
            success: function (json) {
                $("#ShowDir").html();
                $("#ShowDir").html(json);
                $("#dirurl").val(file);
                $("#dirnum").val(dirnum);
            }
        });

    });
    //搜索目录/文件
    $("#dirCheck").click(function () {
        var beginTime = $("input[name=beginTime]").val();
        var beginHour = $("[name=beginHour]").val();
        var beginMinute = $("[name=beginMinute]").val();
        var endTime = $("[name=endTime]").val();
        var endHour = $("[name=endHour]").val();
        var endMinute = $("[name=endMinute]").val();
        if (beginTime || endTime) {
            if (!beginTime) {
                alert("开始时间不能为空！");
                $("[name=beginTime]").focus();
                return false;
            }
            if (!endTime) {
                alert("结束时间不能为空！");
                $("[name=endTime]").focus();
                return false;
            }
            var begindate = beginTime + " " + beginHour + ":" + beginMinute + ":00";
            var enddate = endTime + " " + endHour + ":" + endMinute + ":00";
            if (begindate > enddate) {
                alert("开始时间不能大于结束时间！");
                return false;
            }
        }
        $.ajax({
            url: "DirSearch",
            data: $("#DirForm").serialize(),
            type: "post",
            success: function (json) {
                if (json == 10001) {
                    $("#ShowDir").html();
                    $("#ShowDir").html("<span style='color:red;margin:10px 40%;'><strong>没有找到主机名为" + $("[name=Dirkey]").val() + "的文件夹</trong><span>");
                    return false;
                } else if (json == null || json == "") {
                    $("#ShowDir").html();
                    $("#ShowDir").html("<span style='color:red;margin:10px;width:100%;algin:center;'><strong>目录为空</trong><span>");
                    return false;
                }
                var json = eval("(" + json + ")");
                if (json.data == null || json == null || json == " ") {
                    $("#ShowDir").html();
                    $("#ShowDir").html("<span style='color:red;margin:10px;width:100%;algin:center;'><strong>没有在主机" + $("[name=Dirkey]").val() + "上找到从" + begindate + "到" + enddate + "的数据</trong><span>");
                    return false;
                }
                $("#ShowDir").html();
                $("#ShowDir").html(json.data);
                $("#nzhuji").html(json.nzhuji);
                var ss = enddate - begindate
                console.log(json);
                console.log(ss);
            }
        });
        return false;
    });
    //cmd命令执行
    $("#cmd_execute").click(function () {
        var cmdOrder = $("[name=cmdOrder]").val();
        $.ajax({
            url: 'CmdExecte?order=' + cmdOrder,
            success: function (json) {
                //$("#cmdResult").html();
                $("#cmdResult").append(json);
                $("#cmdResult").scrollTop($("#cmdResult")[0].scrollHeight);
            }
        });

    });
    $("#cmdOrder").keydown(function (e) {
        if (e.keyCode == 13) {
            var cmdOrder = $("[name=cmdOrder]").val();
            $.ajax({
                url: 'CmdExecte?order=' + cmdOrder,
                success: function (json) {
                    //$("#cmdResult").html();
                    $("#cmdResult").append(json);
                    $("#cmdResult").scrollTop($("#cmdResult")[0].scrollHeight);
                    $("[name=cmdOrder]").val("");

                }
            });
        }
    });
    //syslog查询
    $("#syslogSK").keydown(function (e) {
        if (e.keyCode == 13) {
            syslogDoS();
        }
    });
    $("#syslogbutton").click(function () {
        syslogDoS();

    });
    //文件上传
    $(":file").change(function () {
        var file = this.files[0];
        console.log(file);
    });
    $("#import_button").click(function () {
        $.ajax({
            url: 'GetImport',
            type: 'post',
            data: new FormData($('#importForm')[0]),
            processData: false,
            contentType: false,
            success: function (json) {
                json = eval("(" + json + ")");
                $("#importDiv").html();
                $("#importResult").html();
                var htmlt = "<div><strong>&nbsp;&nbsp;&nbsp;" + json.info + "</strong></div>";
                if (json.code == 10000) {
                    htmlt = htmlt + "<input type='hidden' value='" + json.url + "' id='excelurl'/>";
                    htmlt = htmlt + "<div>是否导入？&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' onclick='excelimport()' value='是' id='Doimport'/></div>";
                }
                $("#importDiv").html(htmlt);
                console.log(json.info);
            }
        });
    });
    //修改节点信息 
    $("#se_button").click(function () {
        console.log(checkMq(0));
        if (checkMq(0)) {
            $.ajax({
                url: 'editmq',
                type: 'post',
                data: $("#editmq_form").serialize(),
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.code == 10000) {
                        alert(json.message);
                        location.href = "Mqinfo?id=" + json.id;
                    } else {
                        alert(json.message);
                        return false;
                    }
                    console.log(json);
                }
            });
        }
    });
    //添加节点信息 
    $("#sa_button").click(function () {
        console.log(checkMq(0));
        if (checkMq(0)) {
            $.ajax({
                url: 'addmq',
                type: 'post',
                data: $("#addmq_form").serialize(),
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.code == 10000) {
                        alert(json.message);
                        location.href = "Mqinfo?id=" + json.id;
                    } else {
                        alert(json.message);
                        return false;
                    }
                }
            });
        }
    });
    $("#add_button").click(function () {
        location.href = "addmq";
    });
    //删除节点信息 
    $('#delet_button').click(function (e) {
        e.preventDefault();
        confirm("你确定要删除吗？", function () {
            var id = $("input[name=mq_id]").val();
            $.ajax({
                url: 'deletmq?id=' + id,
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.code == 10000) {
                        $("#body").html("<div class='success'>" + json.message + "</div>");
                        var parentnode = $(parent.frames["main"].document).find("[title='总行']").attr("id"); 
                        var idls = parentnode.split("_");
                        var idlss=idls[0]+"_"+idls[1]+"_ul";
                        $(parent.frames["main"].document).find("#"+idlss).css("display", "none"); 
                        console.log(idlss);
                    } else {
                        $("divl#header").html("<span>错误提示</span>");
                        $("divl#confirm_no").html("<span>q确定</span>");
                        $("divl#confirm_yes").html("");
                        confirm(json.message);
                        return false;
                    }
                }
            });

        });
    });
    //验证用户名是否存在
    $("#uReg").keyup(function () {
        var username = $("input[name=username]").val();
        $.ajax({
            url: 'CheckUser?username=' + username,
            type: 'post',
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == 10000) {
                    $("#uArealog").html("<span style='color:red'>" + json.message + "</span>");
                    $("input[name=username]").focus();
                    return false;
                } else if (json.code == 10001) {
                    $("#uArealog").html("");
                }
            }

        });
        return false;
    });
    //添加用户
    $("#addUserButton").click(function () {
        var username = $("input[name=username]").val();
        var password = $("input[name=password]").val();
        var password2 = $("input[name=password2]").val();
        if (!username) {
            $("#uArealog").html("<span style='color:red'>账号不能为空</span>");
            $("input[name=username]").focus();
            return false;
        } else {
            $("#uArealog").html("");
        }
        if (!password) {
            $("#pArealog").html("<span style='color:red'>密码不能为空</span>");
            $("input[name=password]").focus();
            return false;
        } else {
            $("#pArealog").html("");
        }
        if (password != password2) {
            $("#pArea2log").html("<span style='color:red'>密码不一致</span>");
            $("input[name=password2]").focus();
            return false;
        } else {
            $("#pArea2log").html("");
        }
        $.ajax({
            url: 'AddUserDo',
            data: $("#uRegForm").serialize(),
            type: 'post',
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == 10000) {
                   window.wxc.xcConfirm("添加成功", window.wxc.xcConfirm.typeEnum.succ);
                    //location.reload();
                } else if (json.code == 10003) {
                    $("#uArealog").html("<span style='color:red'>用户名已经存在</span>");
                    $("input[name=username]").focus();
                    return false;
                }  else if (json.code == 10006) {
                    alert(json.message);
                   location.href=json.url; 
                    return false;
                }else  {
                    alert(json.message); 
                    return false;
                }
            }

        });
        return false;
    });  
        $("#changePasswd").click(function () {
        var oldpwd = $("input[name=password]").val();
        var newpassword = $("input[name=newpassword]").val();
        var newpassword2 = $("input[name=newpassword2]").val();
        if(!oldpwd){
            var txt=  "原密码不能为空";
            $("input[name=password]").focus();
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
            return false;
        }
        if(!newpassword){
            var txt=  "新原密码不能为空";
            $("input[name=newpassword]").focus();
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
            return false;
        }
        if(newpassword != newpassword2){
            var txt=  "两次新密码输入不一致";
            $("input[name=newpassword2]").focus();
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
            return false;
        }
        $.ajax({
            url: 'changePwd',
            type: 'post',
            data:$("#changPwdForm").serialize(),            
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == 10000) { 
                    window.wxc.xcConfirm(json.message, window.wxc.xcConfirm.typeEnum.success); 
                    return false;
                } else if (json.code == 10001) {
                    var html="<span style='color:red'>" + json.message + "</span>";
                    window.wxc.xcConfirm(html, window.wxc.xcConfirm.typeEnum.error); 
                }
             
            }

        });
        return false;
    });
});
function ChangDir(dir) {
    var dirnum = parseInt($("[name=dirnum]").val());
    dirnum = dirnum + 1;
    $.ajax({
        url: 'CheckStatus?dir=' + dir,
        type: 'post',
        success: function (json) {
            $("#ShowDir").html();
            $("#ShowDir").html(json);
            $("#dirnum").val(dirnum);
            console.log(json);
        }
    });
}
//syslog查询
function syslogDoS() {
    var key = $("[name=syslogSK]").val();
    if (!key) {
        var err = "请输入要查询的信息";
        $("#show_err").html(err);
        return false;
    }
    $.ajax({
        url: 'syslogDoS?key=' + key,
        success: function (json) {
            $("#syslogSh").html();
            $("#syslogSh").html(json);
            $("#show_err").html();
            console.log(json);

        }
    });
}
//文件导入执行
function excelimport() {
    var url = $("#excelurl").val();
    $("#importResult").html("<span style='color:#30CD25' margin:20px;font-size:14px;>正在导入数据......</span>");
    $.ajax({
        url: 'DoImport',
        data: {'url': url},
        type: 'post',
        success: function (json) {
            $("#importResult").html();
            $("#importResult").html(json);
            console.log(json);
        }
    });

}
//验证表单
function checkMq(i) {
    var sys_name = $("[name=sys_name]").val();
    if (!sys_name) {
        $("span#sys_name").removeClass("right");
        $("span#sys_name").html("* 不能为空");
        $("input[name=sys_name]").focus();
        i = 0;
        return false;
    } else {
        $("span#sys_name").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#sys_name").addClass("right");
        i = 1;
    }
    var host_name = $("input[name=host_name]").val();
    if (!host_name) {
        $("span#host_name").removeClass("right");
        $("span#host_name").html("* 不能为空");
        $("input[name=host_name]").focus();
        i = 0;
        return false;
    } else {
        $("span#host_name").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#host_name").addClass("right");
        i = 1;
    }
    var os_ver = $("input[name=os_ver]").val();
    if (!os_ver) {
        $("span#os_ver").removeClass("right");
        $("span#os_ver").html("* 不能为空");
        $("input[name=os_ver]").focus();
        i = 0;
        return false;
    } else {
        $("span#os_ver").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#os_ver").addClass("right");
        i = 1;

    }
    var manage_ip = $("input[name=manage_ip]").val();
    if (!manage_ip) {
        $("span#manage_ip").removeClass("right");
        $("span#manage_ip").html("*不能为空");
        $("input[name=manage_ip]").focus();
        i = 0;
        return false;
    } else {
        $("span#manage_ip").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#manage_ip").addClass("right");
        i = 1;

    }
    var mq_ver = $("input[name=mq_ver]").val();
    if (!mq_ver) {
        $("span#mq_ver").removeClass("right");
        $("span#mq_ver").html("*不能为空");
        $("input[name=mq_ver]").focus();
        i = 0;
        return false;
    } else {
        $("span#mq_ver").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#mq_ver").addClass("right");
        i = 1;

    }
    var deploy = $("input[name=deploy]").val();
    if (!deploy) {
        $("span#deploy").removeClass("right");
        $("span#deploy").html("*不能为空");
        $("input[name=deploy]").focus();
        i = 0;
        return false;
    } else {
        $("span#deploy").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#deploy").addClass("right");
        i = 1;

    }
    var qm_name = $("input[name=qm_name]").val();
    if (!qm_name) {
        $("span#qm_name").removeClass("right");
        $("span#qm_name").html("*不能为空");
        $("input[name=qm_name]").focus();
        i = 0;
        return false;
    } else {
        $("span#qm_name").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#qm_name").addClass("right");
        i = 1;

    }
    var qm_status = $("input[name=qm_status]").val();
    if (!qm_status) {
        $("span#qm_status").removeClass("right");
        $("span#qm_status").html("*不能为空");
        $("input[name=qm_status]").focus();
        i = 0;
        return false;
    } else {
        $("span#qm_status").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#qm_status").addClass("right");
        i = 1;

    }
    var deadq = $("input[name=deadq]").val();
    if (!deadq) {
        $("span#deadq").removeClass("right");
        $("span#deadq").html("*不能为空");
        $("input[name=deadq]").focus();
        i = 0;
        return false;
    } else {
        $("span#deadq").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#deadq").addClass("right");
        i = 1;

    }
    var backups = $("input[name=backups]").val();
    if (!backups) {
        $("span#backups").removeClass("right");
        $("span#backups").html("*不能为空");
        $("input[name=backups]").focus();
        i = 0;
        return false;
    } else {
        $("span#backups").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#backups").addClass("right");
        i = 1;

    }
    var remark = $("input[name=remark]").val();
    if (!remark) {
        $("span#remark").removeClass("right");
        $("span#remark").html("*不能为空");
        $("input[name=remark]").focus();
        i = 0;
        return false;
    } else {
        $("span#remark").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#remark").addClass("right");
        i = 1;

    }
    var serve_ip = $("input[name=serve_ip]").val();
    if (!serve_ip) {
        $("span#serve_ip").removeClass("right");
        $("span#serve_ip").html("*不能为空");
        $("input[name=serve_ip]").focus();
        i = 0;
        return false;
    } else {
        $("span#serve_ip").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#serve_ip").addClass("right");
        i = 1;

    }
    var principal = $("input[name=principal]").val();
    if (!principal) {
        $("span#principal").removeClass("right");
        $("span#principal").html("*不能为空");
        $("input[name=principal]").focus();
        i = 0;
        return false;
    } else {
        $("span#principal").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        $("span#principal").addClass("right");
        i = 1;

    }
    return i;
}
function confirm(message, callback) {
    $('#confirm').modal({
        close: false,
        position: ["20%", ],
        overlayId: 'confirmModalOverlay',
        containerId: 'confirmModalContainer',
        onShow: function (dialog) {
            dialog.data.find('.message').append(message);

            // if the user clicks "yes"
            dialog.data.find('.yes').click(function () {
                // call the callback
                if ($.isFunction(callback)) {
                    callback.apply();
                }
                // close the dialog
                $.modal.close();
            });
        }
    });
}

//清空表单
function clearForm(form) {
  // iterate over all of the inputs for the form
  // element that was passed in
  $(':input', form).each(function() {
    var type = this.type;
    var tag = this.tagName.toLowerCase(); // normalize case
    // it's ok to reset the value attr of text inputs,
    // password inputs, and textareas
    if (type == 'text' || type == 'password' || tag == 'textarea')
      this.value = "";
    // checkboxes and radios need to have their checked state cleared
    // but should *not* have their 'value' changed
    else if (type == 'checkbox' || type == 'radio')
      this.checked = false;
    // select elements need to have their 'selectedIndex' property set to -1
    // (this works for both single and multiple select elements)
    else if (tag == 'select')
      this.selectedIndex = -1;
  });
};
function stime(tag){
    var mi="";
    var tag=tag;
  for(var i=0;i<tag;i++){
      if(i<10){
        mi="0"+i;
      }else{
        mi=i;
      }
      document.write("<option value="+mi+">"+mi+"</option>");
  }
}