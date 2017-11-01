jQuery(function ($) {
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
                    clearForm("#uRegForm");
                    //location.reload();
                } else if (json.code == 10003) {
                    $("#uArealog").html("<span style='color:red'>用户名已经存在</span>");
                    $("input[name=username]").focus();
                    return false;
                } else if (json.code == 10006) {
                    alert(json.message);
                    location.href = json.url;
                    return false;
                } else {
                    alert(json.message);
                    return false;
                }
            }

        });
        return false;
    });
    //new添加用户
    $("#content_allmainview").on('click', '#save_usp', function () {
        var username = $("#content_add input[name=username]").val();
        var password = $("#content_add input[name=password]").val();
        var password2 = $("#content_add input[name=password2]").val();
        console.log(username);
        if (!username) {
            $("#msgview_ups").html("<span style='color:red'>用户名不能为空</span>");
            $("input[name=username]").focus();
            return false;
        } else {
            $("#msgview_ups").html("");
        }
        if (!password) {
            $("#msgview_ups").html("<span style='color:red'>密码不能为空</span>");
            $("input[name=password]").focus();
            return false;
        } else {
            $("#msgview_ups").html("");
        }
        if (password != password2) {
            $("#msgview_ups").html("<span style='color:red'>密码不一致</span>");
            $("input[name=password2]").focus();
            return false;
        } else {
            $("#msgview_ups").html("");
        }
        $.ajax({
            url: '/index.php/Home/User/addUserPowerDo',
            data: $("#content_add #formuserpoweradd").serialize(),
            type: 'post',
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == 10000) {
                    $("#commonmodal .modal-body").html("<h2>添加成功</h2>");
                    $("#commonmodal").modal('show');
                    clearForm("#formuserpoweradd");
                    //location.reload();
                } else if (json.code == 10003) {
                    $("#uArealog").html("<span style='color:red'>用户名已经存在</span>");
                    $("input[name=username]").focus();
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
                    window.wxc.xcConfirm(json.message, window.wxc.xcConfirm.typeEnum.success);
                    clearForm("#changPwdForm");
                    return false;
                } else if (json.code == 10001) {
                    var html = "<span style='color:red'>" + json.message + "</span>";
                    window.wxc.xcConfirm(html, window.wxc.xcConfirm.typeEnum.error);
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
function changetabs(e) {
    $('#content_' + e).siblings().css('display', 'none');
    $('#tabs_' + e).siblings().removeClass('active');
    $('#tabs_' + e).addClass('active');
    $('#content_' + e).css('display', 'block');
}
function closetabs(e) {
    $("#content_allmainview").find('#content_' + e).remove();
    $('#tabs_title').find('#tabs_' + e).remove();
    var active = false;
    $('#tabs_title').find('div').each(function (e, div) {
        if ($(div).attr('class') == "active") {
            active = true;
        } else {
            active = false;
        }
    });
    if (!active) {
        var last = $('#tabs_title').find('div:last');
        last.addClass('active');
        var did = last.attr('id').split('_')[1];
        $('#content_allmainview').find('#content_' + did).css('display', 'block');
    }
}
function doact(e) {
    var is_exists = $('#tabs_title').find('#tabs_' + e).length;
    if (is_exists) {
        changetabs(e);
        return false;
    }
    if (e == 'add') {
        var title_tab = '<div class="active" id="tabs_add" onclick="changetabs(\'add\')" temp="tabs"><i class="icon-plus"></i>  新增用户<span class="icon-remove" onclick="closetabs(\'add\')"></span></div>';
    }
    $.ajax({
        url: '/index.php/Home/User/get_add',
        success: function (jsoan) {
            $("#content_allmainview").append(jsoan);
            $('#tabs_title').append(title_tab);
            changetabs(e);
        }
    })
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
    $("#edit_user").removeAttr('disabled');
})
//删除用户
$("#del_user").click(function (event) {
    var str = $("#tablebody").find('[selected]');
    var userid = str.find('input[name=userid]').val();
    var username = str.find('input[name=username]').val();
    if ((!userid) || (!str.length)) {
        return false;
    }
    var power = checkpower('user', 'delete');
    if (!power) {
        $("#commonmodal .modal-body").html("<h2>您没有权限删除用户，请联系管理员分配权限</h2>");
        $("#commonmodal").modal('show');
        return false;
    }
    layer.confirm('您确定要删除[ ' + username + ' ]？', {
        title: '信息提示',
        btn: ['确定', '取消'] //按钮
    }, function () {
        $.ajax({
            url: '/index.php/Home/User/newDeleteUser?userid=111' + userid,
            success: function (json) {
                json = eval("(" + json + ")");
                layer.closeAll();
                if (json.code == '10000') {
                    $("#commonmodal .modal-body").html("<h2>删除成功</h2>");
                    $("#commonmodal").modal('show');
                    $(str).remove();
                } else {
                    $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                    $("#commonmodal").modal('show');
                }
            }
        })
    });

    return false;
});
//修改用户信息
$("#edit_user").click(function (event) {
    var str = $("#tablebody").find('[selected]');
    var userid = str.find('input[name=userid]').val();
    var username = str.find('input[name=username]').val();
    if ((!userid) || (!str.length)) {
        $("#edit_user").attr('disabled', true);
        return false;
    }
    var power = checkpower('user', 'edit');
    if (!power) {
        $("#commonmodal .modal-body").html("<h2>您没有权限编辑用户，请联系管理员分配权限</h2>");
        $("#commonmodal").modal('show');
        return false;
    }
    if ($('#tabs_title').find('#tabs_edit' + userid).length) {
        changetabs('edit' + userid);
        return false;
    }
    var title_tab = '<div class="active" id="tabs_edit' + userid + '" onclick="changetabs(\'edit' + userid + '\')" temp="tabs"><i class="icon-edit"></i>  编辑用户:' + username + '<span class="icon-remove" onclick="closetabs(\'edit' + userid + '\')"></span></div>';
    $.ajax({
        url: '/index.php/Home/User/get_edit?userid=' + userid,
        success: function (jsoan) {
            $("#content_allmainview").append(jsoan);
            $('#tabs_title').append(title_tab);
            changetabs('edit' + userid);
        }
    })

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
                //clearForm("#formuserpoweredit");
                edit_refresh(userid);
            } else if (json.code == 10002) {
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
//搜索用户
function searchUser() {
    var key = $("#SUserKey").val();
    var postdata = [];
    if (!key) {
        $("#SUserKey").removeAttr('selected');
        postdata['pagesize'] = $("#pagesize").val();
    } else {
        $("#SUserKey").attr('selected', true);
    }
    var url = encodeURI('/index.php/Home/User/searchUser?key=' + key + '&pagesize=' + $("#pagesize").val());
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
    for (var i = 0; i < data.length; i++) {
        trs += '<tr>';
        trs += '<th width="40">';
        trs += i + 1;
        trs += '    <input type="hidden" name="userid" value="' + data[i]['userid'] + '">';
        trs += '    <input type="hidden" name="username" value="' + data[i]['username'] + '">';
        trs += '</th> ';
        trs += '<th>';
        trs += data[i]['username'];
        trs += '</th>';
        trs += '<th nowrap="">';
        trs += data[i]['nickname'];
        trs += '</th> ';
        trs += '<th nowrap="">';
        trs += data[i]['last_login'];
        trs += '</th>';
        trs += '<th nowrap="">';
        trs += data[i]['reg_date'];
        trs += '</th>';
        trs += '<th nowrap="">';
        trs += data[i]['logintimes'];
        trs += '</th>';
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
        keys += '&key=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
    }
    $.ajax({
        url: '/index.php/Home/User/pageGo?page=1&pagesize=' + size + keys,
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
        keys += '&key=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
    }
    $.ajax({
        url: '/index.php/Home/User/pageGo?page=' + (parseInt(page) - 1) + '&pagesize=' + size + keys,
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
        keys += '&key=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
    }
    $.ajax({
        url: '/index.php/Home/User/pageGo?page=' + (parseInt(page) + 1) + '&pagesize=' + size + keys,
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
        keys += '&key=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
    }
    $.ajax({
        url: '/index.php/Home/User/pageGo?page=' + maxpage + '&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
});
$(window).resize(function () {          //当浏览器大小变化时
    var bt = $("#content_allmainview").find('#pageList');
    var off = $(bt).offset();
    var left = off.left;
    var top = off.top + 34;
    var wh = $(window).height();
    var mh = $('body').find('#pageListMenu').height();
    if (top > wh - mh) {
        top = top + mh + 10 - wh;
    }
    $('body').find('#pageListMenu').css({
        top: top + "px",
        left: left + 'px'
    });
});
//修改每页显示条数
function cPageSize(e) {
    var size = $(e).val();
    var key = $("#content_allmainview").find('#content_users #SUserKey').attr('selected');
    var keys = '';
    if (key) {
        keys += '&key=';
        keys += $("#content_allmainview").find('#content_users #SUserKey').val();
    }
    $.ajax({
        url: '/index.php/Home/User/pageGo?page=1&pagesize=' + size + keys,
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