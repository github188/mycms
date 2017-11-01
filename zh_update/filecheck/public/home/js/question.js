jQuery(function ($) {
    $('#question-inb').click(function (event) {
        // $.post('/index.php/Home/Questions/upage', function(data, textStatus, xhr) {
        //     data=eval("("+data+")");
        //     $('.right-coneten-body').html(data.div);
        // });
        open('/index.php/Home/Questions/upage');
        return false;
    });
    $('#question-add').click(function (event) {
        // $.post('/index.php/Home/Questions/addpage', function(data, textStatus, xhr) {
        //     data=eval("("+data+")");
        //     $('.right-coneten-body').html(data.div);
        // });
        open('/index.php/Home/Questions/addpage');
        return false;
    });
    $("#search-botton").click(function (event) {
        $.ajax({
            url: '/index.php/Home/Questions/search',
            data: $('#quseafrom').serialize(),
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == 10000) {
                    $(".event_list").html(json.data);
                } else {
                    $(".event_list").html('<div style="margin:10px;text-align: center;"><h2>没有相关数据</h2></div>');
                }
            }
        })
        return false;
    });
    $("#export").click(function (event) {
        location.href = '/index.php/Home/Questions/export?' + $('#quseafrom').serialize();
        // $.ajax({
        //     url: '/index.php/Home/Questions/export',  
        //     type:'get',
        //     data: $('#quseafrom').serialize(),
        //     success:function(json){
        //         json=eval("("+json+")");
        //         // if(json.code==10000){ 
        //         //     $(".event_list").html(json.data);
        //         // }else{
        //         //     $(".event_list").html('<div style="margin:10px;text-align: center;"><h2>没有相关数据</h2></div>');
        //         // } 
        //     }
        // }) 

        return false;
    });
    $("#qsubmit").click(function (event) {
        var xmsel = $("select[name=xmsel]").val();
        if (!xmsel) {
            $("select[name=xmsel]").focus();
            $("span#xmsel").html('请选择项目');
            return false;
        } else {
            $("span#xmsel").css({
                color: 'green'
            });
            $("span#xmsel").html('<i class="icon icon-check-sign"></i>');
        }
        var happentime = $("input[name=happentime]").val();
        if (!happentime) {
            $("input[name=happentime]").focus();
            $("span#happentime").html('请选择发生时间');
            return false;
        } else {
            $("span#happentime").css({
                color: 'green'
            });
            $("span#happentime").html('<i class="icon icon-check-sign"></i>');
        }
        var environment = $("input[name=environment]").val();
        if (!environment) {
            $("input[name=environment]").focus();
            $("span#environment").html('系统环境不能为空！');
            return false;
        } else {
            $("span#environment").css({
                color: 'green'
            });
            $("span#environment").html('<i class="icon icon-check-sign"></i>');
        }
        var systemname = $("input[name=systemname]").val();
        if (!systemname) {
            $("input[name=systemname]").focus();
            $("span#systemname").html('系统名称不能为空！');
            return false;
        } else {
            $("span#systemname").css({
                color: 'green'
            });
            $("span#systemname").html('<i class="icon icon-check-sign"></i>');
        }
        var describe = $("textarea[name=describe]").val();
        if (!describe) {
            $("[name=describe]").focus();
            $("span#describe").html('问题描述及分析不能为空！');
            return false;
        } else {
            $("span#describe").css({
                color: 'green'
            });
            $("span#describe").html('<i class="icon icon-check-sign"></i>');
        }
        var result = $("textarea[name=result]").val();
        if (!result) {
            $("[name=result]").focus();
            $("span#result").html('处理方法及结果不能为空！');
            return false;
        } else {
            $("span#result").css({
                color: 'green'
            });
            $("span#result").html('<i class="icon icon-check-sign"></i>');
        }
        var manager = $("[name=manager]").val();
        if (!manager) {
            $("[name=manager]").focus();
            $("span#manager").html('处理人员不能为空！');
            return false;
        } else {
            $("span#manager").css({
                color: 'green'
            });
            $("span#manager").html('<i class="icon icon-check-sign"></i>');
        }
        $.ajax({
            url: '/index.php/Home/Questions/add',
            type: 'POST',
            data: $('#questionsform').serialize(),
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == '10000') {
                    clearForm('#questionsform');
                }
                alert(json.message);
            }
        })
        return false;
    });
//    $('#divlist ul li div').click(function(event) {
//   alert("dd");
// }); 
    $('#divlist ul ').on("mouseover", "li", function (e) {
        $(this).css({
            cursor: 'pointer'
        });
    });
$('#divlist ul ').on("click","li",function(e){ 
    var idval = $(this).find('input').val(); 
  if(3==e.which||1==e.which){ 
    var mouse = new MouseEvent(e);
    var x=e.clientX + document.body.scrollLeft - document.body.clientLeft;
    var y=e.clientY + document.body.scrollTop - document.body.clientTop ;
    // var x =  e.pageX;
    // var y =  e.pageY;
    // $("#rightMenu").css({
    //   'position':'fixed',
    //   'left':x+18,
    //   'top':y-5
    // }) 
    $.ajax({
        url: '/index.php/Home/Questions/chepower?opt=delete,edit',
        success:function(json){
            json = eval("(" + json + ")");
                if (json.message == 'ok') { 
                    if(json.data.delete=="ok"){
                        var dethtml = '<button id="delete_q" data-id="'+idval+'" class="btn btn-info btn-lg" style="margin:10px;"><i class="icon icon-trash"></i> 删除</button>'; 
                    }else{
                        var dethtml = '';
                    }
                    if(json.data.edit=="ok"){
                        var edhtml = '<button id="edit_q" data-id="'+idval+'" class="btn btn-info btn-lg" style="margin:10px;"><i class="icon icon-edit"></i> 修改</button>';
                        // $("#edit_q").attr('data-id', idval);;
                    }else{
                        var edhtml = '';
                    } 
                    $(".modal-body").html(dethtml+edhtml);
                    $("#rightMenu").modal("show"); 
                }else{
                    $(".modal-body").html('');
                    return false;
                }
                
        } 
    });   
  } 
});  
})

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
