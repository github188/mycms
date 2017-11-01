<?php
if($_GET){
    $indexdata = fopen("data/data.txt", "r");    
    if ($indexdata) {
        while (($datainfo = fgets($indexdata)) != FALSE) {
            if ($datainfo == "" || $datainfo == null)
                continue;
            $dataarr = explode(",", trim($datainfo));
            if($dataarr[2]==$_GET["serverid"]){
            		echo "10000";
            }
             
        }
    }
}