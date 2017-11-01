//验证表单MQ修改表单 
var mq_i = 0;
$("#mq-content input").blur(function(){
    var deploy = $(this).val();
    var id=$(this).attr("name");
    if (!deploy) {
        $("span#"+id).html("不能为空"); 
        $(this).focus();
        $(this).css({"border-color": 'red'});
        mq_i = 0;
        return false;
    } else {
        $("span#"+id).html("*&nbsp;&nbsp;&nbsp;&nbsp;"); 
        $(this).css({"border-color": '#66afe9'});
        mq_i = 1;
    }
});
function edit_onblur(e){
    var deploy = $(e).val(); 
    var id=$(e).attr("name");
    if (!deploy) {
        $("span#"+id).html("不能为空"); 
        $(e).focus();
        $(e).css({"border-color": 'red'});
        mq_i = 0;
        return false;
    } else {
        $("span#"+id).html("*&nbsp;&nbsp;&nbsp;&nbsp;"); 
        $(e).css({"border-color": '#66afe9'});
        mq_i = 1;
    }
}
$("#mq-content #mq_save_button").click(function () {
    if (mq_i) {
	var mq_id = $("[name=mq_id]").val();
	$.ajax({
	    url: "/index.php/Home/Mq/editmq",
	    type: "post",
	    data: $("#mq_edit_form").serialize(),
	    success: function (json) {
		json = eval("(" + json + ")");
		if (json.code == "10000") {
		    $("#mq_modal .modal-body").html("<h3>" + json.message + "</h3>");
		    $("#mq_modal").modal({
			show: true,
			keyboard: true
		    });
		    $("#mq_modal").on("hidden.bs.modal", function () {
			$.post('/index.php/home/mq/mqinfo?id=' + mq_id, function (data, textStatus, xhr) {
			    data = eval("(" + data + ")");
			    $("#mq-content").html(data.div);
			});
		    });
		    setTimeout(function () {
			$("#mq_mode").modal("hide");
			$(".modal-backdrop,#mq_modal").remove();
			$("body").removeClass("modal-open");
		    }, 3000);
		    //alert(json.message); 
		}

	    }
	});
    }
    return false;
});
$("#mq-content #mq_delete_button").bind("click", function () {
    var mq_id = $("[name=mq_id]").val();
    $.post('/index.php/home/mq/deletMq?id=' + mq_id, function (data, textStatus, xhr) {
	data = eval("(" + data + ")");
	if (data.code = "10000") {
	    $("#mq_modal .modal-body").html("<h3>" + data.message + "</h3>");
	    $("#mq_modal").modal({
		show: true,
		keyboard: true
	    });
	    setTimeout(function () {
		$("#mq_mode").modal("hide");
		$(".modal-backdrop,#mq_modal").remove();
		$("body").removeClass("modal-open");
	    }, 3000);
	    $("#mq_modal").on("hidden.bs.modal", function () {
		$("#mq-content").html("");
		refreshzTree();
	    });


	}
    });
    return false;
});
$("#mq-content #mq_add_button").click(function () {
    clearForm("#mq_edit_form");
    $("[name=mq_id]").val("");
    $(".mq_op").html('<button onclick="mq_sadd();return false;" class="btn btn-primary"><i class="icon-cloud-upload"></i> 提交</button><button onclick="resetform();return false;" class="btn btn-primary"><i class="icon-mail-reply-all"></i> 重置</button>');
    $("#ch_user").remove();
    return false;
});
function mq_sadd(e) {
    var form = $(e).parents().eq(1);
    if (mq_i) {         
	$.ajax({
	    url: "/index.php/Home/Mq/editmq",
	    type: "post",
	    data: form.serialize(),
	    success: function (json) {
		json = eval("(" + json + ")");
		if (json.code == "10000") {
		    $("#mq_modal .modal-body").html("<h3>" + json.message + "</h3>");
		    $("#mq_modal").modal({
			show: true,
			keyboard: true
		    });
		    $("#mq_modal").on("hidden.bs.modal", function () {

		    });
		}

	    }
	});
    }else{
        form.find("input").each(function(){
            edit_onblur(this);
        });
    }
    return false;
}
function resetform(e) {
    var form = $(e).parents().eq(1);
    clearForm(form); 
    return false;
}
function refreshzTree() {
    var zTree = $.fn.zTree.getZTreeObj("lists"); 
}
//清空表单
function clearForm(form) {
    // iterate over all of the inputs for the form
    // element that was passed in
    $(':input', form).each(function () {
	var type = this.type;
	var tag = this.tagName.toLowerCase(); // normalize case
	// it's ok to reset the value attr of text inputs,
	// password inputs, and textareas
	if (type == 'text' || type == 'password' || tag == 'textarea')
	    this.value = "";
	// checkboxes and radios need to have their checked state cleared
	// but should *not* have their 'value' changed
	else if (type == 'checkbox' || type == 'radio')
	    this.checked = false;
	// select elements need to have their 'selectedIndex' property set to -1
	// (this works for both single and multiple select elements)
	else if (tag == 'select')
	    this.selectedIndex = -1;
    });
}
;
//mq分页函数
var page_cur = 1; //当前页
var total_num, page_size, page_total_num;//总记录数,每页条数,总页数
function getData(page, shownum) { //获取当前页数据
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
	url: '/index.php/home/mq/option?id=mq_all', 
    data:data,
	dataType: 'json',
	success: function (data) {
	    json = data.page;
	    $("#ul_lists").empty();
	    total_num = json.total_num;//总记录数
	    page_size = json.page_size;//每页数量
	    page_cur = page;//当前页
	    page_total_num = json.page_total_num;//总页数
	    $("#mq-content-body").html(data.div);
	},
	complete: function () {
	    getPageBar();//js生成分页，可用程序代替
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
    page_str = "<li><a href='javascript:void(0)'>共" + total_num + "条</a></li><li style='width:77px;'><a href='javascript:void(0)' style='width:77px;display:block'><span style='width:77px' ><input class='gopage' id='gopage'  style='height:20px;' type='text' value=" + page_cur + " /><span id='allpage'>/" + page_total_num + "</span></span></a></li>";
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
$("#mq-content-footer-right").on('click', 'a', function () { //live 向未来的元素添加事件处理器,不可用bind
    var page = $(this).attr("data-page");//获取当前页
    var shownum = $("select[name=shownum]").val();
    var mqtage = $("#mq_content-heading input[name=mqtage]").val();
    if (page) {
        if(mqtage=="part"){
            getData_part(page, shownum);
        }else if(mqtage=="all"){
           getData(page, shownum); 
       }	
    }
    return false;
});
$("#mq-content-footer-right").on('blur', 'input', function () { //live 向未来的元素添加事件处理器,不可用bind
    var page = $(this).val();//获取当前页
    var shownum = $("select[name=shownum]").val();
    var mqtage = $("#mq_content-heading input[name=mqtage]").val();
    if (page) {
        if(mqtage=="part"){
            getData_part(page, shownum);
        }else if(mqtage=="all"){
           getData(page, shownum); 
       }    
    }
    return false;
});
//改变显示条数
$("#mq_content-heading").on('change', 'select', function () { //live 向未来的元素添加事件处理器,不可用bind
    var shownum = $(this).val();//获取当前页
    var mqtage = $("#mq_content-heading input[name=mqtage]").val();  
        if(mqtage=="part"){
            getData_part(1, shownum);
        }else if(mqtage=="all"){
           getData(1, shownum); 
       }  
    return false;
});
//全选、取消、删除、导出操作 
$("#mq-content-footer-left").on('click', '#mq-query-checkall', function () {     
    $("#mq-content-body input[name=mq_checkbox]").prop("checked","checked");  
});
$("#mq-content-footer-left").on('click', '#mq-query-qxall', function () { 
    $("#mq-content-body input[name=mq_checkbox]").attr("checked",false); 
     
});
//删除提示框
$("#mq-content-footer-left").on('click', '#mq-query-delet', function () {    
    $("#infonote .modal-body").html("<h3>确定要删除主机信息吗？</h3>");
    var bqe='<button id="ok" class="btn btn-primary" data-dismiss="modal">确定</button>';
    bqe +='<button class="btn btn-primary" data-dismiss="modal">取消</button>';
    $("#infonote .modal-footer").html(bqe);
    $("#infonote").modal("show");       
});
$("#infonote .modal-footer").on("click","#ok",function(){
    var i=0;
    var arr=new Array();
    $("#mq-content-body input[name=mq_checkbox]:checked").each(function(index, el) {
        arr[i]=$(el).val();
        i++;
    });
    var mqtage = $("#mq_content-heading input[name=mqtage]").val(); 
    if (arr[0]) {        
        $.ajax({
        url: "/index.php/Home/Mq/delete?mq_id=" + arr,
        type: 'get',
        success: function (json) {
            json = eval("(" + json + ")");
            if (json.code == "10000") { 
            if(mqtage=="part"){
            getData_part(1, 0);
            }else if(mqtage=="all"){
            getData(1, 0);
            } 
            } else {                
                 
            } 
            setTimeout(function(){
                $("#infonote .modal-body").html("<h3>"+json.message+"</h3>");
                $("#infonote .modal-footer").html('<button class="btn btn-primary" data-dismiss="modal">取消</button>');
                $("#infonote").modal("show"); 
            },300);
        }
        });
}
}); 
$("#mq-content-footer-left").on('click', '#mq-query-out', function () {
    var i=0;
    var arr=new Array();
    $("#mq-content-body input[name=mq_checkbox]:checked").each(function(index, el) {
        arr[i]=$(el).val();
        i++;
    });
    var mqtage = $("#mq_content-heading input[name=mqtage]").val();  
    var url=""; 
    if (arr[0]) {
        if(mqtage=="part"){
        var data = $("#sysquery").serialize();
        var orderby = $("#mq-content-body input[name=orderby]").val();    
        var bykey =$("#mq-content-body input[name=bykey]").val();
        url ="/index.php/Home/Mq/exportpart?mq_id=" + arr+"&"+data+"&orderby="+orderby+"&bykey="+bykey;
        }else if(mqtage=="all"){
            url ="/index.php/Home/Mq/ExportAll?mq_id=" + arr;
        }
        window.location = url;
    } else {
        alert("请选择要导出的数据");
    }     
});
$("#mq-content-footer-left").on('click', '#mq-query-see', function () {
    var i=0;
    var arr=new Array();
    $("#mq-content-body input[name=mq_checkbox]:checked").each(function(index, el) {
        arr[i]=$(el).val();
        i++;
    });
    if (arr[0]) {
        $.ajax({
            url: '/index.php/Home/Mq/seenode',
            type: 'POST', 
            data: {"mq_id": arr},
            success: function(json){
                $("#mq-content-body").html(json);
                $("#mq-content-footer-left").html("");
                $("#mq-content-footer-right").html("");
                $("#searchdiv").hide(); 
            }
        })         
    } else {
        alert("请选择要查看的数据");
    }    
});

//表格排序
function orderby(e) {
    var orderby =$("#mq-content-body input[name=orderby]");
    var bykey =$("#mq-content-body input[name=bykey]"); 
    if (bykey.val()== "desc") {
	bykey.val("asc");
    } else {
	bykey.val("desc");
    }

    orderby.val($(e).attr("data-order")); 
    getData(1, 0); 
}
$(document).ready(function() {
     urlp = '/index.php/home/mq/option?id=mq_all' ;
     $.post(urlp, function (data, textStatus, xhr) {
            data = eval("(" + data + ")");
            var ophtml = data.div;
             var page = '<ul id="page" style="width: 388px;" class="pagination"><li><a href="javascript:void(0)">共' + data.page.total_num + '条</a></li><li style="width:77px;"><span style="width:77px;" href="javascript:void(0)"><input class="gopage" id="gopage" size="1" style="height:20px;" type="text" value="1" /><span id="allpage">/' + data.page.page_total_num + '</span></span></li><li><a href="javascript:void(0)">首页</a></li><li class="disabled"><a href="javascript:void(0)">上一页</a></li><li><a data-page="2" href="javascript:void(0)">下一页</a></li><li><a data-page="' + data.page.page_total_num + '" href="javascript:void(0)">尾页</a></li></ul>';
                var optbu = '<button id="mq-query-checkall" type="button" class="btn btn-info"><i class="icon-unchecked (alias)"></i> 全选</button> <button id="mq-query-qxall" type="button" class="btn btn-info"><i class="icon-mail-reply-all"></i> 取消全选</button>  <button id="mq-query-delet" type="button" class="btn btn-info"><i class="icon-remove"></i> 删除</button> <button id="mq-query-out" type="button" class="btn btn-info"><i class="icon-cloud-download"></i> 导出</button> <button id="mq-query-see" type="button" class="btn btn-info"><i class="icon-eye-open"></i> 查看</button>';
                $("#mq-content-footer-left").html(optbu);
                $("#mq-content-footer-right").html(page);
                $("#mq_content-heading").html(headsa);
                $("#mq-content-body").html(ophtml);
                $("#mq_content-heading input[name=mqtage]").val("all");
                $(".showkey").remove();
        })
   
});
//搜索
// $("#frame-right-main #mq_search").on("click",function(){
//     var mqtage = $("#mq_content-heading input[name=mqtage]").val();  
//         if(mqtage=="part"){
//             getData_part(1, 0);
//         }else if(mqtage=="all"){
//            getData(1, 0); 
//        } 
// })