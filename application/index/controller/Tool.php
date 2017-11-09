<?php
namespace app\index\controller;
use app\index\model\Blacklist;
use app\index\model\Hxtong;
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
	/**
	 * 添加黑名单规则
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-09T09:59:15+0800
	 * @return [type]                   [description]
	 */
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
			$is_exit = $db->table("blacklist")->where($data)->find();
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
	/**
	 * 查看短信黑名单列表
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-09T09:59:39+0800
	 * @return [type]                   [description]
	 */
	public function smsList() {
		$db = new Blacklist();
		$list = $db->table("blacklist")->select()->toArray();
		$this->assign("list", $list);
		//dump($list);exit;
		return $this->fetch();
	}
	/**
	 * 短信黑名单节点名提示
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-09T10:04:59+0800
	 */
	public function getSmsNode() {
		if (input("get.type")) {
			$type = input("get.type");
			switch ($type) {
			case 'TE':
				$db = new Hxtong();
				$res = $db->table('t_teinfo')->field('sys_name')->group("sys_name")->order("sys_name asc")->select()->toArray();
				return $this->success('ok', '', $res);
				break;
			case 'GTP':
				$db = new \app\index\model\Hxgtp();
				$res = $db->table('gtp_main_info')->field('sysname')->group("sysname")->order("sysname asc")->select()->toArray();
				return $this->success('ok', '', $res);
				break;
			case 'MQ':
				$db = new \app\index\model\Hxmqm2();
				$res = $db->table('maint_phone')->field('sysname')->group("sysname")->order("sysname asc")->select()->toArray();
				return $this->success('ok', '', $res);
				break;
			default:
				break;
			}
		} else {
			return $this->error('参数错误');
		}
	}
	/**
	 * 根据系统名查找节点名
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-09T11:35:28+0800
	 * @return [type]                   [description]
	 */
	public function getSmsNodeName() {
		if (input("get.sysname") && input("get.type")) {
			$type = trim(input("get.type"));
			$sysname = trim(input("get.sysname"));
			switch ($type) {
			case 'TE':
				$db = new Hxtong();
				$res = $db->table('t_teinfo')->where("sys_name='$sysname'")->field('node_name')->select()->toArray();
				return $this->success('ok', '', $res);
				break;
			case 'GTP':
				$db = new \app\index\model\Hxgtp();
				$res = $db->table('gtp_main_info')->where("sysname='$sysname'")->field('nodename')->select()->toArray();
				return $this->success('ok', '', $res);
				break;
			case 'MQ':
				$db = new \app\index\model\Hxmqm2();
				$res = $db->table('maint_phone')->where("sysname='$sysname'")->field('qmname')->select()->toArray();
				return $this->success('ok', '', $res);
				break;
			default:
				break;
			}
		} else {
			return $this->error('参数错误');
		}
	}
	public function chart() {
		return $this->fetch();
	}
	public function addEq() {
		return $this->fetch();
	}
}