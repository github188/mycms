$(function($){ 
	 $("#user_add_button").on("click",function(){ 
 		window.location.href="addUserPage";
	});
	 /*
	 验证用户名是否存在
	  */
	$("#user_add_form [name=username]").on("blur",function(){
		var username = $(this).val();
		if (!username) {
	 		$("#user_add_form [name=username]").focus();
	 		$(".username_block").css("color","red");
	 		return false;
	 	} 
	 	var reg = /^[0-9A-Za-z]+$/;
	 	if(!reg.test(username)){ 
	 		layer.msg("用户名请使用字母/数字/字母数字组合！");
	 		$(".username_block").parent().find('i').remove();
	 		$(".username_block").parent().append('<i class="fa fa-close text-red"></i>'); 
	 		return false;
	 	};
	 	$.ajax({
	 		url: 'checkUserName?username='+username,
	 		type: 'POST',
	 		success:function(json){
	 			var json=eval("("+json+")");
	 			if(json.statu){
	 				if(json.msg){
	 					layer.msg('参数错误！', {icon: 2});
	 				}else{
	 					$(".username_block").parent().find('i').remove();
	 					$(".username_block").parent().append('<i class="fa fa-check text-green"></i>');
	 				}
	 			}else{
	 				layer.msg('参数错误！', {icon: 2});
	 			}
	 		}
	 	}) 
	 	 
	});
$("[type=password]").each(function() {
	$(this).on("blur",function() {
		var which = 'password';
		var tv = $(this).val();
		var otv = '';
		if (tv) {
			if ($(this).attr('name') == which) {
				otv = $('[name=repassword]').val();
			} else {
				otv = $('[name=password]').val();
				which = 'repassword';
			} 
			if (!otv) {
				$("." + which + "_block").parent().append('<i class="fa fa-check text-green"></i>');
				return false;
			} 
			if (tv !== otv) { 
				$(".repassword_block").parent().find('.passworderr,i').remove(); 
				$(".repassword_block").parent().append('<span class="passworderr text-red">两次密码输入不一致<span><i class="fa fa-close text-red"></i>');
				return false;
			} else {
				$(".repassword_block").parent().find('.passworderr,i').remove();
				$(".repassword_block").parent().append('<i class="fa fa-check text-green"></i>');
				return false;
			}
		};
	});
});
	/*
	添加用户提交操作
	 */
	 $(".user_add_submit").on("click",function(){ 
	 	var username=$("#user_add_form [name=username]").val();
	 	var password=$("#user_add_form [name=password]").val();
	 	var repassword=$("#user_add_form [name=repassword]").val();
	 	var email=$("#user_add_form [name=email]").val();
	 	if (!username) {
	 		$("#user_add_form [name=username]").focus();
	 		$(".username_block").css("color","red");
	 		return false;
	 	}
	 	if (!password) {
	 		$("#user_add_form [name=password]").focus();
	 		return false;
	 	}
	 	if (!repassword) {
	 		$("#user_add_form [name=repassword]").focus();
	 		return false;
	 	}
	 	if(password!==repassword){
	 		layer.msg('两次密码输入不一致', {icon: 2});
	 		return false;
	 	}
	 	if(email){
	 		var emreg=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,8})+$/;
	 		if(!emreg.test(email)){
	 			$(".repassword_block").parent().find('i').remove();
	 			$(".repassword_block").parent().append('<i class="fa fa-check text-green"></i>');
	 			return false;
	 		};
	 	}
 		console.log("addUserPage");
 		return false;
	});
	
});