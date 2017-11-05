<?php 
 header("content-type:text/html;charset=utf-8");
define('APP_DEBUG',True);
define('APP_PATH', './App/');
define('RUNTIME_PATH','./Runtime/');  
//加上下面这一句话，用于自动加载QueryList 
require '../mycms/ThinkPHP/ThinkPHP.php'; 