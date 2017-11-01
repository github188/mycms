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
            url: 'getEquipmentClass',
            success: function (json) {
                json = eval("(" + json + ")");
                for (var i = 0; i < json.length; i++) {
                    switch (json[i].e_class) {
                        case "jifang":
                            jifang += '<option>' + json[i].e_name + '</option>';
                            break;
                        case "huanjing":
                            huanjing += '<option>' + json[i].e_name + '</option>';
                            break;
                        case "e_type":
                            e_type += '<option>' + json[i].e_name + '</option>';
                            break;
                        case "e_pinpai":
                            e_pinpai += '<option>' + json[i].e_name + '</option>';
                            break;
                        case "buwei":
                            buwei += '<option>' + json[i].e_name + '</option>';
                            break;
                        case "istingji":
                            istingji += '<option>' + json[i].e_name + '</option>';
                            break;
                        case "yujing":
                            yujing += '<option>' + json[i].e_name + '</option>';
                            break;
                        default:
                            break;
                    }
                }
                jifang += '<option>新增</option>';
                huanjing += '<option>新增</option>';
                e_type += '<option>新增</option>';
                e_pinpai += '<option>新增</option>';
                buwei += '<option>新增</option>';
                istingji += '<option>新增</option>';
                yujing += '<option>新增</option>';
                $("#jifang").html(jifang);
                $("#huanjing").html(huanjing);
                $("#e_type").html(e_type);
                $("#e_pinpai").html(e_pinpai);
                $("#buwei").html(buwei);
                $("#istingji").html(istingji);
                $("#yujing").html(yujing);
                
            }
        })
    var date = new Date(); 
    var nowdate = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
    $("#hapend_date,#huifu_date").val(nowdate);
    }
    onloads();
    var open_layer;
    var sub_new_add = function () {
        $("#sub_new_add").click(function () {
            var new_val = $("#new_add_eqmt").val();
            var eqmt = $(this).attr("data-type");
            if (!new_val) {
                return false;
            }
            $.ajax({
                url: 'newAdd?p=' + eqmt + '&v=' + new_val,
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
    function refulsh_option(eqmt, val) {
        var divid = "#" + eqmt;
        var options = '';
        $.ajax({
            url: 'getEquipmentClass?p=' + eqmt,
            success: function (json) {
                json = eval("(" + json + ")");
                for (var i = 0; i < json.length; i++) {
                    options += '<option>' + json[i].e_name + '</option>';
                }
                options += '<option>新增</option>';
                $(divid).html(options);
                $(divid).val(val);
            }
        })
    }
    //机房
    $("#jifang").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("jifang");
            sub_new_add();
        }
    });
    //环境
    $("#huanjing").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("huanjing");
            sub_new_add();
        }
    });
    //设备类型
    $("#e_type").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("e_type");
            sub_new_add();
        }
    });
    //设备品牌
    $("#e_pinpai").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("e_pinpai");
            sub_new_add();
        }
    });
    //部位
    $("#buwei").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("buwei");
            sub_new_add();
        }
    });
    //预警
    $("#yujing").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("yujing");
            sub_new_add();
        }
    });
    //是否停机
    $("#istingji").change(function () {
        var jifang = $(this).val();
        if (jifang == "新增") {
            newAdds("istingji");
            sub_new_add();
        }
    });
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

    //验证是否为空
    function is_empty() {

    }
    $("#sub_add").click(function () {
        // var hapend_date = $("#hapend_date").val();
        // var jifang = $("#jifang").val();
        // var huanjing = $("#huanjing").val();
        // var yewu = $("#yewu").val();
        // var e_type = $("#e_type").val();
        // var e_pinpai = $("#e_pinpai").val();
        // var e_xinghao = $("#e_xinghao").val();
        // var codeid = $("#codeid").val();
        // var ip = $("#ip").val();
        // var yujing = $("#yujing").val();
        // var buwei = $("#buwei").val();
        // var istingji = $("#istingji").val();
        // var syears = $("#syears").val();
        // var chuli = $("#chuli").val();
        // var result = $("#result").val();
        // var huifu_date = $("#huifu_date").val();
        var vallist = ["hapend_date", "jifang", "huanjing", "yewu", "e_type", "e_pinpai", "e_xinghao", "codeid", "ip", "yujing", "buwei", "istingji", "syears", "chuli", "result", "huifu_date"];
        var arlertv = {"hapend_date": "发现日期不能为空！", "jifang": "资料填写不全！", "huanjing": "资料填写不全！", "yewu": "业务名称不能为空！", "e_type": "资料填写不全！", "e_pinpai": "资料填写不全！", "e_xinghao": "设备型号不能为空！", "codeid": "序列号不能为空！", "ip": "IP地址不能为空！", "yujing": "资料填写不全！", "buwei": "资料填写不全！", "istingji": "资料填写不全！", "syears": "设备使用年限不能为空！", "chuli": "处理人员不能为空！", "result": "处理结果不能为空！", "huifu_date": "恢复日期不能为空！"};
        for (var i = 0; i < vallist.length; i++) {
            var valid = "#" + vallist[i];
            var tempv = $(valid).val();
            if (!tempv) {
                $(valid).focus();
                var msgshow = '';
                for (var key in arlertv) {
                    if (key == vallist[i])
                        msgshow = arlertv[key];
                } 
                layer.msg(msgshow);
                return false;
            } 
            if(vallist[i]=='syears'){
                var reg = new RegExp("^[0-9]*$");
                if(!reg.test(tempv)){
                    layer.msg('使用年限只能为数字');
                    return false;
                }
            }
        } 
        $.ajax({
            url: 'doadd',
            type: 'post',
            data: $("#inputs").serialize(),
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "ok") {
                    layer.msg("信息录入成功！");
                    clearForm("#inputs");
                } else {
                    layer.msg(json.msg);
                }
            }

        });

        return false;
    })
});

