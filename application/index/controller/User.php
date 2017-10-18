<?php
namespace app\index\controller;
use think\Controller;

class User extends Controller {
	public function index() {
		return $this->fetch('user/index');
	}
	public function role() {
		return "role	";
	}
	public function permission() {
		return "permission";
	}
}
