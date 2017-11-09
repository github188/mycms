<?php
namespace app\index\model;
use think\Model;

class Hxgtp extends Model {
	protected $connection = [
		'type' => 'MYSQL',
		'hostname' => '127.0.0.1',
		'username' => 'root',
		'password' => '123qwe',
		'database' => 'hxgtp',
		'hostport' => '3400',
		'charset' => 'utf8',
		'prefix' => '',
	];
}