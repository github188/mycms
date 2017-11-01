<?php

header("content-type:text/html;charset=utf-8");
$con = mysql_connect("localhost", "root", "root");
mysql_query("chareset:utf-8");
if (!mysql_select_db("abc")) {
    $createabc = "create database abc";
    if (mysql_query($createabc)) {
        mysql_select_db("abc"); 
    }
} 
if (!mysql_num_rows(mysql_query("show tables like'inspection'"))) {
    $ctable = "CREATE TABLE IF NOT EXISTS `inspection` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nodename` varchar(100) DEFAULT NULL,
  `location_id` int(6) DEFAULT NULL,
  `server_id` varchar(20) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `os_type` varchar(20) DEFAULT NULL,
  `app_type` varchar(20) DEFAULT NULL,
  `user_id` int(6) NOT NULL,
  `date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `operation` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ";
     mysql_query($ctable) ;
}   
$indexdata = fopen("data/data.txt", "r");
$ii = 0;
$dataarr = ""; 
if ($indexdata) {
    while (($datainfo = fgets($indexdata)) != FALSE) {
        if ($datainfo == "" || $datainfo == null)
            continue;
        $dataarr = explode(",", trim($datainfo));
       echo $sqlinst ="insert into inspection ( `nodename` , `location_id` , `server_id` , `hostname` , `os_type` , `app_type` ) VALUES ('$dataarr[0]','$dataarr[1]','$dataarr[2]','$dataarr[3]','$dataarr[4]','$dataarr[5]')";
        mysql_query($sqlinst);
    }
}
fclose($indexdata);






