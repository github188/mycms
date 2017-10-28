$(function($) {
    $(".add_menu_submit").on("click", function() {
        if ($(this).attr("class").indexOf("disabled") >= 0) {
            return false;
        }
        var name = $("#menu_edit_form [name=name]").val();
        var posturl = $("#menu_edit_form [name=posturl]").val();
        if (!name) {
            $("#menu_edit_form [name=name]").focus();
            return false;
        }
        var loading = layer.load(1, {
            shade: [0.5, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
                url: posturl,
                type: 'post',
                data: $("#menu_edit_form").serialize(),
            })
            .done(function(json) {
                layer.close(loading);
                if (json.code == 1) {
                    layer.msg("操作成功", function() {
                        location.href = json.url;
                    });
                } else {
                    layer.msg(json.msg);
                }
            });
        //$(".add_menu_submit").addClass('disabled');
        return false;
    });

});