;
$(function($) {
    $(".auth-ajax-submit").on("click", function() {
        var posturl = $(".auth-ajax-form").attr("action");
        if (!posturl) {
            layer.msg("提交地址错误", { 'icon': 2 });
            return false;
        }
        var loading = layer.load(1, {
            shade: [0.1, '#000'] //0.1透明度的白色背景
        });
        $.ajax({
                url: posturl,
                type: 'POST',
                data: $(".auth-ajax-form").serialize(),
            })
            .done(function(json) {
                layer.close(loading);
                if (json.code == 1) {
                    layer.msg(json.msg, function() {
                        location.reload();
                    });
                } else {
                    layer.msg(json.msg);
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
        return false;
    });
});
$(document).ready(function($) {
    $("#authrule-tree").treeTable({
        indent: 20
    });
});

