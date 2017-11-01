jQuery(function () {
    //treeNav
    $("#treeNav ul").on('click', 'a', function () {
        var pul = $(this).parent().parent();
        var key = pul.attr('data-key');
        var go = $(this).attr('data-go');
        var year = pul.attr('data-year');
        var xmsel = pul.attr('data-xmsel');
        var url = "";
        if (!key) {
            return false;
        }
        if (key == 'month') {
            url = '/index.php/Home/Mreport/dos?years=' + year + '&months=' + go + '&xmsel=' + xmsel;
        } else if (key == 'year') {
            url = '/index.php/Home/Mreport/dos?years=' + go + '&xmsel=' + xmsel;
        } else if (key == 'xmsel') {
            url = '/index.php/Home/Mreport/dos?xmsel=' + go;
        } else {
            return false;
        }
        $.ajax({
            url: url,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    $("#resshow").html(json.div);
                     $("input[name=nowurl]").val(json.nowurl);
                    var height = $(window).height();
                    var width = $(window).width();
                    var wh = $('#resshow table').height();
                    if (wh > (height - 200)) {
                        wh = height - 200;
                    }
                    $('#resshow').css({"height": wh + 1, "width": width - 320});
                    $("#nav-tool").css("margin-top", wh + 11);
                } else {
                    $("#commonmodal .modal-body").html('<h2>' + json.message + '</h2>');
                    $("#commonmodal").modal('show');
                }
            }
        })
    })
    $("#download").click(function (event) {
        window.open('/index.php/Home/Mreport/down', '', 'scrollbars=no,toolbar=no,top=100, left=100, menubar=no, location=no, status=no');
    });
    $("#upload_report").click(function (event) {
        window.open('/index.php/Home/Mreport/iereport', '', 'scrollbars=no,toolbar=no,top=100, left=100, menubar=no, location=no, status=no,width=1000');
    });
    $("#su").click(function (event) {
        var wd = $("[name=wd]").val();
        if (!wd) {
            $("[name=wd]").focus();
            return false;
        }
        $.ajax({
            url: '/index.php/Home/Mreport/dos?wd=' + wd,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    $("#resshow").html(json.div);
                    var height = $(window).height();
                    var width = $(window).width();
                    var wh = $('#resshow table').height();
                    if (wh > (height - 200)) {
                        wh = height - 200;
                    }
                    $('#resshow').css({"height": wh + 1, "width": width - 320});
                    $("#nav-tool").css("margin-top", wh + 11);
                } else {
                    $("#commonmodal .modal-body").html(json.message);
                    $("#commonmodal").modal('show');
                }
            }
        })

    });
    $("#kw").on('keyup', function (e) {
        if (e && e.preventDefault) {
            //阻止默认浏览器动作(W3C)
            e.preventDefault();
        } else {
            //IE中阻止函数器默认动作的方式
            window.event.returnValue = false;
        }
        var wd = $("[name=wd]").val();
        if (wd) {
            $.ajax({
                url: '/index.php/Home/Mreport/navlist?wd=' + wd,
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.code == "10000") {
                        var len = parseInt(json.len) * 13;
                        $("#prompt").css('width', len);
                        $("#prompt a").css('width', len);
                        $("#prompt").html(json.html);
                        $('.navlist').show();
                        $(document).off('click');
                        setTimeout(function () {
                            $(document).one('click', function () {
                                $('.navlist').css('display', 'none');
                            });
                        }, 0);
                    } else {
                        $('.navlist').hide();
                    } 
                }
            })
        }
    })
    $("#kw").on('keydown', function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) {
            var wd = $("[name=wd]").val();
            if (!wd) {
                wd = $("[name=wd]").focus();
                return false;
            }
        }
    })
    $("#prompt").on('click', 'a', function () {
        var wd = $(this).html();
        $("[name=wd]").val(wd);
        $('.navlist').hide();
    })
    $(".container").click(function (event) {
        /* Act on the event */
    });
})

