<?php

namespace Home\Controller;

use Think\Controller;

class RegisterController extends Controller {

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

    public function AddUserDo() {
        if ($_POST) {
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
                $data['password'] = md5(md5($password) . "xtszhgl");
                $data['reg_date'] = date('Y-m-d H:i:s');
                $res = $db->add($data);
                if ($res) {
                    global $power;
                    $pres = M("class")->select();
                    foreach ($pres as $key => $value) {
                        if ($value['action'] == "user")
                            continue;
                        $pda['userid'] = $res;
                        $pda['classid'] = $value['classid'];
                        $pda['power_level'] = $power['view'];
                        M("user_power")->add($pda);
                    }
                    session("userid", $res);
                    session("username", $username);
                    $udata['last_login'] = date('Y-m-d H:i:s');
                    $udata['logintimes'] = 1;
                    $db->where("username ='$username' and password = '$password'")->save($udata);
                    echo json_encode(array('code' => 10000, 'message' => '添加成功', 's' => session("userid")));
                } else {
                    echo json_encode(array('code' => 10004, 'message' => mysql_errno()));
                }
            }
        }
    }

    public function downsoftware() { 
            $url = $_GET['url'];
            echo $file_path =  './Public/upload/software/ChromeStandalone_49.exe';;
            download($file_path);  
    }

}
