jQuery(function ($) {
    $(document).ready(function () {
        var height = $(window).height();
        var width = $(window).width();
        $("#indexcontent").css('width', width - 200);
        $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
        $("#indexcontent").css('height', height - 94);
        $("#menulist").css('height', height - 100);
    });
    $(window).scroll(function (event) {
        var scrollTop = $(window).scrollTop();
        $("#sr_nav").css('margin-top', scrollTop + 50);
        $(".container").css('margin-top', 0 - scrollTop - 10);
    });
    $(window).resize(function (event) {
        var height = $(window).height();
        var width = $(window).width();
        $("#indexcontent").css('width', width - 200);
        $("#indexmenu,#indexmenuss,#indexsplit").css('height', height - 50);
        $("#indexcontent").css('height', height - 94);
        $("#menulist").css('height', height - 100);
    }); 
    $("#reordershla").click(function (event) {
        $("#indexmenu").css({
            display: 'none'
        });
        $("#indexmenuss").css({
            display: 'block'
        });
        $("#indexcontent").css({
            width: ' 1331px'
        });
    });
    $("#indexmenuss").click(function (event) {
        $("#indexmenu").css({
            display: 'block'
        });
        $("#indexmenuss").css({
            display: 'none'
        });
        $("#indexcontent").css({
            width: ' 1171px'
        });
    });
    $("#indexmenuss").click(function (event) {
        $("#indexmenu").css({
            display: 'block'
        });
        $("#indexmenuss").css({
            display: 'none'
        });
        $("#indexcontent").css({
            width: ' 1171px'
        });
    });
})
function doact(e, cl,did) {
    var is_exists = $('#tabs_title').find('#tabs_' + e).length;
    if (is_exists&&e=='search') {
        var keyword = $("#content_"+did+" #key_alladdress").val();
        // if(!keyword){
        //     layer.msg("搜索内容不能为空");
        //     return false;
        // }
        $.ajax({
            url: '/index.php/Home/Address/get_search?do='+e+'&keyword='+keyword,
            success: function (jsoan) {
                $("#content_"+e).remove();
                $("#content_allmainview").append(jsoan); 
                changetabs(e);
            }
        })
        changetabs(e);
        return false;
    }
    if (is_exists) {
        changetabs(e);
        return false;
    }
    if (e == 'add') {
        var title_tab = '<div class="accive" id="tabs_add" onclick="changetabs(\'add\')" temp="tabs"><i class="icon-plus"></i>  新增联系人<span class="icon-remove" onclick="closetabs(\'add\')"></span></div>';
        $.ajax({
            url: '/index.php/Home/Address/get_add',
            success: function (jsoan) {
                $("#content_allmainview").append(jsoan);
                $('#tabs_title').append(title_tab);
                changetabs(e);
            }
        })
    } else if (e == 'move') {
        movegrounp(cl);
    }else if (e == 'search') {
        var search_tab1 = '<div class="accive" id="tabs_search" onclick="changetabs(\'search\')" temp="tabs"><i class="icon-search"></i>  搜索结果<span class="icon-remove" onclick="closetabs(\'search\')"></span></div>'; 
         var keyword = $("#content_"+did+" #key_alladdress").val(); 
        $.ajax({
            url: '/index.php/Home/Address/get_search?do='+e+'&keyword='+keyword,
            success: function (jsoan) {
                $("#content_allmainview").append(jsoan);
                $('#tabs_title').append(search_tab1);
                changetabs(e);
            }
        })
    }

}
 
