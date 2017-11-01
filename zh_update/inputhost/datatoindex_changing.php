<?php
error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set("RPC");
header("content-Type: text/html; charset=utf-8");
session_start();
if (!$_SESSION['username']||$_SESSION["act"] != "inputhost") {
    header('location:index.php');
    exit();
}  
    $indexdata = fopen("data/data.txt", "r");
    $ii = 0;
    $dataarr = "";
    $data2 = "subcat = new Array();" . "\r\n";
    if ($indexdata) {
        while (($datainfo = fgets($indexdata)) != FALSE) {
            if ($datainfo == "" || $datainfo == null)
                continue;
            $dataarr = explode(",", trim($datainfo));
            $data2 .= 'subcat[' . $ii . ']= new Array("' .   $dataarr[0]  . '","' . $dataarr[1] . '","' . $dataarr[2] . '","' . $dataarr[3] . '","' . $dataarr[4] . '","' . $dataarr[5] . '");' . "\r\n";
            $ii = $ii + 1;
        }
    }
    $data2 .="//end"; 
    $url11 = "../index.html";
    if (!file_exists("log/" . date('Ym') . "/")) {
        mkdir("log/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/index/" . date('Ym') . "/")) {
        mkdir("backups/index/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/data/" . date('Ym') . "/")) {
        mkdir("backups/data/" . date('Ym') . "/", 777);
    }
    copy($url11, "backups/index/" . date('Ym') . "/" . date('YmdHis') . "-index.html");
    $handle11 = fopen($url11, "r") or die("10001");
    $contindex11 = fread($handle11, filesize($url11));
    fclose($handle11); 
    $newcont = preg_replace("/subcat = new Array().+\/\/end/is", $data2, $contindex11);
    $uphtml = fopen("../index.html", "w") or die("10001");
    $writehtml = fwrite($uphtml, $newcont);
    if ($writehtml) { 
        $txtcont="";
        $txtcont .= "用户：" . $_SESSION["username"] . "\r\n" . "时间：" . date("Y-m-d H:i:s") . "\r\n" . "操作：从data.txt把数据更新到index.html";
        $txtcont .="\r\n" . "----------------------------------------------------------------" . "\r\n"; 
        $newlogtxt = fopen("log/" . date('Ym') . "/" . date('Ymd') . ".log", 'a');
        fwrite($newlogtxt, $txtcont);
        echo "更新成功  共".$ii."条数据"."<br><br>"; 
        $writetxt = fwrite($newlogtxt, $txtcont); 
        }