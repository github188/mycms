<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Db\Query;
class User extends Controller {
	public function index() { 
		$this->assign('title', "用户管理");
		$sql = "select id,user_name,user_nickname,last_login_time,user_status,user_logintimes from mc_user";
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
			echo json_encode(array("statu"=>'ok',"msg"=>$res));
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
				echo json_encode(array("statu"=>'err',"msg"=>"密码不一致！"));
				exit;
			} 
			$res = $db->insert($data); 
			if($res){
				echo json_encode(array("statu"=>"ok","msg"=>"添加成功！"));
			}else{
				echo json_encode(array("statu"=>'err',"msg"=>"数据库繁忙！"));
			}
		}else{  
			 parameterErr();
		}
	}
	/*
	changeUserStatus 修改用户状态
	 */
	public function changeUserStatus(){
		if(request()->isGet()){
			$status = $_GET['status'];
			$userid = $_GET['userid'];
			if(!($userid&&db("mc_user")->find($userid))){
				echo json_encode(array("statu"=>'err',"msg"=>"用户ID错误"));
				exit;
			}
			if(db("mc_user")->where("id='$userid'")->update(array("user_status"=>$status))){
				if($status=='0'){
					echo json_encode(array("statu"=>'ok',"msg"=>"禁用"));
				}else{
					echo json_encode(array("statu"=>'ok',"msg"=>"启用"));
				}
			}else{
				echo json_encode(array("statu"=>'err',"msg"=>"请重试！"));
			}
			
		}else{
			parameterErr();
		}
	}
	/*
	del 删除用户
	 */
	public function del($id=0){
		//获取用户信息
		$find = $this->getUserinfo($id);  
		if($userinfo['user_name']==='admin'){
			return $this->error($errormsg ? $errormsg : '超级用户不能删除！');
		}else if($find["user_name"]===session("username")){
			return $this->error($errormsg ? $errormsg : '不能删除自己！');
		}else{
			db('mc_user')->where(array('id' => $id))->delete();
			return $this->success('删除用户成功！');
		}; 
	}
	/**
	 * 获取用户信息
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-24T10:35:19+0800
	 * @param  $uid 用户ID
	 * @return array 用户信息
	 */
	public function getUserinfo($uid=0){
		$uid  = $uid ? $uid : input('id'); 
		$uid  = $uid ? $uid : 0;
		$map=array( 
			'id'=>$uid
		);
		$list = db('mc_user')->where($map)->find(); 
		if(!$list){
			return $this->error($errormsg ? $errormsg : '不存在此用户！');
		}
		return $list;
	}
	/**
	 * [test description]
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-24T10:34:55+0800
	 * @return [type]                   [description]
	 */
	public function test(){
		echo strtotime(date("Y-m-d H:i:s",time())); 
	}
}
