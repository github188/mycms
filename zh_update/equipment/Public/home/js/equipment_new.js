function  newAdds(eqmt) {
    var newadd = '<div style="text-align: center;">';
    newadd += '<input type="text" class="form-control layer_new_add" id="new_add_eqmt" name="new_add_eqmt" placeholder="新增内容">';
    newadd += '<button style="margin:15px auto;float:left;" class="btn btn-info" id="sub_new_add" data-type="' + eqmt + '" type="button">添加</button>';
    newadd += '</div>'
    open_layer = layer.open({
        type: 1,
        title: "新增项目",
        skin: 'layui-layer-demo', //样式类名
        anim: 2,
        shadeClose: true, //开启遮罩关闭
        area: ['260px', '114px'], //宽高
        content: newadd
    });
}
function refulsh_option(eqmt, val) {
    var divid = "#" + eqmt;
    var options = '';
    var selected = '';
    $.ajax({
        url: './getEquipmentClass?p=' + eqmt,
        success: function (json) {
            json = eval("(" + json + ")");
            for (var i = 0; i < json.length; i++) {
                if (json[i].e_name == val) {
                    selected = ' b-selected';
                } else {
                    selected = '';
                }
                options += '<span><a href="javascript:void(0);" class="b-item ' + selected + '"><span class="text">' + json[i].e_name + '</span></a></span>';
            }
            options += '<span><a href="javascript:void(0);"  onclick="add_frame(this)"  id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
            $(divid).html(options);
            $(divid).val(val);
        }
    })
}
var sub_new_add = function () {
    $("#sub_new_add").click(function () {
        var new_val = $("#new_add_eqmt").val();
        var eqmt = $(this).attr("data-type");
        if (!new_val) {
            return false;
        }
        $.ajax({
            url: './newAdd?p=' + eqmt + '&v=' + new_val,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code != "ok") {
                    layer.msg(json.msg);
                } else {
                    layer.close(open_layer);
                    layer.msg("添加成功！");
                    refulsh_option(eqmt, new_val)
                }
            }
        })

        return false;
    });
}
function add_frame(e) {
    var id = $(e).parent().parent().attr("id");
    newAdds(id);
    sub_new_add();
}
$(function () {
    var onloads = function () {
        var jifang = '';
        var huanjing = '';
        var e_type = '';
        var e_pinpai = '';
        var buwei = '';
        var istingji = '';
        var yujing = '';
        $.ajax({
            url: './getEquipmentClass',
            success: function (json) {
                json = eval("(" + json + ")");
                for (var i = 0; i < json.length; i++) {
                    switch (json[i].e_class) {
                        case "jifang":
                            jifang += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        case "huanjing":
                            huanjing += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        case "e_type":
                            e_type += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        case "e_pinpai":
                            e_pinpai += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        case "buwei":
                            buwei += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        case "istingji":
                            istingji += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        case "yujing":
                            yujing += '<span><a href="javascript:void(0);" class="b-item"><span class="text">' + json[i].e_name + '</span></a></span>';
                            break;
                        default:
                            break;
                    }
                }
                jifang += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                huanjing += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select"  class="b-item"><span class="text">新增</span></a></span>';
                e_type += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                e_pinpai += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                buwei += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                istingji += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                yujing += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                $("#jifang").html(jifang);
                $("#huanjing").html(huanjing);
                $("#e_type").html(e_type);
                $("#e_pinpai").html(e_pinpai);
                $("#buwei").html(buwei);
                $("#istingji").html(istingji);
                $("#yujing").html(yujing);

            },
            complete:function(){  
            }
            
        })
        var date = new Date();
        var nowdate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
        $("#hapend_date,#huifu_date").val(nowdate);
        setTimeout(function(){
            var loadingval =$("input[name=codeid]").val();
            if (!loadingval) {
                return false;
            }
            getMonitorInfo(loadingval);
        },500); 
    }
    onloads();
    var open_layer;
    $(".shop-btn").click(function () {
        var vallist = ["codeid", "hapend_date", "jifang", "huanjing", "yewu", "e_type", "e_pinpai", "e_xinghao", "ip", "yujing", "buwei", "istingji", "syears", "chuli", "result", "huifu_date"];
        var selectlist = ["jifang", "huanjing", "e_type", "e_pinpai", "buwei", "istingji", "yujing"];
        var arlertv = {"codeid": "序列号不能为空！", "hapend_date": "发现日期不能为空！", "jifang": "请选择所在机房！", "huanjing": "请选择环境类型！", "yewu": "业务名称不能为空！", "e_type": "请选择设备类型！", "e_pinpai": "请选择设备品牌！", "e_xinghao": "设备型号不能为空！", "ip": "IP地址不能为空！", "yujing": "请选择预警情况！", "buwei": "请选择故障部位！", "istingji": "请选择是否需要停机！", "syears": "设备使用年限不能为空！", "chuli": "处理人员不能为空！", "result": "处理结果不能为空！", "huifu_date": "恢复日期不能为空！"};
        var select_data = '';
        for (var i = 0; i < vallist.length; i++) {
            var valid = "#" + vallist[i];
//            alert($.inArray(vallist[i], selectlist)+vallist[i]);
            if ($.inArray(vallist[i], selectlist) > -1) {
                var this_selected = '';
                var hjvs = '';
                var p = '';
                if (vallist[i] == "huanjing") {
                    $(valid).find(".b-selected").each(function (el, asl) {
                        var hjv = $(asl).find("span").html();
                        if (hjv) {
                            hjvs += p + hjv;
                            p = ',';
                        }
                    })
                    if (hjvs) {
                        this_selected = hjvs;
                    }
                } else {
                    this_selected = $(valid).find(".b-selected").find("span").html();
                }
                if (!this_selected) {
                    var msgshow = '';
                    for (var key in arlertv) {
                        if (key == vallist[i])
                            msgshow = arlertv[key];
                    }
                    layer.msg(msgshow);
                    return false;
                } else {
                    select_data += '&' + vallist[i] + '=' + this_selected;
                }
            } else {
                var tempv = $.trim($(valid).val());
                if (!tempv) {
                    $(valid).focus();
                    msgshow = '';
                    for (var key in arlertv) {
                        if (key == vallist[i])
                            msgshow = arlertv[key];
                    }
                    layer.msg(msgshow);
                    return false;
                }
            }
            if (vallist[i] == 'syears') {
                var reg = new RegExp("^[0-9]*$");
                if (!reg.test(tempv)) {
                    layer.msg('使用年限只能为数字');
                    return false;
                }
            }
        }
        var all_data = $("#inputs").serialize() + select_data;
        $.ajax({
            url: './doadd',
            type: 'post',
            data: all_data,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "ok") {
                    layer.msg("信息录入成功！");
                    //clearForm("#inputs");
                } else {
                    layer.msg(json.msg);
                }
            }

        });
        return false;
    })
    $("input[name=codeid]").on("paste", function () {
        var el = $(this);
        setTimeout(function () {
            var val = $(el).val();
            if (!val) {
                return false;
            }
            getMonitorInfo(val);
        }, 100);


    });
    $("input[name=codeid]").keyup(function (e) {
        var ctrlKey = e.ctrlKey || e.metaKey || e.shiftKey;
        if (ctrlKey || e.keyCode == 17)
            return false;
        var val = $(this).val();
        if (!val) {
            return false;
        }
        getMonitorInfo(val);
    });
    function getMonitorInfo(codeid) {
        var selectlist = ["jifang", "huanjing",  "e_pinpai", "yujing"];
        var onloadings = ['e_type',, "buwei",, "istingji"];
        for(var i=0;i<onloadings.length;i++){
            $("#"+onloadings[i]+">span").each(function(){
                    var e_type = '';
                    var etype = $("[name="+onloadings[i]+"]").val(); 
                    e_type = $(this).find("span").html();
                    $(this).find("a").removeClass("b-selected");
                    if(e_type==etype){
                        $(this).find("a").addClass("b-selected"); 
                    }
                   
                });
        }
        
        $.ajax({
            url: './getMonitorInfo?codeid=' + codeid,
            success: function (json) {
                var json = eval("(" + json + ")");
                for (var i = 0; i < selectlist.length; i++) {
                    var beforew = "#" + selectlist[i];
                    $(beforew).find("span").each(function () {
                        $(this).find("a").removeClass("b-selected");
                    });
                }
                ;
                if (json.code == "err") {
                    layer.msg(json.msg);
                } else {
                    $("#yewu").val(json.msg['HX_APPNAME']);
                    $("#ip").val(json.msg['HX_BUSINESSIP']);
                    $("#e_xinghao").val(json.msg['MODEL']);
                    $("#yujing").find("span").each(function(){
                        $syj = $(this).find("span").html();
                        if($syj=="监控"){
                            $(this).find("a").siblings().removeClass("b-selected");
                            $(this).find("a").addClass("b-selected");
                            
                        }
                    });
                    if (json.opt_enviroment) {
                        json.opt_enviroment += '<span><a href="javascript:void(0);"  onclick="add_frame(this)" id="new_add_select" class="b-item"><span class="text">新增</span></a></span>';
                        $("#huanjing").html(json.opt_enviroment);
                    }
                    $.each(json.msg, function (key, value) {
                        value = $.trim(value).replace(/[\r\n]/g,"");
                        var select_where = "#" + json.keys[key];
                        if (!value || (value == ' ' || key == "HX_SYSTEMENVIRONMENT")) {
                            $(select_where).val('');
                            return true;
                        } 
                        if (json.keys[key] && ($.inArray(json.keys[key], selectlist) > -1)) {
                            var is_exist_option = false;
                            var sel = tvl = '';
                            $(select_where).find("span").each(function (e) {
                                sel = '';
                                tvl = '';
                                sel = $(this).find("a");
                                tvl = $(sel).find("span").html();
                                var hanj1 = 1;
                                if (!tvl) {
                                    return true;
                                }
                                if ((value.indexOf(tvl) >= 0) || (tvl.indexOf(value) >= 0)) {
                                    sel.siblings().removeClass('b-selected');
                                    sel.addClass("b-selected");
                                    is_exist_option = true;
                                    return false;
                                }

                                if (key == "MANUFACTURERNAME") {
                                    if (tvl == "华为" && (value.indexOf("Huawei") >= 0)) {
                                        sel.siblings().removeClass('b-selected');
                                        sel.addClass("b-selected");
                                        is_exist_option = true;
                                        return false;
                                    }
                                }
                            }); 
                            if (!is_exist_option) {
                                if ($.inArray(json.keys[key], selectlist)>-1) {
                                    monitor_selct_add(value, json.keys[key]);
                                }
                            }
                        }
                    })
                }
            }
        })

    }
    function monitor_selct_add(value, eqmt) {
        var new_select_arr = value.split(" ");
        var new_select_option = new_select_arr[0];
        $.ajax({
            url: './newAdd?p=' + eqmt + '&v=' + new_select_option,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "ok") {
                    refulsh_option(eqmt, new_select_option)
                }
            }
        })
    }
    
    $(".edit-btn").click(function () {
        var vallist = ["codeid", "hapend_date", "jifang", "huanjing", "yewu", "e_type", "e_pinpai", "e_xinghao", "ip", "yujing", "buwei", "istingji", "syears", "chuli", "result", "huifu_date"];
        var selectlist = ["jifang", "huanjing", "e_type", "e_pinpai", "buwei", "istingji", "yujing"];
        var arlertv = {"codeid": "序列号不能为空！", "hapend_date": "发现日期不能为空！", "jifang": "请选择所在机房！", "huanjing": "请选择环境类型！", "yewu": "业务名称不能为空！", "e_type": "请选择设备类型！", "e_pinpai": "请选择设备品牌！", "e_xinghao": "设备型号不能为空！", "ip": "IP地址不能为空！", "yujing": "请选择预警情况！", "buwei": "请选择故障部位！", "istingji": "请选择是否需要停机！", "syears": "设备使用年限不能为空！", "chuli": "处理人员不能为空！", "result": "处理结果不能为空！", "huifu_date": "恢复日期不能为空！"};
        var select_data = '';
        for (var i = 0; i < vallist.length; i++) {
            var valid = "#" + vallist[i];
//            alert($.inArray(vallist[i], selectlist)+vallist[i]);
            if ($.inArray(vallist[i], selectlist) > -1) {
                var this_selected = '';
                var hjvs = '';
                var p = '';
                if (vallist[i] == "huanjing") {
                    $(valid).find(".b-selected").each(function (el, asl) {
                        var hjv = $(asl).find("span").html();
                        if (hjv) {
                            hjvs += p + hjv;
                            p = ',';
                        }
                    })
                    if (hjvs) {
                        this_selected = hjvs;
                    }
                } else {
                    this_selected = $(valid).find(".b-selected").find("span").html();
                }
                if (!this_selected) {
                    var msgshow = '';
                    for (var key in arlertv) {
                        if (key == vallist[i])
                            msgshow = arlertv[key];
                    }
                    layer.msg(msgshow);
                    return false;
                } else {
                    select_data += '&' + vallist[i] + '=' + this_selected;
                }
            } else {
                var tempv = $.trim($(valid).val());
                if (!tempv) {
                    $(valid).focus();
                    msgshow = '';
                    for (var key in arlertv) {
                        if (key == vallist[i])
                            msgshow = arlertv[key];
                    }
                    layer.msg(msgshow);
                    return false;
                }
            }
            if (vallist[i] == 'syears') {
                var reg = new RegExp("^[0-9]*$");
                if (!reg.test(tempv)) {
                    layer.msg('使用年限只能为数字');
                    return false;
                }
            }
        }
        var all_data = $("#inputs").serialize() + select_data;
        var thisid = $("input[name=id]").val();
        $.ajax({
            url: './doedit?id='+thisid,
            type: 'post',
            data: all_data,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "ok") {
                    layer.msg("信息修改成功！"); 
                    setTimeout(function(){
                        location.href='./infoList';
                    },1000);
                    //clearForm("#inputs");
                } else {
                    layer.msg(json.msg);
                }
            }

        });
        return false;
    })
});


