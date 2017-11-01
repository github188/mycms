var zTree;
var demoIframe;
var setting = {
    async: {
        enable: true,
        url: "/index.php/Home/TongGTP/get_node",
        autoParam: ["id", "pId", "treenode"],
        dataFilter: filter
    },
    view: {
        dblClickExpand: false,
        showLine: true,
        selectedMulti: false
    },
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "pId",
            rootPId: ""
        }
    },
    callback: {
        onClick: zmreportClick,
        beforeExpand: beforeExpand,
        onAsyncSuccess: onAsyncSuccess
    }
};
function filter(treeId, parentNode, childNodes) {
    if (!childNodes)
        return null;
    for (var i = 0, l = childNodes.length; i < l; i++) {
        childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
    }
    return childNodes;
}
var zNodes = [
    {id: 'gtp', pId: 0, name: "节点查看", isParent: true, open: false}
];
function zmreportClick(event, treeId, treeNode) {
    var gurl = ''; 
    $("input[name=gtpskey]").val(""); 
    if (treeNode.id == "task" || treeNode.id == "file") {
        $(".gtp-toolbar #gtp_taskinfo").removeClass('btn-info');
        $(".gtp-toolbar #gtp_nodeinfo").addClass('btn-info');
        gurl = '/index.php/Home/TongGTP/taskinfo?nodeip=' + treeNode.pId + '&sel=' + treeNode.id;
    } else if (treeNode.id == "tothis") {
        gurl = '/index.php/Home/TongGTP/taskinfo?nodeip=' + treeNode.pId+'&sel='+treeNode.id;
    }else if (treeNode.id == "exportgo"||treeNode.id == "exportcome"||treeNode.id == "exportall") {
        gurl = '/index.php/Home/TongGTP/zexport?nodeip=' + treeNode.pId+'&sel='+treeNode.id;
        location.href=gurl;
        return false;
    }else if (!treeNode.pId) {
        gurl = '/index.php/Home/TongGTP/zexport?nodeip=' + treeNode.pId+'&sel='+treeNode.id;
        //location.href=gurl;
        return false;
    } else {
        $(".gtp-toolbar #gtp_nodeinfo").removeClass('btn-info');
        $(".gtp-toolbar #gtp_taskinfo").removeClass('btn-default');
        $(".gtp-toolbar #gtp_taskinfo").addClass('btn-info'); 
        $(".gtp-toolbar #gtp_tothis").addClass('btn-info'); 
        gurl = '/index.php/Home/TongGTP/nodeinfo?nodeip=' + treeNode.id+"&nodename="+$(event.target).html(); 
    }
    if (treeNode.id && treeNode.id != "gtp") {
        $.post(gurl, function (data, textStatus, xhr) {
            data = eval("(" + data + ")");
            $(".gtp-right .right-content-body .table").html(data.div);
            if (data.tage == "task") {
                var page = '<ul id="page" style="width: 500px;font-size:16px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:105px;"><span style="width:105px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
                if (data.numtask != "notask") {
                    $(".right-content-footer").html(page);
                }
            } else {
                $(".right-content-footer").html("");
            }

            var height = document.getElementById("tableshow").offsetHeight;
            var width = document.getElementById("tableshow").offsetWidth;
            var bwidth = document.getElementById("container").offsetWidth - 300;
            var bheight = document.getElementById("container").offsetHeight - 80;
            if (height > (bheight - 40)) {
                height = bheight - 40;
            }
            if (width > bwidth) {
                width = bwidth;
            }
            if (data.tage == "node") {
                $('.right-content-body').css("height", bheight);
            } else {
                $('.right-content-body').css("height", height);
            }
            $('.right-content-body').css("width", bwidth);
            $('.right-content-body #table').css("width", bwidth);
            $('.right-content-body #table').css("height", height);
        });
    }



}
;
function beforeExpand(treeId, treeNode) { 
    ajaxGetNodes(treeNode, "refresh");
}
function onAsyncSuccess(event, treeId, treeNode, msg) {
    if (!msg || msg.length == 0) {
        return;
    }
    var zTree = $.fn.zTree.getZTreeObj("gtptree");
    treeNode.icon = "";
    zTree.updateNode(treeNode);
    zTree.selectNode(treeNode.children[3]);
    var height = document.getElementById("container").offsetHeight;
    document.getElementById("gtptree").style.height = height;
    $('#gtptree').css("height", height);
}
;
function ajaxGetNodes(treeNode, reloadType) {
    var zTree = $.fn.zTree.getZTreeObj("gtptree");
    if (reloadType == "refresh") {
        treeNode.icon = "/Public/App/images/loading_1.gif";
        zTree.updateNode(treeNode);
        zTree.reAsyncChildNodes(treeNode, reloadType, true);
    }
}
function zjloading() {
    $(document).ready(function () {
        $.fn.zTree.init($("#treeDemo"), setting);
    });
    var zTree = $.fn.zTree.getZTreeObj("gtptree");
    zTree.expand('gtp');
}
$(document).ready(function () {
    var t = $("#gtptree");
    t = $.fn.zTree.init(t, setting, zNodes);
    var zheight = $(window).height() - 50;
    var zwidth = $(window).width() - 300;
    $('#gtptree').css("height", zheight);
    $('.right-content-body').css("height", zheight + 50);
    $('.right-content-body').css("width", zwidth);
    // var bwidth = document.getElementById("container").offsetWidth-300;
    // var bheight = document.getElementById("container").offsetHeight-80;  
    // $('.right-content-body').css("height",height); 
    // $('.right-content-body').css("width",bwidth);
    $('.right-content-body #table').css("height", zheight);
    $('.right-content-body #table').css("width", zwidth);
});
$('body').scroll(function () {
    $('.container').removeClass('container');
    $('.container').addClass('container');
})
$("#gtp_nodeinfo").click(function (event) {
    var nodename = $(".table input[name=nodename]").val();
    var nodeip = $(".table input[name=nodeip]").val();
    if(!nodeip){
        $(".gtp-toolbar #gtp_nodeinfo").removeClass('btn-info'); 
        $(".gtp-toolbar #gtp_nodeinfo").addClass('btn-default');
        return false;
    }
    $.post('/index.php/Home/TongGTP/nodeinfo?nodeip=' + nodeip, function (data) {
        if (data == "") {
            return false;
        }
        data = eval("(" + data + ")");
        $(".gtp-toolbar #gtp_nodeinfo").removeClass('btn-info');
        $(".gtp-toolbar #gtp_taskinfo").removeClass('btn-default');
        $(".gtp-toolbar #gtp_taskinfo").addClass('btn-info');
        $(".gtp-toolbar #gtp_tothis").addClass('btn-info');
        $(".gtp-right .right-content-body .table").html(data.div);
        var height = document.getElementById("tableshow").offsetHeight;
        $('.right-content-body').css("height", height + 40);
        $('.right-content-body #table').css("height", height);
        $(".right-content-footer").html("");
    });
    return false;
});
$("#gtp_taskinfo").click(function (event) {
    var nodename = $(".table input[name=nodename]").val();
    var nodeip = $(".table input[name=nodeip]").val();
    var sel = $(".table input[name=sel]").val();
    if(!nodeip){
        $(".gtp-toolbar #gtp_taskinfo").removeClass('btn-info'); 
        $(".gtp-toolbar #gtp_taskinfo").addClass('btn-default');
        return false;
    } 
    $.post('/index.php/Home/TongGTP/taskinfo?nodeip=' + nodeip + '&sel=task'+'&nodename='+nodename, function (data) {
        data = eval("(" + data + ")");
        $("#tableshow").remove();
        $(".gtp-right .right-content-body .table").html(" ");
        $(".gtp-toolbar #gtp_taskinfo").removeClass('btn-info');
        $(".gtp-toolbar #gtp_nodeinfo").addClass('btn-info');
        $(".gtp-toolbar #gtp_tothis").addClass('btn-info');
        $(".gtp-right .right-content-body .table").html(data.div);
        var page = '<ul id="page" style="width: 500px;font-size:16px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:105px;"><span style="width:105px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
        if (data.numtask != "notask") {
            $(".right-content-footer").html(page);
        }
    });
    var height = document.getElementById("tableshow").offsetHeight;
    var width = document.getElementById("tableshow").offsetWidth;
    var bwidth = document.getElementById("container").offsetWidth - 300;
    var bheight = document.getElementById("container").offsetHeight - 80;
    if (height > (bheight - 40)) {
        height = (bheight - 40);
    }
    if (width > bwidth) {
        width = bwidth;
    }
    $('.right-content-body').css("height", bheight - 40);
    $('.right-content-body').css("width", bwidth);
    $('.right-content-body #table').css("width", bwidth);
    $('.right-content-body #table').css("height", height - 30);
    return false;
});
//发往本节点的任务
$("#gtp_tothis").click(function (event) {
    var nodename = $(".table input[name=nodename]").val();
    var nodeip = $(".table input[name=nodeip]").val();
    var sel = $(".table input[name=sel]").val();
    if(!nodeip){
        $(".gtp-toolbar #gtp_tothis").removeClass('btn-info');  
        return false;
    }  
    $(".gtp-toolbar #gtp_taskinfo").addClass('btn-info');
    $(".gtp-toolbar #gtp_nodeinfo").addClass('btn-info');
    $.post('/index.php/Home/TongGTP/taskinfo?nodeip=' + nodeip + '&sel=tothis'+'&nodename='+nodename, function (data) {
        data = eval("(" + data + ")");
        $("#tableshow").remove();
        $(".gtp-right .right-content-body .table").html(" ");
        $(".gtp-toolbar #gtp_tothis").removeClass('btn-info');
        // $(".gtp-toolbar #gtp_nodeinfo").addClass('btn-info');
        $(".gtp-right .right-content-body .table").html(data.div);
        var page = '<ul id="page" style="width: 500px;font-size:16px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:105px;"><span style="width:105px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
        if (data.numtask != "notask") {
            $(".right-content-footer").html(page);
        }
    });
    var height = document.getElementById("tableshow").offsetHeight;
    var width = document.getElementById("tableshow").offsetWidth;
    var bwidth = document.getElementById("container").offsetWidth - 300;
    var bheight = document.getElementById("container").offsetHeight - 80;
    if (height > (bheight - 40)) {
        height = (bheight - 40);
    }
    if (width > bwidth) {
        width = bwidth;
    }
    $('.right-content-body').css("height", bheight - 40);
    $('.right-content-body').css("width", bwidth);
    $('.right-content-body #table').css("width", bwidth);
    $('.right-content-body #table').css("height", height - 30);
    return false;
});
//导航条导出任务
$("#gtp_exptaskinfo").click(function () {
    var nodename = $(".table input[name=nodename]").val();
    var nodeip = $(".table input[name=nodeip]").val();
    var sel = $(".table input[name=sel]").val();
    if(!sel){
        return false;
    }
    var html = '';
        html += '<button onclick="tlexport(\'tothis\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">发往“<span style="color:#FFBF00;">' + nodename + '</span>”的任务</button>';
        html += '<button onclick="tlexport(\'fromthis\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">“<span style="color:#FFBF00;">' + nodename + '</span>”发出的任务</button>';
        html += '<button onclick="tlexport(\'all\')" id="allthis" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">全部相关任务</button>';
        $("#rmodal_upload #upsinfo").html(html);
    if (nodeip) {
        $("#rmodal_upload").modal("show");
    }
    
})
//执行导航条任务导出
function tlexport(sel){
    var tag = tag;
    var nodeip = $(".table input[name=nodeip]").val();
    var nodename = $(".table input[name=nodename]").val();
    var url="";
     url = '/index.php/Home/TongGTP/tlexport?nodeip=' + nodeip + '&nodename=' + nodename + "&sel="+sel; 
     if(nodeip){
        location.href=url;
     }
     
    // if (key == "taskname" || key == "nodename") {
    //     switch (tag) {
    //         case "tothis":
    //             url = '/index.php/Home/TongGTP/tlexport?nodeip=' + nodeip + '&nodename=' + nodename + "&tag=destnodename ";
    //             break;
    //         case "fromthis":
    //              url = '/index.php/Home/TongGTP/tlexport?nodeip=' + nodeip + '&nodename=' + nodename + "&tag=srcnodename ";
    //             break;
    //         case "all":
    //              url = '/index.php/Home/TongGTP/tlexport?nodeip=' + nodeip + '&nodename=' + nodename + "&tag=taskname ";
    //             break;
    //         default:
    //              url = '/index.php/Home/TongGTP/tlexport?nodeip=' + nodeip + '&nodename=' + nodename + "&tag=" + tag; 
    //             break;
    //     } 
    // }
}
//搜索
$(".gtp-search #gtp-search").click(function () {
    var kvalue = $(".gtp-search input[name=gtpskey]").val();
    var key = $(".gtp-search select[name=gtp-searchkey]").val();
    var url = '/index.php/Home/TongGTP/gtpskey?key=' + key + '&kvalue=' + kvalue;
    $.post(url, function (data, textStatus, xhr) {
        data = eval("(" + data + ")");
        $(".gtp-right .right-content-body #table").html(data.div);
        if (data.tage == "task") {
            var page = '<ul id="page" style="width: 500px;font-size:16px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:105px;"><span style="width:105px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
            $(".right-content-footer").html(page);
        } else {
            $(".right-content-footer").html('');
        }
        var height = document.getElementById("tableshow").offsetHeight;
        var width = document.getElementById("tableshow").offsetWidth;
        var bwidth = document.getElementById("container").offsetWidth - 300;
        var bheight = document.getElementById("container").offsetHeight - 80;
        if (height > (-40)) {
            height = (bheight - 40);
        }
        if (width > bwidth) {
            width = bwidth;
        }
        $('.right-content-body').css("height", height);
        $('.right-content-body').css("width", bwidth);
        $('.right-content-body #table').css("width", bwidth);
        // $('.right-content-body #table').css("height",height); 
        // $('.right-content-body #table .table').css("height",height);
    });
    return false;
});
//导出到Excel
function exporttag(tag) {
    var tag = tag;
    var kvalue = $(".gtp-search input[name=gtpskey]").val();
    var key = $(".gtp-search select[name=gtp-searchkey]").val();
    var url="";
    if (key == "taskname" || key == "nodename") {
        switch (tag) {
            case "tothis":
                url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=destnodename ";
                break;
            case "fromthis":
                 url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=srcnodename ";
                break;
            case "all":
                 url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=taskname ";
                break;
            default:
                 url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=" + tag; 
                break;
        } 
    } else if (key == "nodeip") {
        switch (tag) {
            case "tothis":
                 url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=destnodeip ";
                break;
            case "fromthis":
                  url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=srcnodeip ";
                break;
            case "all":
                 url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=allip ";
                break;
            default:
                 url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue + "&tag=" + tag;
                break;
        }
    }

    //alert(url+key);
    location.href = url;
    return false;
}
$(".gtp-search #gtp-export").click(function () {
    var kvalue = $(".gtp-search input[name=gtpskey]").val();
    var key = $(".gtp-search select[name=gtp-searchkey]").val();
    if (key == "taskname" && kvalue) {
        $("#rmodal_upload .modal-tittle").html("请选择要导出的数据项");
        var html = '<button onclick="exporttag(\'tothis\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">发往“' + kvalue + '的任务”</button>';
        html += '<button onclick="exporttag(\'fromthis\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">“' + kvalue + '”发出的任务</button>';
        html += '<button onclick="exporttag(\'all\')" id="allthis" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">全部相关任务</button>';
        $("#rmodal_upload #upsinfo").html(html);
    } else {
        var html = '<button onclick="exporttag(\'nodeinfo\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">“' + kvalue + '”的节点信息</button>';
        html += '<button onclick="exporttag(\'tothis\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">发往“' + kvalue + '”的任务</button>';
        html += '<button onclick="exporttag(\'fromthis\')" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">“' + kvalue + '”发出的任务</button>';
        html += '<button onclick="exporttag(\'all\')" id="allthis" style="margin:10px;font-size:16px;font-with:600;" class="btn btn-success">全部相关任务</button>';
        $("#rmodal_upload #upsinfo").html(html);
    }
    if (kvalue) {
        $("#rmodal_upload").modal("show");
    }
    return false;
});

