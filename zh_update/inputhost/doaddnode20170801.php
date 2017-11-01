<?php

error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set("RPC");
session_start();
if (!$_SESSION['username']||$_SESSION["act"] != "inputhost") {
    header('location:index.php');
    exit();
}
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
if ($_POST) {
    $arrurl = array(
        "0" => "../index.html"
    );
    $allnum = count($_POST['nodename']);
    $indexdata = fopen("data/data.txt", "r");
    $ii = 0;
    $dataarr = "";
    $data2 = "subcat = new Array();" . "\r\n";
    if ($indexdata) {
        while (($datainfo = fgets($indexdata)) != FALSE) {
            if ($datainfo == "" || $datainfo == null)
                continue;
            $dataarr = explode(",", trim($datainfo));
            $data2 .= 'subcat[' . $ii . ']= new Array("' . $dataarr[0] . '","' . $dataarr[1] . '","' . $dataarr[2] . '","' . $dataarr[3] . '","' . $dataarr[4] . '","' . $dataarr[5] . '");' . "\r\n";
            $ii = $ii + 1;
        }
    }
    //start new
    $url11 = "../index.html";
    $handle11 = fopen($url11, "r") or die("10001");
    $contindex11 = fread($handle11, filesize($url11));
    fclose($handle11);
    preg_match_all("/subcat = new Array().+\/\/end/is", $contindex11, $contind11);
    $data111 = $contind11[0][0];
    preg_match_all("/\(\"(.*)\"\);/", $data111, $strdata11);
//echo count($strdata11[1]);
  
//end new
    $temp = "";
    $keyid_a = $ii - 1;
    $txtcont = "";
    $dataadd = "";
    for ($i_a = 0; $i_a < $allnum; $i_a++) {
        $keyid_a = $keyid_a + 1;
        if ($_POST['applist'][$i_a]) {
            $appid = 0;
            $apptrue = "";
            $p = "";
            foreach ($_POST['applist'][$i_a] as $k => $v) {
                $appid = $appid + $v;
                $apptrue .=$p . $apparr[$v];
                $p = ",";
            }
        } else {
            $appid = "";
        }
        $temp .='subcat[' . $keyid_a . ']= new Array("' . $_POST['nodename'][$i_a] . '","' . $_POST['location_id'][$i_a] . '","' . $_POST['server_id'][$i_a] . '","' . trim($_POST['hostname'][$i_a]) . '","' . $_POST['os_type'][$i_a] . '","' . $appid . '");' . "\r\n";
        $sharedata .= "系统名称：" . $_POST['nodename'][$i_a] . "\r\n" . "所在地：" . $locationarr[$_POST['location_id'][$i_a]] . "\r\n" . "SERVICEID:" . $_POST['server_id'][$i_a] . "\r\n" . "主机名：" . $_POST['hostname'][$i_a] . "\r\n" . "操作系统：" . $osarr[$_POST['os_type'][$i_a]] . "\r\n" . "应用：" . $apptrue;
        $dataadd .= "\r\n" . $_POST['nodename'][$i_a] . "," . $_POST['location_id'][$i_a] . "," . $_POST['server_id'][$i_a] . "," . $_POST['hostname'][$i_a] . "," . $_POST['os_type'][$i_a] . "," . $appid;
        $txtcont .= "用户：" . $_SESSION["username"] . "\r\n" . "时间：" . date("Y-m-d H:i:s") . "\r\n" . $sharedata;
        $txtcont .="\r\n" . "----------------------------------------------------------------" . "\r\n";
    }
    $data2 .=$temp . "\r\n";
    $data2 .="//end";
    $handle = fopen($arrurl[0], "r") or die("10001");
    $contindex = fread($handle, filesize($arrurl[0]));
    $newcont = preg_replace("/subcat = new Array().+\/\/end/is", $data2, $contindex);
    fclose($handle);
    if (!file_exists("log/" . date('Ym') . "/")) {
        mkdir("log/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/index/" . date('Ym') . "/")) {
        mkdir("backups/index/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/data/" . date('Ym') . "/")) {
        mkdir("backups/data/" . date('Ym') . "/", 777);
    }
    copy($arrurl[0], "backups/index/" . date('Ym') . "/" . date('YmdHis') . "-index.html");
    $uphtml = fopen($arrurl[0], "w") or die("10001");
    $writehtml = fwrite($uphtml, $newcont);
    fclose($uphtml);
    if ($writehtml) {
        $newlogtxt = fopen("log/" . date('Ym') . "/" . date('Ymd') . ".log", 'a');

        for ($kk = 0; $kk < $allnum; $kk++) {
            
        }

//        $sharedata .= "系统名称：" . $_POST['nodename'][$i_a] . "\r\n" . "所在地：" . $locationarr[$_POST['location_id'][$i_a]] . "\r\n" . "SERVICEID:" . $_POST['server_id'][$i_a] . "\r\n" . "主机名：" . $_POST['hostname'][$i_a] . "\r\n" . "操作系统：" . $osarr[$_POST['os_type'][$i_a]] . "\r\n" . "应用：" . $apptrue;
//        $dataadd .= $_POST['nodename'][$i_a] . "," . $_POST['location_id'][$i_a] . "," . $_POST['server_id'][$i_a] . "," . $_POST['hostname'][$i_a] . "," . $_POST['os_type'][$i_a] . "," . $appid;

        $writetxt = fwrite($newlogtxt, $txtcont);
        copy("data/data.txt", "backups/data/" . date('Ym') . "/" . date('YmdHis') . "-data.txt");
        $dataopen = fopen("data/data.txt", 'a');
        $writedata = fwrite($dataopen, $dataadd);
        fclose($dataopen);
        fclose($newlogtxt);
        echo json_encode(array("code" => 10000, "message" => "添加成功"));
    } else {
        echo json_encode(array("code" => 10001, "message" => "写入失败"));
    }
} else {
    echo json_encode(array("code" => 10002, "message" => "参数错误"));
}
