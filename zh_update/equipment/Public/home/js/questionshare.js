$(document).ready(function () {
    var tags_a = $("#tags a");
    tags_a.each(function () {
        var x = 9;
        var y = 0;
        var rand = parseInt(Math.random() * (x - y + 1) + y);
        $(this).addClass("tags" + rand);
    });
    var key = decodeURI(getUrlParam("key"));
    var keyword = decodeURI(getUrlParam("keyword"));
    if (key && keyword&&(key!='null')&&(keyword!='null')) {
        if(key=='null') return false; 
        $("#sKey").attr("selected", "selected"); 
        var shxm =$("[data-key="+key+"]").text(); 
        $(".home_main_h").find("#loginfo").text(shxm);
        $("#sKey").val(key);
        $("#sKeyword").val(keyword);
    }
    $('#question-add').click(function (event) {
        location.href = '/index.php/Home/Questions/addpage';
        return false;
    });
    $('#question-inb').click(function (event) {
        location.href='/index.php/Home/Questions/upage';
        return false;
    });
    $("#export").click(function (event) {
        var exloading = layer.load(0, {
                shade: [0.5, '#fff'] //0.1透明度的白色背景
            });
        var option ='<option value="">==请选择项目==</option>';
        $.ajax({
            url: '/index.php/Home/Questions/get_xmsel', 
            async:false,
            success:function(json){
               json=eval("("+json+")");
               var xm = json.xmsel;
               for (var i = 0;i <xm.length ;  i++) { 
                 option +='<option value="'+xm[i].xmsel+'">'+xm[i].xmsel+'</option>';  
               };
            } 
        })  
        option +='<option value="all">全部导出</option>'; 
        var xm = '';
        xm += '<div style="width:191px;margin: 23px auto;" class="input-group">';
        xm += '<select id="xmsel" class="form-control">';
        xm += option;
        xm += '</select>';
        xm += '<a href="javascript:;" id="exoprtxm" class="input-group-addon btn btn-default">';
        xm += '    <i class="list_signout"></i>  导出';
        xm += '</a> ';
        xm += '</div>'; 
        var environment ='<dl><dd>';
        $.ajax({
            url: '/index.php/Home/Questions/get_environment', 
            async:false,
            success:function(json){
               json=eval("("+json+")");
               var ent = json.environment;
               for (var i = 0;i <ent.length ;  i++) { 
                 environment +='<label><input name="Fruit" type="checkbox"  value="'+ent[i].environment+'">'+ent[i].environment+' </label>';  
               };
            } 
        })  
        environment +='</dd></dl>';
        var systemname ='<dl><dd>';
        $.ajax({
            url: '/index.php/Home/Questions/get_systemname', 
            async:false,
            success:function(json){
               json=eval("("+json+")");
               var sysname = json.systemname;
               for (var i = 0;i <sysname.length ;  i++) { 
                 systemname +='<label><input name="Fruit" type="checkbox"  value="'+sysname[i].systemname+'">'+sysname[i].systemname+' </label>';  
               };
            } 
        })  
        systemname +='</dd></dl>';
        layer.closeAll('loading');
        layer.tab({
            area: ['600px','300px'],  
            tab: [{
                    title: '按项目导出',  
                    content: xm
                 },
                //  {
                //     title: '按项系统环境导出',
                //     content:environment
                // }, 
                //{
                //     title: '按项系统名称',
                //     content: systemname
                // }
                ]
        }); 
        return false;
        location.href = '/index.php/Home/Questions/export?' + $('#quseafrom').serialize();
        return false;
    });
//点击导出
$("body").on('click','#exoprtxm',function(){
 var xmsel = $(this).siblings('#xmsel').val(); 
 if(!xmsel||xmsel=='==请选择项目=='){
    layer.msg("请选择要导出的项目！");
    return false;
 }
 open('/index.php/Home/Questions/export?xmsel='+xmsel);
//  layer.open({
//   type: 2,
//   title: 'layer mobile页',
//   shadeClose: true,
//   shade: 0.8,
//   area: ['380px', '90%'],
//   content: '/index.php/Home/Questions/export?xmsel='+xmsel //iframe的url
// }); 
 
})
    $(".tabmark_list").on("click", "a", function () {
        var id = $(this).attr("data-id");
        var act = $(this).attr("data-act");
        if (!id) {
            return false;
        }
        if (act == "delete") {
            var str = $(this).parent().parent().parent();
            var power = checkpower('Questions', 'delete');
            if (!power) {
                $("#commonmodal .modal-body").html("<h2>您没有删除权限，请联系管理员分配权限</h2>");
                $("#commonmodal").modal('show');
                return false;
            }
            var coid = "modal" + (new Date()).getTime();
            var okid = "dok_" + (new Date()).getTime();
            var cbody = "<h2>您确定要删除吗？</h2>";
            var footerd = '<button id="' + okid + '" class="btn btn-primary" data-dismiss="modal">删除</button> <button class="btn btn-primary" data-dismiss="modal">关闭</button>';
            var cmodal = create_modal(coid, '信息提示', cbody, footerd);
            $('body').prepend(cmodal);
            $("#" + coid).modal('show');
            $("#" + coid).on('hidden.bs.modal', function () {
                $("#" + coid).remove();
            });
            setTimeout(function () {
                deletenode(okid, str, id);
            }, 100);
            return false;
        } else if (act == "edit") {
            open("/index.php/Home/Questions/edit?id=" + id);
        }
        return false;
    })
    function deletenode(did, str, id) {
        $("#" + did).click(function () {
            var coid = "modal_" + (new Date()).getTime();
            $.ajax({
                url: '/index.php/Home/Questions/delete?id=' + id,
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.code == '10000') {
                        var c_body = "<h2>删除成功</h2>";
                        $(str).remove();
                    } else {
                        var c_body = "<h2>" + json.message + "</h2>";
                    }
                    var footerd = '<button class="btn btn-primary" data-dismiss="modal">关闭</button>';
                    var cmodal = create_modal(coid, '信息提示', c_body, footerd);
                    $('body').prepend(cmodal);
                    $("#" + coid).modal('show');
                    $("#" + coid).on('hidden.bs.modal', function () {
                        $("#" + coid).remove();
                        reFreshData();
                    });
                }
            });
        })
    }
    //验证权限
    var checkpower = function (a, p) {
        var power = 0;
        $.ajax({
            async: false,
            url: '/index.php/Home/Index/checkpower?act=' + a + '&p=' + p,
            success: function (json) {
                power = json;
            }
        })
        return power;
    }
    //搜索关键字下拉列表
    $("#dselect").on('click', '#keysList li', function (event) {
        event.preventDefault();
        var key = $(this).attr('data-key');
        var keyname = $(this).find('a').html();
        $('#dselect #loginfo').html(keyname);
        $('#sKey').val(key);
    });