function movegrounp(cl) {
    var str = $("#content_" + cl).find('table [selected]');
    var aid = str.find('input[name=id]').val();
    if ((!aid) || (!str.length)) {
        $("#content_alladdress #movecl").attr('disabled', true);
        return false;
    }
    var modiv='';
    if(cl=='alladdress'){
        modiv = "commonmodal";
    }else{
        modiv = "commonmodal_"+cl;
    }
    $("#"+modiv).on('click','ul li',function(){
        $(this).siblings().css('background-color',"#FFFFFF");
        $(this).siblings().removeAttr('selected');
        $(this).css('background-color',"#D1D1D1");
        $(this).attr('selected',true);
    });
    $("#"+modiv+" .modal-tittle").html("<span style='font-size:23px;'>选择分组</span>");
    var footer = ' <span id="mvmsgview"></span><button type="button" data-id="' + aid + '" id="moveclb" data-this="'+cl+'" class="btn btn-success" ><i class="icon-save"></i>&nbsp;移动</button>&nbsp;';
    footer += '&nbsp;&nbsp;&nbsp;&nbsp;';
    footer += '<button class="btn btn-primary" data-id="' + aid + '" data-dismiss="modal">取消</button>';
    $("#"+modiv+" .modal-footer").css('text-align', 'center');
    $("#"+modiv+" .modal-footer").html(footer);
    $("#"+modiv+" .modal-dialog").css('width', '202px');
    $("#"+modiv).modal('show');
    var dates = new Date().getTime() + '_group';
        loading(modiv, dates);
        $.ajax({
            url: '/index.php/Home/Address/get_mygroup',
            success: function (json) {
                json = eval("(" + json + ")");
                if (json.code == "10000") {
                    var cldiv = '<ul style="width:100%;">';
                    for (var i = 0; i < json.res.length; i++) {
                        cldiv += '<li style="width:100%;text-align:left;cursor:pointer;"><div style="padding-left:10px"> <input type="hidden"  name="acid" value="'+json.res[i]['address_class_id']+'">   <i  class="icon-folder-close-alt" style="cursor:pointer"></i> ' + json.res[i]['name'] + '</div></li>';
                    } 
                    if(cl!='alladdress'){
                        cldiv += '<li style="width:100%;text-align:left;cursor:pointer;"><div style="padding-left:10px"> <input type="hidden"   name="acid" value="out">   <i  class="icon-folder-close-alt" style="cursor:pointer"></i>  移出该分组</div></li>';
                    }
                    cldiv += '</ul>';
                    $("#"+modiv+" .modal-body").html(cldiv);
                }
            },
            complete: function () { 
                $("#modeshow_" + dates).remove(); 
            }
        })  
    return false;
} 
function refreshnavs(){
    $.ajax({
        url: '/index.php/Home/Address/reNav',
        data: $("#form_add_group").serialize(),
        type: 'post',
        success: function (json) {
             $("#menulist #usernavs").each(function(index, el) {
                 $(this).remove();
             });
             $("#menulist").prepend(json);
        } 
    })
}
function changetabs(e) {
    $('#content_' + e).siblings().css('display', 'none');
    $('#tabs_' + e).siblings().removeClass('accive');
    $('#tabs_' + e).addClass('accive');
    $('#content_' + e).css('display', 'block');
}
function clickmenu(e, a, b) {
    var is_exists = $('#tabs_title').find('#tabs_' + a).length;
    if (is_exists) {
        changetabs(a);
        return false;
    }
    var html = '';
    var title = '';
    if (a == "group") {
        $.get("/index.php/Home/Address/get_group", function (response, status, xhr) {
            html = response;
            title = '<div class="accive" id="tabs_' + a + '"  onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-sitemap"></i>  分组管理<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span></div>';
            doappend(html, title, a)
        });
    }
 // else if (a == "myaddress") {
 //        $.get("/index.php/Home/Address/get_myaddress", function (response, status, xhr) {
 //            html = response;
 //            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-user"></i>  我的联系人<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
 //            doappend(html, title, a)
 //        });
 //    }
     else if (a == "alladdress") {
        $.get("/index.php/Home/Address/get_alladdress", function (response, status, xhr) {
            html = response;
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-user"></i>  所有联系人<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    } else {
        $.get("/index.php/Home/Address/get_temp?did="+a, function (response, status, xhr) {
            json= eval("("+response+")");
             html = json.html;   
             if(!html){
                $("#tabs_"+ a).remove();
                $("#content"+ a).remove(); 
                return false;
             }
            title = '<div class="" id="tabs_' + a + '" onclick="changetabs(\'' + a + '\')" temp="tabs"><i class="icon-user"></i>  '+json.classname+'<span class="icon-remove" onclick="closetabs(\'' + a + '\')"></span> </div>';
            doappend(html, title, a)
        });
    }

}
function doappend(html, title, a) {
    $("#content_allmainview").append(html);
    $('#tabs_title').append(title);
    changetabs(a);
}
function closetabs(e) {
    $("#content_allmainview").find('#content_' + e).remove();
    $('#tabs_title').find('#tabs_' + e).remove();
    var active = false;
    $('#tabs_title').find('div').each(function (e, div) {
        if ($(div).attr('class') == "accive") {
            active = true;
        } else {
            active = false;
        }
    });
    if (!active) {
        var last = $('#tabs_title').find('div:last');
        last.addClass('accive');
        var did = last.attr('id').split('_')[1];
        if(last.attr('id').split('_')[2]){
            did = did+"_"+last.attr('id').split('_')[2]; 
        }
        $('#content_allmainview').find('#content_' + did).css('display', 'block');
    }
}