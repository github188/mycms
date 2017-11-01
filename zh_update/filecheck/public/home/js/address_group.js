$(document).ready(function () {
    refresh();
});
$("#content_group .panel-footer").on('click', 'a', function () {
    var left = ($(window).width() - 300) / 2.0;
    var top = ($(window).height() - 200) / 2.0;
    $("#group_add_modal").css({'left': left, 'top': top});
    var type = $(this).attr('click');
    if (type == 'clicktypeadd') {
        $("#group_add_modal #save").attr('log', 'add');
        $("#group_add_modal #madol_title").html('<i class="icon-plus"></i> 新增分组 选项');
        $("#group_add_modal #msgview").html('');
        $("#group_add_modal [name=name]").val('');
        $("#group_add_modal [name=orderby]").val('');
        $("#group_add_modal [name=address_class_id]").remove();
        $("#group_add_modal").modal({
            backdrop: 'static',
            keyboard: false
        });
    } else if (type == 'reload') {
        refresh();
    } else if (type == 'clicktypeeidt') {
        var str = $('#group_tbody').find('[selected]');
        if (!str.length) {
            return false;
        }
        var id = str.attr('dataid');
        $("#group_add_modal #madol_title").html('<i class="icon-edit"></i> 编辑 选项');
        $("#group_add_modal #form_add_group").append('<input type="hidden" name="address_class_id" value="' + id + '">')
        var name = str.find('td').eq(1).html();
        var order = str.find('td').eq(2).html();
        var bname = str.find('[name=bname]').val();
        $('[name=name]').val(name);
        $('[name=orderby]').val(order);
        $('[name=bname]').val(bname);
        $("#group_add_modal #save").attr('log', 'edit');
        $("#group_add_modal #msgview").html('');
        $("#group_add_modal").modal({
            backdrop: 'static',
            keyboard: false
        });
    } else if (type == 'typedel') {
        var str = $('#group_tbody').find('[selected]');
        if (!str.length) {
            return false;
        }
        var name = str.find('td').eq(1).html();
        var order = str.find('td').eq(2).html();
        var dataid = str.attr('dataid');
        $('#commonmodal #msgview').html("");
        var info = '<span>您确定顶要删除【<span style="color:red;">' + name + '</span>】分组吗？</span><br>';
        var footer = '<button class="btn btn-primary" data-id="' + dataid + '" id="delok_group">删除</button>';
        footer += '&nbsp;&nbsp;&nbsp;&nbsp;';
        footer += '<button class="btn btn-primary" data-id="' + dataid + '" data-dismiss="modal">取消</button>';
        $("#commonmodal .modal-body").html(info);
        $("#commonmodal .modal-footer #button").html(footer);
        $("#commonmodal").modal('show');
    }
});
//编辑通讯录
$("#tablemain").on('click', '#tbody tr', function () {
    $(this).siblings().removeAttr('style');
    $(this).siblings().removeAttr('selected');
    $(this).css({background: 'rgb(223, 240, 216) none repeat scroll 0% 0%'});
    $(this).attr('selected', 1);
    $('#class_edit_address').removeAttr('disabled');
})
$('#class_edit_address').mousemove(function (event) {
    var str = $('#tablemain').find('[selected]');
    if (!str.length) {
        $('#class_edit_address').attr('disabled', 'true');
        return false;
    } else {
        $('#class_edit_address').removeAttr('disabled');
    }
});
$('#class_edit_address').click(function (event) {
    var str = $('#tablemain').find('[selected]');
    if (!str.length) {
        return false;
    }
    var id = str.attr('dataid');
    $.ajax({
        url: "/index.php/Home/Address/editpage?id=" + id,
        success: function (json) {
            json = eval("(" + json + ")");
            var a = 'editaddress';
            var html = json.message;
            if (json.res == 'ok') {
                title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-edit"></i>  编辑联系人<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
                doappend(html, title, a);
            }
        }
    })
});

