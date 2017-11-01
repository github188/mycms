<?php
error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set("Asia/Shanghai");
header("content-Type: text/html; charset=utf-8");
session_start();
if (!$_SESSION['username']||$_SESSION["act"] == "inputhost") {
    header('location:index.php');
    exit();
}
if ($_POST) {
    var_dump($_POST);
    exit();
}
$url = "../index.html";
$handle = fopen($url, "r") or die("10001");
$contindex = fread($handle, filesize($url));
fclose($handle);
preg_match_all("/subcat = new Array().+\/\/end/is", $contindex, $contind);
$data1 = $contind[0][0];
//preg_match_all("/\(\".+\"\);/", $data1, $strdata);
preg_match_all("/\(\"(.*)\"\);/", $data1, $strdata);
$sstr="";
$ss="";
$p="";
foreach ($strdata[1] as $k){
    $sstr = str_replace('"','', $k);
    $ss .= $p.$sstr;$p="\r\n";
}
if (!file_exists("log/" . date('Ym') . "/")) {
        mkdir("log/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/index/" . date('Ym') . "/")) {
        mkdir("backups/index/" . date('Ym') . "/", 777);
    }
    if (!file_exists("backups/data/" . date('Ym') . "/")) {
        mkdir("backups/data/" . date('Ym') . "/", 777);
    }
    copy("data/data.txt", "backups/data/" . date('Ym') . "/" . date('YmdHis') . "-data.txt");
    copy("../index.html", "backups/index/" . date('Ym') . "/" . date('YmdHis') . "-index.html");
    $updata = fopen("data/data.txt", "w") or die("10003");
    $writehtml = fwrite($updata, $ss); 
    fclose($updata);
    if($writehtml){
        $txtcont="";
        $txtcont .= "用户：" . $_SESSION["username"] . "\r\n" . "时间：" . date("Y-m-d H:i:s") . "\r\n" . "操作：从index.html把数据更新到data.txt";
        $txtcont .="\r\n" . "----------------------------------------------------------------" . "\r\n"; 
        $newlogtxt = fopen("log/" . date('Ym') . "/" . date('Ymd') . ".log", 'a');
        fwrite($newlogtxt, $txtcont);
        echo "更新成功 共".count($strdata[1])."条数据"."<br><br>"; 
    }
//echo $ss;
//echo "<pre>";
//var_dump($strdata[1]);
$indexdata = fopen("data/data.txt", "r")or die("10002");
$ii = 0;
$dataarr = "";
$data2 = "subcat2 = new Array();" . "\r\n";
if ($indexdata) {
    while (($datainfo = fgets($indexdata)) != FALSE) {
        if ($datainfo == "" || $datainfo == null)
            continue;
        $dataarr = explode(",", trim($datainfo));
        $data2 .= 'subcat2[' . $ii . ']= new Array("' . $dataarr[0] . '","' . $dataarr[1] . '","' . $dataarr[2] . '","' . $dataarr[3] . '","' . $dataarr[4] . '","' . $dataarr[5] . '");' . "\r\n";
        $ii = $ii + 1;
    }
}
fclose($indexdata);
//echo $data2;
//echo "<script>";
//echo $contind[0][0];
//echo "</script>";
//echo "<pre>";
//var_dump($contind[0]);
?>
<!-- <!DOCTYPE html> 
<html>
    <head>
        <title>系统巡检报添加主机信息</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>  
        <link rel="stylesheet" type="text/css" href="js/jquery.confirm/jquery.confirm.css" /> 
        <style>
            body{
                background: #dadada none repeat scroll 0 0;
            } 
        </style>
    </head>
    <body >
        <div class="header">

        </div>
        <script>
<?= $data1; ?>
            //data数据
<?= $data2; ?>
//    
//
//                var html = "";
//                if (arr3) {
//                    for (var l = 0; l < arr3.length; l++) {
//                        html += "--" + arr3[l][0] + "--";
//                    }
//                }
//                $(".header").html(html);
//                html = "";
//                $.ajax({
//                    url: "updatedata.php",
//                    data: {"data": subcat},
//                    type: "post",
//                    success: function (json) {
//                        //$(".header").html(json);
//                        // console.log(json);
//                    }
//                })
//            }
             
        </script> 

        <script type="text/javascript" src="js/jquery.confirm/jquery.confirm.js"></script>
    </body>
</html>
 -->

