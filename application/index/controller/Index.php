<?php
namespace app\index\controller;
use com\Baseinit;
use think\Controller;

class Index extends Baseinit {
	public function index() {
		$this->assign("menus", session("menus"));
		$this->assign('title', '系统室管理');
		return $this->fetch();
	}
}
