$(function($){ 
	$("#user_add_button").on("click",function(){
		layer.open({
          type: 2,
          area: ['700px', '450px'],
          title:'添加用户',
          fixed: false, //不固定
          maxmin: true,
          content: 'addUserPage'
        });
	});
});