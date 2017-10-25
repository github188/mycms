$(function($){
	$("#add_menu_button").on("click",function(){
		location.href='add/id/0.html';
	}); 
	$(".add_menu_submit").on("click",function(){ 
		if($(this).attr("class").indexOf("disabled")>=0){
			return false;
		}
		var title=$("#menu_edit_form [name=title]").val();
	 	var url=$("#menu_edit_form [name=url]").val(); 
	 	if (!title) {
	 		$("#menu_edit_form [name=title]").focus();
	 		$(".title_block").css("color","red");
	 		return false;
	 	}
	 	// if (!url) {
	 	// 	$("#menu_edit_form [name=url]").focus(); 
	 	// 	return false;
	 	// } 
	 	var loading = layer.load(1, {
		  shade: [0.5,'#000'] //0.1透明度的白色背景
		});  
 		$.ajax({
 			url: 'add',
 			type: 'post', 
 			data: $("#menu_edit_form").serialize(),
 			success:function(json){ 
 				layer.close(loading);
 				layer.msg(json.msg,function(){
 					if(json.code==1){
 					 location.href=json.url;
 					}
 				});
 			}
 		}) 
 		.fail(function() {
 			layer.msg("error"); 
 			return false;
 		});
 		$(".add_menu_submit").addClass('disabled');
		return false;
	});
	
});