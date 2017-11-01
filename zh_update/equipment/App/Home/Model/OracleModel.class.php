<?php
namespace Home\Model;
use Think\Model;
use Think\Orcl;
class Orcl extends Model(){
    protected $connect=array(
      'DB_TYPE' => 'oracle', // 数据库类型
     'DB_HOST' => 'localhost', // 服务器地址
     'DB_NAME' => 'ORCL', // 数据库名
     'DB_USER' => 'hxb', // 用户名
     'DB_PWD' => 'HXB1234hxb@orcl', // 密码
     'DB_PORT' => '1521', // 端口
        );
}
