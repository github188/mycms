<?php
namespace app\index\controller;
use think\Controller;
use think\Url;

class User extends Controller {
	public function __construct() {
		url::root('/index.php');
	}
	public function index() {
		return "user";
	}
	public function role() {
		return "role	";
	}
	public function permission() {
		return "permission";
	}
}
