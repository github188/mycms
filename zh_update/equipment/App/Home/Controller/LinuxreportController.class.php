<?php
namespace Home\Controller;
use  Think\Controller;
use QL\QueryList;
class LinuxreportController extends Controller{
    function index(){
        header("Content-Type:text/html;charset=utf-8");
        //require './ThinkPHP/Library/Vendor/QueryList/QueryList.php';
        $index_file ='F:/wamp/www/report/linuxreport/index.html';
        if(file_exists($index_file)){
            $indexcont =  file_get_contents("compress.zlib://".$index_file);
            $reg = '/^Cluster(.*)<hr$/';
            preg_match_all($reg,$txt,$matcharr);
            $exp = explode("#",$indexcont);
            $all = array();
            foreach ($exp as $key => $value) {
                $all[$key] = $value;
                // $all[$key] = iconv("gb2312","utf-8",str_replace("0000","",$value));
                //$all[$key] =mb_convert_encoding(str_replace("ff0000?","",$value),"BIG5","utf-8");
            }
            dump($all);
            // dump($matcharr);
            // dump($indexcont);
        }  
    }
}