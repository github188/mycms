$(function($){ 
	 $("#user_add_button").on("click",function(){ 
 		window.location.href="addUserPage";
	});
	 /*
	 验证用户名是否存在
	  */
	function check_user(){
		var username = $("#user_add_form [name=username]").val();
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
	 					$(".username_block").parent().find('i,.text-red').remove();
	 					$(".username_block").parent().append('<span class="text-red">该用户名已经被使用</span><i class="fa fa-close text-red"></i>');
	 					$("#user_add_form [name=username]").focus();
	 					return false;
	 				}else{
	 					$(".username_block").parent().find('i,.text-red').remove();
	 					$(".username_block").parent().append('<i class="fa fa-check text-green"></i>');
	 					return true;
	 				}
	 			}else{
	 				layer.msg('参数错误！', {icon: 2});
	 				return false;
	 			}
	 		}
	 	}) 
	}
	$("#user_add_form [name=username]").on("blur",function(){
		check_user(); 
	});
	/*
	判断密码是否一致
	 */
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
	 	// var username=$("#user_add_form [name=username]").val();
	 	// var password=$("#user_add_form [name=password]").val();
	 	// var repassword=$("#user_add_form [name=repassword]").val();
	 	// var email=$("#user_add_form [name=email]").val();
	 	// if (!username) {
	 	// 	$("#user_add_form [name=username]").focus();
	 	// 	$(".username_block").css("color","red");
	 	// 	return false;
	 	// }
	 	// check_user(); 
	 	// if (!password) {
	 	// 	$("#user_add_form [name=password]").focus();
	 	// 	return false;
	 	// }
	 	// if (!repassword) {
	 	// 	$("#user_add_form [name=repassword]").focus();
	 	// 	return false;
	 	// }
	 	// if(password!==repassword){
	 	// 	layer.msg('两次密码输入不一致', {icon: 2});
	 	// 	return false;
	 	// }
	 	// if(email){
	 	// 	var emreg=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,8})+$/;
	 	// 	if(!emreg.test(email)){
	 	// 		$(".email_block").parent().find('i').remove();
	 	// 		$(".email_block").parent().append('<span class="text-red">邮箱格式不正确</span> <i class="fa fa-close text-red"></i>');
	 	// 		return false;
	 	// 	};
	 	// 	$(".email_block").parent().find('i,.text-red').remove();
	 	// 	$(".email_block").parent().append('<i class="fa fa-check text-green"></i>');
	 	// }
	 	var loading = layer.load(1, {
		  shade: [0.5,'#fff'] //0.1透明度的白色背景
		});
		return false;
 		$.ajax({
 			url: 'doAddUser',
 			type: 'post', 
 			data: $("#user_add_form").serialize(),
 			success:function(json){
 				var json=eval("("+json+")");
 				layer.close(loading);
 				layer.msg(json.msg,function(){
 					 location.href="index";
 				});
 			}
 		}) 
 		.fail(function() {
 			layer.msg("error"); 
 			return false;
 		});
 		$(".user_add_submit").addClass('disabled');
 		return false;
	});
	
});