<?php
namespace app\index\controller;
use think\Controller;

class Role extends Controller {
	public function index() {
		$this->assign('title', '角色管理');
		return $this->fetch();
	}
}