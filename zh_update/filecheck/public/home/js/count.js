$(document).ready(function($) {
    var now =new Date();
    var month = now.getMonth()+1;
    var jidu = 0;
    if(month%3==0){
        jidu = month/3;
    }else{
        jidu = (month/3)+1;
    }
    $("#cmonth [name=mmonth]").val(month); 
    $("#cjidu [name=jidu]").val(jidu);  
});
$("#cmonth").on("change","select",function(){
    $("#cmlog").show();
    var year = $("#cmonth [name=myear]").val();
    var month = $("#cmonth [name=mmonth]").val(); 
    if((!year)||(!month)){
        $("#cmonth #cmlog").hide();
        layer.msg('参数错误！');
        return false;
    }
    $.ajax({
        url: '/index.php/Home/Count/cmonth?year='+year+'&month='+month, 
        async:false,
        success:function(json){
            json = eval("("+json+")");
            var easy = json.data.easynum;
            var mq = json.data.mqnum;
            $("#cmonth #mq").html(mq);
            $("#cmonth #easy").html(easy);
        },
        complete:function(){
            $("#cmonth #cmlog").hide();
        }
    }) 
    
});
$("#cjidu").on("change","select",function(){
    $("#cjidu #cmlog").show();
    var jyear = $("#cjidu [name=jyear]").val();
    var jidu = $("#cjidu [name=jidu]").val(); 
    if((!jyear)||(!jidu)){
        $("#cjidu #cmlog").hide();
        layer.msg('参数错误！');
        return false;
    }
    $.ajax({
        url: '/index.php/Home/Count/cjidu?jyear='+jyear+'&jidu='+jidu, 
        async:false,
        success:function(json){
            json = eval("("+json+")");
            var easy = json.data.easynum;
            var mq = json.data.mqnum;
            $("#cjidu #mq").html(mq);
            $("#cjidu #easy").html(easy);
        },
        complete:function(){
            $("#cjidu #cmlog").hide();
        }
    }) 
    
});
$("#cauto").on("click","button",function(){
    $("#cauto #cmlog").show();
    var start_date = $("#cauto [name=start_date]").val();
    var end_date = $("#cauto [name=end_date]").val(); 
    if((!end_date)||(!start_date)){
        $("#cauto #cmlog").hide();
        layer.msg('参数错误！');
        return false;
    } 
    $.ajax({
        url: '/index.php/Home/Count/cauto?end_date='+end_date+'&start_date='+start_date, 
        async:false,
        success:function(json){
            json = eval("("+json+")");
            var easy = json.data.easynum;
            var mq = json.data.mqnum;
            $("#cauto #mq").html(mq);
            $("#cauto #easy").html(easy);
        },
        complete:function(){
            $("#cauto #show_cauto").show();
            $("#cauto #cmlog").hide();
        }
    }) 
    
});