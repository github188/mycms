<?php
namespace app\index\Controller;
use think\Controller;

class Auth extends Controller {
	public function index() {
		return $this->fetch();
	}
	public function add() {
		$this->assign("title", "新增节点");
		if (input("post.")) {
			$data = input("post.");
			unset($data['id']);
			$data['create_time'] = time();
			try {
				$res = db("role")->insert($data);
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
	public function grant() {

	}
	public function del() {

	}
}