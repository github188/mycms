//生成时间的时和分
function stime(tag) {
    var mi = "";
    var tag = tag;
    for (var i = 0; i < tag; i++) {
        if (i < 10) {
            mi = "0" + i;
        } else {
            mi = i;
        }
        document.write("<option value=" + mi + ">" + mi + "</option>");
    }
} 
function tooltips(e) {
    $(e).tooltip("show")
}