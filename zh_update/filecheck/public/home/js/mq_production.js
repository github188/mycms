$(document).ready(function () {
    var height = $(window).height();
    var width = $(window).width();
    $("#showright").css('width', width - 213);
    $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
    $("#tablebody").css('height', height - 194);
    $("#menulist").css('height', height - 110);
});
$(window).resize(function (event) {
    var height = $(window).height();
    var width = $(window).width();
    $("#showright").css('width', width - 213);
    $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
    $("#tablemain").css('height', height - 194);
    $("#menulist").css('height', height - 94);
});
