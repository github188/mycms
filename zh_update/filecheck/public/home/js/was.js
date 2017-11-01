$(document).ready(function () {
    var height = $(window).height();
    var width = $(window).width();
    $("#indexcontent").css('width', width - 250);
    $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
    $("#indexcontent").css('height', height - 94);
    $("#menulist").css('height', height - 94);
    var listw = $('#gtpcont').width();
    $('#indexcontent').width(listw);
    var key = getUrlParam("key");
    var keyword = decodeURI(getUrlParam("keyword"));
    if (key && keyword) {
        var keyname = $("#keysList").find('[data-key=' + key + ']').text();
        $("#sKeyword").val(keyword);
        $("#was_shearch_keyname").html(keyname);
    }
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
$(function () { 
    //导出节点
    $("#menulist").on('click', "#was_signout", function () {
        location.href = '/index.php/Home/Was/signout';
    })
    //添加节点
    $("table").on('click', "#add_node", function () {  
        location.href = '/index.php/Home/Was/addpage'; 
    })
    //编辑按钮
    $("#content_list #edit_node").on('mouseover', function () {
        var str = $("#content_list #tableshowcs").find('[selected]');
        var id = str.find('input[name=wasid]').val();
        if (!id) {
            $("#content_list #edit_node").attr('disabled', true);
            $("#content_list #delete_node").attr('disabled', true);
            return false;
        }
    })
    //编辑按钮
    $("#content_list #delete_node").on('mouseover', function () {
        var str = $("#content_list #tableshowcs").find('[selected]');
        var id = str.find('input[name=wasid]').val();
        if (!id) {
            $("#content_list #edit_node").attr('disabled', true);
            $("#content_list #delete_node").attr('disabled', true);
            return false;
        }
    })
    //编辑按钮
    $("#content_list #edit_node").on('click', function () {
        var str = $("#content_list #tableshowcs").find('[selected]');
        var id = str.find('input[name=wasid]').val();
        if (!id) {
            layer.msg("请单击要编辑的行");
            return false;
        }
        location.href = "/index.php/Home/Was/edit?id=" + id;
    })
    //删除按钮
    $("#content_list #delete_node").on('click', function () {
        var str = $("#content_list #tableshowcs").find('[selected]');
        var id = str.find('input[name=wasid]').val();
        if (!id) {
            layer.msg("请单击要删除的行");
            return false;
        }
        layer.confirm('您确定要删除吗？', {btn: ['删除', '取消']}, function () {
            $.ajax({
                url: "/index.php/Home/Was/delete?id=" + id,
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.success) {
                        layer.msg('删除成功', function () {
                            location.reload();
                        });
                        return false;
                    } else {
                        layer.msg(json.errorMsg);
                    }
                }
            })
        });
        return false;
    })
//--------------------------------------------------------//
    var url_key = getUrlParam("key");
    var url_keyword = decodeURI(getUrlParam("keyword"));
    var url_osenvir = decodeURI(getUrlParam("osenvir"));
    var curl = '';
    if (url_key && url_keyword) {
        curl += '&key=' + url_key + '&keyword=' + url_keyword;
    }
    if (url_osenvir && url_osenvir != 'null') {
        curl += '&osenvir=' + url_osenvir;
    }
//------------------------------------------------------//

    //翻页处理首页
    $("#content_list #shouye").click(function (event) {
        var size = $("#content_list #tablefanye #pagesize").val();
        var key = $("#content_list #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_list").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_list").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Was/pageGo?page=1&pagesize=' + size + keys + curl,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRCs(json);
            }
        })
    });
//翻页处理上一页
    $("#content_list #shang").click(function (event) {
        var page = $("#content_list #pages").html();
        if (parseInt(page) <= 1) {
            return false;
        }
        var size = $("#content_list #tablefanye #pagesize").val();
        var key = $("#content_list #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_list").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_list").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Was/pageGo?page=' + (parseInt(page) - 1) + '&pagesize=' + size + keys + curl,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRCs(json);
            }
        })
    });
//翻页处理下一页
    $("#content_list #next").click(function (event) {
        var page = $("#content_list #pages").html();
        var maxpage = $("#content_list #maxpage").html();
        if (parseInt(page) >= parseInt(maxpage)) {
            return false;
        }
        var size = $("#content_list #tablefanye #pagesize").val();
        var key = $("#content_list #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_list").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_list").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Was/pageGo?page=' + (parseInt(page) + 1) + '&pagesize=' + size + keys + curl,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRCs(json);
            }
        })
    });
