/**
 * 按字段导出
 * @authors Your Name (you@example.org)
 * @date    2016-05-18 09:49:58
 * @version $Id$
 */
//mq分页函数
var page_cur = 1; //当前页
var total_num, page_size, page_total_num;//总记录数,每页条数,总页数
function getData(page, shownum) { //获取当前页数据
    var arr=[];
    var i=0;
    $("#sysquery [name=show_key]:checked").each(function () {
            arr[i] = $(this).val();
            i++;
        });
        if (!arr[0]) {
            alert("请选择要查询的字段");
            return false;
        }
    var orderby = $("#mq-content-body input[name=orderby]").val();    
    var bykey =$("#mq-content-body input[name=bykey]").val();
    if (!shownum) {
    var shownum = $("#mq_content-heading").find("select[name=shownum]").val();
    }
    var beginTime = $("input[name=beginTime]").val();
        var beginHour = $("[name=beginHour]").val();
        var beginMinute = $("[name=beginMinute]").val();
        var endTime = $("[name=endTime]").val();
        var endHour = $("[name=endHour]").val();
        var endMinute = $("[name=endMinute]").val();
        var key = $("#mq_content-heading input[name=searchkey]").val();
        var keyid = $("#mq_content-heading input[name=simquery]").val(); 
    if (beginTime || endTime) {
            if (!beginTime) {
                alert("开始时间不能为空！");
                $("[name=beginTime]").focus();
                return false;
            }
            if (!endTime) {
                alert("结束时间不能为空！");
                $("[name=endTime]").focus();
                return false;
            }
            var begindate = beginTime + " " + beginHour + ":" + beginMinute + ":00";
            var enddate = endTime + " " + endHour + ":" + endMinute + ":00";
            if (begindate > enddate) {
                alert("开始时间不能大于结束时间！");
                return false;
            }
        }
    var data=$("#sysquery").serialize();  
    data += "&page="+page+"&orderby="+orderby+"&bykey="+bykey;  
    $.ajax({
    type: 'POST',
    url: '/index.php/home/mq/mq_partexport', 
    data:data,
    dataType: 'json',
    success: function (data) {
        data = eval("("+data+")");
        if(data.code="10000"){}
        var json = data.page;
    console.log(data);
        $("#ul_lists").empty();
        total_num = json.total_num;//总记录数
        page_size = json.page_size;//每页数量
        page_cur = page?page:1;//当前页
        page_total_num = json.page_total_num;//总页数
        $("#mq-content-body").html(data.div);
    },
    complete: function () {
        //getPageBar();//js生成分页，可用程序代替
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
    page_str = "<li><a href='javascript:void(0)'>共" + total_num + "条</a></li><li><span style='width:77px' ><input class='gopage' id='gopage'  style='height:20px;' type='text' value=" + page_cur + " /><span id='allpage'>/" + page_total_num + "</span></span></li>";
    if (page_cur == 1) {//若是第一页
    page_str += "<li class='disabled'><a href='javascript:void(0)'>首页</li><li style='margin: auto 0;' class='disabled'>上一页</li>";
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
$("#mq-content-footer-right").on('click', 'a', function () { //live 向未来的元素添加事件处理器,不可用bind
    var page = $(this).attr("data-page");//获取当前页
    var shownum = $("select[name=shownum]").val();
    if (page) {
    getData(page, shownum);
    }
    return false;
});
$("#mq-content-footer-right").on('blur', 'input', function () { //live 向未来的元素添加事件处理器,不可用bind
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
    if (shownum) {
    getData(1, shownum);
    }
    return false;
});

