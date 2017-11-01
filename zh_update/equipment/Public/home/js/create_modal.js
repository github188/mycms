;
function create_modal(id, title, body, footer) {
    var cont = '';
    cont += '<div id="' + id + '" class="modal fade" style="display:none;">';
    cont += '        <div class="modal-dialog modal-lg"  style="width:403px;margin:200px auto;">';
    cont += '            <div class="modal-content">';
    cont += '                <div class="modal-header" style="font-size:16px;font-weight:bold;color:white;padding-left:8px;background: #157fcc none repeat scroll 0 0;height: 48px; line-height: 48px;  overflow: hidden;">';
    cont += '                    <button class="close" data-dismiss="modal"><span>&times;</span>';
    cont += '                    </button>';
    cont += '                    <h4 style="font-size:28px;font-weight:bold;margin-top: -20px;" class="modal-tittle panel-heading">' + title + '</h4>';
    cont += '                </div>';
    cont += '                <div class="modal-body" style="text-align: center;font-size:18px;font-weight:bold;">';
    cont += body;
    cont += '                </div>';
    cont += '                <div class="modal-footer">';
    cont += '                    <span id="msgview"></span>&nbsp;';
    cont += '                    <span id="button">';
    cont += footer;
    cont += '                    </span>';
    cont += '                </div>';
    cont += '            </div> ';
    cont += '        </div>';
    cont += '    </div> ';
    return cont;
}
;
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null)
        // return unescape(r[2]);
        return r[2];
    return null;
}