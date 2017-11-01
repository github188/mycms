$(document).ready(function () {          //当浏览器大小变化时
    var bt = $("#content_allmainview").find('#pageList');
    var off = $(bt).offset();
    var left = off.left;
    var top = off.top + 34;
    var wh = $(window).height();
    var mh = $('body').find('#pageListMenu').height();
    if (top > wh - mh) {
        top = top + mh + 10 - wh;
    }
    var divh = $("#tablebody table").height();
    if (divh > wh - 168) {
        divh = wh - 168;
    }
    $("#tablebody").height(divh);
    $('body').find('#pageListMenu').css({
        top: top + "px",
        left: left + 'px'
    });
});
$(document).ready(function () {          //当浏览器大小变化时
    var bt = $("#content_allmainview").find('#pageList');
    var off = $(bt).offset();
    var left = off.left;
    var top = off.top + 34;
    var wh = $(window).height();
    var mh = $('body').find('#pageListMenu').height();
    if (top > wh - mh) {
        top = top + mh + 10 - wh;
    }
    var divh = $("#tablebody table").height();
    if (divh > wh - 168) {
        divh = wh - 168;
    }
    $("#tablebody").height(divh);
    $('body').find('#pageListMenu').css({
        top: top + "px",
        left: left + 'px'
    });
});
jQuery(function ($) {
    $("#tablefanye").on('click', '#pageList', function (event) {
        var page = $(this).find('#maxpage').html();
        var thispage = $(this).find('#pages').html();
        var numnav = '';
        numnav += '<div id="pageListMenu" class="rockmenu" style="display: block;position:fixed;z-index:10001;font-size:16px;">';

        numnav += '<div id="rockmenuli" class="rockmenuli" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; width: 115px;">';
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
        numnav += '</ul>';
        numnav += '</div>';
        numnav += '</div>';
        $('body').prepend(numnav);
        var off = $(this).offset();
        var left = off.left;
        var top = off.top;
        var wh = $(window).height();
        var mh = $('body').find('#pageListMenu').height();
        if (mh > 110) {
            mh = 110;
        }
        if (mh > wh - top) {
            top = top - mh;
        }
        $('body').find('#pageListMenu').css({
            'top': top + "px",
            'left': left + 'px'
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
            var key = $("#content_allmainview").find('#content_TongEasys #STongEasyKey').attr('selected');
            var keys = '';
            if (key) {
                keys += '&key=';
                keys += $("#content_allmainview").find('#content_TongEasys #STongEasyKey').val();
            }
            $.ajax({
                url: '/index.php/Home/TongEasy/appFlush?page=' + page + '&pagesize=' + size + keys,
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
//自适应屏幕大小
    $(window).resize(function (event) {
        var wh = $(window).height() - 170;
        var divh = $("#tablebody table").height();
        if (divh > wh) {
            divh = wh;
        }
        $("#tablebody").height(divh);
    });
    //翻页处理首页
    $("#shouye").click(function (event) {
        var size = $("#tablefanye #pagesize").val();
        var key = $("#sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $(".navtool-right").find('#sKey').val();
            keys += '&keyword=';
            keys += $(".navtool-right").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/TongEasy/appFlush?page=1&pagesize=' + size + keys,
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
        var key = $("#sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $(".navtool-right").find('#sKey').val();
            keys += '&keyword=';
            keys += $(".navtool-right").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/TongEasy/appFlush?page=' + (parseInt(page) - 1) + '&pagesize=' + size + keys,
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
        var key = $("#sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $(".navtool-right").find('#sKey').val();
            keys += '&keyword=';
            keys += $(".navtool-right").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/TongEasy/appFlush?page=' + (parseInt(page) + 1) + '&pagesize=' + size + keys,
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
        var key = $("#sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $(".navtool-right").find('#sKey').val();
            keys += '&keyword=';
            keys += $(".navtool-right").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/TongEasy/appFlush?page=' + maxpage + '&pagesize=' + size + keys,
            success: function (json) {
                json = eval("(" + json + ")");
                showSearchResult(json);
            }
        });
    });
    //单机算定Tr
    $("#tablebody").on('click', 'tbody tr', function () {
        $(this).siblings().removeAttr('style');
        $(this).siblings().removeAttr('selected');
        $(this).css({background: 'rgb(223, 240, 216) none repeat scroll 0% 0%'});
        $(this).attr('selected', 1);
        $("#del_info").removeAttr('disabled');
        $("#edit_info").removeAttr('disabled');
    })
    $(window).resize(function () {          //当浏览器大小变化时
        var bt = $("#content_allmainview").find('#pageList');
        var off = $(bt).offset();
        var left = off.left;
        var top = off.top;
        var wh = $(window).height();
        var mh = $('body').find('#pageListMenu').height();
        if (mh > 110) {
            mh = 110;
        }
        if (mh > wh - top) {
            top = top - mh;
        } 
        $('body').find('#pageListMenu').css({
            top: top + "px",
            left: left + 'px'
        });
    });

    $("#pagesize").keydown(function (event) {
        var key = event.keyCode;
        if (key == 13) {
            cPageSize($(this));
        }
    });
    $("#pagesize").on("change", function (event) {
        cPageSize($(this));
    });

})
//修改每页显示条数
function cPageSize(e) {
    var size = $(e).val();
    var key = $("#sKey").attr('selected');
    var keys = '';
    if (key) {
        keys += '&key=';
        keys += $(".navtool-right").find('#sKey').val();
        keys += '&keyword=';
        keys += $(".navtool-right").find('#sKeyword').val();
    }
    $.ajax({
        url: '/index.php/Home/TongEasy/appFlush?page=1&pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == "10000") {
                showSearchResult(json);
            }
        }
    })
}
function showSearchResult(json) {
    var data = json.result.data;
    var trs = '';
    for (var i = 0; i < data.length; i++) {
        trs += '<tr>';
        trs += '<th width="40">';
        trs += json.result.pagesize * (json.result.pages - 1) + i + 1;
        trs += '    <input type="hidden" name="app_name" value="' + data[i]['app_name'] + '">'; 
        trs += '    <input type="hidden" name="nodenum" value="' + data[i]['nodenum'] + '">';
        trs += '</th> '; 
        trs += '<th> '; 
        trs +=  '<a href="javascript:;" onmouseover="tooltips(this);" title="点击查看节点信息"  >'+data[i]['app_name']+'</a>'; 
        trs += '</th> '; 
        trs += '<th> '; 
        trs +=  data[i]['nodenum']; 
        trs += '</th> '; 
        trs += '</tr>';
    }
    ;
    $("#tableSAppList").html(trs);
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
    var wh = $(window).height();
    var mh = $('body').find('#pageListMenu').height();
    if (top > wh - mh) {
        top = top + mh + 10 - wh;
    }
    var divh = $("#tablebody table").height();
    if (divh > wh - 170) {
        divh = wh - 170;
    }
    $("#tablebody").height(divh);
}
//更新数据
function reFreshData() {
    var size = $("#tablefanye #pagesize").val();
    var key = $("#sKey").attr('selected');
    var key1 = $("#seckey").attr('data-seckey');
    if(key1!=key){
        key=key1;
    }
    var keys = '';
    if (key) {
        keys += '&key=';
        keys += $(".navtool-right").find('#sKey').val();
        keys += '&keyword=';
        keys += $(".navtool-right").find('#sKeyword').val();
    }
    $.ajax({
        url: '/index.php/Home/TongEasy/appFlush?pagesize=' + size + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == "10000") {
                showSearchResult(json);
            } else {
                ntrs = '<tr>';
                ntrs += '<th colspan="9">';
                ntrs += '未找到相关结果';
                ntrs += '</th>';
                ntrs += '<tr>';
                $("#tablebody #tableSAppList").html(ntrs);
                $("#maxpage").html('0');
                $("#pages").html('0');
                $("#zjilu").html('0');
                $("#pagesize").html('0');
                $("#shouye").attr('disabled', true);
                $("#shang").attr('disabled', true);
                $("#next").attr('disabled', true);
                $("#lastye").attr('disabled', true);
                $("#pageList").attr('disabled', true);
            }
        }
    })
}  
//点击搜索
$("#seachicon").click(function () { 
    $("#sKey").attr('selected', true);
    reFreshData();
})
$("#sKeyword").keydown(function(event) {
    if(event.keyCode==13){
        $("#sKey").attr('selected', true);
        reFreshData();
    }
});  
//导出节点
$("#tongeasy_signout").click(function(){
    var keys = '';
    var key = $("#sKey").attr('selected');
    if (key) {
        keys += '&key=';
        keys += $(".navtool-right").find('#sKey').val();
        keys += '&keyword=';
        keys += $(".navtool-right").find('#sKeyword').val();
    }
    location.href= '/index.php/Home/TongEasy/out_app?' + keys;
});
//点击查看详细节点
$("#tableSAppList").on('click','a',function(){
    var keyword =$(this).html();
    location.href='/index.php/Home/TongEasy/query?l=s&key=sys_name&keyword='+keyword; 
})