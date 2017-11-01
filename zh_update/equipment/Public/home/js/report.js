jQuery(function ($) {
    $(".right-content-footer").on('click', '#mq-report-checkall', function () { 
        $(".right-content-body input[name=re_checkbox]").prop("checked", "checked");
    });
    $(".right-content-footer").on('click', '#mq-report-qxall', function () { 
        $(".right-content-body input[name=re_checkbox]").attr("checked", false);
    });
    $(".right-content-footer").on('click', '#mq-report-down', function () {
        var i = 0;
        var arr = new Array();
        $(".right-content-body input[name=re_checkbox]:checked").each(function (index, el) {
            arr[i] = $(el).val();
            i++;
        });
        var mqtage = $("#mq_content-heading input[name=mqtage]").val();
        var url = "";
        if (arr[0]) { 
                url = "/index.php/Home/Mreport/moredown?repid=" + arr; 
            window.location = url;
        } else {
            alert("请选择要下载的月报");
        }
    });
}); 
//按月导出
$("#douwn_month").click(function(){
    $("#rmodal_upload .modal-tittle").html("按月下载月报");
    $.ajax({
        url:'/index.php/Home/Mreport/tjdowm',
        success:function(json){
            json=eval("("+json+")");
            if(json.code==10000){
                $("#dyear").html(json.data);
                $("#mdowns").html(json.chm);
            }else{
                $(".info").html(json.data);
            }
        }
    });
    $(".modal-footer").html('<button class="btn btn-primary" id="domdown">下载</button>');
    
    $("#rmodal_upload").modal('show');
});
$("#dyear").change(function(){
    $.ajax({
        url:'/index.php/Home/Mreport/tjdowm',
        success:function(json){
            json=eval("("+json+")"); 
            if(json.code==10000){ 
                $("#mdowns").html(json.chm);
            }else{
                $(".info").html(json.data);
            }
        }
    });
});
$(".modal-footer").on('click','#domdown',function(){     
        var i = 0;
        var arr = new Array();
        $(".info input[name=mdowm]:checked").each(function (index, el) {
            arr[i] = $(el).val();
            i++;
        });
        var url = "";
        if (arr[0]) { 
            var year = $(".info select[name=dyear]").val();
            url = "/index.php/Home/Mreport/md?year="+year+"&mid=" + arr; 
            window.location = url;
        } else {
            alert("请选择要下载的月报");
        }
});
//按项目下载
$("#douwn_xm").click(function(){
    $("#rmodal_upload .modal-tittle").html("按项目下载月报");
    $.ajax({
        url:'/index.php/Home/Mreport/tjdowm',
        success:function(json){
            json=eval("("+json+")");
            if(json.code==10000){
                $("#dyear").html(json.data);
                $("#mdowns").html(json.chxm);
            }else{
                $(".info").html(json.data);
            }
        }
    });
    $(".modal-footer").html('<button class="btn btn-primary" id="doxmdown">下载</button>');
    
    $("#rmodal_upload").modal('show');
});
$(".modal-footer").on('click','#doxmdown',function(){     
        var i = 0;
        var arr = new Array();
        $(".info input[name=xmdowm]:checked").each(function (index, el) {
            arr[i] = $(el).val();
            i++;
        });
        var url = "";
        if (arr[0]) { 
            var year = $(".info select[name=dyear]").val();
            url = "/index.php/Home/Mreport/md?year="+year+"&xmid=" + arr; 
            window.location = url;
        } else {
            alert("请选择要下载的月报");
        }
});
$(".right-content-body").on("click","#mreportdel",function(event) {
    $("#rmodal_upload .modal-tittle").html("确定要删除以下月报吗？");
    var id = $(this).parent().parent().find('[name=re_checkbox]').val()
    var name = $(this).parent().parent().find("#report_name").html() 
    $("#rmodal_upload .info").html("<strong>"+name+"</strong>");
    var footer ='<button data-id="'+id+'" id="delety" class="btn btn-primary" >删除</button>';
    footer += '<button class="btn btn-primary" data-dismiss="modal">取消</button>';
    $("#rmodal_upload .modal-footer").html(footer);
    $("#rmodal_upload").modal('show'); 
}); 
 $("#rmodal_upload .modal-footer").on("click","#delety",function(event) {
    var id = $(this).attr("data-id");      
        $.ajax({
        url: "/index.php/Home/Mreport/delete?id=" + id,
        type: 'get',
        success: function (json) {
            json = eval("(" + json + ")");
             if(json.code=="10000"){
                setTimeout(function(){
                    $("#rmodal_upload .modal-tittle").html(""); 
                    $("#rmodal_upload .info").html("<h3>"+json.message+"</h3>"); 
                    $("#rmodal_upload .modal-footer").html('<button class="btn btn-primary" data-dismiss="modal">确定</button>');
                    $("#rmodal_upload").modal("show"); 
                },300);

             }
             var td = $(".right-content-body table").find("[value="+id+"]");
            td.parent().parent().remove();
        }
        });  
 }); 
//月报预览
function clickview(docid){
     url = '/index.php/Home/Mreport/mview?id='+docid;
      url = encodeURI(url); 
     window.open(url,"","scrollbars=no,toolbar=no,top=100, left=100, menubar=no, location=no, status=no,width=800");  
}
// $(".right-content-body").on("click","#mreportview",function(event) {
//       var id = $(this).parent().parent().find('[name=re_checkbox]').val();
//       url = '/index.php/Home/Mreport/mview?id='+id;
//       url = encodeURI(url);
//      window.open(url,"","scrollbars=no,toolbar=no,top=100, left=100, menubar=no, location=no, status=no,width=800");        //弹出新窗口
//    // window.opener=null;
//    // window.open("","_self");
//    // //window.close();  //关闭窗口 
// });