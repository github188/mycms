jQuery(function () {
    $("#download").click(function (event) {
        window.open('/index.php/Home/Mreport/down', '', 'scrollbars=no,toolbar=no,top=100, left=100, menubar=no, location=no, status=no,width=800');
    });
    $("#su").click(function (event) {
        var wd = $("[name=wd]").val();
        if (!wd) {
            $("[name=wd]").focus();
            return false;
        }
        window.open("/index.php/Home/Mreport/s?wd=" + wd);
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
                    console.log(json, len);
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