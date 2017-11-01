<?php
$indexdata = fopen("data/data.txt", "r");
    $ii = 0;
    $dataarr = "";
    $data2 = "subcat = new Array();" . "\r\n";
    if ($indexdata) {
        while (($datainfo = fgets($indexdata)) != FALSE) {
            if ($datainfo == "" || $datainfo == null)
                continue; 
            $ii = $ii + 1;
        }
    }
    $url11 = "../index.html";
    $handle11 = fopen($url11, "r") or die("10001");
    $contindex11 = fread($handle11, filesize($url11));
    fclose($handle11);
    preg_match_all("/subcat = new Array().+\/\/end/is", $contindex11, $contind11);
    $data111 = $contind11[0][0];
    preg_match_all("/\(\"(.*)\"\);/", $data111, $strdata11); 
    include_once("updatedata.php");
    echo 0; 
    return false;
    exit;
    if (count($strdata11[1]) != $ii) { 
		include_once("updatedata.php"); 
        return 1;
        //echo json_encode(array("code" => 10001, "message" => count($strdata11[1])."--".$ii."index.html中的数据条数大于data.txt中的数据，请先更新数据")); 
    }  else{ 
	//	include_once("updatedata.php");
        return 0;
    }
