$(function($) {
    $("#user_add_button").on("click", function() {
        window.location.href = "addUserPage";
    });
    /*
    验证用户名是否存在
     */
    function check_user() {
        var user_name = $("#user_add_form [name=user_name]").val();
        if (!user_name) {
            $("#user_add_form [name=user_name]").focus();
            $(".user_name_block").css("color", "red");
            return false;
        }
        var checkurl = $("#user_add_form").attr("checkurl");
        $.ajax({
            url: checkurl+'?username=' + user_name,
            type: 'POST',
            success: function(json) {
                var json = eval("(" + json + ")");
                if (json.statu == 'ok') {
                    if (json.msg) {
                        $(".user_name_block").parent().find('i,.text-red').remove();
                        $(".user_name_block").parent().append('<span class="text-red">该用户名已经被使用</span><i class="fa fa-close text-red"></i>');
                        $("#user_add_form [name=user_name]").focus();
                        return false;
                    } else {
                        $(".user_name_block").parent().find('i,.text-red').remove();
                        $(".user_name_block").parent().append('<i class="fa fa-check text-green"></i>');
                        return true;
                    }
                } else {
                    layer.msg('参数错误！', { icon: 2 });
                    return false;
                }
            }
        })
    }
    $("#user_add_form [name=user_name]").on("blur", function() {
        check_user();
    });
    /*
    判断密码是否一致
     */
    $("[type=user_password]").each(function() {
        $(this).on("blur", function() {
            var which = 'user_password';
            var tv = $(this).val();
            var otv = '';
            if (tv) {
                if ($(this).attr('name') == which) {
                    otv = $('[name=repassword]').val();
                } else {
                    otv = $('[name=user_password]').val();
                    which = 'repassword';
                }
                if (!otv) {
                    $("." + which + "_block").parent().append('<i class="fa fa-check text-green"></i>');
                    return false;
                }
                if (tv !== otv) {
                    $(".repassword_block").parent().find('.passworderr,i').remove();
                    $(".repassword_block").parent().append('<span class="passworderr text-red">两次密码输入不一致<span><i class="fa fa-close text-red"></i>');
                    return false;
                } else {
                    $(".repassword_block").parent().find('.passworderr,i').remove();
                    $(".repassword_block").parent().append('<i class="fa fa-check text-green"></i>');
                    return false;
                }
            };
        });
    });
    /*
    添加用户提交操作
     */
    $(".user_add_submit").on("click", function() {
        var posturl = $("#user_add_form").attr("action");
        if (!posturl) {
            layer.msg('提交地址错误', { icon: 2 });
            return false;
        }
        var user_name = $("#user_add_form [name=user_name]").val();
        var password = $("#user_add_form [name=user_password]").val();
        var repassword = $("#user_add_form [name=repassword]").val();
        var email = $("#user_add_form [name=user_email]").val();
        if (!user_name) {
            $("#user_add_form [name=user_name]").focus();
            $(".user_name_block").css("color", "red");
            return false;
        }
        check_user();
        if (!password) {
            $("#user_add_form [name=user_password]").focus();
            return false;
        }
        if (!repassword) {
            $("#user_add_form [name=repassword]").focus();
            return false;
        }
        if (password !== repassword) {
            layer.msg('两次密码输入不一致', { icon: 2 });
            return false;
        }
        if (email) {
            var emreg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,8})+$/;
            if (!emreg.test(email)) {
                $(".email_block").parent().find('i').remove();
                $(".email_block").parent().append('<span class="text-red">邮箱格式不正确</span> <i class="fa fa-close text-red"></i>');
                return false;
            };
            $(".email_block").parent().find('i,.text-red').remove();
            $(".email_block").parent().append('<i class="fa fa-check text-green"></i>');
        }
        var loading = layer.load(1, {
            shade: [0.5, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
                url: posturl,
                type: 'post',
                data: $("#user_add_form").serialize(),
                success: function(json) { 
                    layer.close(loading);
                    if (json.code == 1) {
                    layer.msg("成功", function() {
                        location.href = json.url;
                    });
                } else {
                    layer.msg(json.msg);
                }
                }
            })
            .fail(function(json) {
            	layer.close(loading);
                layer.open({
                    title: '系统错误',
                    area: ['50%', '80%'],
                    content: json.responseText
                });
            });
        $(".user_add_submit").addClass('disabled');
        return false;
    });
    /*
    列表页切换用户状态	
     */
    $(".user_status").on("click", function() {
        var status = 1;
        var thisattr = $(this);
        var user_name = thisattr.attr("data-user_name");
        if (user_name == 'admin') {
            return false;
        }
        var userid = $(this).attr("data-userid");
        $(this).css("display", "none");
        $(this).siblings(".overlay").css("display", "");
        if ($(this).html() == "启用") {
            status = 0;
        }
        if (!userid) {
            layer.msg("用户ID错误", ['icon', 2]);
            return false;
        }
        $.ajax({
                url: 'changeUserStatus?status=' + status + '&userid=' + userid,
                type: 'get',
            })
            .done(function(json) {
                var json = eval("(" + json + ")");
                if (json.status == 'err') {
                    layer.msg(json.msg);
                    return false;
                }
                thisattr.html(json.msg);
                if (json.msg == "禁用") {
                    thisattr.removeClass('label-primary');
                    thisattr.addClass('label-danger');
                } else {
                    thisattr.removeClass('label-danger');
                    thisattr.addClass('label-primary');
                }
                thisattr.siblings(".overlay").css("display", "none");
                thisattr.css("display", "");
            });
    });
    /*
    ajax-get 
     */
    $(".ajax-get").on("click", function(e) {
        e.preventDefault;
        var url = $(this).attr("href");
        $.ajax({
                url: url,
            })
            .done(function(json) {
                layer.msg(json.msg, function() {
                    location.reload();
                });
            });
        return false;
    });
});