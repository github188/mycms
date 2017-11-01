<?php

/**
 * 云检查和处理
 */

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller {

  

    public function __destruct() {
        $actarr = array('index', 'check');
        $act = ACTION_NAME;
        if (in_array($act, $actarr)) {
            $this->display('Index/footer');
        }
    }

    function index() {
        $db = M("cloud_check");
        //$userid = session('userid');
        $allinfo = $db->order("check_time desc")->select();
        if (!$allinfo) {
            $allinfo = 0;
        }
        $this->assign('data', $allinfo);
        $this->display('Index/header');
        $this->display('cloud/cloud');
    }

    function delete() {
        if ($_GET['id']) {
            $id = $_GET['id'];
            $case = M("cloud_check");
            $power = checkpower("cloud", "delete");
            $data = $case->where(" cloudid='$id'")->find();
            if (1) {
                $res = $case->where(" cloudid='$id'")->delete(); 
                if ($res) {
                   @unlink(realpath(trim($data['save_filename'])));
                   @unlink(realpath(trim($data['recv_filename']))); 
                }
                echo json_encode(array("msg" => "ok"));
            }
        } else {
            echo json_encode(array("msg" => "参数错误！"));
        }
    }

    function show_recv() {
        if ($_POST['id'] && $_POST['file']) {
            $id = $_POST['id'];
            $file = $_POST['file'];
            if (file_exists($file)) {
                $fp = fopen($file, "r");
                $str = "";
                $buffer = 1024; //每次读取 1024 字节
                while (!feof($fp)) {//循环读取，直至读取完整个文件
                    $str .= fread($fp, $buffer);
                }
                $str = str_replace("\r\n", "<br/>", $str);
                $str = str_replace("\n", "<br/>", $str);
                $content = $str;
                echo json_encode(array("msg" => "ok", 'content' => $content));
            } else {
                echo json_encode(array("msg" => "返回文件不存在！"));
            }
        } else {
            echo json_encode(array("msg" => "参数错误！"));
        }
    }

    function delMore() {
        if ($_GET['ids']) {
            $idarr = explode("-", $_GET['ids']);
            $ids = '';
            $p = '';
            foreach ($idarr as $key => $value) {
                $ids .=$p . $value;
                $p = ',';
            }
            $where = " cloudid in ($ids)";
            $cloud_check = M("cloud_check");
            $power = checkpower("cloud", "delete");
            //$power == '1'
            if (1) {
                $data = $cloud_check->where($where)->select();
                $res = $cloud_check->where($where)->delete();
                if ($res) {
                    echo json_encode(array("msg" => "ok", 'file' => ''));
                    foreach ($data as $key => $value) {
                        @unlink(realpath(trim($value['save_filename'])));
                        @unlink(realpath(trim($value['recv_filename']))); 
                    }
                } else {
                    echo json_encode(array("msg" => "系统繁忙！"));
                }
            } else {
                echo json_encode(array("msg" => "您没有删除权限！"));
            }
        } else {
            echo json_encode(array("msg" => "参数错误！"));
        }
    }

    function createfile() {
        $nodename = $_POST["nodename"];
        $filename = $_POST["filename"];
        $sendfile = $_POST["sendfile"];
        if (!$nodename) {
            echo json_encode(array('success' => false, 'errorMsg' => '节点名称不能为空'));
            exit();
        }
        if (!$sendfile) {
            echo json_encode(array('success' => false, 'errorMsg' => '发送目录不能为空'));
            exit();
        }
        if (!$filename) {
            echo json_encode(array('success' => false, 'errorMsg' => '文件名不能为空'));
            exit();
        }
        $cont = $nodename . "#" . $sendfile . "#" . $filename;
        $url = "./Public/gtpCheck/$nodename/send";
        if (!is_dir($url)) {
            mkdir($url, 0777, true);
        }
        $namedate = date("YmdHis");
        $save_filename = "gtp_search_" . $namedate . ".txt";
        $recv_filename = "gtp_recv_" . $namedate . ".txt";
        $filepath = $url . "/" . $save_filename;
        $db = M("cloud_check");
        $data = $_POST;
        $is_exist = $db->where($_POST)->select();
        if ($is_exist) {
            $data['userid'] = session("userid");
            $data['check_time'] = date("Y-m-d H:i:s");
            $data['check_status'] = 0;
            $userid = session('userid');
            $allinfo = $db->order("check_time desc")->select();
            echo json_encode(array('success' => false, 'data' => $allinfo, 'errorMsg' => '正在查询，请耐心等待...'));
        } else {
            $myfile = fopen($filepath, "w") or die("Unable to open file!");
            fwrite($myfile, $cont);
            fclose($myfile);
            $data['userid'] = session("userid");
            $data['check_time'] = date("Y-m-d H:i:s");
            $data['check_status'] = 0;
            $data['save_filename'] = $filepath;
            $data['recv_filename'] = $url = "./Public/gtpCheck/$nodename/recv/" . $recv_filename;
            $addres = $db->add($data);
            $userid = session('userid');
            //$allinfo = $db->where(" userid='$userid'")->select();
            $allinfo = $db->order("check_time desc")->select();
            if ($addres) {
                echo json_encode(array('success' => true, 'data' => $allinfo));
            } else {
                echo json_encode(array('success' => false, 'data' => $allinfo, 'errorMsg' => '数据生成失败，请重新查询！'));
            }
        }
        // echo realpath($filepath);
    }

    function scan() {
        $userid = session("userid");
        $db = M("cloud_check");
        $res = $db->order("check_time desc")->select(); 
        foreach ($res as $key => $value) {
            $check_status = $value['check_status'];
            if ($check_status == '1') {
                continue;
            }
            $recv = $value['recv_filename'];
            $real_recvpath = realpath($recv);
            if (file_exists($real_recvpath)) {
                $res[$key]["check_status"] = 1;
                $cloudid = $value["cloudid"];
                $update = $db->where("cloudid='$cloudid'")->save(array("check_status" => 1));
            }
        }
        if (!$res) {
            $res = false;
        }
        echo json_encode(array('success' => true, 'data' => $res));
    }

}
