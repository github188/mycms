$(function ($) {
    $("#add-rules").click(function (event) {
        location.href='/index.php/Home/Rules/add';
    });
    $("#subrules").click(function (event) {
        var title = $("input[name=title]").val();
        if (!title) {
            $("input[name=title]").focus();
            $("input[name=title]").addClass('error');
            return false;
        } else {
            $("input[name=title]").removeClass('error');
        }
        var happen_date = $("input[name=happen_date]").val();
        if (!happen_date) {
            $("input[name=happen_date]").focus();
            $("input[name=happen_date]").addClass('error');
            return false;
        } else {
            $("input[name=happen_date]").removeClass('error');
        }
        var rules_class_id = $("select[name=rules_class_id]").val();
        if (!rules_class_id) {
            $("select[name=rules_class_id]").focus();
            $("select[name=rules_class_id]").addClass('error');
            return false;
        } else {
            $("input[name=happen_date]").removeClass('error');
        }
        var keyword = $("input[name=keyword]").val();
        if (!keyword) {
            $("input[name=keyword]").focus();
            $("input[name=keyword]").addClass('error');
            return false;
        } else {
            $("input[name=keyword]").removeClass('error');
        }
        var container = $("[name=container]").val();
        if (!container) {
            $("[name=container]").focus();
            $("[name=container]").addClass('error');
            return false;
        } else {
            $("[name=container]").removeClass('error');
        }
        $.ajax({
            url: '/index.php/Home/rules/doa',
            type: 'post',
            data: $("#uprulesform").serialize(),
            success: function (json) {
                json = eval("(" + json + ")");
                $("#commonmodal .modal-body").html("<h2>" + json.message + "</h2>");
                $("#commonmodal").modal("show");
                if (json.code == "10000") {
                    $("#uprulesform [name=rules_id]").val(json.id);
                    $("#commonmodal").on("hidden.bs.modal", function () {
                        location.href = "/index.php/Home/rules/show?id=" + json.id;
                    })
                }
            }
        })
        return false;
    });
    $(".formControls").on('blur', 'input[type=text]', function () {
        var val = $(this).val();
        if (!val) {
            $(this).focus();
            $(this).parent().find('.success').remove();
            $(this).addClass('error');
            return false;
        } else {
            $(this).removeClass('error');
            $(this).parent().find('.success').remove();
        }
    }
    );
    $("#addcl").click(function () {
        var did = "adclh_" + (new Date()).getTime();
        var adclh = '<div id="' + did + '" class="modal fade" style="height: 150px; top: 99.5px; width: 300px;padding:0px !import;background-color:#FFF;  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);left: 533px; display: none;"><div class="title primary"><table width="100%" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td id="madol_title"  style="font-size:16px;font-weight:bold;padding-left:8px;" width="100%" height="34"><i class="icon-plus"></i> 新增分类 </td><td><div style="padding: 0px 8px; height: 40px; overflow: hidden; cursor: pointer;" ><div style="height:16px;overflow:hidden;width:16px;background:url(/Public/home/img/wclose.png);margin-top:12px" data-dismiss="modal"><i class="icon-remove"></i></div></div></td></tr></tbody></table></div>';
        adclh += '<div><div style="padding-top:60px;padding-button:60px;overflow-y:auto" align="center">';
        adclh += '<form style="padding:0px;maring:0px;margin-top: -47px;" name="form_add_class" id="form_add_class">  <table width="100%">';
        adclh += '<tbody>';
        adclh += '<tr>';
        adclh += ' <td style="padding-right:5px" width="50" align="right"> <font color = "red" > * </font>名称</td > ';
        adclh += '<td style="padding:5px" align="left">';
        adclh += '<input class="form-control" name="rules_class_name" value="" placeholder="" type="text"></td>';
        adclh += '</tr> ';
        adclh += '</tbody>';
        adclh += '</table>';
        adclh += '</form>';
        adclh += '</div>';
        adclh += '<div style="padding:8px 10px;line-height:30px" align="right">';
        adclh += '   <span id="msgview"></span>&nbsp;';
        adclh += '    <button id="rules_cs" data-id="' + did + '" class="btn btn-primary" type="button" title="名称不能为空" log="add">';
        adclh += ' <i class="icon-save"></i>&nbsp;确定</button></div>';
        adclh += '</div></div>';
        $("body").prepend(adclh);
        var wh = $(window).height();
        var didh = $("#" + did).height();
        var top = (wh - didh) / 2;
        $("#" + did).css('top', top);
        $("#" + did).modal("show");
        $("#" + did).on('hidden.bs.modal', function () {
            $("#" + did).remove();
        });
        return false;
    });

    $("body").on("click", "#rules_cs", function () {
        var name = $("body").find("[name=rules_class_name]").val();
        if (!name) {
            return false;
        }
        var did = $(this).attr("data-id");
        $.ajax({
            url: '/index.php/Home/rules/addcl?name=' + name,
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    $("#rules_class_id").html('');
                    var option = '<option value="0">--分类--</option>';
                    for (var i = json.res.length - 1; i >= 0; i--) {
                        if (json.res[i]['rules_class_name'] == name) {
                            option += '<option selected value="' + json.res[i]['rules_class_id'] + '">' + json.res[i]['rules_class_name'] + '</option>';
                        } else {
                            option += '<option value="' + json.res[i]['rules_class_id'] + '">' + json.res[i]['rules_class_name'] + '</option>';
                        }

                    }
                    ;
                    $("#rules_class_id").html(option);
                    $("#" + did).modal("hide");
                }
            }
        })

    });