//点击搜索
    $("#qseach").click(function () {
        $("#sKey").attr('selected', true);
        reFreshData();
    })
    $("#sKeyword").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#sKey").attr('selected', true);
            reFreshData();
        }
    });
//更新数据
    function reFreshData() {
        var key = $("#sKey").attr('selected');
        var keys = '';
        if (key) {
            keys += 'key=';
            keys += $(".h_main").find('#sKey').val();
            keys += '&keyword=';
            keys += $(".h_main").find('#sKeyword').val();
        } else {
            return false;
        }
        location.href = '/index.php/Home/Questions/qsearch?' + keys;
    }
//新增的提交按钮
    $("#qsubmit").click(function (event) {
        var xmsel = $("select[name=xmsel]").val();
        if (!xmsel) {
            $("select[name=xmsel]").focus();
            layer.msg('请选择项目!');
            //$("span#xmsel").html('请选择项目');
            return false;
        } else {
            $("span#xmsel").css({
                color: 'green'
            });
            $("span#xmsel").html('<i class="icon icon-check-sign"></i>');
        }
        var happentime = $("input[name=happentime]").val();
        if (!happentime) {
            $("input[name=happentime]").focus();
            layer.msg('请选择发生时间!');
            //$("span#happentime").html('请选择发生时间');
            return false;
        } else {
            $("span#happentime").css({
                color: 'green'
            });
            $("span#happentime").html('<i class="icon icon-check-sign"></i>');
        }
        var environment = $("input[name=environment]").val();
        if (!environment) {
            $("input[name=environment]").focus();
            layer.msg('系统环境不能为空！');
            //$("span#environment").html('系统环境不能为空！');
            return false;
        } else {
            $("span#environment").css({
                color: 'green'
            });
            $("span#environment").html('<i class="icon icon-check-sign"></i>');
        }
        var systemname = $("input[name=systemname]").val();
        if (!systemname) {
            $("input[name=systemname]").focus();
            layer.msg('系统名称不能为空！');
            //$("span#systemname").html('系统名称不能为空！');
            return false;
        } else {
            $("span#systemname").css({
                color: 'green'
            });
            $("span#systemname").html('<i class="icon icon-check-sign"></i>');
        }
        var describe = $("textarea[name=describe]").val();
        if (!describe) {
            $("[name=describe]").focus();
            layer.msg('问题描述及分析不能为空！');
            //$("span#describe").html('问题描述及分析不能为空！');
            return false;
        } else {
            $("span#describe").css({
                color: 'green'
            });
            $("span#describe").html('<i class="icon icon-check-sign"></i>');
        }
        var result = $("textarea[name=result]").val();
        if (!result) {
            $("[name=result]").focus();
            layer.msg('处理方法及结果不能为空！');
            //$("span#result").html('处理方法及结果不能为空！');
            return false;
        } else {
            $("span#result").css({
                color: 'green'
            });
            $("span#result").html('<i class="icon icon-check-sign"></i>');
        }
        var manager = $("[name=manager]").val();
        if (!manager) {
            $("[name=manager]").focus();
            layer.msg('处理人员不能为空！');
            //$("span#manager").html('处理人员不能为空！');
            return false;
        } else {
            $("span#manager").css({
                color: 'green'
            });
            $("span#manager").html('<i class="icon icon-check-sign"></i>');
        }
        var appver = $("[name=appver]").val();
        var tishi = '<div style="width:600px;"> <div class="list-he"> <span class="subspan">项目：<span style="color:#7AB8DF;">'+xmsel+'</span></span> <span class="subspan">系统环境：<span style="color:#7AB8DF;">' + environment + '</span></span>';
        tishi += '<span class="subspan">系统名称：<span style="color:#7AB8DF;">' + systemname + '</span></span> </div>';
        if(appver){
            tishi += '<span class="subspan">应用版本号：<span style="color:#7AB8DF;">' + appver + '</span></span> </div>';
        }
        tishi += '<div class="list-con">  <p style="border-buttom:1px solid #DDD;color:#EB6F22;">问题描述及分析:</p>  <span>' + describe + '</span>  <hr> ';
        tishi += '<p style="border-buttom:1px solid #DDD;color:#EB6F22;">处理方法及结果:</p><span>' + result + '</span> <input value="60" type="hidden"> </div>';
        tishi += '<div class="tabmark"> <div class="tabmark_list fl"> <span> <i class="icon-time"></i>' + happentime + '</span> <span> <i class="icon-bookmark-empty"></i> '+xmsel+'</span> </div>  <div class="clear"></div> </div> <div class="clear"></div> </div>';
        layer.confirm(tishi, {
            btn: ['保存', '返回'], //按钮
            maxWidth: ['area', 'auto'],
            title: '信息确认'
        }, function () {
            // layer.msg('的确很重要', {icon: 1});
            layer.closeAll('dialog');
            var loading = layer.load(0, {
                shade: [0.5, '#fff'] //0.1透明度的白色背景
            });
            $.ajax({
                url: '/index.php/Home/Questions/add',
                type: 'POST',
                data: $('#questionsform').serialize(),
                success: function (json) {
                    json = eval("(" + json + ")");
                    if (json.code == '10000') {
                        layer.msg(json.message, {icon: 1}, function () {
                            location.href = '/index.php/Home/Questions';
                        });
                    } else {
                        layer.msg(json.message, {icon: 5});
                    }
                },
                complete: function () {
                    layer.closeAll('loading');
                }
            })
        }, function () {
            layer.closeAll('dialog');
        });
        return false;
    });
});
