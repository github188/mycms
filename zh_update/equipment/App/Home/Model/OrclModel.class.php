<?php

namespace Home\Model;

use Think\Model;
use Think\Orcl;

class Orcl extends Model {

    protected $connect = array(
        'DB_TYPE' => 'oracle', // 数据库类型
        'DB_HOST' => '192.168.2.9', // 服务器地址
        'DB_NAME' => 'gtpsys', // 数据库名
        'DB_USER' => 'gtpsys', // 用户名
        'DB_PWD' => 'zzh', // 密码
        'DB_PORT' => '1521', // 端口
    );

}
