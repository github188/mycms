<?php

namespace Home\Controller;

use Think\Controller;

class UserController extends Controller {

    public function __construct() {        
        parent::__construct();
        global $level;
        if (!session('username')) {
            $this->error('请登录', '__ROOT__');
            exit;
        }else{
            global $power;
            $db = M("User_power");
            $controller = strtolower(CONTROLLER_NAME);
            $classres = M('class')->where(" action ='$controller' ")->find();
            $classid = $classres['classid'];
            $userid = session('userid');
            $usrlevel = $db->where("userid='$userid' and classid='$classid'")->find();
            $power_level = $usrlevel['power_level'];
            foreach ($power as $key => $value) {
                if (($power_level & $value) == $value) {
                    session($key, 'ok');
                } else {
                    session($key, 'no');
                }
            }
//            if (session('view') == 'no') {
//                echo "<h2>您没有权限，请联系管理员给您访问权限，或者选择其他用户";
//                echo "<a  href='./Index/login'>登录</a> 。</h2>";
//                exit;
//            }  
            $this->assign("navs", NavChechPower('User'));
            click_action_log();
        }
    }

    public function _before_index() {
        $this->assign("title", "用户管理");
        $this->assign("user", "active");
        $this->assign("username", $_SESSION["username"]);
        $this->assign("level", $_SESSION["level"]);
        $this->display("Index/header");
    }

    public function _after_index() {
        $this->display("Index/footer");
    }

    public function index() {
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
        $this->display('user_index');
    }

    // public function _before_changepw(){
    //     $this->assign("title","修改密码"); 
    //     $this->assign("username", $_SESSION["username"]);
    //     $this->assign("level", $_SESSION["level"]);
    //     $this->display("Index/header");
    // }
    // public function _after_changepw(){
    //     $this->display("Index/footer");
    // }
    public function changepw() {
        $this->assign("userid", $_SESSION["userid"]);
        $this->display();
    }

    public function _before_mamager() {
        $this->assign("title", "用户管理");
        $this->assign("mq", "active");
        $this->assign("username", $_SESSION["username"]);
        $this->assign("level", $_SESSION["level"]);
        $this->display("Index/header");
    }