// //接受
// $("#rmodal_upload").on("#tothis","click",function(e){
//     alert(e);
//     var kvalue = $(".gtp-search input[name=gtpskey]").val();
//     var key = $(".gtp-search select[name=gtp-searchkey]").val();
//     var url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue;
//     location.href=url+"&tag=destnodename "
// });
// //发送
// $("#rmodal_upload").on("#fromthis","click",function(){
//     alert("eee");
//     var kvalue = $(".gtp-search input[name=gtpskey]").val();
//     var key = $(".gtp-search select[name=gtp-searchkey]").val();
//     var url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue;
//     location.href=url+"&tag=srcnodename"
// });
// //全部
// $("#rmodal_upload #allthis").on("click",function(){
//     alert("eee");
//     var kvalue = $(".gtp-search input[name=gtpskey]").val();
//     var key = $(".gtp-search select[name=gtp-searchkey]").val();
//     var url = '/index.php/Home/TongGTP/export?key=' + key + '&kvalue=' + kvalue;
//     location.href=url+"&tag=all"
// });
$(".gtp-search input[name=gtpskey]").keyup(function () {
    var gtpskey = $(".gtp-search input[name=gtpskey]").val();
    var key = $(".gtp-search select[name=gtp-searchkey]").val();
});
function taskshow(ip,nodename) {
    // var nodename = $(".table input[name=nodename]").val();
    // var nodeip = $(".table input[name=nodeip]").val();
    var sel = $(".table input[name=sel]").val();
    var nodeip = ip;
    var nodename = nodename;
    $.post('/index.php/Home/TongGTP/taskinfo?nodeip=' + nodeip + '&sel='+sel+'&nodename='+nodename, function (data) {
        data = eval("(" + data + ")");
        $("#tableshow").remove();
        $(".gtp-toolbar #gtp_taskinfo").removeClass('btn-info');
        $(".gtp-toolbar #gtp_nodeinfo").addClass('btn-info');
        $(".gtp-toolbar #gtp_tothis").addClass('btn-info');
        $(".gtp-right .right-content-body .table").html(data.div);
        var page = '<ul id="page" style="width: 500px;font-size:16px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:105px;"><span style="width:105px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
        $(".right-content-footer").html(page);
    });
    var height = document.getElementById("tableshow").offsetHeight;
    var width = document.getElementById("tableshow").offsetWidth;
    var bwidth = document.getElementById("container").offsetWidth - 300;
    var bheight = document.getElementById("container").offsetHeight - 80;
    if (height > (bheight - 40)) {
        height = bheight - 40;
    }
    if (width > bwidth) {
        width = bwidth;
    }
    $('.right-content-body').css("height", bheight - 40);
    $('.right-content-body').css("width", bwidth);
    $('.right-content-body #table').css("height", height);
    $('.right-content-body #table .table').css("width", bwidth);
    $('.right-content-body #table .table').css("height", height);
}
//title
function tooltips(e) {
    $(e).tooltip('show');
}
//分页函数 
var page_cur = 1; //当前页
var total_num, page_size, page_total_num;//总记录数,每页条数,总页数
function getData(page, shownum) { //获取当前页数据
    var orderby = $("#mq-content-body input[name=orderby]").val();
    var bykey = $("#mq-content-body input[name=bykey]").val();
    if (!shownum) {
        var shownum = $("#mq_content-heading").find("select[name=shownum]").val();
    }
    var data = $("#gtp_sform").serialize();
    var nodename = $(".table input[name=nodename]").val();
    var nodeip = $(".table input[name=nodeip]").val();
    var sel = $(".table input[name=sel]").val();
    data += "&page=" + page + "&orderby=" + orderby + "&bykey=" + bykey;
    $.ajax({
        type: 'POST',
        url: '/index.php/Home/TongGTP/taskinfo?nodeip=' + nodeip + "&sel="+sel,
        data: data,
        dataType: 'json',
        success: function (data) {
            json = data.page;
            total_num = json.total_num;//总记录数
            page_size = json.page_size;//每页数量
            page_cur = page;//当前页
            page_total_num = json.page_total_num;//总页数
            $(".gtp-right .right-content-body .table").html(data.div);
        },
        complete: function () {
            getPageBar();//js生成分页，可用程序代替
            var height = document.getElementById("tableshow").offsetHeight;
            var width = document.getElementById("tableshow").offsetWidth;
            var bwidth = document.getElementById("container").offsetWidth - 300;
            var bheight = document.getElementById("container").offsetHeight - 80;
            if (height > (bheight - 40)) {
                height = bheight - 40;
            }
            if (width > bwidth) {
                width = bwidth;
            }
            $('.right-content-body').css("height", bheight - 40);
            $('.right-content-body').css("width", bwidth);
            $('.right-content-body #table').css("height", height);
            $('.right-content-body #table .table').css("width", bwidth);
            $('.right-content-body #table .table').css("height", height);
        },
        error: function () {
            alert("数据异常,请检查是否json格式");
        }
    });
}

