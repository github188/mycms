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
//生成树导航
var heads = '<div class="row" id="searchdiv">  <form class="form-inline" id="sysquery"> <div class="form-group" style="float:left;margin-left: 10px; width: 168px;">  <label>每页显示 <select name="shownum" id="shownum">  <option value="5" >5</option> <option selected="selected" value="10">10</option> <option value="25">25</option> <option value="50">50</option> <option value="100">100</option> </select> 条</label> </div> <div class="form-group" style="float:right;margin-right:  10px;display:none;"> <strong>从</strong> <input type="text" id="beginTime" name="beginTime" readonly="readonly" onclick="laydate()" class="laydate-icon" style="width:110px"><select id="beginHour" name="beginHour" size="1"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option></select>时<select id="beginMinute" name="beginMinute" size="1"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>分&nbsp;&nbsp;<strong>到</strong><input type="text" id="endTime" name="endTime" readonly="readonly" class="laydate-icon" style="width:110px"><select id="endHour" name="endHour" size="1"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option></select>时<select id="endMinute" name="endMinute" size="1"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>分</div><div style="float:right;"> <input type="text" value="" id="searchkey" name="searchkey">   <select id="simquery" name="simquery"><option value="host_name">主机名称</option><option value="sys_name">所属系统名称</option><option value="os_ver">操作系统及版本</option><option value="manage_ip">管理地址</option><option value="mq_ver">MQ版本号</option><option value="deploy">部署方式</option><option value="qm_name">队列管理器名称</option><option value="qm_status">队列管理器状态</option> <option value="remark">备  注</option><option value="serve_ip">服务IP</option><option value="principal">负责人和联系方式</option></select><input type="hidden" name="mqtage">';
heads2 = '<button type="button" style="margin:0;" id="mq_search" data-toggle="tooltip" data-placement="top" title="点击搜索"><i class="icon-search"></i></button></div>';
heads2pa = '<button  type="button" style="margin:0;" id="mq_search_part"  data-toggle="tooltip" data-placement="top" title="点击搜索"><i class="icon-search"></i></button></div>';
heads3 = '</form>  </div>';
$(document).ready(function () {

    headsa = heads + heads2 + heads3;
    var setting = {
        async: {
            enable: true,
            url: "/index.php/home/mq/get_nodes",
            autoParam: ["id"]
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        view: {
            expandSpeed: ""
        },
        callback: {
            beforeExpand: beforeExpand,
            onClick: zTreeonClick,
            onAsyncSuccess: onAsyncSuccess
        }
    };

    var zNodes = [
        // {id: "mq", pId: 0, name: "MQ管理", icon: "/Public/App/images/tree_mnt_04.gif", open: true},
        {id: "mq_all", pId: "mq", name: "节点管理", isParent: true, open: true,icon: "/Public/App/images/tree_mnt_04.gif"},
        {id: "mq_add", pId: "mq_all", name: "添加节点"},
        // {id: "mq_option", pId: "mq_all", name: "操作查询"},
        {id: "mq_export", pId: "mq_all", name: "节点导出"},
        {id: "mq_input", pId: "mq_all", name: "节点导入"}
    ];
    function zTreeonClick(event, treeId, treeNode) {
        var urp = '';
        if (treeNode.mq_id) {
            urlp = '/index.php/home/mq/mqinfo?id=' + treeNode.mq_id;
        } else {
            urlp = '/index.php/home/mq/option?id=' + treeNode.id;
        }
        $.post(urlp, function (data, textStatus, xhr) {
            data = eval("(" + data + ")");
            var ophtml = data.div;
            if (treeNode.id == "mq_all") {
                var page = '<ul id="page" style="width: 388px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:77px;"><span style="width:77px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
                var optbu = '<button id="mq-query-checkall" type="button" class="btn btn-info"><i class="icon-unchecked (alias)"></i> 全选</button> <button id="mq-query-qxall" type="button" class="btn btn-info"><i class="icon-mail-reply-all"></i> 取消全选</button>  <button id="mq-query-delet" type="button" class="btn btn-info"><i class="icon-remove"></i> 删除</button> <button id="mq-query-out" type="button" class="btn btn-info"><i class="icon-cloud-download"></i> 导出</button> <button id="mq-query-see" type="button" class="btn btn-info"><i class="icon-eye-open"></i> 查看</button>';
                $("#mq-content-footer-left").html(optbu);
                $("#mq-content-footer-right").html(page);
                $("#mq_content-heading").html(headsa);
                $("#mq-content-body").html(ophtml);
                $("#mq_content-heading input[name=mqtage]").val("all");
                $(".showkey").remove();
            } else if (treeNode.id == "mq_export") {
                headsa = heads + heads2pa + ophtml + heads3;
                $("#mq_content-heading").html(headsa);
                $("#mq_content-heading input[name=mqtage]").val("part");
                $("#mq-content-footer-left").html("");
                $("#mq-content-footer-right").html("");
                $("#mq-content-body").html("");
            } else if (treeNode.id == "mq_option") {
                $("#mq-content-footer-left").html(optbu);
                $("#mq-content-footer-right").html(page);
                $("#mq_content-heading").html(headsa);
                $("#mq-content-body").html(ophtml);
                $("#mq_content-heading input[name=mqtage]").val("option");
                $(".showkey").remove();
            } else {
                $("#mq-content-body").html(ophtml);
                $("#mq-content-footer-left").html("");
                $("#mq-content-footer-right").html("");
                $("#mq_content-heading").html("");
            }
        });
    }
    function beforeExpand(treeId, treeNode) {
        if (!treeNode.isAjaxing && treeNode.id == "mq_zong") {
            ajaxGetNodes(treeNode, "refresh");
            return true;
        } else {
            return [{name: "无子节点"}];
        }
    }
    function onAsyncSuccess(event, treeId, treeNode, msg) {
        if (!msg || msg.length == 0) {
            return;
        }
        var zTree = $.fn.zTree.getZTreeObj("lists");
        if (treeNode.id == "mq_zong") {
            treeNode.icon = "/Public/App/images/tree_mnt_02.gif";
        }
        zTree.updateNode(treeNode);
        zTree.selectNode(treeNode.children[0]);

    }
    function ajaxGetNodes(treeNode, reloadType) {
        var zTree = $.fn.zTree.getZTreeObj("lists");
        if (reloadType == "refresh") {
            treeNode.icon = "/Public/App/images/loading_1.gif";
            zTree.updateNode(treeNode);
            zTree.reAsyncChildNodes(treeNode, reloadType, true);
        }
    }

    $(document).ready(function () {
        $.fn.zTree.init($("#lists"), setting, zNodes);

    });
})
$(document).ready(function () {
    $('#header #loginfo').dropdownHover();
});

function menuh(e) {
    var urp = '';
    var datah = $(e).attr("data-href");
    if (datah) {
        urlp = '/index.php/home/mq/option?id=' + datah;
    } else {
        urlp = '/index.php/home/mq/mqinfo?id=' + datah;
    }
    $.post("/index.php/Home/Mq", {param1: 'value1'}, function (data, textStatus, xhr) {
        $("body").html(data);
    });
    $.post(urlp, function (data, textStatus, xhr) {
        data = eval("(" + data + ")");
        var ophtml = data.div;
        if (datah == "mq_all") {
            var page = '<ul id="page" style="width: 388px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:77px;"><span style="width:77px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
            var optbu = '<button id="mq-query-checkall" type="button" class="btn btn-info"><i class="icon-unchecked (alias)"></i> 全选</button> <button id="mq-query-qxall" type="button" class="btn btn-info"><i class="icon-mail-reply-all"></i> 取消</button>  <button id="mq-query-delet" type="button" class="btn btn-info"><i class="icon-remove"></i> 删除</button> <button id="mq-query-out" type="button" class="btn btn-info"><i class="icon-cloud-download"></i> 导出</button> <button id="mq-query-see" type="button" class="btn btn-info"><i class="icon-eye-open"></i> 查看</button>';
            $("#mq-content-footer-left").html(optbu);
            $("#mq-content-footer-right").html(page);
            $("#mq_content-heading").html(headsa);
            $("#mq-content-body").html(ophtml);
            $("#mq_content-heading input[name=mqtage]").val("all");
            $(".showkey").remove();
        } else if (datah == "mq_export") {
            headsa = heads + heads2pa + ophtml + heads3;
            $("#mq_content-heading").html(headsa);
            $("#mq_content-heading input[name=mqtage]").val("part");
            $("#mq-content-footer-left").html("");
            $("#mq-content-footer-right").html("");
            $("#mq-content-body").html("");
        } else if (datah == "mq_option") {
            $("#mq-content-footer-left").html(optbu);
            $("#mq-content-footer-right").html(page);
            $("#mq_content-heading").html(headsa);
            $("#mq-content-body").html(ophtml);
            $("#mq_content-heading input[name=mqtage]").val("option");
            $(".showkey").remove();
        } else {
            $("#mq-content-body").html(ophtml);
            $("#mq-content-footer-left").html("");
            $("#mq-content-footer-right").html("");
            $("#mq_content-heading").html("");
        }
    });

    return false;
}
function tooltips(e) {
    $(e).tooltip("show")
}