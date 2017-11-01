<?php
namespace Home\Controller;
use Think\Controller;
use Think\Model;
class SmsController extends Controller{
    function __construct(){
        parent::__construct(); 
        if(!session("sms_user")&&ACTION_NAME!='doLogin'){
            $this->display("sms/login");
            exit;
        }else{
            $this->assign("sms_power_level",$this->chechPower());
            $this->assign("sms_user",session("sms_user"));
        }
    }
    function __destruct(){
        
    }
    function index(){
        $this->display("sms/input");;
    }
    function login(){
        
    }
    function chechPower(){
        $sms_userid = session("sms_userid");
        $db = M();
        $sql = "select * from class a,user_power b where a.classid=b.classid and userid='$sms_userid'";
        $res = $db->query($sql);
        return $res[0]['power_level']; 
    }
    function doLogin(){
        if ($_POST) {
            $username = iconv("utf-8", "gbk", $_POST['username']);
            $password = md5(md5($_POST['password']) . "xtszhgl");
            $db = M("User");
            $res = $db->where("username ='$username' and password = '$password'")->find();
            if ($res) {
                session('sms_user', $username);
                session('sms_userid', $res['userid']);
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
    function loginout(){
        session('[destroy]');
        header('location:http://' . $_SERVER['HTTP_HOST'] .__ROOT__."/index.php/home/sms");
    }
    //修改密码
    public function changepw() {
        $this->assign("sms_userid", $_SESSION["sms_userid"]);
        $this->display('sms/changepw');
    }
        //修改密码
    public function changePwd() {
        if ($_POST['sms_userid']) {
            $db = M("User");
            $pwd1 = $_POST['newpassword'];
            $pwd2 = $_POST['newpassword2'];
            if ($pwd1 != $pwd2) {
                //echo "两次密码输入不一致";
                echo json_encode(array('code' => 10003, 'message' => '两次密码输入不一致'));
                exit();
            }
            $data['userid'] = $_POST['sms_userid'];
            $data['username'] = session('sms_user');
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
        }else {
                echo json_encode(array('code' => 10002, 'message' => '用户ID错误！'));
            }
    }
    function lists(){
        //$db=M('intelligent_alarm','','Hxtong');
        $db=M('intelligent_alarm_log');
        $data['pagesize']=15; 
        $res = $db->limit(0,$data['pagesize'])->order("indate desc")->select();
        $data['total']=$db->count();
        $data['page'] =  ceil($data['total']/$data['pagesize']); 
        if($data['page']<=1){
            $data['disabled']='disabled';
        }else{
            $data['disabled']='';
        }  
        // dump($res);exit;
        $power['delete'] = 'ok';
        $power['edit'] = 'ok';
        $this->assign("powers",$power);
        $this->assign('pages', $data);
        $this->assign('infolist', $res);
        $this->display(sms/lists);
        //dump($res);
    }
    function deleteInfo(){
        if($_GET['id']){
            $id = $_GET['id'];
            $log = M("intelligent_alarm_log");
            $isres = $log->where("id='$id'")->find();
            $alarm_id = $isres["alarm_id"];
            $is_exit_alarm = M("intelligent_alarm")->where("id='$alarm_id'")->find();
            $send_content='';
            if(!$is_exit_alarm){
                echo json_encode(array("code"=>10000,"msg"=>"黑名单已经删除！"));
                $send_content = session("sms_user")." ".date("H:i:s")." 删除已被脚本清理的黑名单，开始时间：".($isres['strtime']?$isres['strtime']:"空").",结束时间：".($isres['endtime']?$isres['endtime']:"空")."，规则：".($isres['keywords']?$isres['keywords']:"空"); 
            }else{
                if($isres['operate']=='delete'){
                    $send_content = session("sms_user")." ".date("H:i:s")." 删除已被脚本清理的黑名单，开始时间：".($isres['strtime']?$isres['strtime']:"空").",结束时间：".($isres['endtime']?$isres['endtime']:"空")."，规则：".($isres['keywords']?$isres['keywords']:"空"); 
                }else{
                 if($alarm_id){
                    $dalarm = M("intelligent_alarm")->where("id='$alarm_id'")->delete(); 
                    if($dalarm){
                         $send_content = session("sms_user")." ".date("H:i:s")." 删除".(($is_exit_alarm['type']=='TE')?'TongEASY':$is_exit_alarm['type'])."黑名单：开始时间：".($is_exit_alarm['strtime']?$is_exit_alarm['strtime']:"空").",结束时间：".($is_exit_alarm['endtime']?$is_exit_alarm['endtime']:"空")."，规则：".($is_exit_alarm['keywords']?$is_exit_alarm['keywords']:"空"); 
                        $update['indate']=date("Y-m-d H:i:s");
                        $update['operate']='delete';
                        $log->where("id='$id'")->save($update);
                        echo json_encode(array("code"=>10000,"msg"=>"删除成功！"));
                    }else{
                    echo json_encode(array("code"=>10001,"msg"=>"日志删除：！".$dlog?"Ok":"Error ,规则删除：".$dalarm?"Ok":"Error"));
                    }
              }else{
                echo json_encode(array("code"=>10003,"msg"=>"参数错误！"));
              }
                }  
            } 
            $rootpath ="./sms_send/";
            if(!is_dir($rootpath)){
                @mkdir($rootpath,0775,true); 
            }
            $smsfile = $rootpath."/delete_".date("YmdHis")."txt";
            $filecont = fopen($smsfile,"w");
            fwrite($filecont,$send_content);
            fclose($filecont);  
        }else{
            echo json_encode(array("code"=>10002,"msg"=>"参数错误！"));
        }
    }
        //搜索信息
    function searchInfo(){
        if($_GET['pagesize']){
            $pagesize = trim($_GET['pagesize']);
            if($_GET['keywords']&&$_GET['key']){
                $key = trim($_GET['key']);
                $keywords = str_replace("*","%",trim($_GET['keywords']));
                $keywords = trim($keywords,"%");
                $where = "$key like '%$keywords%'";
            }else{
                 $where = '1';
            }
            
            $db=M('intelligent_alarm_log'); 
            if($_GET['page']){
                $start = ($_GET['page']-1)*$pagesize;
                $end = $pagesize;
                $nowpage = $_GET['page'];
            }else{
                $start = 0;
                $end = $pagesize;
                $nowpage = 1;
            } 
            $res = $db->where($where)->limit($start,$end)->order("indate desc")->select();
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
    function pagego(){
        if($_GET){
            
        }else{
            echo json_encode(array("code"=>10002,"msg"=>"参数错误！"));
        }
    }
    function getClientIp(){
        $ip ='';
        if(getenv("HTTP_CLIENT_IPT")){
            $ip = getenv("HTTP_CLIENT_IPT");
        }elseif (getenv("HTTP_X_FORWARDED_ROR")) {
            $ip = getenv("HTTP_X_FORWARDED_ROR");
        }elseif (getenv("REMOTE_ADDR")) {
            $ip = getenv("REMOTE_ADDR");
        }else{
            $ip = " ";
        }
        return $ip;
    }
    //新增
    function input(){
        if($_POST){
            $type = trim($_POST['type']);
            if(!in_array($type,array('GTP','TongEASY','MQ'))){
                echo json_encode(array("code"=>10001,"msg"=>"请选择正确的的中间件！"));
                exit;
            }
            if($type=='TongEASY'){
                $type='TE';
            }
            $data['type']=$type;
            $data['strtime']=trim($_POST['strtime'])?trim($_POST['strtime']):Null;
            $data['endtime']=trim($_POST['endtime'])?trim($_POST['endtime']):Null;
            $data['keywords']=trim($_POST['keywords'])?trim($_POST['keywords']):Null;
            if(strtotime($data['strtime'])>strtotime($data['endtime'])){
                echo json_encode(array("code"=>10004,"msg"=>"开始时间不能大于结束时间！"));
                exit;
            }
            //$db=M('intelligent_alarm','','Hxtong');
             $db=M('intelligent_alarm');
            $is_exit = $db->where($data)->select();
            if($is_exit){
                echo json_encode(array("code"=>10002,"msg"=>"该规则已经存在！"));
                exit;
            }else{
                $datas = $data;
                $datas['operate_ip']=$this->getClientIp();
                $datas['indate']=date('Y-m-d H:i:s');
                $datas['username']=session('sms_user');
                $datas['operate']='add';
                $smsid = $db->add($data);
                if($smsid){
                    $datas['alarm_id']= $smsid;
                    M('intelligent_alarm_log')->add($datas);
                    $send_content = session("sms_user")." ".date("H:i:s",$datas['indate'])." 新增".$type."黑名单：开始时间：".($data['strtime']?$data['strtime']:"空").",结束时间：".($data['endtime']?$data['endtime']:"空")."，规则：".($data['keywords']?$data['keywords']:"空");
                    $rootpath ="./sms_send/";
                    if(!is_dir($rootpath)){
                        @mkdir($rootpath,0775,true); 
                    }
                    $smsfile = $rootpath."/add_".date("YmdHis")."txt";
                    $filecont = fopen($smsfile,"w");
                    fwrite($filecont,$send_content);
                    fclose($filecont); 
                    echo json_encode(array("code"=>10000,"msg"=>"短信黑名单添加成功！",'sms'=>$smsfile));
                    exit;
                }else{
                    echo json_encode(array("code"=>10003,"msg"=>"数据库繁忙！"));
                    exit;
                }
            } 
        }
        
    } 
    function get_edit(){
        if($_GET['id']&&$_GET['alarm_id']){
            $alarm_id = $_GET['alarm_id'];
            $log_id = $_GET['id'];
            $alarmdb =  M("intelligent_alarm");
            $logdb = M("intelligent_alarm_log");
            $alarmres = $logdb->where("id='$log_id'")->find();
            $types = array("GTP","TE","MQ");
            foreach ($types as $value) {
                if($alarmres['type']==$value){
                    $this->assign($value,'selected');
                    break;
                }
            }
            //dump($alarmres);exit;
            $this->assign("alarm",$alarmres);
            $this->display("sms/edit");
        }else{
            echo "参数错误！";
        }
    }
    function is_delete(){
         if($_GET['alarm_id']&&$_GET['id']){
            //$db=M('intelligent_alarm','','Hxtong');
            $db=M('intelligent_alarm'); 
            $dblog=M('intelligent_alarm_log'); 
            $log_id = $_GET['id'];
            $alarm_id = $_GET['alarm_id'];
            //$dblog->where("id='$log_id'")->save(array("operate"=>"delete"));
            $is_info = $db->where("id='$alarm_id'")->find(); 
            if($is_info){
               echo json_encode(array("code"=>10000,"msg"=>"ok！"));
            }else{
                //$edits = $db->add($data);
                // if($edits){
                //     $alarm_id = $edits;
                // }else{
                //     echo json_encode(array("code"=>10003,"msg"=>"无法编辑已删除的黑名单！"));
                //     exit;
                // }
                echo   json_encode(array("code"=>10003,"msg"=>"无法编辑已删除的黑名单！"));
                exit;
            } 
         }else{
             echo  json_encode(array("code"=>10003,"msg"=>"参数错误！"));
         }
    }
    //执行修改
    function doEdit(){
        if($_POST&&$_POST['alarm_id']){
            $alarm_id = $_POST['alarm_id'];
            $log_id = $_POST['log_id'];
            $type = trim($_POST['type']);
            if(!in_array($type,array('GTP','TongEASY','MQ'))){
                echo json_encode(array("code"=>10001,"msg"=>"请选择正确的的中间件！"));
                exit;
            }
            if($type=='TongEASY'){
                $type='TE';
            }
            $data['type']=$type;
            $data['strtime']=trim($_POST['strtime'])?trim($_POST['strtime']):Null;
            $data['endtime']=trim($_POST['endtime'])?trim($_POST['endtime']):Null;
            $data['keywords']=trim($_POST['keywords'])?trim($_POST['keywords']):Null;
            if(strtotime($data['strtime'])>strtotime($data['endtime'])){
                echo json_encode(array("code"=>10004,"msg"=>"开始时间不能大于结束时间！"));
                exit;
            } 
            //$db=M('intelligent_alarm','','Hxtong');
            $db=M('intelligent_alarm');
            $logdb=M('intelligent_alarm_log');
            $is_info = $db->where("id='$alarm_id'")->select();
            $edits =0;
            $send_content='';
            if($is_info){
               $edits = $db->where("id='$alarm_id'")->save($data); 
            }else{
                //$edits = $db->add($data);
                // if($edits){
                //     $alarm_id = $edits;
                // }else{
                //     echo json_encode(array("code"=>10003,"msg"=>"规则未改变,！"));
                //     exit;
                // }
                echo json_encode(array("code"=>10003,"msg"=>"无法编辑已删除的黑名单！"));
                exit;
            }  
            if(!$edits){ 
                echo json_encode(array("code"=>10002,"msg"=>"规则未改变！"));
                exit;
            }else{
                $changed = '';
                $old_rule = $logdb->where("id='$log_id'")->find();
                if($old_rule['type']!=$data['type']){
                    $changed .="中间件[".$old_rule['type']."]修改为[".$data['type']."];";
                }
                if($old_rule['strtime']!=$data['strtime']){
                    $changed .="开始时间[".$old_rule['strtime']."]修改为[".$data['strtime']."];";
                }
                if($old_rule['endtime']!=$data['endtime']){
                    $changed .="结束时间[".$old_rule['endtime']."]修改为[".$data['endtime']."];";
                } 
                if($old_rule['keywords']!=$data['keywords']){
                    $changed .="规则[".$old_rule['keywords']."]修改为[".$data['keywords']."];";
                }
                $datas = $data;
                $datas['indate']=date('Y-m-d H:i:s');
                $datas['username']=session('sms_user');
                $datas['operate']='edit';
                $datas['alarm_id']= $alarm_id;
                $logdb->add($datas);
                    //$send_content =  session("sms_user")." ".date("H:i:s",$datas['indate'])." 修改黑名单：开始时间：".($data['strtime']?$data['strtime']:"空").",结束时间：".($data['endtime']?$data['endtime']:"空")."，规则：".($data['keywords']?$data['keywords']:"空");
               $send_content =  session("sms_user")." ".date("H:i:s",$datas['indate'])." 修改".(($old_rule['type']=='TE')?'TongEASY':$old_rule['type'])."黑名单,".$changed;
               echo json_encode(array("code"=>10000,"msg"=>"黑名单修改成功！",'sms'=>$smsfile)); 
            }  
            $rootpath ="./sms_send/";
            if(!is_dir($rootpath)){
             @mkdir($rootpath,0775,true); 
            }
            $smsfile = $rootpath."/edit_".date("YmdHis")."txt";
            $filecont = fopen($smsfile,"w");
            fwrite($filecont,$send_content);
            fclose($filecont); 
        }
        
    } 
    //快捷查询
    function pQuery(){
        if($_GET['type']){
            $t = $_GET['type'];
            switch($t){
                case 'MQ': 
                    $db = D('Hxmqm2');
                    $res = $db->field('sysname')->group("sysname")->select();
                    echo json_encode(array("msg"=>'ok','data'=>$res));
                    break;
                case 'GTP':
                    $db= D('Hxgtp');
                    $res = $db->field('sysname')->group("sysname")->select();
                    echo json_encode(array("msg"=>'ok','data'=>$res));
                    break;
                case 'TongEASY':
                    $db=M('t_teinfo','','Hxtong');
                    $res = $db->field('sys_name')->group("sys_name")->select();
                    echo json_encode(array("msg"=>'ok','data'=>$res));
                    break;
                default:
                    echo json_encode(array("msg"=>'ok','data'=>''));
                    break;
                    
            }
        }else{
                    echo json_encode(array("msg"=>'err'));
                    exit;
            }
    }
    function pOtherName(){
        if($_GET['sysname']&&$_GET['type']){
            $sysname = $_GET['sysname'];
            $t = $_GET['type'];
            switch($t){
                case 'MQ': 
                    $db = D('Hxmqm2');
                    $res = $db->where("sysname='$sysname'")->group("qmname")->select();
                    echo json_encode(array("msg"=>'ok','data'=>$res));
                    break;
                case 'GTP':
                    $db= D('Hxgtp');
                    $res = $db->where("sysname='$sysname'")->group("nodename")->select();
                    echo json_encode(array("msg"=>'ok','data'=>$res));
                    break;
                case 'TongEASY':
                    $db=M('t_teinfo','','Hxtong');
                    $res = $db->where("sys_name='$sysname'")->group("node_name")->select();
                    echo json_encode(array("msg"=>'ok','data'=>$res));
                    break;
                default:
                    break;
                    
            }
        }else{
                    echo json_encode(array("msg"=>'err'));
                    exit;
                }
    }
}