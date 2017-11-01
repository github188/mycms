<?php

namespace Home\Model;

use Think\Model; 

class GtpsysModel extends Model {

    public function __construct(){ 
        $conn = ocilogon('gtpsys', 'zzh', '192.168.2.113:1521/orcl'); // 建立连接  
        if (!$conn) {
            $e = oci_error();
            print htmlentities($e['message']);
            exit;
        }   
    }
    public function nodeQuery($sql){
        $query = 'SELECT * FROM node'; // 查询语句
        $stid = oci_parse($conn, $query); // 配置SQL语句，准备执行
        if (!$stid) {
            $e = oci_error($conn);
            print htmlentities($e['message']);
            exit;
        }
        $r = oci_execute($stid, OCI_DEFAULT); // 执行SQL。OCI_DEFAULT表示不要自动commit
        if (!$r) {
            $e = oci_error($stid);
            echo htmlentities($e['message']);
            exit;
        }
        $node_info=array();
        $num=0;
        while ($row = oci_fetch_array($stid, OCI_ASSOC)) { 
            foreach ($row as $k =>$item) {
                $node_info[$num][$k]=iconv("GB2312","UTF-8",$item);
            } 
            $num++;
        }
        return $node_info;
    }

}
