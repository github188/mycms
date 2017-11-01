<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller {

    function __construct() {
        parent::__construct();
        global $level;
        if (0) {
            $this->display('login');
            exit;
        } else { 
            $actarr = array('inputInfo', 'index','editInfo','infoList','get_edit');
            $act = ACTION_NAME;
            $logs['action'] = ACTION_NAME;
            if (in_array($act, $actarr)) {
                $this->assign("title", "设备故障处理");
                // $this->assign("inputInfo", "active");
                $this->assign("username", $_SESSION["username"]);
                $this->display("Index/header");
            }
        }
    }

    public function __destruct() {
        $actarr = array('inputInfo', 'index','editInfo','infoList','get_edit');
        $act = ACTION_NAME;
        if (in_array($act, $actarr)) {
            $this->display('footer');
        }
    }
    function index(){
        if(!session("username")){
            $this->display('index/login');
        }else{ 
            $this->display('equipment/index');
        }
    } 
    function login() {
        if ($_POST) {
            $username = iconv("utf-8", "gbk", $_POST['username']);
            $password = md5(md5($_POST['password']) . "xtszhgl");
            $db = M("User");
            $res = $db->where("username ='$username' and password = '$password'")->find();
            if ($res) {
                session('username', $username);
                session('userid', $res['userid']);
                session('power_level', $res['power_level']);
                $data['last_login'] = date('Y-m-d H:i:s');
                $data['logintimes'] = $res['logintimes'] + 1;
                $db->where("username ='$username' and password = '$password'")->save($data);
                echo '10000';
            } else {
                echo '用户名或密码错误';
            }
        }else{
            echo "参数错误！";
        }
    }
    //搜索信息
    function searchUser(){
        if($_GET['pagesize']){
            $pagesize = trim($_GET['pagesize']);
            if($_GET['keyword']&&$_GET['key']){
                $key = trim($_GET['key']);
                $keyword = str_replace("*","%",trim($_GET['keyword']));
                if(count(explode("%",$keyword))>1){
                    $where = "$key like '$keyword'";
                }else{
                    $where = "$key = '$keyword'";
                }
            }else{
                 $where = '1';
            }
            
            $db=M('equipment'); 
            if($_GET['page']){
                $start = ($_GET['page']-1)*$pagesize;
                $end = ($_GET['page'])*$pagesize;
                $nowpage = $_GET['page'];
            }else{
                $start = 0;
                $end = $pagesize;
                $nowpage = 1;
            } 
            $res = $db->where($where)->limit($start,$end)->select();
            $total = $db->where($where)->count();
            if($res){
                $srs['total'] = $total;
                $srs['maxpage'] = ceil($total/$pagesize);
                $srs['pages'] = $nowpage;
                $srs['pagesize'] = $pagesize;
                $srs['data']=$res;
                echo json_encode(array('code' => 10000, 'message' => '成功','result'=>$srs));
            }else{
                echo json_encode(array('code' => 10001, 'message' => '搜索信息不存在'));
            }
           
        }else{
             echo json_encode(array("code"=>10002,'message' => '参数错误'));
        } 
    }
    function loginout() {
        session('[destroy]');
        header('location:http://' . $_SERVER['HTTP_HOST'] .__ROOT__);
    } 
    function downfile() {
        $file_dir = './Public/upload/equipment/equipment.txt';
        $file = fopen($file_dir, "r");
        //输入文件标签     
        Header("Content-type: application/octet-stream");
        Header("Accept-Ranges: bytes");
        Header("Accept-Length: " . filesize($file_dir));
        Header("Content-Disposition: attachment; filename=equipment.txt");
        //输出文件内容     
        //读取文件内容并直接输出到浏览器    
        echo fread($file, filesize($file_dir));
        fclose($file);
        exit();
    }
    function doUp(){//处理上传操作 
        set_time_limit(0);
        $sqlkey=array('hapend_date','jifang','huanjing','yewu','e_type','e_pinpai','e_xinghao','codeid','ip','yujing','buwei','istingji','syears','chuli','result','huifu_date'); 
        if($_FILES){ 
            $name = $_FILES['datafile']['name'];
            $nameinfo = explode(".",$name);
            if($nameinfo[1]!='txt'){
                echo "请上传txt文件！";
                exit;
            } 
            $rootpath = './Public/upload/equipment/'.date("Ym")."/";
            if(!is_dir($rootpath)){
                @mkdir($rootpath,0775,true);
            }
            $filename = $rootpath.$name;
            if(is_file($filename)){
                @unlink($filename);
            }
            @move_uploaded_file($_FILES['datafile']['tmp_name'],$filename);
            if(!is_file($filename)){
                echo "Upload File Error!";
            }else{
                $data = fopen($filename,"r");
                $rownum = 1;
                $db = M("equipment");
                while(!feof($data)){
                   $link_arr = explode("#",iconv("GBK","utf-8",fgets($data)));
                   if(count($link_arr)<16){
                    continue;
                   }
                   $newdata = array();
                   foreach ($link_arr as $key => $value) {
                    $newdata[$sqlkey[$key]] =  $value; 
                   }
                   $isexit = $db->where($newdata)->find();
                   if($isexit){ 
                    echo $rownum ."----数据已处在！".$isexit['codeid']."<br>";
                   }else{
                        //echo $rownum ."----new！";
                        $newdata['in_date']=date('Y-m-d H:i:s');
                        $addres = $db->add($newdata);
                        if($addres){
                            echo $rownum ."----数据添加成功！".$newdata['codeid']."<br>";
                        }else{
                            echo $rownum ."<hr>序列号：".$newdata['codeid']."数据添加失败！<br><hr>";
                        } 
                   }
                   $rownum++;
                }
                fclose($data); 
            }
        }else{
            echo "No data!";
        }
    }
    function doadd() {
        $db = M("equipment");
        if ($_POST) {
            $data = $_POST;
            foreach ($data as $k => $v) {
                $data[$k] = trim($v);
            }
            $is_exist = $db->where($data)->find();
            if ($is_exist) {
                echo json_encode(array("code" => "exist", "msg" => "信息已经存在！"));
            } else {
                $data['in_date'] = date("Y-m-d H:i:s");
                if ($db->add($data)) {
                    echo json_encode(array("code" => "ok"));
                } else {
                    echo json_encode(array("code" => "err", "msg" => $db->getError()));
                };
            }
        }else{
            echo json_encode(array("code" => "err", "msg" => "参数错误！"));
        }
    }

    function doedit() {
        $db = M("equipment");
        if ($_POST&&$_GET['id']) {
            $id = $_GET['id'];
            $data = $_POST;
            foreach ($data as $k => $v) {
                $data[$k] = trim($v);
            }
            $data['in_date'] = date("Y-m-d H:i:s");
            $is_exist = $db->where("id='$id'")->save($data);
            if ($is_exist) {
                echo json_encode(array("code" => "ok", "msg" => "信息修改成功！"));
            } else {
                echo json_encode(array("code" => "exist", "msg" => "信息已提交！"));
            }
        }else{
            echo json_encode(array("code" => "err", "msg" => "参数错误！"));
        }
    }

    function newAdd() {
        if ($_GET['v'] && $_GET['p'] && ($_GET['v'] != ' ')) {
            $db = M("equipment_class");
            $data["e_name"] = trim($_GET['v']);
            $data["e_class"] = trim($_GET['p']);
            $is_exist = $db->where($data)->find();
            if (!$is_exist) {
                $data['in_date'] = date("Y-m-d H:i:s");
                $addres = $db->add($data);
                if ($addres) {
                    echo json_encode(array("code" => "ok"));
                } else {
                    echo json_encode(array("code" => "errAdd", "msg" => $db->getError()));
                }
            } else {
                echo json_encode(array("code" => "ok"));
            }
        } else {
            echo json_encode(array("code" => "err", "msg" => "参数错误！"));
        }
    }

    function getEquipmentClass() {
        $db = M("equipment_class");
        $where = '';
        if ($_GET['p']) {
            $p = $_GET['p'];
            $where = " e_class='$p' ";
        }
        $res = $db->where($where)->select();
        echo json_encode($res);
    }
  
    function upLoadPage() {
        $this->display('equipment/uploadpage');
    }

    function inputInfo() {
        $this->display('equipment/inputinfo');
    }

    function monthStatistics() {//月查询
        if ($_POST) {
            $monthselect = $_POST['monthselect'];
            $monthyear = $_POST['monthyear'];
            $monthx = $_POST['monthx'];
            if ($monthselect == "month") {
                $db = M('equipment');
                $yearres = $db->where("YEAR(hapend_date)='$monthyear'")->select();
                if ($yearres) {
                    echo json_encode(array('errMsg' => 0, 'msg' => $yearres));
                } else {
                    echo json_encode(array('errMsg' => 1, 'msg' => "无故障发生。"));
                }
            } else {
                
            }
        } else {
            echo json_encode(array('errMsg' => 3, 'msg' => '参数错误！'));
        }
    }

    function yearStatistics() {//年查询
        if ($_POST) {
            $yearstartdate = date("Y-m-d", $_POST['yearstartdate']);
            $yearenddate = date("Y-m-d", $_POST['yearenddate']);
            if ($yearenddate && $yearenddate) {
                $db = M('equipment');
                $yearres = $db->where("hapend_date between '$yearstartdate' and '$yearenddate'")->select();
                if ($yearres) {
                    echo json_encode(array('errMsg' => 0, 'msg' => "dd"));
                } else {
                    echo json_encode(array('errMsg' => 1, 'msg' => "从 '$yearstartdate' 到 '$yearenddate' 之间无故障发生。"));
                }
                //echo json_encode(array('data'=>$yearres,'msg'=>date("Y-m-d",$yearstartdate)));
            } else {
                echo json_encode(array('errMsg' => 2, 'msg' => '时间格式错误！'));
            }
        } else {
            echo json_encode(array('errMsg' => 3, 'msg' => '参数错误！'));
        }
    }

    function test() {
        $db = M("equipment_class");
        // $arr = array("中金421", "中金422", "中金433", "中金434", "中金725", "中金726", "中金727", "中金736", "西三旗");
        //$arr = array("测试/准生产","灾备","生产");
        //$arr = array("小型机","PC服务器","存储","其它");
        //$arr = array("IBM","华为","联想","浪潮","EMC");
        //$arr = array("巡检","监控"); 
        //$arr = array("CPU","内存","硬盘","电源","风扇","其它");
        //$arr = array("在线更换","停机更换","已经宕机");

        foreach ($arr as $key => $value) {
            $data['e_name'] = $value;
            $data['e_class'] = "istingji";
            if (!$db->where($data)->select()) {
                $data['in_date'] = date("Y-m-d H:i:s");
                $db->add($data);
            }
        }
    }

    //获取监控数据
    function getMonitorInfo1() {
        global $monitor_keys;
        if ($_GET['codeid']) {
            $serialnumber = $_GET['codeid'];
            $db = M("equipment_monitor");
            $cl_db = M("equipment_class");
            $monitor_info = $db->where("serialnumber='$serialnumber'")->find();
            if ($monitor_info) {
                $environment = $monitor_info['hx_systemenvironment'];
                if ($environment && $environment != ' ') {
                    $en_arr = explode(",", $environment);
                    $opt_enviroment = '';
                    $is_cs = true;
                    foreach ($en_arr as $key => $value) {
                        if (!$cl_db->where("e_name like '%$value%' and e_class='huanjing'")->find()) {
                            $r_add = $cl_db->add(array("e_name" => $value, "e_class" => "huanjing", "in_date" => date("Y-m-d H:i:s")));
                        }
                    }
                    $all_enviroment = $cl_db->where("e_class='huanjing'")->select();
                    foreach ($all_enviroment as $key => $value) {
                        if (in_array($value['e_name'], $en_arr)) {
                            $b_selected = '  b-selected';
                        } else {
                            $b_selected = '';
                        }
                        if (count($en_arr) > 1) {
                            $b_selected = '';
                        }
                        if ((in_array("测试", $en_arr) || in_array("准成产", $en_arr)) && $is_cs) {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item b-selected"><span class="text">测试/准生产</span></a></span>';
                            $is_cs = false;
                        } else if ($value['e_name'] != "测试/准生产") {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item ' . $b_selected . '"><span class="text">' . $value['e_name'] . '</span></a></span>';
                        } else {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item"><span class="text">测试/准生产</span></a></span>';
                        }
                    }
                }

                //机房选项
                // $jifang = $monitor_info['hx_room'];
                // if($jifang&&$jifang!=' '){
                //     if (!$cl_db->where("e_name like '%$jifang%' and e_class='jifang'")->find()) {
                //             $r_add = $cl_db->add(array("e_name" => $jifang, "e_class" => "jifang", "in_date" => date("Y-m-d H:i:s")));
                //         } 
                // }
                echo json_encode(array("code" => "ok", "msg" => $monitor_info, 'keys' => $monitor_keys, 'opt_enviroment' => $opt_enviroment));
            } else {
                echo json_encode(array("code" => "err", "msg" => "数据库没有此序列号的相关信息!"));
            }
        } else {
            echo json_encode(array("code" => "err", "msg" => "数据库没有此序列号的相关信息!"));
        }
    }

        //获取Orcale监控数据
    function getMonitorInfo() {
        global $monitor_keys;
        if ($_GET['codeid']) {
            $serialnumber = trim($_GET['codeid']);
            $db = M("equipment_monitor");
            $cl_db = M("equipment_class");
            $conn= ocilogon("hxb","HXB1234hxb","102.101.31.20:1521/hxcmdb90"); 
        if(!$conn){
          $e=oci_error();
          echo json_encode(array("code" => "err", "msg" => iconv("gb2312","utf-8",$e["message"]))); 
          exit;
        } 
       $query = "select SERIALNUMBER,HOSTNAME,MODEL,MANUFACTURERNAME,HX_APPNAME,HX_BUSINESSIP,HX_OTHERIP,HX_ROOM,HX_SYSTEMENVIRONMENT from aradmin.cmdbhx_to_monitor where SERIALNUMBER='$serialnumber'";
       //$query = "select SERIALNUMBER,HOSTNAME,MODEL,MANUFACTURERNAME,HX_APPNAME,HX_BUSINESSIP,HX_OTHERIP,HX_ROOM,HX_SYSTEMENVIRONMENT from aradmin.cmdbhx_to_monitor where  SERIALNUMBER='VMware-42 18 38 0e 3a e4 48 6e-9c 87 56 0b 08 5d 65 d5' ";
    	$parse = oci_parse($conn,$query);
    	oci_execute($parse,OCI_DEFAULT);  
    	$allres = array();
    	$allnum =0;
    	while($row = oci_fetch_array($parse,OCI_ASSOC)){
    	    $allres[$allnum]=$row;
    	    $allnum++;
    	}  
    	if($allres){
    	    $hx_appname = $p = $hx_businessip='';
    	    foreach($allres as $sk=>$sv){
    	        $hx_appname .= $p.iconv('gbk','utf-8',$sv['HX_APPNAME']);
    	        $hx_businessip .= $p.trim($sv['HX_BUSINESSIP']);
    	        $p=',';
    	    }
    	}else{
    	    echo json_encode(array("code" => "err", "msg" => "数据库没有此序列号的相关信息!"));
    	    exit;
    	}
    	$allres[0]['HX_APPNAME']= trim($hx_appname,',');
    	$allres[0]['HX_BUSINESSIP']= trim($hx_businessip,',');
    	$monitor_info = $allres[0]; 
    	$cl_db = M("equipment_class");
       //$monitor_info = $db->where("serialnumber='$serialnumber'")->find();
            if ($monitor_info) {
                $environment = $monitor_info['HX_SYSTEMENVIRONMENT'];
                if ($environment && $environment != ' ') { 
                    $is_cs=true;
                    $all_enviroment = $cl_db->where("e_class='huanjing'")->select();
                    foreach ($all_enviroment as $key => $value) {
                        if($environment=="PROD-HXPROD"){
                            $en_arr="生产";
                        }else{
                            $en_arr=$environment;
                        }
                        if (in_array($value['e_name'], $en_arr)) {
                            $b_selected = '  b-selected';
                        } else {
                            $b_selected = '';
                        } 
                        if (("测试"== $en_arr||"准成产"== $en_arr) && $is_cs) {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item b-selected"><span class="text">测试/准生产</span></a></span>';
                            $is_cs = false;
                        } else if ($value['e_name'] == "生产"&&$en_arr="生产") {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item b-selected "><span class="text">生产</span></a></span>';
                        }else if ($value['e_name'] != $en_arr) {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item ' . $b_selected . '"><span class="text">' . $value['e_name'] . '</span></a></span>';
                        } else {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item"><span class="text">测试/准生产</span></a></span>';
                        }
                    }
                } 
                echo json_encode(array("code" => "ok", "msg" => $monitor_info, 'keys' => $monitor_keys, 'opt_enviroment' => $opt_enviroment));
            } else {
                echo json_encode(array("code" => "err", "msg" => "数据库没有此序列号的相关信息!"));
            }
        }
    }

    //将监控数据从txt文件更新数据到MySql
    function inputMonitor() {
        ob_end_clean();
        ob_implicit_flush(1);
        $db = M("equipment_monitor");
        $keys = array('serialnumber', 'hostname', 'model', 'manufacturername', 'hx_appname', 'hx_businessip', 'hx_otherip', 'hx_room', 'hx_systemenvironment');
        $monitir_file = "F:/wamp/www/report/equipment/Public/upload/equipment/minfo.txt";
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
    function testdata(){ 
      ob_end_clean();
        ob_implicit_flush(1);
        $db = M("equipment_monitor");
        $keys = array('serialnumber', 'hostname', 'model', 'manufacturername', 'hx_appname', 'hx_businessip', 'hx_otherip', 'hx_room', 'hx_systemenvironment');
        $monitir_file = "F:/shebinfo/minfo.20170705";
        $minfo = fopen($monitir_file, 'r') or exit("Unable to open file!");
        $all_num = $ok_num= $err_num = 0;
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
                    $err_num ++;
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
        echo $all_num."_".$ok_num."_".$err_num;
    }
    
    //--------------Register/Add User----------//
    public function CheckUser() {
        if ($_GET['username']) {
            $db = M("User");
            $username = iconv("utf-8", "gbk", $_GET['username']);
            ;
            $res = $db->where("username='$username'")->select();
            if ($res) {
                echo json_encode(array('code' => 10000, 'message' => '用户名已经存在'));
            } else {
                echo json_encode(array('code' => 10001, 'message' => '用户名可以使用'));
            }
        }
    }
    function get_edit(){
        if($_GET['id']){
            $id = $_GET['id'];
            $db = M("equipment");
            $res = $db->where("id='$id'")->find();
            //dump($res); 
            $this->assign("result",$res);
            $this->display("equipment/infoedit");
        }else{
            $this->display("equipment/editinfo");
        }
        
    }
    function editInfo(){
        if($_GET['id']){}
        $this->display("equipment/editinfo");
    }
    public function AddUserDo() {
        if ($_POST) {
            if($_GET['c']){
                $power_level = $_GET['c'];
            }else{
                $power_level =0;
            }
            $db = M('User');
            $username = iconv("utf-8", "gbk", $_POST['username']);
            $password = $_POST['password'];
            $password2 = $_POST['password2'];
            if (!$username || !$password || !$password2) {
                echo json_encode(array('code' => 10001, 'message' => '参数错误'));
            } elseif ($password != $password2) {
                echo json_encode(array('code' => 10002, 'message' => '两次密码输入不一致'));
            } else {
                $chekcu = $db->where("username='$username'")->select();
                if ($chekcu) {
                    echo json_encode(array('code' => 10003, 'message' => '用户名已经存在'));
                    exit();
                }
                $data['username'] = $username;
                $data['realname'] = iconv("urf-8","gbk",$_POST["realname"]);
                $data['password'] = md5(md5($password) . "xtszhgl");
                $data["nickname"] = '';
                $data["mobile"] = $_POST['mobile'];
                $data['power_level'] = 0;
                $data['class_level'] = 0;
                $data['token'] = 0;
                $data['logintimes'] = 0;
                $data['last_login'] = date('Y-m-d H:i:s');
                
                $data['reg_date'] = date('Y-m-d H:i:s');
                $res = $db->add($data);
                if ($res) {
                    global $power; 
                    // session("userid", $res);
                    // session("username", $username);
                    // $udata['last_login'] = date('Y-m-d H:i:s');
                    // $udata['logintimes'] = 1;
                    // $db->where("username ='$username' and password = '$password'")->save($udata);
                    echo json_encode(array('code' => 10000, 'message' => '添加成功', 's' => session("userid")));
                } else {
                    echo json_encode(array('code' => 10004, 'message' => mysql_errno()));
                }
            }
        }
    }
    function mysqlTest(){
        $db=M();
        $sql ="show tables";
        $res = $db->query($sql);
        dump($res);
    }
//----------Add User End -------- ChangePw start----------//

    public function changepw() {
        $this->assign("userid", $_SESSION["userid"]);
        $this->display('equipment/changepw');
    }
        //修改密码
    public function changePwd() {
        if ($_POST['user_id']) {
            $db = M("User");
            $pwd1 = $_POST['newpassword'];
            $pwd2 = $_POST['newpassword2'];
            if ($pwd1 != $pwd2) {
                echo "两次密码输入不一致";
                exit();
            }
            $data['userid'] = $_POST['user_id'];
            $data['username'] = session('username');
            $data['password'] = md5(md5($_POST['password']) . "xtszhgl");
            $res = $db->where($data)->find();
            if ($res) {
                $data2['password'] = md5(md5($_POST['newpassword2']) . "xtszhgl");
                $update = $db->where($data)->save($data2);
                if ($update) {
                    session("[distroy]");
                    session_destroy();
                    echo json_encode(array('code' => 10000, 'message' => '修改成功'));
                }
            } else {
                echo json_encode(array('code' => 10001, 'message' => '原密码输入有误！'));
            }
        }
    }
///-----------------ChangePw start--------change info-------------------/// 
    function cPower(){
        if($_GET){
            $p=trim($_GET['p']);
            $username = trim($_GET['username']);
            if(!$username){
                echo "<h1>请填写用户名!</h1>";
                exit;
            }
            $l = trim($_GET['l']);
            if($p!=="zzhhuii"){
                echo "<h1>您没有权限修改!</h1>";
                exit;
            }
            $power=array('0','1','2','3');
            if(!in_array($l,$power)){
                echo "<h1>您要修改的权限信息不对！</h1>";
                exit;
            }
            $db=M("user");
            $is_user = $db->where("username='$username'")->select();
            dump($is_user);
            if($is_user){
                if($db->where("username='$username'")->save(array("power_level"=>$l))){
                    echo "<h1>Success！</h1>";
                }else{
                    echo "<h1>Fail or changeed！</h1>";
                };
            }else{
                echo "<h1>用户$username不存在！</h1>";
            }
        }else{
            echo '<h1>Error！';
        }
    }
    function infoList(){
        $db=M("equipment");
        $data['pagesize']=10; 
        $res = $db->limit(0,$data['pagesize'])->order("in_date desc")->select();
        $data['total']=$db->count();
        $data['page'] =  ceil($data['total']/$data['pagesize']); 
        if($data['page']<=1){
            $data['disabled']='disabled';
        }else{
            $data['disabled']='';
        } 
        $username = session("username");
        $userinfo =M("user")->where("username='$username'")->find();
       
        echo $power_level = $userinfo['power_level'];
        $this->assign('power_level', $power_level);
        $this->assign('pages', $data);
        $this->assign('infolist', $res);
        $this->display('equipment/infolist');
    }
    function deleteInfo(){
        $power_level = session("power_level");
        if(session("power_level")!=3){
            echo json_encode(array("code"=>10001,"message"=>"您没有删除权限！"));
            exit;
        }
        if($_GET['id']){
            $db=M("equipment");
            $id = $_GET['id'];
            if($db->where("id='$id'")->delete()){
                echo json_encode(array("code"=>10000,"message"=>"删除成功！"));
            }else{
                echo json_encode(array("code"=>10003,"message"=>"数据库繁忙！"));
            }
        }else{
            echo json_encode(array("code"=>10002,"message"=>"参数错误！"));
        }
    }
    function cInfo() {
        $dbu = M('user');
        $data['pagesize']=10; 
        $resu = $dbu->limit(0,$data['pagesize'])->select();
        $data['total']=$dbu->count();
        $data['page'] =  ceil($data['total']/$data['pagesize']); 
        if($data['page']<=1){
            $data['disabled']='disabled';
        }else{
            $data['disabled']='';
        }  
        $this->assign('pages', $data);
        $this->assign('users', $resu);
        $this->assign('add', session('add'));
        $this->assign('view', session('view'));
        $this->assign('edit', session('edit'));
        $this->assign('delete', session('delete'));
        $this->assign('users', $resu); 
        $this->display("cinfo");
    }
        public function userRefresh($arg=array()){
        if($arg||$_GET){
            $temp ='';
            if($arg){
                $temp = $arg;
            }else{
                $temp=$_GET;
            }
            if($temp['key']){
                $key=$temp['key'];
                $where = " username like '%$key%' or nickname like '%$key%'";
            }else{
                $where = '';
            } 
            $pagesize = $temp['pagesize']; 
            if($temp['page']){
                $start = ($temp['page']-1)*$pagesize;
                $end = ($temp['page'])*$pagesize;
                $nowpage = $temp['page'];
            }else{
                $start = 0;
                $end = $pagesize;
                $nowpage = 1;
            }      
            $db=M("user");
            $key = $temp['key'];
            $total =  $db->where($where)->count();
            $res = $db->where($where)->limit($start,$pagesize)->select();
            if($res){
                $srs['total'] = $total;
                $srs['maxpage'] = ceil($total/$pagesize);
                $srs['pages'] = $nowpage;
                $srs['pagesize'] = $pagesize;
                $srs['data']=$res;
                echo json_encode(array('code' => 10000, 'message' => '成功','result'=>$srs));
            }else{
                echo json_encode(array('code' => 10002, 'message' => '搜索的用户不存在'));
            } 
        }else{
            echo json_encode(array('code' => 10003, 'message' => '参数错误'));
        }
        
    }
    
    
    function testorcl(){ 
    //$conn= oci_connect("hxb","HXB1234hxb","(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=102.101.31.20)(PORT = 1521))) (CONNECT_DATA =(SERVICE_NAME =hxcmdb90)(SERVER = DEDICATED)))"); 
    $conn= ocilogon("hxb","HXB1234hxb","102.101.31.20:1521/hxcmdb90"); 
     if(!$conn){
       $e=oci_error();
       echo iconv("gb2312","utf-8",$e["message"]); 
       exit;
     }else{
      echo "ok!<br>";
     }
     
      //$query = "select SERIALNUMBER,HOSTNAME,MODEL,MANUFACTURERNAME,HX_APPNAME,HX_BUSINESSIP,HX_OTHERIP,HX_ROOM,HX_SYSTEMENVIRONMENT from aradmin.cmdbhx_to_monitor where category='软件' and type='基础软件' and item='主机'";
       $query = "select SERIALNUMBER,HOSTNAME,MODEL,MANUFACTURERNAME,HX_APPNAME,HX_BUSINESSIP,HX_OTHERIP,HX_ROOM,HX_SYSTEMENVIRONMENT from aradmin.cmdbhx_to_monitor where SERIALNUMBER ='06D1B6T'";
    	$parse = oci_parse($conn,$query);
    	oci_execute($parse,OCI_DEFAULT);  
    	$allres = array();
    	$allnum =0;
    	while($row = oci_fetch_array($parse,OCI_ASSOC)){
    	    $allres[$allnum]=$row;
    	    $allnum++;
    	}  
    	foreach($allres as $key=>$value){
    	    $allres[$key]["HX_APPNAME"]=iconv("gb2312","utf-8",$value["HX_APPNAME"]); 
    	}
    	dump($allres);
    	exit;
    	if($allres){
    	    $hx_appname = $p ='';
    	    foreach($allres as $sk=>$sv){
    	        $hx_appname .= $p.$sv['HX_APPNAME'];
    	        $p=',';
    	    }
    	}else{
    	    echo json_encode(array("code" => "err", "msg" => "数据库没有此序列号的相关信息!"));
    	    exit;
    	}
    	$allres[0]['HX_APPNAME']= $hx_appname;
    	$monitor_info = $allres[0]; 
    	$cl_db = M("equipment_class");
       //$monitor_info = $db->where("serialnumber='$serialnumber'")->find();
            if ($monitor_info) {
                $environment = $monitor_info['HX_SYSTEMENVIRONMENT'];
                if ($environment && $environment != ' ') { 
                    $all_enviroment = $cl_db->where("e_class='huanjing'")->select();
                    foreach ($all_enviroment as $key => $value) {
                        if($environment=="PROD-HXPROD"){
                            $en_arr="生产";
                        }else{
                            $en_arr="";
                        }
                        if (in_array($value['e_name'], $en_arr)) {
                            $b_selected = '  b-selected';
                        } else {
                            $b_selected = '';
                        } 
                        if ((in_array("测试", $en_arr) || in_array("准成产", $en_arr)) && $is_cs) {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item b-selected"><span class="text">测试/准生产</span></a></span>';
                            $is_cs = false;
                        } else if ($value['e_name'] != "测试/准生产") {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item ' . $b_selected . '"><span class="text">' . $value['e_name'] . '</span></a></span>';
                        } else {
                            $opt_enviroment .= '<span><a href="javascript:void(0);" class="b-item"><span class="text">测试/准生产</span></a></span>';
                        }
                    }
                } 
                echo json_encode(array("code" => "ok", "msg" => $monitor_info, 'keys' => $monitor_keys, 'opt_enviroment' => $opt_enviroment));
            } else {
                echo json_encode(array("code" => "err", "msg" => "数据库没有此序列号的相关信息!"));

           } 
    	 
    }
    function mData(){
        if($_GET['m']){
            $m = trim($_GET['m']);
            $where = '';
            if($m=='lastweek'){
                $where .="";
            }elseif($m=='lastbmonth'){
                
            }elseif($m=='lastmonth'){
                
            }else{
                echo json_encode(array("code"=>10001,"msg"=>"参数错误！"));
            }
        }else{
            
        }
    }
}
