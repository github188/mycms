<?php
namespace app\common\validate;

use think\Validate;

class User extends Validate {
	protected $rule = [
		'user_name' => 'require|unique:user,user_name',
		'user_password' => 'require',
	];
	protected $message = [
		'user_name.require' => '用户不能为空',
		'user_name.unique' => '用户名已存在',
		'user_password.require' => '密码不能为空',
	];

	protected $scene = [
		'add' => ['user_name', 'user_password'],
		'edit' => ['user_name', 'user_email'],
	];
}