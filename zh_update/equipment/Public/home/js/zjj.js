jQuery(function ($) {
    $(".zjj_tabs").on('click', "#txlog", function (event) {
        event.preventDefault();
        $.ajax({
            url: '/index.php/home/query/txlog',
            type: 'post',
            success: function (json) {
                $('#logs').popover("hide");
                $(".modal-tittle").html("txlog错误信息对照表");
                $("#logmodal .modal-body").html(json);
            }
        });
        $("#logmodal").modal({
            show: true
        });
    });
    $(".zjj_tabs").on('click', "#syslog", function (event) {
        event.preventDefault();
        $.ajax({
            url: '/index.php/home/query/syslog',
            type: 'post',
            success: function (json) {
                $('#logs').popover("hide");
                $(".modal-tittle").html("syslog错误信息对照表");
                $("#logmodal .modal-body").html(json);
            }
        });
        $("#logmodal").modal({
            show: true
        });
    });
    $(".panel").on('click', '.panel-title', function () { 
        var cursori = $(this).find('i');
        $(this).parent().siblings('.panel-body').slideToggle('50', function (event) {
            if ($(this).is(':hidden')) {
                cursori.removeClass('icon-hand-up');
                cursori.addClass('icon-hand-down');
            } else {
                cursori.removeClass('icon-hand-down');
                cursori.addClass('icon-hand-up');
            } 
        });
    });
});