<?php
namespace app\index\model;
use think\Model;

class Hxtong extends Model {
	protected $connection = [
		'type' => 'MYSQL',
		'hostname' => '127.0.0.1',
		'username' => 'root',
		'password' => '123qwe',
		'database' => 'hxtong',
		'hostport' => '3400',
		'charset' => 'utf8',
		'params' => [],
		'prefix' => '',
	];
}