    public function manager() {
        $this->display();
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
                    echo json_encode(array('code' => 10000, 'message' => '修改成功'));
                }
            } else {
                echo json_encode(array('code' => 10001, 'message' => '修改失败'));
            }
        }
    }

    public function add() {
        $this->display();
    }

    public function get_add() {
        $db = M('class');
        $res = $db->select();
        $this->assign('classes', $res);
        $dbp = M('power');
        $resp = $dbp->select();
        $td = '';
        foreach ($resp as $key => $value) {
            $td .= '<td align="center"><img style="cursor:pointer;" onclick="checkthis(this)" src="/Public/home/img/checkbox0.png"><input id="' . $value['pnickname'] . '" type="hidden" name="power[' . $value['pnickname'] . '][]" value="0"></td>';
        }
        $this->assign('td', $td);
        $this->assign('tdnum', count($resp) + 2);
        $this->assign('power', $resp);
        echo $this->fetch('getadd');
    }

    public function AddUserDo() {
        if ($_POST) {
            $db = M('User');
            $namec = session('username');
            $seck = $db->where("username='$namec'")->select();
            if ($seck) {
                if ($seck[0]['level'] > 0) {
                    echo json_encode(array('code' => 10005, 'message' => '您没有权限添加用户'));
                    exit();
                }
            } else {
                echo json_encode(array('code' => 10006, 'message' => '请登录', 'url' => 'http://' . $_SERVER['HTTP_HOST']));
                exit();
            }
            $username = iconv("utf-8", "gbk", $_POST['username']);
            $password = $_POST['password'];
            $password2 = $_POST['password2'];
            $level = $_POST['level'];
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
                $data['password'] = md5(md5($password) . "xtszhgl");
                $data['reg_date'] = date('Y-m-d H:i:s');
                $data['level'] = $level;
                $res = $db->add($data);
                if ($res) {
                    echo json_encode(array('code' => 10000, 'message' => '添加成功'));
                } else {
                    echo json_encode(array('code' => 10004, 'message' => mysql_errno()));
                }
            }
        }
    }

    public function addUserPowerDo() {
        if ($_POST) {
            global $power;
            $db = M('user_power');
            // $userid = session('userid');
            // $res = $db->where("userid='$userid' and classid='4'")->find();
            // if ($res) {
            //     if ($res['power_level'] & $power['add'] != $power['add']) {
            //         echo json_encode(array('code' => 10005, 'message' => '您没有权限添加用户'));
            //         exit();
            //     }
            // } else {
            //     echo json_encode(array('code' => 10006, 'message' => '请联系管理管分配权限'));
            //     exit();
            // }
            if (session('add') == "no") {
                echo json_encode(array('code' => 10006, 'message' => '请联系管理管分配权限'));
                exit();
            }
            $username = $_POST['username'];
            $password = $_POST['password'];
            $password2 = $_POST['password2'];
            if (!$username || !$password || !$password2) {
                echo json_encode(array('code' => 10001, 'message' => '参数错误'));
            } elseif ($password != $password2) {
                echo json_encode(array('code' => 10002, 'message' => '两次密码输入不一致'));
            } else {
                $dbUser = M('user');
                $chekcu = $dbUser->where("username='$username'")->select();
                if ($chekcu) {
                    echo json_encode(array('code' => 10003, 'message' => '用户名已经存在'));
                    exit();
                }
                $dataUser['username'] = $username;
                $dataUser['password'] = md5(md5($password) . "xtszhgl");
                $dataUser['reg_date'] = date('Y-m-d H:i:s');
                $resid = $dbUser->add($dataUser);
                if ($resid) {
                    $data['userid'] = $resid;
                    $classids = $_POST['classid'];
                    $powers = $_POST['power'];
                    $powerkeys = array_keys($power);
                    $n = 0;
                    foreach ($classids as $key => $value) {
                        $data['classid'] = $value;
                        $data['power_level'] = 0;
                        for ($i = 0; $i < count($powerkeys); $i++) {
                            if ($powers[$powerkeys[$i]][$n]) {
                                $data['power_level'] +=pow(2, $i);
                            }
                        }
                        $n++;
                        $upexit = $db->where(" userid ='$resid' and classid='$value' ")->select();
                        if ($upexit) {
                            $resadd = $db->where(" userid ='$resid' and classid='$value' ")->save($data);
                        } else {
                            $resadd = $db->add($data);
                        }
                    }
                    if ($resadd) {
                        echo json_encode(array('code' => 10000, 'message' => '添加成功'));
                    } else {
                        echo json_encode(array('code' => 10002, 'message' => '数据库繁忙'));
                    };
                } else {
                    echo json_encode(array('code' => 10003, 'message' => '数据库繁忙2'));
                }
            }
        } else {
            echo json_encode(array('code' => 10003, 'message' => '参数错误'));
        }
    }

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

    public function delet_user() {
        if ($_GET['id']) {
            $db = M('User');
            $namec = session('username');
            $seck = $db->where("username='$namec'")->select();
            if ($seck) {
                if ($seck[0]['level'] > 0) {
                    echo json_encode(array('code' => 10005, 'message' => '您没有权限删除用户'));
                    exit;
                }
                $ids = $_GET['id'];
                if($ids==session('userid')){
                    echo json_encode(array('code' => 10002, 'message' => '不能删除自己的账户'));
                    exit;
                } 
                $where = "userid in($ids)";
                $deres = $db->where($where)->delete();
                if ($deres) {
                    echo json_encode(array('code' => 10000, 'message' => ' 删除成功'));
                } else {
                    echo json_encode(array('code' => 10001, 'message' => '系统繁忙'));
                }
            } else {
                echo json_encode(array('code' => 10006, 'message' => '请登录', 'url' => 'http://' . $_SERVER['HTTP_HOST']));
                exit();
            }
        }
    }

    public function newDeleteUser() {
        if ($_GET['userid']) {
            $db = M('User_power');
            $namagerid = session('userid');
            $deleteid = $_GET['userid']; 
            $power = checkpower('user', 'delete');
            if (!$power) {
                echo json_encode(array('code' => 10005, 'message' => '您没有权限删除用户'));
                exit();
            }
            $ids = $deleteid;
            if($ids==session('userid')){
                    echo json_encode(array('code' => 10002, 'message' => '不能删除自己的账户'));
                    exit;
                }
            $where = "userid in($ids)";
            $deres = M('user')->where($where)->delete();
            if ($deres) {
                echo json_encode(array('code' => 10000, 'message' => ' 删除成功'));
                M('user_power')->where($where)->delete();
            } else {
                echo json_encode(array('code' => 10001, 'message' => '系统繁忙'));
            }
        } else {
            echo json_encode(array('code' => 10006, 'message' => '参数错误！'));
            exit();
        }
    }