//月报预览
function clickview(docid) {
    url = '/index.php/Home/Mreport/mview?id=' + docid;
    url = encodeURI(url);
    window.open(url, "", "scrollbars=no,toolbar=no,top=100, left=100, menubar=no, location=no, status=no,width=800");
}
//全选，取消全选，下载
$("#nav-tool").on('click', '#mq-report-checkall', function () {
    $("#resshow input[name=re_checkbox]").prop("checked", "checked");
});
$("#nav-tool").on('click', '#mq-report-qxall', function () {
    $("#resshow input[name=re_checkbox]").attr("checked", false);
});
$("#nav-tool").on('click', '#mq-report-down', function () {
    var i = 0;
    var arr = new Array();
    $("#resshow input[name=re_checkbox]:checked").each(function (index, el) {
        arr[i] = $(el).val();
        i++;
    });
    var url = "";
    if (arr[0]) {
        url = "/index.php/Home/Mreport/moredown?repid=" + arr;
        window.location = url;
    } else {
        alert("请选择要下载的月报");
    }
});
// //批量月报状态调整
$("#nav-tool").on('click', '#mq-report-verify', function () {
    var i = 0;
    var arr = new Array();
    $("#resshow input[name=re_checkbox]:checked").each(function (index, el) {
        arr[i] = $(el).val();
        i++;
    });
    var url = "";
    if (arr[0]) {
        $.ajax({
            url: '/index.php/Home/Mreport/checkpower?act=mreport&p=verify',
            success: function (json) {
                json = eval("(" + json + ")");
                var btn = '';
                if (json.code == "10000") {
                    for (var i = 0; i < json.data.length; i++) { 
                            var css = json.data[i].status_css.replace("btn-xs", " ");
                            btn += '<button onclick="btnShenhe(this)" data-status="' + json.data[i].status + '"  class="' + css + '">' + json.data[i].status_name + '</button>';
                            btn += '&nbsp;&nbsp;&nbsp;&nbsp;'; 
                    }
                    $("#commonmodal .modal-tittle").html("修改月报状态");
                    $("#commonmodal .modal-body").html(btn);
                    $("#commonmodal .modal-footer").html('<button id="qrshehe" onclick="plshenhe(\''+arr+'\',this);" class="btn btn-primary" data-dismiss="modal">确定</button>&nbsp;&nbsp;&nbsp;<button  class="btn btn-primary" data-dismiss="modal">取消</button>');
                    $("#commonmodal").modal("show");
                }

            }
        })  

    } else {
        return false;
    }
});
//批量提交批量审核
function plshenhe(ids,e){
    var status = $(e).attr("data-status");
    var data = {
        'id': ids,
        'status': status
    };
    if (!status) { 
        return false;
    }
    $.ajax({
        url: '/index.php/Home/Mreport/cPLStatus',
        type: 'POST',
        data: data,
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == '10000') {
                var nowurl = $("[name=nowurl]").val();
                var dates = new Date().getTime();
                loading('resshow', dates);
                reflushst(nowurl, dates);
            }         }
    })
}
$(document).ready(function () {
    var height = $(window).height();
    var width = $(window).width();
    var wh = $('#resshow table').height();
    if (wh > (height - 200)) {
        wh = height - 200;
    }
    $('#resshow').css({"height": wh + 1, "width": width - 320});
    $("#nav-tool").css("margin-top", wh + 11);
});
//删除月报
$(".container").on("click", "#mreportdel", function (event) {
    $("#commonmodal .modal-tittle").html("确定要删除以下月报吗？");
    $("#commonmodal .modal-tittle").attr({
        'font-size': '21px',
        'margin-top': '-11px'
    });
    var id = $(this).parent().parent().find('[name=re_checkbox]').val()
    var name = $(this).parent().parent().find("#report_name").html()
    $("#commonmodal .modal-body").html("<strong>" + name + "</strong>");
    var footer = '<button data-id="' + id + '" id="delety" class="btn btn-primary" >删除</button>';
    footer += '<button class="btn btn-primary" data-dismiss="modal">取消</button>';
    $("#commonmodal .modal-footer").html(footer);
    $("#commonmodal").modal('show');
    $("#commonmodal .modal-footer").on("click", "#delety", function (event) {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "/index.php/Home/Mreport/delete?id=" + id,
            type: 'get',
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    var td = $(".container table").find("[value=" + id + "]");
                    td.parent().parent().remove();
                }

                setTimeout(function () {
                    $("#commonmodal .modal-tittle").html("");
                    $("#commonmodal .modal-body").html("<h3>" + json.message + "</h3>");
                    $("#commonmodal .modal-footer").html('<button class="btn btn-primary" data-dismiss="modal">确定</button>');
                    $("#commonmodal").modal("show");
                }, 300);
            }
        });
    });
});
$(".container").on("click", "#daiShenhe", function (event) {
    var id = $(this).attr('data-id');
    var status = $(this).attr('data-status');
    var msta;
    $.ajax({
        url: '/index.php/Home/Index/checkpower?act=mreport&p=verify',
        success: function (json) {
            if (json == 1) {
                $.ajax({
                    url: '/index.php/Home/Mreport/mrstatus',
                    async: false,
                    success: function (json) {
                        json = eval("(" + json + ")");
                        msta = json.data;
                    }
                });
                var btn = '';
                for (var i = 0; i < msta.length; i++) {
                    if (msta[i].status != status) {
                        var css = msta[i].status_css.replace("btn-xs", " ");
                        btn += '<button onclick="btnShenhe(this)" data-status="' + msta[i].status + '"  class="' + css + '">' + msta[i].status_name + '</button>';
                        btn += '&nbsp;&nbsp;&nbsp;&nbsp;';
                    }
                }
                $("#commonmodal .modal-tittle").html("修改月报状态");
                $("#commonmodal .modal-body").html(btn);
                $("#commonmodal .modal-footer").html('<button id="qrshehe" onclick="qrshehe(\'' + id + '\',this);" class="btn btn-primary" data-dismiss="modal">确定</button>&nbsp;&nbsp;&nbsp;<button  class="btn btn-primary" data-dismiss="modal">取消</button>');
                $("#commonmodal").modal("show");
            }
        }
    })
})
function btnShenhe(e) {
    var sname = $(e).html();
    var dataStatus = $(e).attr('data-status');
    if (dataStatus) {

    }
    var spanh = '<span id="shtishi" style="color:#449d44;margin-right:10px;">' + sname + '</span>';
    $(e).attr('selected', true);
    $(e).siblings().removeClass('focus');
    $(e).addClass('focus');
    $("#qrshehe").attr('data-status', dataStatus);
    $("#commonmodal #shtishi").remove();
    $("#commonmodal .modal-footer").prepend(spanh)
}
function qrshehe(id, e) {
    var status = $(e).attr("data-status");
    var data = {
        'id': id,
        'status': status
    };
    if (!status) {
        // var spanh = '<span id="shtishi" style="color:red;margin-right:10px;">请选择月报状态</span>';
        // $("#commonmodal .modal-footer").prepend(spanh);
        return false;
    }
    $.ajax({
        url: '/index.php/Home/Mreport/cStatus',
        type: 'POST',
        data: data,
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == '10000') {
                var nowurl = $("[name=nowurl]").val();
                var dates = new Date().getTime();
                loading('resshow', dates);
                reflushst(nowurl, dates);
            }
            setTimeout(function () {
                $("#commonmodal .modal-tittle").html("修改月报状态结果");
                $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                $("#commonmodal .modal-footer").html('<button   class="btn btn-primary" data-dismiss="modal">确定</button>&nbsp;&nbsp;&nbsp;');
                $("#commonmodal").modal("show");
            }, 300);
        }
    })

}
function reflushst(nowurl, dates) {
    $.ajax({
        url: '/index.php/Home/Mreport/reflushst?' + nowurl,
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == '10000') {
                $("#resshow").html(json.data.html);
                $("#modeshow_" + dates).remove();
            }
        }
    })

}
function loading(id, dates) {
    var width = $('#' + id).width();
    var height = $('#' + id).height();
    var h = '<div align="center" style="filter:Alpha(opacity=20);opacity:0.2;height:' + height + 'px;width:' + width + 'px;overflow:hidden;z-index:3;position:absolute;left:1px;line-height:' + height + 'px;top:1px;background:#000000;color:white" id="modeshow_' + dates + '"> <img align="absmiddle" src="/Public/home/img/mloading.gif">&nbsp;加载中...</div>';
    $('#' + id).after(h);
}