//搜索
    $("#csu").click(function (event) {
        var keyw = $("#rulesSearchInput").val();
        if (!keyw) {
            return false;
        }
        location.href = '/index.php/Home/rules/search?k=' + keyw;
        return false;
    });
    $("#rulesSearchInput").keydown(function (event) {
        if (event.keyCode == 13) {
            var keyw = $(this).val();
            if (!keyw) {
                return false;
            }
            location.href = '/index.php/Home/rules/search?k=' + keyw;
        } 
    });
//文件上传
    $("#uploadrules").click(function (event) {
        var title = $("input[name=title]").val();
        if (!title) {
            $("input[name=title]").focus();
            $("input[name=title]").addClass('error');
            return false;
        } else {
            $("input[name=title]").removeClass('error');
        }
        var happen_date = $("input[name=happen_date]").val();
        if (!happen_date) {
            $("input[name=happen_date]").focus();
            $("input[name=happen_date]").addClass('error');
            return false;
        } else {
            $("input[name=happen_date]").removeClass('error');
        }
        var rules_class_id = $("select[name=rules_class_id]").val();
        if (!rules_class_id || rules_class_id == 0) {
            $("select[name=rules_class_id]").focus();
            $("select[name=rules_class_id]").addClass('error');
            layer.msg("请选择分类！");
            return false;
        } else {
            $("input[name=rules_class_id]").removeClass('error');
        }
        var keyword = $("input[name=keyword]").val();
        if (!keyword) {
            $("input[name=keyword]").focus();
            $("input[name=keyword]").addClass('error');
            return false;
        } else {
            $("input[name=keyword]").removeClass('error');
        }
        var keyword = $("input[name=rulesdoc]").val();
        if (!keyword) {
            $("input[name=rulesdoc]").focus();
            $("input[name=rulesdoc]").addClass('error');
            layer.msg("请选择word文档！");
            return false;
        } else {
            $("input[name=rulesdoc]").removeClass('error');
        } 
        $.ajax({
            url: '/index.php/Home/rules/titleCheck',
            type: 'post',
            async:false,
            data: $("#uprulesform").serialize(),
            success: function (json) {
                // json = eval("(" + json + ")"); 
                if (json == "yes") {
                    layer.confirm('标题已经存在，是否覆盖？', {icon: 3, title: '提示'}, function (index) { 
                        layer.load(0, {shade: false});
                        $("#uprulesform").submit();
                        layer.close(index);
                    },function(index){
                        layer.close(index);
                        return false;
                    });
                }else{
                    layer.load(0, {shade: false});
                    $("#uprulesform").submit();
                }
            }
        })
        return false;
     });
}) 