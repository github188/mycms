jQuery(function ($) {
    $(document).ready(function () {
        var height = $(window).height();
        var width = $(window).width();
        $("#indexcontent").css('width', width - 250);
        $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
        $("#indexcontent").css('height', height - 94);
        $("#menulist").css('height', height - 94);
        var cl = getUrlParam("l");
        if (cl) {
            clickmenu(cl);
        }
        var listw = $('#gtpcont').width();
        $('#indexcontent').width(listw);
    });
    $(window).resize(function (event) {
        var height = $(window).height();
        var width = $(window).width();
        var listw = $('#gtpcont').width();
        $('#indexcontent').width(listw);
        // $("#indexcontent").css('width', width - 250);
        $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
        $("#indexcontent").css('height', height - 94);
        $("#menulist").css('height', height - 94);
        var ish = $("#tablemain").height();
        if (height - 208 < ish) {
            ish = height - 208;
        }
        $("#is").css('height', height - 208);
    });
    $("#reordershla").click(function (event) {
        $("#indexmenu").css({
            display: 'none'
        });
        $("#indexmenuss").css({
            display: 'block'
        });
        var width = $(window).width();
        $("#indexcontent").css('width',(width-30)+'px');
    });
    $("#indexmenuss").click(function (event) {
        $("#indexmenu").css({
            display: 'block'
        });
        $("#indexmenuss").css({
            display: 'none'
        });
        var width = $(window).width();
        $("#indexcontent").css({
            width: (width-220)+'px'
        }); 
    });
});
function menulist(result) {
    var li = '';
    for (var i = result.length - 1; i >= 0; i--) {
        li += '<li>';
        li += '<a href="javascript:;"  title="' + result[i]['nodename'] + '"><i id="opennode" class="icon-plus"></i> <span id="shownode" data-ip="' + result[i]['nodeip'] + '">' + result[i]['nodename'] + '</span></a>';
        li += '<ul class="tview-menu2" style="display:none;">';
        li += '    <li onclick="navTask(\''+result[i]['nodeip']+'\',\'' + result[i]['nodename'] + '\')">节点的任务</li>';
        // li += '    <li >发往本节点的任务</li>';
        li += '    <li onclick="navExportTask(\''+result[i]['nodeip']+'\',\'' + result[i]['nodename'] + '\',\'fromthis\')">导出本节点的任务</li>';
        li += '    <li onclick="navExportTask(\''+result[i]['nodeip']+'\',\'' + result[i]['nodename'] + '\',\'tothis\')">导出发往本节点的任务</li>';
        li += '    <li onclick="navExportTask(\''+result[i]['nodeip']+'\',\'' + result[i]['nodename'] + '\',\'all\')">导出所有相关任务</li>';
        li += '</ul>';
        li += '</li>';
    }
    return li;
}
function navTask(nodeip,nodename) {  
    if (!nodeip) { 
        return false;
    } 
    clickmenu('task',nodeip,nodename); 
}; 
function navExportTask(ip,srcnodename,sel){ 
     var url = '/index.php/Home/TongGTP/tlexport?nodeip=' + ip + '&nodename=' +srcnodename+ "&sel="+sel; 
     if(ip){
        location.href=url;
     }
 }
