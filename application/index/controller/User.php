<?php
namespace app\index\controller;
use app\index\model\Menu;
use com\Baseinit;
use think\Controller;
use think\Db;
use think\Db\Query;

class User extends Baseinit {
	public function index() {
		$this->assign('title', "用户管理");
		$menuModel = new Menu();
		$menus = $menuModel->menuTree();
		$this->assign("menus", $menus);
		$sql = "select id,user_name,user_nickname,last_login_time,user_status,user_logintimes from mc_user";
		$db_user = new Query();
		$res = $db_user->query($sql);
		$this->assign("users", $res);
		$this->assign('user_index', "active");

		return $this->fetch('user/index');
	}
	public function addUserPage() {
		$roles = DB::name('role')->where(['status' => 1])->order("id DESC")->select();
		$this->assign("roles", $roles);
		return $this->fetch('user/add');
	}
	public function checkUserName() {
		if ($_GET['username']) {
			$username = $_GET['username'];
			$where = "user_name='$username'";
			if ($_GET['id']) {
				$where .= " and id !='" . $_GET['id'] . "' ";
			}
			$res = db("user")->where($where)->count();
			echo json_encode(array("statu" => 'ok', "msg" => $res));
			exit;
		} else {
			parameterErr();
		}
	}
	public function addPost() {
		if (request()->isPost()) {
			$password = $_POST['user_password'];
			$repassword = $_POST['repassword'];
			if ($password !== $repassword) {
				echo json_encode(array("statu" => 'err', "msg" => "密码不一致！"));
				exit;
			}
			$role_id = $_POST['role_id'];
			unset($_POST['role_id']);
			unset($_POST['id']);
			unset($_POST['repassword']);
			$db = db('user');
			$data = $_POST;
			$data['user_password'] = md5(md5($_POST['password']) . "zzh");
			$data['create_time'] = time();
			$res = $db->insertGetId($data);
			if ($res !== false) {
				Db::name('RoleUser')->insert(["role_id" => $role_id, "user_id" => $res]);
				return $this->success('添加成功', url("User/index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			parameterErr();
		}
	}
	/*
		changeUserStatus 修改用户状态
	*/
	public function changeUserStatus() {
		if (request()->isGet()) {
			$status = $_GET['status'];
			$userid = $_GET['userid'];
			if (!($userid && db("user")->find($userid))) {
				echo json_encode(array("statu" => 'err', "msg" => "用户ID错误"));
				exit;
			}
			if (db("user")->where("id='$userid'")->update(array("user_status" => $status))) {
				if ($status == '0') {
					echo json_encode(array("statu" => 'ok', "msg" => "禁用"));
				} else {
					echo json_encode(array("statu" => 'ok', "msg" => "启用"));
				}
			} else {
				echo json_encode(array("statu" => 'err', "msg" => "请重试！"));
			}

		} else {
			parameterErr();
		}
	}
	/*
		del 删除用户
	*/
	public function del($id = 0) {
		//获取用户信息
		$find = $this->getUserinfo($id);
		if ($userinfo['user_name'] === 'admin') {
			return $this->error($errormsg ? $errormsg : '超级用户不能删除！');
		} else if ($find["user_name"] === session("username")) {
			return $this->error($errormsg ? $errormsg : '不能删除自己！');
		} else {
			if (db('user')->where(array('id' => $id))->delete()) {
				Db::name("RoleUser")->where(["user_id" => $id])->delete();
				return $this->success('删除用户成功！');
			} else {
				$this->error("删除失败！");
			}
		}
	}
	/**
	 * 获取用户信息
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-24T10:35:19+0800
	 * @param  $uid 用户ID
	 * @return array 用户信息
	 */
	public function getUserinfo($uid = 0) {
		$uid = $uid ? $uid : input('id');
		$uid = $uid ? $uid : 0;
		$map = array(
			'id' => $uid,
		);
		$list = db('user')->where($map)->find();
		if (!$list) {
			return $this->error($errormsg ? $errormsg : '不存在此用户！');
		}
		return $list;
	}
	/**
	 * 管理员编辑
	 * @adminMenu(
	 *     'name'   => '管理员编辑',
	 *     'parent' => 'index',
	 *     'display'=> false,
	 *     'hasView'=> true,
	 *     'order'  => 10000,
	 *     'icon'   => '',
	 *     'remark' => '管理员编辑',
	 *     'param'  => ''
	 * )
	 */
	public function edit($id) {
		$roles = DB::name('role')->where(['status' => 1])->order("id DESC")->select();
		$this->assign("roles", $roles);
		$role_ids = DB::name('RoleUser')->where(["user_id" => $id])->column("role_id");
		$this->assign("role_ids", $role_ids);

		$user = DB::name('user')->where(["id" => $id])->find();
		$this->assign("info", $user);
		return $this->fetch("user/add");
	}
	/**
	 * 管理员编辑提交
	 * @adminMenu(
	 *     'name'   => '管理员编辑提交',
	 *     'parent' => 'index',
	 *     'display'=> false,
	 *     'hasView'=> false,
	 *     'order'  => 10000,
	 *     'icon'   => '',
	 *     'remark' => '管理员编辑提交',
	 *     'param'  => ''
	 * )
	 */
	public function editPost() {
		if (input("post.")) {
			if (!empty($_POST['role_id']) && $_POST['role_id']) {
				if (empty($_POST['user_password'])) {
					unset($_POST['user_password']);
				} else {
					$_POST['user_password'] = md5_password($_POST['user_password']);
				}
				$role_id = $_POST['role_id'];
				unset($_POST['role_id']);
				unset($_POST['repassword']);
				$uid = $_POST['id'];
				$result = DB::name('user')->where("id='$uid'")->update($_POST);
				if ($result !== false) {
					$uid = $this->request->param('id', 0, 'intval');
					DB::name("RoleUser")->where(["user_id" => $uid])->delete();
					DB::name("RoleUser")->insert(["role_id" => $role_id, "user_id" => $uid]);
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error("请为此用户指定角色！");
			}

		}
	}
	/**
	 * 修改角色授权页面
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-30T10:05:47+0800
	 */
	public function auth($id) {
		$roles = Db::name("role")->where(['status' => 1])->field("id,role_name,description")->select();
		$rule = Db::name("RoleUser")->where("user_id='$id'")->find();
		$this->assign("rule", $rule);
		$this->assign("roles", $roles);
		return $this->fetch();
	}
	/**
	 * 执行修改角色授权
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-30T10:04:50+0800
	 */
	public function authPost($id) {
		return $this->success("保存成功！");
	}
}