//翻页处理最后一页
    $("#content_list #lastye").click(function (event) {
        var page = $("#content_list #pages").html();
        var maxpage = $("#content_list #maxpage").html();
        if (parseInt(page) >= parseInt(maxpage)) {
            return false;
        }
        var size = $("#content_list #tablefanye #pagesize").val();
        var key = $("#content_list #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_list").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_list").find('#sKeyword').val();
            l = 's';
        }
        $.ajax({
            url: '/index.php/Home/Was/pageGo?page=' + maxpage + '&pagesize=' + size + keys + curl,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRCs(json);
            }
        });
    });
    //修改每页显示条数
    $("#content_list #pagesize").keydown(function (event) {
        var key = event.keyCode;
        if (key == 13) {
            csPageSize($(this));
        }
    });
    $("#content_list #pagesize").on("change", function (event) {
        csPageSize($(this));
    });
    function csPageSize(e) {
        var size = $(e).val();
        var key = $("#content_list #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_list").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_list").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Was/pageGo?page=1&pagesize=' + size + keys + curl,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    showSRCs(json);
                }
            }
        })
    }
})
function showSRCs(json) {
    var data = json.result.data;
    var trs = '';
    for (var i = 0; i < data.length; i++) {
        trs += '<tr title="单机选定">';
        trs += '<th width="30">';
        trs += json.result.pagesize * (json.result.pages - 1) + i + 1;
        trs += '<input type="hidden" name="wasid" value="' + data[i].wasid + '"> ';
        trs += '</th> ';
        trs += '<th algin="center"><a  href="javascript:void(0);"  class="cursor">' + data[i].osenvir + '</a></th>';
        trs += '<th algin="center">' + data[i].osclass + '</th>';
        trs += '<th algin="center">' + data[i].osname + '</th>';
        trs += '<th algin="center">' + data[i].hostname + '</th>';
        trs += '<th algin="center">' + data[i].manager_ip + '</th> ';
        trs += '<th algin="center">' + data[i].username + '</th> ';
        trs += '<th algin="center">' + data[i].was_ver + '</th> ';
        trs += '<th algin="center">' + data[i].add_date + '</th> ';
        trs += '</tr>';
    }
    $("#tableshowcs").html(trs);
    $("#content_list #maxpage").html(json.result.maxpage);
    $("#content_list #pages").html(json.result.pages);
    $("#content_list #zjilu").html(json.result.total);
    $("#content_list #pagesize").val(json.result.pagesize);
    if (json.result.maxpage <= 1) {
        $("#content_list #shouye").attr('disabled', true);
        $("#content_list #shang").attr('disabled', true);
        $("#content_list #next").attr('disabled', true);
        $("#content_list #lastye").attr('disabled', true);
        $("#content_list #pageList").attr('disabled', true);
    } else {
        if (json.result.pages == 1) {
            $("#content_list #shouye").attr('disabled', true);
            $("#content_list #shang").attr('disabled', true);
            $("#content_list #next").removeAttr('disabled');
            $("#content_list #lastye").removeAttr('disabled');
            $("#content_list #pageList").removeAttr('disabled');
        } else if (json.result.pages == json.result.maxpage) {
            $("#content_list #shouye").removeAttr('disabled');
            $("#content_list #shang").removeAttr('disabled');
            $("#content_list #next").attr('disabled', true);
            $("#content_list #lastye").attr('disabled', true);
            $("#content_list #pageList").removeAttr('disabled');
        } else {
            $("#content_list #shouye").removeAttr('disabled');
            $("#content_list #shang").removeAttr('disabled');
            $("#content_list #next").removeAttr('disabled');
            $("#content_list #lastye").removeAttr('disabled');
            $("#content_list #pageList").removeAttr('disabled');
        }
    }
    var wh = $(window).height();
    var mh = $('body').find('#content_list #pageListMenu').height();
    var divh = $("#reslist #tablemain").height();
    if (divh > wh - 150) {
        divh = wh - 150;
    }
    $("#reslist #tablemain").height(divh);
}