<?php
namespace app\index\controller;
use think\Controller;

class Role extends Controller {
	public function index() {
		$this->assign('title', '角色管理');
		$list = db('mc_role')->select();
		$this->assign('list', $list);
		return $this->fetch();
	}
	public function checkName($role_name = '') {
		if (!empty($role_name)) {
			if (db('mc_role')->where("role_name='$role_name'")->find()) {
				return $this->error("角色已经存在");
			} else {
				return $this->success("ok");
			};
		} else {
			return $this->error("参数错误！");
		}
	}
	public function add() {
		$this->assign("title", "新增角色");
		if (input("post.")) {
			$data = input("post.");
			unset($data['id']);
			$data['create_time'] = time();
			try {
				$res = db("mc_role")->insert($data);
			} catch (\Exception $e) {
				return $this->error($e, 'system_error', $data);
				exit;
			}
			if ($res) {
				return $this->success('ok', url("index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			return $this->fetch('edit');
		}
	}
	public function edit($id = 0) {
		$this->assign("title", "新增角色");
		if (input("post.")) {
			$data = input("post.");
			$data['update_time'] = time();
			try {
				$res = db("mc_role")->where(array("id" => $data['id']))->update($data);
			} catch (\Exception $e) {
				return $this->error($e, 'system_error', $data);
				exit;
			}
			if ($res) {
				return $this->success('ok', url("index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			$info = db("mc_role")->find($id);
			$this->assign("info", $info);
			return $this->fetch('edit');
		}
	}
	public function del() {

	}
	public function auth($id) {
		if (!$id) {
			return $this->error("非法操作！");
		}
		if (input("post.")) {

		} else {
			return $this->fetch();
		}

	}
}