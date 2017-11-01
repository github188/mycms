<?php 
 header("content-type:text/html;charset=utf-8");
define('APP_DEBUG',True);
define('APP_PATH', './App/');
define('RUNTIME_PATH','./Runtime/');  
require './ThinkPHP/Library/Vendor/QueryList/QueryList.php';
include './ThinkPHP/ThinkPHP.php'; 