//获取节点分类
$('.menuul').on("click", "#openthisf", function (e) {
    var tag = $(this);
    var l = $(this).attr('data-class');
    $.ajax({
        url: '/index.php/Home/TongGTP/get_menu?l=' + l,
        async: false,
        success: function (json) {
            json = eval("(" + json + ")");
            var tview1 = $(tag).parent().siblings('.tview-menu');
            if (!json.res) {
                $(tview1).html("无数据");
                setTimeout(function () {
                    $(tview1).remove();
                }, 2000);
                return false;
            }
            tview = $(tag).parent().siblings('.tview-menu');
            var ajaxli = menulist(json.res);
            tview.html(ajaxli);
        },
        beforeSend: function (json) {
            var ul = '<ul class="tview-menu" data-toggle="0">';
            ul += '<li> 正在加载...</li>';
            ul += '</ul>';
            var tview = $(tag).parent().siblings('.tview-menu');
            if (!tview.length) {
                $(tag).parent().after(ul);
            }
        },
        complete: function () {
            var isul = $(tag).parent().siblings('.tview-menu');
            var istoggle = $(isul).attr("data-toggle");
            if (istoggle == '1') {
                $(isul).hide('100');
                $(isul).attr("data-toggle", 0);
                $(tag).find('i').removeClass('icon-minus');
                $(tag).find('i').addClass('icon-plus');
            } else {
                $(isul).show('100');
                $(isul).attr("data-toggle", 1);
                $(tag).find('i').removeClass('icon-plus');
                $(tag).find('i').addClass('icon-minus');
            }
        }
    })
    return false;
})
//导出
$('.menuul').on("click", "#signout", function (e) {
    var tag = $(this);
    var tabid = $(this).attr('data-out');
    var url = '/index.php/Home/TongGTP/get_out?l=' + tabid;
    var is_exists = $('#tabs_title').find('#tabs_' + tabid).length;
                if (is_exists) { 
                    changetabs(tabid);
                    return false;
                }
    $.ajax({
        url: url, 
        success:function(json){
            json = eval("("+json+")");
            if (json.message != "ok") {
                    var cdid = "modal_" + (new Date()).getTime();
                    var cfooter = '<button class="btn btn-primary" data-dismiss="modal">关闭</button>';
                    var comm = create_modal(cdid, '信息提示', json.message, cfooter);
                    $('body').prepend(comm);
                    $("#" + cdid).modal('show');
                    $("#" + cdid).on('hidden_bs_modal', function () {
                        $("#" + cdid).remove();
                    });
                    return false;
                }
                html = json.html; 
                var title = '<div class="accive" id="tabs_' + tabid + '"  onclick="changetabs(\'' +tabid + '\')" temp="tabs"><i class="icon-signout"></i>  ' + json.title + '<span class="icon-remove" onclick="closetabs(\'' +tabid+ '\')"></span></div>'; 
                doappend(html, title, tabid);
        }
    }) 
    
    return false;
})
//滚动条样式
$('.menuul').on("click", "#opennode", function (e) {
    var ul = $(this).parent().siblings('ul');
    $(ul).toggle('50')
})
$(window).load(function () {
    $("#menulist").mCustomScrollbar({
        axis: "y",
        theme: "minimal-dark"
    });
});
//按行分类 
function clickmenu(a, ip, nodename) {
    var list = ['zh', 'fh', 'cz', 'kc', 'qt','s'];
    var tabid = 'list';
    if ($.inArray(a, list) != "-1") {
        tabid = 'list';
    } else {
        tabid = a;
    } 
    if(a=='s'){
        var key='&key='+getUrlParam('key')+'&keyword='+decodeURI(getUrlParam('keyword')); 
    }else{
        var key='';
    }
    var html = '';
    var title = '';
    if ($.inArray(a, list) != "-1") {
        $.get('/index.php/Home/TongGTP/get_class?l=' + a+key, function (response, status, xhr) {
            if (!response) {
                var cdid = "modal_" + (new Date()).getTime();
                var cfooter = '<button class="btn btn-primary" data-dismiss="modal">关闭</button>';
                var comm = create_modal(cdid, '信息提示', '参数错误！', footer);
                $('body').prepend(comm);
                $("#" + cdid).modal('show');
                $("#" + cdid).on('hidden_bs_modal', function () {
                    $("#" + cdid).remove();
                });
                return false;
            }
            html = response;
            var is_exists = $('#tabs_title').find('#tabs_' + tabid).length;
            if (is_exists) {
                $("#content_list").remove();
                $("#content_allmainview").append(html);
                changetabs(tabid);
                return false;
            }
            title = createtitle(tabid, '节点列表');
            doappend(html, title, tabid);
        });
    } else if (a == 'info') {
        if (!ip)
            return false;
        $.ajax({
            url: '/index.php/Home/TongGTP/get_info?ip=' + ip,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.message != "ok") {
                    var cdid = "modal_" + (new Date()).getTime();
                    var cfooter = '<button class="btn btn-primary" data-dismiss="modal">关闭</button>';
                    var comm = create_modal(cdid, '信息提示', '参数错误！', footer);
                    $('body').prepend(comm);
                    $("#" + cdid).modal('show');
                    $("#" + cdid).on('hidden_bs_modal', function () {
                        $("#" + cdid).remove();
                    });
                    return false;
                }
                html = json.html;
                var is_exists = $('#tabs_title').find('#tabs_' + tabid).length;
                if (is_exists) {
                    $("#content_info").remove();
                    $("#content_allmainview").append(html);
                    changetabs(tabid);
                    return false;
                }
                title = createtitle(tabid, '节点信息');
                doappend(html, title, tabid);
            }
        })
    } else if (a == 'task') {
        var ip = ip;
        if (!ip)
            return false;
        $.ajax({
            url: '/index.php/Home/TongGTP/get_task?ip=' + ip + '&at=task',
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.message != "ok") {
                    var cdid = "modal_" + (new Date()).getTime();
                    var cfooter = '<button class="btn btn-primary" data-dismiss="modal">关闭</button>';
                    var comm = create_modal(cdid, '信息提示', json.message, cfooter);
                    $('body').prepend(comm);
                    $("#" + cdid).modal('show');
                    $("#" + cdid).on('hidden_bs_modal', function () {
                        $("#" + cdid).remove();
                    });
                    return false;
                }
                html = json.html;
                var is_exists = $('#tabs_title').find('#tabs_' + tabid).length;
                if (is_exists) {
                    $("#content_task").remove();
                    $("#content_allmainview").append(html);
                    changetabs(tabid, nodename);
                    return false;
                }
                title = createtitle(tabid, nodename + '[任务]');
                doappend(html, title, tabid);
            }
        })
    } else {
        return false;
    }
}
function createtitle(a, name) {
    var title = '<div class="accive" id="tabs_' + a + '"  onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  ' + name + '<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span></div>';
    return title;
}
function doappend(html, title, a) {
    $("#content_allmainview").append(html);
    $('#tabs_title').append(title);
    changetabs(a);
}
function changetabs(e, nodename) {
    if (nodename) {
        $('#tabs_' + e).html('<i class="icon-sitemap"></i> ' + nodename + '[任务]<span class="icon-remove" onclick="closetabs(\'task\')"></span>');
    }
    $('#content_' + e).siblings().css('display', 'none');
    $('#tabs_' + e).siblings().removeClass('accive');
    $('#tabs_' + e).addClass('accive');
    $('#content_' + e).css('display', 'block');
}
$(".tview a").on("click", ":eq(1),:eq(0)", function (event) {
    var l = $(this).siblings("#openthisf").attr("data-class");
    clickmenu(l);
});
//点击显示节点详细信息
$(".menuul").on('click', '#shownode', function () {
    var ip = $(this).attr('data-ip');
    clickmenu('info', ip);
});
//关闭tab
function closetabs(e) {
    $("#content_allmainview").find('#content_' + e).remove();
    $('#tabs_title').find('#tabs_' + e).remove();
    var active = false;
    $('#tabs_title').find('div').each(function (e, div) {
        if ($(div).attr('class') == "accive") {
            active = true;
        } else {
            active = false;
        }
    });
    if (!active) {
        var last = $('#tabs_title').find('div:last');
        last.addClass('accive');
        var did = last.attr('id').split('_')[1];
        $('#content_allmainview').find('#content_' + did).css('display', 'block');
    }
}