function getPageBar() { //js生成分页
    if (page_cur > page_total_num)
        page_cur = page_total_num;//当前页大于最大页数
    if (page_cur < 1)
        page_cur = 1;//当前页小于1
    page_str = "<li><a href='javascript:void(0)'>共" + total_num + "条</a></li><li style='width:107px;'><a href='javascript:void(0)' style='width:107px;display:block'><span style='width:107px' ><input class='gopage' id='gopage'  style='height:20px;' type='text' value=" + page_cur + " /><span id='allpage'>/" + page_total_num + "</span></span></a></li>";
    if (page_cur == 1) {//若是第一页
        page_str += "<li class='disabled'><a href='javascript:void(0)'>首页</a></li><li style='margin: auto 0;' class='disabled'><a href='javascript:void(0)'>上一页</a></li>";
    } else {
        page_str += "<li><a href='javascript:void(0)' data-page='1'>首页</a></li><li><a href='javascript:void(0)' data-page='" + (page_cur - 1) + "'>上一页</a></li>";
    }
    if (page_cur >= page_total_num) {//若是最后页
        page_str += "<li class='disabled'><a href='javascript:;'>下一页</a></li><li class='disabled'><a href='javascript:;'>尾页</a></li>";
    } else {
        page_str += "<li><a href='javascript:void(0)' data-page='" + (parseInt(page_cur) + 1) + "'>下一页</a></li><li><a href='javascript:void(0)' data-page='" + page_total_num + "'>尾页</a></li>";
    }
    $("#page").html(page_str);
}
//页面跳转
$("#right-content-footer").on('click', 'a', function () { //live 向未来的元素添加事件处理器,不可用bind
    var page = $(this).attr("data-page");//获取当前页
    var shownum = $("select[name=shownum]").val();
    var mqtage = $("#mq_content-heading input[name=mqtage]").val();
    if (page) {
        getData(page, shownum);
    }
    return false;
});
$("#right-content-footer").on('blur', 'input', function () { //live 向未来的元素添加事件处理器,不可用bind
    var page = $(this).val();//获取当前页
    var shownum = $("select[name=shownum]").val();
    if (page) {
        getData(page, shownum);
    }
    return false;
});
$("#right-content-footer").on('keyup', 'input', function () { //live 向未来的元素添加事件处理器,不可用bind
    var page = $(this).val();//获取当前页
    var shownum = $("select[name=shownum]").val();
    if (page) {
        getData(page, shownum);
    }
    return false;
});
//改变显示条数
$("#mq_content-heading").on('change', 'select', function () { //live 向未来的元素添加事件处理器,不可用bind
    var shownum = $(this).val();//获取当前页
    var mqtage = $("#mq_content-heading input[name=mqtage]").val();
    if (mqtage == "part") {
        getData_part(1, shownum);
    } else if (mqtage == "all") {
        getData(1, shownum);
    }
    return false;
});

