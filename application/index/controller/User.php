<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class User extends Controller {
	public function index() {
		$this->assign('title', "用户管理");
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
}
