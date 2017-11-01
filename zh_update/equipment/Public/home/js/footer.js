jQuery(function ($) {
    $('#logmodal').on('hidden.bs.modal', function () {
        $("#logmodal .modal-body").html("");
        $(this).removeData('bs.modal');
    });
    $("#txlog").on('click', function (event) {
        event.preventDefault();
        $.ajax({
            url: '/index.php/home/query/txlog',
            type: 'post',
            success: function (json) {
                $(".modal-tittle").html("<h2 style='margin:0;padding:0;'>txlog错误信息对照表</h2>");
                $("#logmodal .modal-body").html(json);
            }
        });
        $("#logmodal").modal({
            show: true
        });
    });
    $("#syslog").on('click', function (event) {
        event.preventDefault();
        $.ajax({
            url: '/index.php/home/query/syslog',
            type: 'post',
            success: function (json) {
                $(".modal-tittle").html("<h2 style='margin:0;padding:0;'>syslog错误信息对照表</h2>");
                $("#logmodal .modal-body").html(json);
            }
        });
        $("#logmodal").modal({
            show: true
        });
    });
    $("#gtplog").on('click', function (event) {
        event.preventDefault();
        $.ajax({
            url: '/index.php/home/query/gtplog',
            type: 'post',
            success: function (json) {
                $(".modal-tittle").html("<h2 style='margin:0;padding:0;'>gtplog错误信息对照表</h2>");
                $("#logmodal .modal-body").html(json);
            }
        });
        $("#logmodal").modal({
            show: true
        });
    });
    $("#gtpslog").on('click', function (event) {
        event.preventDefault();
        $.ajax({
            url: '/index.php/home/query/gtpslog',
            type: 'post',
            success: function (json) {
                $(".modal-tittle").html("<h2 style='margin:0;padding:0;'>系统日志 gtp.sys 文件格式</h2>");
                $("#logmodal .modal-body").html(json);
            }
        });
        $("#logmodal").modal({
            show: true
        });
    });
    $("#loginout").click(function () {
        location.href="/report/equipment/index.php/home/index/loginout";
        // $.ajax({
        //     url: './loginout',
        //     type: 'post',
        //     success: function () {
        //         window.location.href='../';
        //     }
        // });
        return false;
    });
});
$('#frame-right-main table tr td').on("click", "a", function () {
    alert('dd');
});