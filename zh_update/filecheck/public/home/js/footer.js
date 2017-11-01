jQuery(function ($) {
    var rootPath = document.getElementById('footer').getAttribute('data');
    $('#logmodal').on('hidden.bs.modal', function () {
        $("#logmodal .modal-body").html("");
        $(this).removeData('bs.modal');
    });
    $("#loginout").click(function () {
        $.ajax({
            url: rootPath + '/index.php/Home/Index/loginout',
            type: 'post',
            success: function () {
                window.parent.location.href = rootPath;
            }
        });
        return false;
    });
}); 