<?php
namespace app\index\controller;
use think\Controller;

class User extends Controller {
	public function index() {
		return "user";
	}
	public function role() {
		return "role";
	}
	public function permission() {
		return "permission";
	}
}
