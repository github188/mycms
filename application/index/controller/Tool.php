<?php
namespace app\index\controller;
use app\index\model\Blacklist;
use com\Baseinit;

class Tool extends Baseinit {
	public function _initialize() {
		parent::_initialize();
		$this->assign("title", "系统工具");
	}
	public function _empty($name) {
		return $this->developing();
	}
	public function index() {
		return $this->fetch('iframe');
	}
	public function file() {
		return $this->fetch();
	}
	public function filePost() {
		dump(input("post."));
	}
	public function sms() {
		return $this->fetch();
	}
	public function smsPost() {
		if (input("post.")) {
			$data['type'] = input("post.type");
			$data['strtime'] = trim(input('post.strtime')) ? trim(input('post.strtime')) : Null;
			$data['endtime'] = trim(input('post.endtime')) ? trim(input('post.endtime')) : Null;
			$data['keywords'] = trim(input('post.keywords')) ? trim(input('post.keywords')) : Null;
			if (strtotime($data['strtime']) > strtotime($data['endtime'])) {
				echo json_encode(array("code" => 10004, "msg" => "开始时间不能大于结束时间！"));
				exit;
			}
			$db = new Blacklist();
			$is_exit = $db->table("blacklist")->where($data)->select();
			if ($is_exit) {
				echo json_encode(array("code" => 10002, "msg" => "该规则已经存在！"));
				exit;
			} else {
				$datas = $data;
				$datas['operate_ip'] = getClientIp();
				$datas['indate'] = date('Y-m-d H:i:s');
				$datas['username'] = session('user_name');
				$datas['operate'] = 'add';
				$smsid = $db->table("blacklist")->insertGetId($data);
				if ($smsid) {
					$datas['alarm_id'] = $smsid;
					db('intelligent_alarm_log')->insert($datas);
					$send_content = session("sms_user") . " " . date("H:i:s", $datas['indate']) . " 新增" . $type . "黑名单：开始时间：" . ($data['strtime'] ? $data['strtime'] : "空") . ",结束时间：" . ($data['endtime'] ? $data['endtime'] : "空") . "，规则：" . ($data['keywords'] ? $data['keywords'] : "空");
					$rootpath = ROOT_PATH . "/backups/sms_send/";
					if (!is_dir($rootpath)) {
						@mkdir($rootpath, 0775, true);
					}
					$smsfile = $rootpath . "/add_" . date("YmdHis") . "txt";
					$filecont = fopen($smsfile, "w");
					fwrite($filecont, $send_content);
					fclose($filecont);
					return $this->success('ok', '', array('sms' => $smsfile));
				} else {
					return $this->error('数据库繁忙！');
				}
			}
		} else {
			return $this->error('参数错误');
		}
	}
	public function smsList() {
		return $this->fetch();
	}
	public function chart() {
		return $this->fetch();
	}
	public function addEq() {
		return $this->fetch();
	}
}