//删除确认框
$('#commonmodal').on('click', '#delok_group', function () {
    var id = $(this).attr('data-id');
    var doing = '<img width="16" height="16" align="absmiddle" src="/Public/home/img/loading.gif">';
    doing += '<span style="color:#ff6600;">处理中...</span>';
    $('#commonmodal #msgview').html(doing);
    $.ajax({
        url: '/index.php/Home/Address/del_group?id=' + id,
        success: function (json) {
            json = eval("(" + json + ")");
            $('#commonmodal #msgview').html('<span style="color:#ff6600;">' + json.message + '</span>');
                refreshnavs();
        },
        complete: function () {
             $("#aTS{$bname}").find("tr[selected=selected]").remove();
            setTimeout(function () {
                $('#commonmodal').modal('hide');
                refresh();
            }, 1000);
        }
    })

});
function showSRdbclick(json) {
    var data = json.result.data;
    var trs = '';
    for (var i = 0; i < data.length; i++) {
        trs += '<tr>';
        trs += '<th width="40">';
        trs += json.result.pagesize * (json.result.pages - 1) + i + 1;
        trs += '<input type="hidden" name="id" value="' + data[i]['id'] + '">';
        trs += '</th> ';
        trs += '<td align="center">' + data[i]["username"] + '</td>';
        trs += '<td align="center">' + data[i]["telephone"] + '</td>';
        trs += '<td align="center">' + data[i]["mobile_phone"] + '</td>';
        trs += '<td align="center">' + data[i]["email"] + '</td>';
        trs += '<td align="center">' + data[i]["qq"] + '</td>';
        trs += '<td align="center">' + data[i]["email"] + '</td>';
        trs += '<td align="center">' + data[i]["weixin"] + '</td>';
        trs += '<td align="center">' + data[i]["job"] + '</td>';
        trs += '</tr>';
    }
    $("#content_group #tbodyginfos").html(trs);
    $("#content_group #maxpage").html(json.result.maxpage);
    $("#content_group #pages").html(json.result.pages);
    $("#content_group #zjilu").html(json.result.total);
    $("#content_group #pagesize").val(json.result.pagesize);
    if (json.result.maxpage <= 1) {
        $("#content_group #shouye").attr('disabled', true);
        $("#content_group #shang").attr('disabled', true);
        $("#content_group #next").attr('disabled', true);
        $("#content_group #lastye").attr('disabled', true);
        $("#content_group #pageList").attr('disabled', true);
    } else {
        if (json.result.pages == 1) {
            $("#content_group #shouye").attr('disabled', true);
            $("#content_group #shang").attr('disabled', true);
            $("#content_group #next").removeAttr('disabled');
            $("#content_group #lastye").removeAttr('disabled');
            $("#content_group #pageList").removeAttr('disabled');
        } else if (json.result.pages == json.result.maxpage) {
            $("#content_group #shouye").removeAttr('disabled');
            $("#content_group #shang").removeAttr('disabled');
            $("#content_group #next").attr('disabled', true);
            $("#content_group #lastye").attr('disabled', true);
            $("#content_group #pageList").removeAttr('disabled');
        } else {
            $("#content_group #shouye").removeAttr('disabled');
            $("#content_group #shang").removeAttr('disabled');
            $("#content_group #next").removeAttr('disabled');
            $("#content_group #lastye").removeAttr('disabled');
            $("#content_group #pageList").removeAttr('disabled');
        }
    }
    var wh = $(window).height();
    var divh = $("#content_group #groupinfost table").height();
    if (divh > wh - 210) {
        divh = wh - 210;
    }
    $("#content_group #groupinfost").height(divh);
}
//双击获取信息
$("#group_tbody").on('dblclick', 'tbody tr', function () {
    var str = $('#group_tbody').find('[selected]');
    if (!str.length) {
        return false;
    }
    var name = str.find('td').eq(1).html();
    var order = str.find('td').eq(2).html();
    var dataid = str.attr('dataid');
    var dates = new Date().getTime() + '_info';
    loading('tablemain', dates);
    $.ajax({
        url: '/index.php/Home/Address/dblinfo?id=' + dataid,
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.message == 'ok') {
                showSRdbclick(json);
                $("#content_group #tablefanye").show();
            } else {
                trs = '<tr>';
                trs += '<th colspan="9">该分组无成员！ </th>';
                trs += '</tr>';
                $("#content_group #tbodyginfos").html(trs);
                $("#content_group #tablefanye").hide();
            }
        },
        complete: function () {
            $("#modeshow_" + dates).remove();
        }
    })
})
//单机选定TR
$("#group_tbody").on('click', 'tbody tr', function () {
    $(this).siblings().removeAttr('style');
    $(this).siblings().removeAttr('selected');
    $(this).css({background: 'rgb(223, 240, 216) none repeat scroll 0% 0%'});
    $(this).attr('selected', 1);
})
$("#form_add_group").on('blur', 'input', function () {
    var name = $(this).attr('name');
    var val = $(this).val();
    if (name == 'name') {
        if (val) {
            $('#save').removeAttr('disabled');
        } else {
            $('#save').attr('disabled', 'true');
        }
    }
});
$('#save').click(function (event) {
    var name = $('#form_add_group [name=name]').val(); 
    if (!name) {
        alert('名称不能为空！');
        return false;
    }
    // var egl = /^[a-zA-Z]+$/;
    // if (!egl.test(bname)) {
    //     alert('请输入英文别名！');
    //     return false;
    // }
    var doing = '<img width="16" height="16" align="absmiddle" src="/Public/home/img/loading.gif">';
    doing += '<span style="color:#ff6600;">处理中...</span>';
    $('#group_add_modal #msgview').html(doing);
    var log = $(this).attr('log');
    if (log == 'add') {
        url = '/index.php/Home/Address/doaddgroup';
    } else {
        url = '/index.php/Home/Address/edit';
    }
    $.ajax({
        url: url,
        data: $("#form_add_group").serialize(),
        type: 'post',
        success: function (json) {
            json = eval("(" + json + ")");
            $('#group_add_modal #msgview').html('<span style="color:#ff6600;">' + json.message + '</span>');
            if (json.code == '10000') {
                $("#group_add_modal").modal('hide');
                loading('tbody');
            }
        },
        complete: function () {
            refresh();
            refreshnavs();
        }
    })

});
$('#save').mousemove(function (event) {
    var name = $('[name=name]').val();
    if (!name) {
        $('#save').attr('disabled', 'true');
        return false;
    } else {
        $('#save').removeAttr('disabled');
    }
});
function loading(id, dates) {
    var width = $('#' + id).width();
    var height = $('#' + id).height();
    var h = '<div align="center" style="filter:Alpha(opacity=20);opacity:0.2;height:' + height + 'px;width:' + width + 'px;overflow:hidden;z-index:3;position:absolute;left:1px;line-height:' + height + 'px;top:1px;background:#000000;color:white" id="modeshow_' + dates + '"> <img align="absmiddle" src="/Public/home/img/mloading.gif">&nbsp;加载中...</div>';
    $('#' + id).after(h);
}
// function refreshnavs(){
//     $.ajax({
//         url: '/index.php/Home/Address/reNav',
//         data: $("#form_add_group").serialize(),
//         type: 'post',
//         success: function (json) {
//              $("#menulist #usernavs").each(function(index, el) {
//                  $(this).remove();
//              });
//              $("#menulist").prepend(json);
//         } 
//     })
// }
function refresh() {
    var dates = new Date().getTime() + '_group';
    loading('group_tbody', dates);
    $.ajax({
        url: '/index.php/Home/Address/refresh_group',
        type: 'get',
        success: function (json) {
            json = eval("(" + json + ")");
            var s = '';
            for (var i = 0; i < json.res.length; i++) {
                var result = json.res[i];
                s += '<tr dataid="' + result['address_class_id'] + '" >';
                s += '<td width="40" align="right">' + (i + 1) + '</td>';
                s += '<td align="center" cell="0" row="0" >' + result['name'] + '</td>'; 
                s += '<td align="center" cell="2" row="0">' + result['orderby'];
                s += '<input type="hidden" value="' + result['bname'] + '" name="bname"></td>';
                s += '</tr>';
            }
            $('#group_tbody').find('tbody').html(s);
            var height = $('#group_tbody').height();
            var wheight = $(window).height();
            if (height > (wheight - 199)) {
                height = wheight - 199;
            }
            $("#optionview").css('height', height + 1);
        }
    })
            .done(function () {
                $("#modeshow_" + dates).remove();
            })
}