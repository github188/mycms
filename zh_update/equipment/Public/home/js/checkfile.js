 
         
 
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
 
function showSearchResult(json) {
    var data = json.result.data;
    var trs = '';
    var startnum = (json.result.pages-1)*json.result.pagesize;
    for (var i = 0; i < data.length; i++) {
        trs += '<tr>';
        trs += '<td  align="center" width="40">';
        trs += i + startnum+1;
        trs += '    <input type="hidden" name="id" value="' + data[i]['id'] + '">'; 
        trs += '</td> ';
        trs += '<td align="center">';
        trs += data[i]['strtime'];
        trs += '</td>';
        trs += '<td align="center">';
        trs += data[i]['endtime'];
        trs += '</td> ';
        trs += '<td align="center">';
        if(data[i]['status']=='Y'){
            trs += '已完成';
        }else{
            trs += '正在查询';
        } 
        trs += '</td>';
        trs += '<td align="center">'; 
        trs += '<button filename="'+data[i].filename+'" id="scan_results"    class="btn btn-success" type="button" >查看</button>';
        trs += '</td>';
        trs += '<td align="center">';
        trs += data[i]['indate'];
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
            url: './checkfile/pageFlush?page=' + page + '&pagesize=' + size + keys,
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
        url: './checkfile/pageFlush?page=1&pagesize=' + size + keys,
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
        url: './checkfile/pageFlush?page=' + (parseInt(page) - 1) + '&pagesize=' + size + keys,
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
        url: './checkfile/pageFlush?page=' + (parseInt(page) + 1) + '&pagesize=' + size + keys,
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
        url: './checkfile/pageFlush?page=' + maxpage + '&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
});
 
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
        url: './Checkfile/pageFlush?page=1&pagesize=' + size + keys,
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
        url: './checkfile/pageFlush?pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            showSearchResult(json);
        }
    })
}