//编辑用户权限模板
    public function get_edit() {
        if ($_GET['userid']) {
            global $power;
            $dbUser = M('user');
            $userid = $_GET['userid'];
            $resUser = $dbUser->where("userid = '$userid'")->find();
            $resPower = M('power')->select();
            $resUserPower = M()->table("class a,user_power b ")->where("b.userid = '$userid' and a.classid=b.classid")->select();
            $resClass = M("class")->select(); 
        }
        $hth='';
        foreach ($resPower as $key => $value) {
           $hth .='<th align="center"><span style="cursor:pointer;" onclick="checkall(this,\''.$value['pnickname'].'\',1)">'.$value['powername'].'</span></th>';
        }
        $td = "";
        foreach ($resClass as $key => $value) {
            if($value['action']=="user"){
                continue;
            }
            foreach ($resUserPower as $kp => $vp) {
                if ($vp['classid'] == $value['classid']) {
                    $power_level = $vp['power_level'];
                }
            }
            $isok = 0;
            $td .='<tr>';
            $td .=' <td align="center">' . ($key + 1) . '<input type="hidden" name="classid[]" value="' . $value['classid'] . '"></td>';
            $td .='<td align="center">' . $value['classname'] . '</td>';
            foreach ($power as $k => $v) {
                if (($power_level & $v) == $v) {
                    $isok = 1;
                } else {
                    $isok = 0;
                }
                $td .= '<td align="center"><img style="cursor:pointer;" onclick="checkthis(this)" src="/Public/home/img/checkbox' . $isok . '.png"><input id="' . $k . '" type="hidden" name="power[' . $k . '][]" value="' . $isok . '"></td>';
            }
            $td .='</tr>';
        }
        if($resUser['username']=='admin'){
            $this->assign('disabled','disabled');
        } 
        $this->assign('hth', $hth);
        $this->assign('resUser', $resUser);
        $this->assign('resUserPower', $resUserPower);
        $this->assign('resPower', $resPower);
        $this->assign('resClass', $resClass);
        $this->assign('td', $td);
        $this->assign('userid', $userid);
        $this->assign('tdnum', count($resPower) + 2);
        echo $this->fetch('edit');
    }

    public function editUserPowerDo() {
        if ($_POST) {
            global $power;
            $db = M('user_power');
            if (session('edit') == "no") {
                echo json_encode(array('code' => 10006, 'message' => '请联系管理管分配权限'));
                exit();
            }
            $username = $_POST['username'];
            $userid = $_GET['userid'];
            if (!$username) {
                echo json_encode(array('code' => 10001, 'message' => '参数错误'));
            } else {
                $dbUser = M('user');
                $dataUser['nickname'] = $_POST['nickname'];
                $chekcu = $dbUser->where("username='$username' and userid='$userid'")->save($dataUser);
                $classids = $_POST['classid'];
                $powers = $_POST['power'];
                $powerkeys = array_keys($power);
                $n = 0;
                $poadsok = 0;
                foreach ($classids as $key => $value) {
                    $data['classid'] = $value;
                    $data['power_level'] = 0;
                    for ($i = 0; $i < count($powerkeys); $i++) {
                        if ($powers[$powerkeys[$i]][$n]) {
                            $data['power_level'] +=pow(2, $i);
                        }
                    }
                    $n++;
                    $upexit = $db->where(" userid ='$userid' and classid='$value' ")->select();
                    if ($upexit) {
                        $resadd = $db->where(" userid ='$userid' and classid='$value' ")->save($data);
                    } else {
                        $data['userid'] = $userid;
                        $resadd = $db->add($data);
                    }
                    if ($resadd) {
                        $poadsok = 1;
                    }
                }
                if ($poadsok) {
                    echo json_encode(array('code' => 10000, 'message' => '修改成功'));
                } else {
                    echo json_encode(array('code' => 10002, 'message' => '数据库繁忙'));
                };
            }
        } else {
            echo json_encode(array('code' => 10003, 'message' => '参数错误'));
        }
    }
    public function searchUser(){
        // if($_GET['key']){
        //     $db=M("user");
        //     $key = $_GET['key'];
        //     $where = " username like '%$key%' or nickname like '%$key%'";
        //     $res = $db->where($where)->select();
        //     if($res){
        //         echo json_encode(array('code' => 10000, 'message' => '成功','data'=>$res));
        //     }else{
        //         echo json_encode(array('code' => 10002, 'message' => '搜索的用户不存在'));
        //     }
        // }else{
        //      $this->userRefresh($_GET);
        // }
        $this->userRefresh($_GET);
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
    public function pageGo(){
        $this->userRefresh($_GET);
    }

}
