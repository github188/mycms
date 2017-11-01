<?php
/*
最后编辑时间：2017-08-02
@by zhh
*/ 
error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set("RPC");
session_start();
// if (!$_SESSION['username']||$_SESSION["act"] != "inputhost") {
//     header('location:index.php');
//     exit();
// }
$locationarr[2] = "西三旗";
$locationarr[3] = "亦庄中金";
$locationarr[7] = "东单 ";
$osarr[1] = "AIX";
$osarr[2] = "Solaris";
$osarr[4] = "Windows";
$osarr[8] = "Linux";
$apparr[1] = "MQ";
$apparr[2] = "WAS";
$apparr[4] = "Oracle";
$apparr[8] = "TongEASY";
$apparr[16] = "Informix";
$apparr[32] = "CV";
$apparr[64] = "GTP";

if($_POST){
    $new_nums = count($_POST['nodename']);
    if (!file_exists("log/" . date('Ym') . "/")) {
        mkdir("log/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/index/" . date('Ym') . "/")) {
        mkdir("backups/index/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/data/" . date('Ym') . "/")) {
        mkdir("backups/data/" . date('Ym') . "/", 777);
    }
    $old_index = "../index.html";
    $index_handle = fopen($old_index, "r") or die("10001");
    $old_index_content = fread($index_handle, filesize($old_index));
    fclose($index_handle);
    preg_match_all("/subcat = new Array().+\/\/end/is", $old_index_content, $old_index_matchs);//index.html中的数据
    $old_index_lists = $old_index_matchs[0][0];
    preg_match_all("/\(\"(.*)\"\);/", $old_index_lists, $old_index_datalists);// index.html中的数据数组
    // echo "<pr>";
    // var_dump($old_index_lists);
    $old_nums = count($old_index_datalists[1]);   
    $new_add_list = "";
    $arrayid = $old_nums - 1;
    $txtcont = "";
    $new_into_data = "";
    for ($i = 0; $i < $new_nums; $i++) {
        $arrayid = $arrayid + 1;
        if ($_POST['applist'][$i]) {
            $appid = 0;
            $apptrue = "";
            $p = "";
            foreach ($_POST['applist'][$i] as $k => $v) {
                $appid = $appid + $v;
                $apptrue .=$p . $apparr[$v];
                $p = ",";
            }
        } else {
            $appid = "";
        }
        $new_add_list .='subcat[' . $arrayid . ']= new Array("' . $_POST['nodename'][$i] . '","' . $_POST['location_id'][$i] . '","' . $_POST['server_id'][$i] . '","' . trim($_POST['hostname'][$i]) . '","' . $_POST['os_type'][$i] . '","' . $appid . '");' . "\r\n";
        $sharedata .= "系统名称：" . $_POST['nodename'][$i_a] . "\r\n" . "所在地：" . $locationarr[$_POST['location_id'][$i_a]] . "\r\n" . "SERVICEID:" . $_POST['server_id'][$i_a] . "\r\n" . "主机名：" . $_POST['hostname'][$i_a] . "\r\n" . "操作系统：" . $osarr[$_POST['os_type'][$i_a]] . "\r\n" . "应用：" . $apptrue;
        $new_into_data .= $_POST['nodename'][$i] . "," . $_POST['location_id'][$i] . "," . $_POST['server_id'][$i] . "," . $_POST['hostname'][$i] . "," . $_POST['os_type'][$i] . "," . $appid. "\r\n";
        $txtcont .= "用户：" . $_SESSION["username"] . "\r\n" . "时间：" . date("Y-m-d H:i:s") . "\r\n" . $sharedata;
        $txtcont .="\r\n" . "----------------------------------------------------------------" . "\r\n";
    }
    $into_data_all = '';
    foreach($old_index_datalists[1] as $ov){
        $ovl = explode(',',$ov);
        $templn = $m ='';
        foreach($ovl as $cols){ 
            $templn .=$m . trim($cols,'\"');
            $m = ",";
        }
        $into_data_all .=$templn."\r\n";
    } 
    $into_data_all =$into_data_all.$new_into_data;
    $all_new_index_data = str_replace("//end","",$old_index_lists).$new_add_list."//end";  
    //------------重写和备份index----//
    copy($old_index, "backups/index/" . date('Ym') . "/" . date('YmdHis') . "-index.html"); //---------copy index.html 
    $indexh = fopen($old_index, "w+") or die("10001"); 
    $newcont = preg_replace("/subcat = new Array().+\/\/end/is", $all_new_index_data, $old_index_content);
    $update_index = fwrite($indexh, $newcont);
    fclose($indexh);
    if($update_index){
        //-----重写和备份data----//
        copy("data/data.txt", "backups/data/" . date('Ym') . "/" . date('YmdHis') . "-data.txt");
        $dataopen = fopen("data/data.txt", 'w+');
        $writedata = fwrite($dataopen, $into_data_all);
        fclose($dataopen);
        //-----写如日志----//
        $newlogtxt = fopen("log/" . date('Ym') . "/" . date('Ymd') . ".log", 'a');
        fwrite($newlogtxt, $txtcont);
        fclose($newlogtxt);
        echo json_encode(array("code" => 10000, "message" => "添加成功"));        
    }else {
        echo json_encode(array("code" => 10001, "message" => "写入失败"));
    }

}  else {
    echo json_encode(array("code" => 10002, "message" => "参数错误"));
} 
 
    
