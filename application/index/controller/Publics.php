<?php
namespace app\index\controller;
use com\Baseinit;
use think\Controller;
use think\Db;
use think\Request;

class Publics extends Baseinit {
	public function _initialize() {
	}
	public function index() {
		return $this->fetch();
	}
	/**
	 * 后台登陆界面
	 */
	public function login() {
		$img = rand(1, 12);
		$this->assign("img", $img);
		return $this->fetch("user/login_index");
	}

	/**
	 * 登录验证
	 */
	public function doLogin() {
		$name = $this->request->param("username");
		if (empty($name)) {
			return $this->error("用户名不能为空");
		}
		$pass = $this->request->param("password");
		if (empty($pass)) {
			return $this->error("密码不能为空");
		}

		$result = Db::name('user')->where("user_name='$name'")->find();
		if (!empty($result) && $result['user_type'] == 1) {
			if (compare_password($pass, $result['user_password'])) {
				$groups = Db::name('RoleUser')
					->alias("a")
					->join('role b', 'a.role_id =b.id')
					->where(["user_id" => $result["id"], "status" => 1])
					->value("role_id");
				if ($result["id"] != 1 && (empty($groups) || empty($result['user_status']))) {
					return $this->error("用户禁止登陆");
				}
				//登入成功页面跳转
				session('ADMIN_ID', $result["id"]);
				session('user_name', $result["user_name"]);
				session('userinfo', $result);
				$result['last_login_ip'] = get_client_ip(0, true);
				$result['last_login_time'] = time();
				$result['user_logintimes'] = $result['user_logintimes'] + 1;
				$token = generate_user_token($result["id"], 'web');
				if (!empty($token)) {
					session('token', $token);
				}
				Db::name('user')->where(array("id" => $result["id"]))->update($result);
				cookie("admin_username", $name, 3600 * 24 * 30);
				session("__LOGIN_BY_ADMIN_PW__", null);
				return $this->success('登陆成功', url("index/Index/index"));
			} else {
				return $this->error("密码错误");
			}
		} else {
			return $this->error("用户不存在");
		}
	}

	/**
	 * 后台管理员退出
	 */
	public function logout() {
		session('ADMIN_ID', null);
		return redirect(url('/', [], false, true));
	}
}