<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller {

    function __construct() {
        parent::__construct();
         
    }


    function index() {
        $this->display('equipment/index');
    }



    //将监控数据从txt文件更新数据到MySql
    function inputMonitor() {
        ob_end_clean();
        ob_implicit_flush(1);
        $db = M("equipment_monitor");
        $keys = array('serialnumber', 'hostname', 'model', 'manufacturername', 'hx_appname', 'hx_businessip', 'hx_otherip', 'hx_room', 'hx_systemenvironment');
        $monitir_file = "F:/shebinfo/";
        $minfo = fopen($monitir_file, 'r') or exit("Unable to open file!");
        $all_num = $ok_num = 0;
        while (!feof($minfo)) {
            $div = '';
            $line = fgets($minfo);
            $line_arr = explode("#", $line);
            $serialnumber = trim(iconv("GBK", "UTF-8", $line_arr[0]));
            if ((count($line_arr) < 9) || ($serialnumber == ' ') || (!$serialnumber)) {
                continue;
            }
            $is_exist = $db->where("serialnumber='$serialnumber'")->find();
            if ($is_exist) {
                $div .= "exist<br>";
                continue;
            } else {
                $i = 0;
                $data = array();
                foreach ($line_arr as $key => $value) {
                    $data[$keys[$key]] = trim(iconv("GBK", "UTF-8", $value));
                }
                if ($db->add($data)) {
                    $div .= "ok<br>";
                    $ok_num++;
                }else{
                    echo "oo";
                }
            }
            $all_num++;
            $div .= $serialnumber . "<br>" . $ok_num . "--" . $all_num . "<hr>";
            echo $div;

            ob_end_flush();
            ob_flush();
            flush();
        }
        fclose($minfo);
    }
    
}
