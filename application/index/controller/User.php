<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Db\Query;
class User extends Controller {
	public function index() { 
		$this->assign('title', "用户管理");
		$sql = "select user_name,user_nickname,last_login_time,from_unixtime(create_time) as create_time,user_logintimes from mc_user";
		$db_user = new Query();
		$res = $db_user->query($sql);
		$this->assign("users",$res);
		$this->assign('user_index', "active");

		return $this->fetch('user/index');
	}
	public function role() {
		$this->assign('user_role', "active");
		return $this->fetch('user/role');
	}
	public function permission() {
		$this->assign('user_permission', "active");
		return $this->fetch('user/permission');
	}
	public function addUserPage(){
		return $this->fetch('user/add');
	}
	public function checkUserName(){
		if($_GET['username']){
			$username = $_GET['username'];
			$res=db("mc_user")->where("user_name='$username'")->count();
			echo json_encode(array("statu"=>1,"msg"=>$res));
			exit;
		}else{
			 parameterErr();
		}
	}
	public function doAddUser(){  
		if(request()->isPost()){
			$db=db('mc_user');
			$data['user_name'] = $_POST['username'];
			$data['user_nickname'] = $_POST['user_nick_name'];
			$data['user_email'] = $_POST['email'];
			$data['user_password'] = md5($_POST['password']);
			$data['create_time'] = time();
			$password = $_POST['password'];
			$repassword = $_POST['repassword'];
			$is_exit=$db->where("user_name='$username'")->count();
			if($password!==$repassword){
				echo json_encode(array("statu"=>0,"msg"=>"密码不一致！"));
				exit;
			} 
			$res = $db->insert($data); 
			if($res){
				echo json_encode(array("statu"=>"ok","msg"=>"添加成功！"));
			}else{
				echo json_encode(array("statu"=>0,"msg"=>"数据库繁忙！"));
			}
		}else{  
			 parameterErr();
		}
	}
	public function test(){
		echo strtotime(date("Y-m-d H:i:s",time())); 
	}
}
