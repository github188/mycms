jQuery(function ($) {
        $("#loginout").click(function () {
        location.href="/report/equipment/index.php/home/sms/loginout";
        return false;
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
    
    //修改密码
    $("#changePasswd").click(function () {
        var oldpwd = $("input[name=password]").val();
        var newpassword = $("input[name=newpassword]").val();
        var newpassword2 = $("input[name=newpassword2]").val();
        if (!oldpwd) {
            var txt = "原密码不能为空";
            $("input[name=password]").focus();
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
            return false;
        }
        if (!newpassword) {
            var txt = "新原密码不能为空";
            $("input[name=newpassword]").focus();
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
            return false;
        }
        if (newpassword != newpassword2) {
            var txt = "两次新密码输入不一致";
            $("input[name=newpassword2]").focus();
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
            return false;
        }
        $.ajax({
            url: 'changePwd',
            type: 'post',
            data: $("#changPwdForm").serialize(),
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == 10000) {
                    layer.msg("修改成功！");
                    setTimeout(function() {
                        location.href="./index";
                    }, 1000);
                    clearForm("#changPwdForm");
                    return false;
                } else{
                    var html = "<span style='color:red;font-size:18px;'>" + json.message + "</span>";
                    layer.msg( html);
                    //window.wxc.xcConfirm(html, window.wxc.xcConfirm.typeEnum.error);
                }

            }

        });
        return false;
    });

})
//清空表单
function clearForm(form) {
    // iterate over all of the inputs for the form
    // element that was passed in
    $(':input', form).each(function () {
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
}
 
$(document).ready(function () {
    var height = $(window).height();
    var width = $(window).width();
    $("#indexcontent").css('height', height - 94);
});
$(window).scroll(function (event) {
    var scrollTop = $(window).scrollTop();
    // $("#tabs_title").css('margin-top', scrollTop + 50);
    $(".container").css('margin-top', 0 - scrollTop - 10);
});
$(window).resize(function (event) {
    var height = $(window).height();
    var width = $(window).width();
    $("#indexcontent").css('height', height - 94);
});
function checkall(e, id, num) {
    var status = 0;
    if (num == 1) {
        status = 0;
        $imgurl = '/Public/home/img/checkbox1.png';
    } else {
        status = 1;
        $imgurl = '/Public/home/img/checkbox0.png';
    }
    $(e).attr('onclick', 'checkall(this,\'' + id + '\',' + status + ')');
    $(e).attr('data-status', status);
    $('.table ' + "#" + id).each(function (el) {
        $(this).val(num);
    });
    $('.table ' + "#" + id).each(function (el) {
        $(this).siblings('img').attr('src', $imgurl);
    });
}
function checkthis(e) {
    var val = $(e).siblings('input').val();
    if (val == 0) {
        val = 1;
        $imgurl = '/Public/home/img/checkbox1.png';
    } else {
        val = 0;
        $imgurl = '/Public/home/img/checkbox0.png';
    }
    $(e).siblings('input').val(val);
    $(e).attr('src', $imgurl);
}
//单机算定Tr
$("#tablebody").on('click', 'tbody tr', function () {
    $(this).siblings().removeAttr('style');
    $(this).siblings().removeAttr('selected');
    $(this).css({background: 'rgb(223, 240, 216) none repeat scroll 0% 0%'});
    $(this).attr('selected', 1);
    $("#del_user").removeAttr('disabled');
    $("#edit_info").removeAttr('disabled');
})
//删除用户
$("#del_user").click(function (event) {
    var str = $("#tablebody").find('[selected]');
    var userid = str.find('input[name=id]').val(); 
    var alarm_id = str.find('input[name=alarm_id]').val(); 
    if ((!userid) || (!str.length)) {
        return false;
    }
    // var power = checkpower('user', 'delete');
    // if (!power) {
    //     $("#commonmodal .modal-body").html("<h2>您没有权限删除用户，请联系管理员分配权限</h2>");
    //     $("#commonmodal").modal('show');
    //     return false;
    // }
    layer.confirm('您确定要删除？', {
        title: '信息提示',
        btn: ['确定', '取消'] //按钮
    }, function () {
        $.ajax({
            url: './deleteInfo?id=' + userid+'&alarm_id='+alarm_id,
            success: function (json) {
                json = eval("(" + json + ")");
                layer.closeAll();
                if (json.code == '10000') {
                    $(str).remove();
                    layer.msg(json.msg,function(){
                        location.reload();
                    }); 
                } else {
                    $("#commonmodal .modal-body").html("<h2>" + json.msg + "</h2>");
                    $("#commonmodal").modal('show');
                }
            }
        })
    });

    return false;
});
//修改用户信息
$("#edit_info").click(function (event) {
    var str = $("#tablebody").find('[selected]');
    var alarm_id = str.find('input[name=alarm_id]').val();  
    var id = str.find('input[name=id]').val();  
    if ((!id) || (!str.length)) {
        $("#edit_user").attr('disabled', true);
        return false;
    }
    $.ajax({
        async: false,
        url: './is_delete?alarm_id='+alarm_id+'&id='+id,
        success: function (json) {
            json = eval("(" + json + ")");
            if(json.code=='10000'){
                location.href='./get_edit?alarm_id='+alarm_id+'&id='+id; 
            }else{
                layer.msg(json.msg);
            }
        }
    })
    
    return false; 
});
//验证权限
var checkpower = function (a, p) {
    var power = 0;
    $.ajax({
        async: false,
        url: '/index.php/Home/Index/checkpower?act=' + a + '&p=' + p,
        success: function (json) {
            power = json;
        }
    })
    return power;
}
//编辑用户
$("#content_allmainview").on('click', '#save_edit', function (event) {
    var username = $("input[name=username]").val();
    var userid = $(this).attr('data-userid');
    if (!username) {
        $("#msgview_ups").html("<span style='color:red'>用户名不能为空</span>");
        $("input[name=username]").focus();
        return false;
    } else {
        $("#msgview_ups").html("");
    }
    var formid = "#content_edit" + userid + " #formuserpoweredit";
    $.ajax({
        url: '/index.php/Home/User/editUserPowerDo?userid=' + userid,
        data: $(formid).serialize(),
        type: 'post',
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == 10000) {
                $("#commonmodal .modal-body").html("<h2>修改成功</h2>");
                $("#commonmodal").modal('show'); 
                location.reload(); 
                //edit_refresh(userid);
            } else if (json.code == 10002) {
                layer.msg(json.message);
                edit_refresh(userid);
                return false;
            } else {
                $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                $("#commonmodal").modal('show');
                return false;
            }
        }

    });
    return false;
});
function loading(id, dates) {
    var width = $('#' + id).width();
    var height = $('#' + id).height();
    var h = '<div align="center" style="filter:Alpha(opacity=20);opacity:0.2;height:' + height + 'px;width:' + width + 'px;overflow:hidden;z-index:3;position:absolute;left:1px;line-height:' + height + 'px;top:1px;background:#000000;color:white" id="modeshow_' + dates + '"> <img align="absmiddle" src="__PUBLIC__/home/img/mloading.gif">&nbsp;加载中...</div>';
    $('#' + id).after(h);
}
function edit_refresh(userid) {
    var dates = new Date().getTime() + '_group';
    loading('body', dates);
    $.ajax({
        url: '/index.php/Home/User/get_edit?userid=' + userid,
        success: function (jsoan) {
            $('#content_edit' + userid).remove();
            $("#content_allmainview").append(jsoan);
            changetabs('edit' + userid);
        }
    })
}
//搜索
function searchUser() {
    var keyword = $("#SUserKey").val();
    var key = $("select[name=monthx]").val();
    var postdata = [];
    if (!keyword) {
        $("#SUserKey").removeAttr('selected');
        postdata['pagesize'] = $("#pagesize").val();
        return false;
    } else {
        $("#SUserKey").attr('selected', true);
    }
    var url = encodeURI('./searchInfo?keywords=' + keyword + '&pagesize=' + $("#pagesize").val()+'&key='+key);
    $.ajax({
        url: url,
        data: postdata,
        type: 'post',
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == '10000') {
                var data = json.result.data;
                showSearchResult(json);
                // $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                // $("#commonmodal").modal('show');
            } else {
                $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                $("#commonmodal").modal('show');
                return false;
            }
        }
    })
    return false;
}
function showSearchResult(json) {
    var data = json.result.data;
    var trs = '';
    var startnum = (json.result.pages-1)*json.result.pagesize;
    for (var i = 0; i < data.length; i++) {
        trs += '<tr>';
        trs += '<td  align="center" width="40">';
        trs += i + startnum+1;
        trs += '    <input type="hidden" name="id" value="' + data[i]['id'] + '">';
        trs += '    <input type="hidden" name="alarm_id" value="' + data[i]['alarm_id'] + '">';
        trs += '</td> ';
        trs += '<td align="center">';
        trs += data[i]['type'];
        trs += '</td>';
        trs += '<td align="center">';
        trs += data[i]['strtime'];
        trs += '</td> ';
        trs += '<td align="center">';
        trs += data[i]['endtime'];
        trs += '</td>';
        trs += '<td align="center">';
        trs += data[i]['keywords'];
        trs += '</td>';
        // trs += '<td align="center">';
        // trs += data[i]['indate'];
        // trs += '</td>';
        trs += '</tr>';
    }
    ;
    $("#tableShowUsers").html(trs);
    $("#maxpage").html(json.result.maxpage);
    $("#pages").html(json.result.pages);
    $("#zjilu").html(json.result.total);
    $("#pagesize").val(json.result.pagesize);
    if (json.result.maxpage <= 1) {
        $("#shouye").attr('disabled', true);
        $("#shang").attr('disabled', true);
        $("#next").attr('disabled', true);
        $("#lastye").attr('disabled', true);
        $("#pageList").attr('disabled', true);
    } else {
        if (json.result.pages == 1) {
            $("#shouye").attr('disabled', true);
            $("#shang").attr('disabled', true);
            $("#next").removeAttr('disabled');
            $("#lastye").removeAttr('disabled');
            $("#pageList").removeAttr('disabled');
        } else if (json.result.pages == json.result.maxpage) {
            $("#shouye").removeAttr('disabled');
            $("#shang").removeAttr('disabled');
            $("#next").attr('disabled', true);
            $("#lastye").attr('disabled', true);
            $("#pageList").removeAttr('disabled');
        } else {
            $("#shouye").removeAttr('disabled');
            $("#shang").removeAttr('disabled');
            $("#next").removeAttr('disabled');
            $("#lastye").removeAttr('disabled');
            $("#pageList").removeAttr('disabled');
        }
    }
}
$("button[click=search]").click(function (event) {
    searchUser();
});
$("#SUserKey").keydown(function (event) {
    var key = event.keyCode;
    if (key == 13) {
        searchUser();
    }
});
$("#content_allmainview").on('click', '#pageList', function (event) {
    var page = $(this).find('#maxpage').html();
    var thispage = $(this).find('#pages').html();
    var numnav = '';
    numnav += '<div id="pageListMenu" class="rockmenu" style="display: block;left:' + left + 'px; top:' + top + 'px;">';

    numnav += '<div id="rockmenuli" class="rockmenuli" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; width: 150px;">';
    numnav += '<ul>';
    var background = '';
    var border = '';
    for (var i = 1; i <= parseInt(page); i++) {
        if (i == parseInt(thispage)) {
            background = 'style="background:#e1e1e1;"';
        } else {
            background = '';
        }
        if (i == parseInt(page)) {
            border = 'style="border:none;"';
        } else {
            border = '';
        }
        numnav += '<li ' + background + ' ' + border + ' temp="' + i + '">第' + i + '页</li>';
    }
    // numnav += '<li style="" temp="1">第1页</li>';
    // numnav += '<li style="" temp="2">第2页</li>';
    // numnav += '<li class="" style="background:#e1e1e1;" temp="3">第3页</li>';
    // numnav += '<li style="border:none;" temp="4">第4页</li>';
    numnav += '</ul>';
    numnav += '</div>';
    numnav += '</div>';
    $('body').prepend(numnav);
    var off = $(this).offset();
    var left = off.left;
    var top = off.top;
    var wh = $(window).height();
    var mh = $('body').find('#pageListMenu').height();
    if (top > wh - mh) {
        top = top + mh + 190 - wh;
    }
    $('body').find('#pageListMenu').css({
        top: top + "px",
        left: left + 'px'
    });
    $('body').find('#pageListMenu').find('li').mouseover(function () {
        this.className = 'li01';
    });
    $('body').find('#pageListMenu').find('li').mouseout(function () {
        this.className = '';
    });
    $('body').find('#pageListMenu').find('li').click(function () {
        var page = $(this).attr('temp');
        var size = $("#tablefanye #pagesize").val();
        var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_allmainview").find('#content_users #SUserKey').val();
        }
        $.ajax({
            url: '/index.php/Home/User/pageGo?page=' + page + '&pagesize=' + size + keys,
            success: function (json) {
                json = eval("(" + json + ")");
                showSearchResult(json);
                $('body').find('#pageListMenu').remove();
            }
        })
    });
    $('body').find('#pageListMenu').mouseleave(function () {
        $('body').find('#pageListMenu').remove();
        return false;
    });
})
//翻页处理首页
$("#shouye").click(function (event) {
    var size = $("#tablefanye #pagesize").val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&keywords=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
        keys += '&key=';
        keys += $('select[name=monthx]').val();
    }
    $.ajax({
        url: './searchInfo?page=1&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
});
//翻页处理上一页
$("#shang").click(function (event) {
    var page = $("#pages").html();
    if (parseInt(page) <= 1) {
        return false;
    }
    var size = $("#tablefanye #pagesize").val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&keyword=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
        keys += '&key=';
        keys += $('select[name=monthx]').val();
    }
    $.ajax({
        url: './searchInfo?page=' + (parseInt(page) - 1) + '&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
});
//翻页处理下一页
$("#next").click(function (event) {
    var page = $("#pages").html();
    var maxpage = $("#maxpage").html();
    if (parseInt(page) >= parseInt(maxpage)) {
        return false;
    }
    var size = $("#tablefanye #pagesize").val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&keyword=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
        keys += '&key=';
        keys += $('select[name=monthx]').val();
    }
    $.ajax({
        url: './searchInfo?page=' + (parseInt(page) + 1) + '&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
});
//翻页处理最后一页
$("#lastye").click(function (event) {
    var page = $("#pages").html();
    var maxpage = $("#maxpage").html();
    if (parseInt(page) >= parseInt(maxpage)) {
        return false;
    }
    var size = $("#tablefanye #pagesize").val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&keyword=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
        keys += '&key=';
        keys += $('select[name=monthx]').val();
    }
    $.ajax({
        url: './searchInfo?page=' + maxpage + '&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
});
// $(window).resize(function () {          //当浏览器大小变化时
//     var bt = $("#content_allmainview").find('#pageList');
//     var off = $(bt).offset();
//     var left = off.left;
//     var top = off.top + 34;
//     var wh = $(window).height();
//     var mh = $('body').find('#pageListMenu').height();
//     if (top > wh - mh) {
//         top = top + mh + 10 - wh;
//     }
//     $('body').find('#pageListMenu').css({
//         top: top + "px",
//         left: left + 'px'
//     });
// });
//修改每页显示条数
function cPageSize(e) {
    var size = $(e).val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&keyword=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
        keys += '&key=';
        keys += $('select[name=monthx]').val();
    }
    $.ajax({
        url: './searchInfo?page=1&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
}
$("#pagesize").keydown(function (event) {
    var key = event.keyCode;
    if (key == 13) {
        cPageSize($(this));
    }
});

$("#type").on("change",function(){
        var v = $(this).val(); 
        $("#othername").hide();
        if(v=="请选择"||v==undefined){
            $("#sysname").html('<option>请选择系统</option>');
            return false;
        } 
        var text = $("[name=keywords]").val()+v;
        //$("[name=keywords]").val(text);
        var def ='';
         if(v=='TongEASY'){
            def = 'sys_name'; 
        }else{
            def = 'sysname';
        }
        var url ='';
        if($(this).attr("data-act")=="add"){
            url='./Sms/pQuery?type='+v;
        }else{
            url='./pQuery?type='+v;
        }
        $.ajax({
            url: url,
            success:function(json){
                json = eval("("+json+")");
                if(json.msg=='ok'){
                    options(json.data,'sysname',def,'请选择系统');
                }else{
                    $("#sysname").html('<option>请选择系统</option>');
                    $("#othername").hide();
                }
            }
        });
    });
    
    $("#sysname").on("change",function(){
        var v = $(this).val(); 
        var t = $("#type").val();
        if(v=="请选择系统"||v==undefined){
            $("#sysname").html('<option>请选择系统</option>');
            $("#othername").hide();
            return false;
        } 
        var def =sel='';
        if(t=='MQ'){
            def = '队列管理器名';
            sel = 'qmname';
        }else if(t=='GTP'){
            def = '节点名称';
            sel = 'nodename';
        }
        else if(t=='TongEASY'){
            def = '节点名称';
            sel = 'node_name';
        }else{
            def ='------';
        }
        var text = $("#tabs").html();
        if(text){
            text =text+'#';
        }
        var url ='';
        if($("#type").attr("data-act")=="add"){
            url='./Sms/pOtherName?sysname='+v+'&type='+t;
        }else{
            url='./pOtherName?sysname='+v+'&type='+t;
        } 
        $("#tabs").html(text+v);
        $.ajax({
            url:url,
            success:function(ojson){
                ojson = eval("("+ojson+")");
                if(ojson.msg=='ok'){ 
                    options(ojson.data,"othername",sel,def);
                }else{
                    $("#othername").html('<option>------</option>'); 
                }
            }
        });
    }) 
    $("#othername").on("change",function(){
        var v = $(this).val(); 
        var text = $("#tabs").html();
        $("#tabs").html(text+'#'+v);
    })
    function options(data, wh,ckey,option){
        if(data){
            var ops = '<option>'+option+'</option>';
            for(var i=0;i<data.length;i++){
                ops +="<option>"+data[i][ckey]+"</option>";
            }
            $("#"+wh).html(ops);
            $("#"+wh).show(); 
        }else{
            $("#"+wh).html("<option>"+option+"</option>"); 
                $("#othername").hide(); 
        }
        return false;
    }
//更新数据
function reFreshData(event) {
    var size = $("#tablefanye #pagesize").val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&key=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
    }
    $.ajax({
        url: '/index.php/Home/User/userRefresh?pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
}
;