jQuery(function ($) {
    $(document).ready(function () {
        var height = $(window).height();
        var width = $(window).width();
        $("#indexcontent").css('width', width - 200);
        $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
        $("#indexcontent").css('height', height - 94);
        $("#menulist").css('height', height - 94);
    });
    $(window).resize(function (event) {
        var height = $(window).height();
        var width = $(window).width();
        $("#indexcontent").css('width', width - 200);
        $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
        $("#indexcontent").css('height', height - 94);
        $("#menulist").css('height', height - 94); 
        var ish = $("#tablemain").height(); 
        if(height-208<ish){
            ish=height - 208;
        } 
        $("#is").css('height', height-208);
    });
    $("#reordershla").click(function (event) {
        $("#indexmenu").css({
            display: 'none'
        });
        $("#indexmenuss").css({
            display: 'block'
        });
        $("#indexcontent").css({
            width: ' 1331px'
        });
    });
    $("#indexmenuss").click(function (event) {
        $("#indexmenu").css({
            display: 'block'
        });
        $("#indexmenuss").css({
            display: 'none'
        });
        $("#indexcontent").css({
            width: ' 1171px'
        });
    });
    $("#indexmenuss").click(function (event) {
        $("#indexmenu").css({
            display: 'block'
        });
        $("#indexmenuss").css({
            display: 'none'
        });
        $("#indexcontent").css({
            width: ' 1171px'
        });
    });
})
function doact(e) {
    var is_exists = $('#tabs_title').find('#tabs_' + e).length;
    if (is_exists) {
        changetabs(e);
        return false;
    }
    if (e == 'add') {
        var title_tab = '<div class="accive" id="tabs_add" onclick="changetabs(\'add\')" temp="tabs"><i class="icon-plus"></i>  新增节点信息<span class="icon-remove" onclick="closetabs(\'add\')"></span></div>';
    }
    $.ajax({
        url: '/index.php/Home/Mq/get_add',
        success: function (jsoan) {
            $("#content_allmainview").append(jsoan);
            $('#tabs_title').append(title_tab);
            changetabs(e);
        }
    })


}
function changetabs(e) {
    $('#content_' + e).siblings().css('display', 'none');
    $('#tabs_' + e).siblings().removeClass('accive');
    $('#tabs_' + e).addClass('accive');
    $('#content_' + e).css('display', 'block');
}
function createtitle(a, name) {
    var title = '<div class="accive" id="tabs_' + a + '"  onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  ' + name + '<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span></div>';
    return title;
}
function clickmenu(e, a, b) { 
    var is_exists = $('#tabs_title').find('#tabs_' + a).length;
    if (is_exists) {
        changetabs(a);
        return false;
    }
    var html = '';
    var title = '';
    if (a == "production") {
        $.get("/index.php/Home/Mq/get_prod", function (response, status, xhr) {
            html = response;
            title = createtitle(a, '生产环境')
            doappend(html, title, a)
        });
    } else if (a == "zaibei") {
        $.get("/index.php/Home/Mq/get_zaibei", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  灾备<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else if (a == "zsc") {
        $.get("/index.php/Home/Mq/get_zsc", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  准生产环境<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else if (a == "cs") {
        $.get("/index.php/Home/Mq/get_cs", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  测试环境<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else if (a == "qt") {
        $.get("/index.php/Home/Mq/get_qt", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  其他环境<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else if (a == "import") {
        $.get("/index.php/Home/Mq/get_import", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-signin"></i>  节点导入<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else if (a == "export") {
        $.get("/index.php/Home/Mq/get_export", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-signout"></i>  节点导出<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    }else if (a == "delete") {
        $.get("/index.php/Home/Mq/get_delete", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-signout"></i>  批量删除<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else {
        return false;
    }

}
function doappend(html, title, a) {
    $("#content_allmainview").append(html);
    $('#tabs_title').append(title);
    changetabs(a);
}
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
$(document).on('click', function (e) {
    var target = e.target.id;
    if (target == "setting") {
        $("#sqtshow").hide();
        $("#settingshow").show();
    } else if (target == "sqt") {
        $("#settingshow").hide();
        $("#sqtshow").show();
    } else {
        $("#settingshow").hide();
        $("#sqtshow").hide();
    }
});
$("#settingshow").on('click', 'li', function (event) {
    event.preventDefault();
    var key = $(this).attr('data-key');
    var keyname = $(this).find('a').html();
    $('#chtml1').html(keyname);
    $('#indexSearch #sKs').val(key);
});
$("#sqtshow").on('click', 'li', function (event) {
    event.preventDefault();
    var key = $(this).attr('data-key');
    var keyname = $(this).find('a').html();
    $('#chtml2').html(keyname);
    $('#indexSearch #sKey').val(key);
});
//点击回车搜索
function enlicks(){
    var setting = $('#indexSearch #sKs').val();
    var sKey = $('#indexSearch #sKey').val();
    var keys = '&key=';
    keys += sKey;
    keys += '&keyword=';
    keys += $("#indexSearch").find('#sKeyword').val();
    $.ajax({
        url: '/index.php/Home/Mq/pageGo?l=' + setting + '&page=1&pagesize=15' + keys,
        success: function (json) {
            json = eval("(" + json + ")");
            $("#indexSearch").css('margin-top', '56px');
            if(json.code=="10000"){
                showSRi(json);
            }else{
                $("#commonmodal .modal-body").html("<h2>"+json.message+"</h2>");
                $("#commonmodal").modal("show");
            }
            
        }
    });
    $("#content_home #sKey").attr('selected', true);
}
$("#iGoSearch").click(function (event) {
    /* Act on the event */
    enlicks(); 
});
$('#content_home #sKeyword').keydown(function(e){
    if(e.keyCode==13){ 
        enlicks();
    }
})
//搜索结果
function showSRi(json) {
        var data = json.result.data;
        var trs = '';
        for (var i = 0; i < data.length; i++) {
            trs += '<tr>';
            trs += '<th width="40">';
            trs += json.result.pagesize * (json.result.pages - 1) + i + 1;
            trs += '    <input type="hidden" name="sys_id" value="' + data[i]['sys_id'] + '">';
            trs += '    <input type="hidden" name="user_name" value="' + data[i]['user_name'] + '">';
            trs += '    <input type="hidden" name="tenodename" value="' + data[i]['tenodename'] + '">';
            trs += '</th> ';
            trs += '<th algin="center">' + data[i]["os_name"] + '</th>';
            trs += '<th algin="center">' + data[i]["mq_date"] + '</th>';
            trs += '<th algin="center">' + data[i]["setting"] + '</th>';
            trs += '<th algin="center">' + data[i]["ip"] + '</th>';
            trs += '<th algin="center">' + data[i]["password"] + '</th>';
            trs += '<th algin="center">' + data[i]["os_ver"] + '</th>';
            trs += '<th algin="center">' + data[i]["hostname"] + '</th>';
            trs += '<th algin="center">' + data[i]["qm_name"] + '</th>'; 
            trs += '<th algin="center">' + data[i]["os_limit"] + '</th>';
            trs += '<th algin="center">' + data[i]["file_logsize"] + '</th>';
            trs += '<th algin="center">' + data[i]["mq_ver"] + '</th>';
            trs += '<th algin="center">' + data[i]["pattern"] + '</th>';
            trs += '<th algin="center">' + data[i]["manager"] + '</th>';
            trs += '<th algin="center">' + data[i]["cscript"] + '</th>';
            trs += '<th algin="center">' + data[i]["mq_explain"] + '</th>';
            trs += '<th algin="center">' + data[i]["doit"] + '</th>';
            trs += '<th algin="center">' + data[i]["other"] + '</th>'; 
            trs += '</tr>';
        } 
        $("#iSRtable").html(trs); 
        $("#content_home #maxpage").html(json.result.maxpage);
        $("#content_home #pages").html(json.result.pages);
        $("#content_home #zjilu").html(json.result.total);
        $("#content_home #pagesize").val(json.result.pagesize);
        if (json.result.maxpage <= 1) {
            $("#content_home #shouye").attr('disabled', true);
            $("#content_home #shang").attr('disabled', true);
            $("#content_home #next").attr('disabled', true);
            $("#content_home #lastye").attr('disabled', true);
            $("#content_home #pageList").attr('disabled', true);
        } else {
            if (json.result.pages == 1) {
                $("#content_home #shouye").attr('disabled', true);
                $("#content_home #shang").attr('disabled', true);
                $("#content_home #next").removeAttr('disabled');
                $("#content_home #lastye").removeAttr('disabled');
                $("#content_home #pageList").removeAttr('disabled');
            } else if (json.result.pages == json.result.maxpage) {
                $("#content_home #shouye").removeAttr('disabled');
                $("#content_home #shang").removeAttr('disabled');
                $("#content_home #next").attr('disabled', true);
                $("#content_home #lastye").attr('disabled', true);
                $("#content_home #pageList").removeAttr('disabled');
            } else {
                $("#content_home #shouye").removeAttr('disabled');
                $("#content_home #shang").removeAttr('disabled');
                $("#content_home #next").removeAttr('disabled');
                $("#content_home #lastye").removeAttr('disabled');
                $("#content_home #pageList").removeAttr('disabled');
            }
        }

        $("#iSResult").show();
        var wh = $(window).height();
        var mh = $('body').find('#content_home #pageListMenu').height(); 
        var ish = $("#is #tablemain").height()+25;  
        if(wh-208<ish){
            ish=wh - 208;
        }  
        $("#is").css('height', ish); 
    }
    //翻页处理首页
    $("#content_home #shouye").click(function (event) {
        var size = $("#content_home #tablefanye #pagesize").val();
        var key = $("#content_home #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_home").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_home").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Mq/pageGo?l=cs&page=1&pagesize=' + size + keys,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRi(json);
            }
        })
    });
//翻页处理上一页
    $("#content_home #shang").click(function (event) {
        var page = $("#content_home #pages").html();
        if (parseInt(page) <= 1) {
            return false;
        }
        var size = $("#content_home #tablefanye #pagesize").val();
        var key = $("#content_home #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_home").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_home").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Mq/pageGo?l=cs&page=' + (parseInt(page) - 1) + '&pagesize=' + size + keys,
            async:false,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRi(json);
            }
        })
    });
//翻页处理下一页
    $("#content_home #next").click(function (event) {
        var page = $("#content_home #pages").html();
        var maxpage = $("#content_home #maxpage").html();
        if (parseInt(page) >= parseInt(maxpage)) {
            return false;
        }
        var size = $("#content_home #tablefanye #pagesize").val();
        var key = $("#content_home #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_home").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_home").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Mq/pageGo?l=cs&page=' + (parseInt(page) + 1) + '&pagesize=' + size + keys,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRi(json);
            }
        })
    });
//翻页处理最后一页
    $("#content_home #lastye").click(function (event) {
        var page = $("#content_home #pages").html();
        var maxpage = $("#content_home #maxpage").html();
        if (parseInt(page) >= parseInt(maxpage)) {
            return false;
        }
        var size = $("#content_home #tablefanye #pagesize").val();
        var key = $("#content_home #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_home").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_home").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Mq/pageGo?l=cs&page=' + maxpage + '&pagesize=' + size + keys,
            success: function (json) {
                json = eval("(" + json + ")");
                showSRi(json);
            }
        });
    });
    //修改每页显示条数
    $("#content_home #pagesize").keydown(function (event) {
        var key = event.keyCode;
        if (key == 13) {
            iPageSize($(this));
        }
    });
    $("#content_home #pagesize").on("change", function (event) {
        iPageSize($(this));
    });
    function iPageSize(e) {
        var size = $(e).val();
        var key = $("#content_home #sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += '&key=';
            keys += $("#content_home").find('#sKey').val();
            keys += '&keyword=';
            keys += $("#content_home").find('#sKeyword').val();
        }
        $.ajax({
            url: '/index.php/Home/Mq/pageGo?l=cs&page=1&pagesize=' + size + keys,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    showSRi(json);
                }
            }
        })
    } 