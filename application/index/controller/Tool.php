<?php
namespace app\index\controller;
use app\index\model\Blacklist;
use app\index\model\Hxtong;
use com\Baseinit;
use think\Db;

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
	public function gtp() {
		$res = DB::name('gtp_failfile')->order("id desc")->select();
		$this->assign('list', $res);

		return $this->fetch('Tool/gtpfilecheck');
	}
	/**
	 * 查询GTP传输失败文件
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-10T11:10:43+0800
	 */
	public function gtpPost() {
		if (input("post.strtime") && input("post.endtime")) {
			$strtime = trim(input("post.strtime"));
			$endtime = trim(input("post.endtime"));
			$rootpath = 'F:/gtp_file_check/';
			$filename = date("YmdHis");
			$cfile = $rootpath . $filename;
			$content = $strtime . " " . $endtime;
			$fopen = fopen($cfile, "w");
			fwrite($fopen, $content);
			fclose($fopen);
			$data['strtime'] = $strtime;
			$data['endtime'] = $endtime;
			$data['filename'] = $filename;
			$db = DB::name('gtp_failfile');
			$is_exit = $db->where($data)->find();
			if (!$is_exit) {
				$data['indate'] = date("Y-m-d H:i:s");
				$data['status'] = 'N';
				$db->insert($data);
				$this->checkingToTemp();
			}
			return $this->success("正在查询，请稍后！");
		} else {
			return $this->error('参数错误');
		}
	}
	/**
	 * 将正在等待返回结果的文件名写入缓存文件
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-10T12:06:16+0800
	 */
	public function checkingToTemp() {
		$db = DB::name('gtp_failfile');
		$res = $db->where("status!='Y'")->select();
		$content = $p = '';
		foreach ($res as $v) {
			$content .= $p . $v['filename'];
			$p = "\r\n";
		}
		$temp = "F:/gtp_file_check_result/checking_filename_temp.txt";
		$old_temp = glob("F:/gtp_file_check_result/checking_filename*");
		foreach ($old_temp as $val) {
			unlink($val);
		}
		$fopen = fopen($temp, "w");
		fwrite($fopen, $content);
		fclose($fopen);
	}
	/*
		    searchResult 查看结果文件是否返回
	*/
	public function searchResult() {
		$temp = "F:/gtp_file_check_result/checking_filename_temp.txt";
		$arrfile = explode("\n", file_get_contents($temp));
		foreach ($arrfile as $filename) {
			if (!$filename) {
				continue;
			}
			$allf = "F:/gtp_file_check_result/" . $filename . ".chkrult*";
			$chkfinish = "F:/gtp_file_check_result/" . $filename . ".chkfinish*";
			$file = glob($allf) ? glob($allf) : glob($chkfinish);
			if ($file) {
				$db = DB::name('gtp_failfile');
				$data['status'] = 'Y';
				$up = $db->where("filename='$filename'")->save($data);
			}
		}
	}
	/**
	 * 查看返回结果
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-10T16:46:20+0800
	 */
	public function scanResult() {
		if (input('get.filename')) {
			$db = DB::name('gtp_failfile');
			$filename = input('get.filename');
			$allf = "F:/gtp_file_check_result/" . $filename . ".chkrult*";
			$chkfinish = "F:/gtp_file_check_result/" . $filename . ".chkfinish*";
			$file = glob($allf) ? glob($allf) : glob($chkfinish);
			if ($file) {
				$result = $file[0];
				$content = explode("\n", file_get_contents($result));
				$show = '';
				foreach ($content as $v) {
					$show .= $v . "<br>";
				}
				$data['status'] = 'Y';
				$data['result'] = $show;
				$up = $db->where("filename='$filename'")->update($data);
				return $this->success($show, '', array('file' => $file, 'a' => $allf));
			} else {
				$is_ok = $db->where("filename='$filename'")->find();
				if ($is_ok['status'] == 'Y') {
					return $this->error('del');
				} else {
					return $this->error('正在查询,请稍后！');
				}
			}
		} else {
			return $this->error("参数错误！");
		}
	}
	/**
	 * 删除GTP失败文件查询记录
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-13T17:08:43+0800
	 * @return [type]                   [description]
	 */
	public function delResult() {
		return $this->error("正在开发操作权限功能");
	}
	public function delGtpErrHistory() {
		if (trim(input('get.filename'))) {
			$db = DB::name('gtp_failfile');
			$filename = trim(input('get.filename'));
			$delete = $db->where("filename='$filename'")->delete();
			if ($delete) {
				return $this->success('删除成功！');
			} else {
				return $this->error('数据库繁忙，请稍后重试！');
			}
		} else {
			return $this->error("参数错误！");
		}
	}
	/**
	 * GTP传输失败文件查询
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-13T10:59:14+0800
	 */
	public function file() {
		$db = DB::name("cloud_check");
		$allinfo = $db->order("check_time desc")->select();
		if (!$allinfo) {
			$allinfo = 0;
		}
		$this->assign('data', $allinfo);
		return $this->fetch('tool/file');
	}
	/**
	 * GTP传输失败查询Post
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-13T10:59:37+0800
	 */
	public function filePost() {
		if (input('post.')) {
			$nodename = trim(input("post.nodename"));
			$filename = trim(input("post.filename"));
			$sendfile = trim(input("post.sendfile"));
			if (!$nodename) {
				return $this->error('节点名称不能为空');
			}
			if (!$sendfile) {
				return $this->error('发送目录不能为空');
			}
			if (!$filename) {
				return $this->error('文件名不能为空');
			}
			$cont = $nodename . "#" . $sendfile . "#" . $filename;
			$url = ROOT_PATH . "../report/public/gtpCheck/$nodename/send";
			if (!is_dir($url)) {
				mkdir($url, 0777, true);
			}
			$namedate = date("YmdHis");
			$save_filename = "gtp_search_" . $namedate . ".txt";
			$recv_filename = "gtp_recv_" . $namedate . ".txt";
			$filepath = $url . "/" . $save_filename;
			$db = DB::name("cloud_check");
			$data = input('post.');
			$myfile = fopen($filepath, "w") or die("Unable to open file!");
			fwrite($myfile, $cont);
			fclose($myfile);
			$data['userid'] = session("ADMIN_ID");
			$data['check_time'] = date("Y-m-d H:i:s");
			$data['check_status'] = 0;
			$data['save_filename'] = $filepath;
			$data['recv_filename'] = $url = ROOT_PATH . "../report/public/gtpCheck/$nodename/recv/" . $recv_filename;
			$addres = $db->insert($data);
			$userid = session("ADMIN_ID");
			$allinfo = $db->order("check_time desc")->select();
			if ($addres) {
				return $this->success('正在查询，请稍后！', '', $allinfo);
			} else {
				return $this->error('数据文件生成失败');
			}

		} else {
			return $this->error('参数错误');
		}
	}
	/**
	 * 展示GTP失败文件查询结果
	 */
	public function showRecv() {
		if (input('post.id') && trim(input("post.file"))) {
			$id = trim(input("post.id"));
			$file = trim(input("post.file"));
			if (file_exists($file)) {
				$fp = fopen($file, "r");
				$str = "";
				$buffer = 1024; //每次读取 1024 字节
				while (!feof($fp)) {
//循环读取，直至读取完整个文件
					$str .= fread($fp, $buffer);
				}
				$str = str_replace("\r\n", "<br/>", $str);
				$str = str_replace("\n", "<br/>", $str);
				$content = $str;
				return $this->success($content);
			} else {
				return $this->error("返回文件不存在！");
			}

		} else {
			return $this->error('参数错误');
		}
	}
	/**
	 * 删除GTP失败文件的查询记录
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-13T13:59:07+0800
	 */
	public function delGTPCheck() {
		if (input('get.id')) {
			$id = trim(input("get.id"));
			$info = DB::name("cloud_check")->where(" cloudid='$id'")->find();
			if ($info) {
				if (DB::name("cloud_check")->where(" cloudid='$id'")->delete()) {
					@unlink(realpath(trim($data['save_filename'])));
					@unlink(realpath(trim($data['recv_filename'])));
				}
			}
			return $this->success('已删除');
		} else {
			return $this->error('参数错误');
		}
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
			$type = $data['type'];
			$data['strtime'] = trim(input('post.strtime')) ? trim(input('post.strtime')) : Null;
			$data['endtime'] = trim(input('post.endtime')) ? trim(input('post.endtime')) : Null;
			$data['keywords'] = trim(input('post.keywords')) ? trim(input('post.keywords')) : Null;
			if (strtotime($data['strtime']) > strtotime($data['endtime'])) {
				return $this->error("开始时间不能大于结束时间！");
			}
			$db = new Blacklist();
			$is_exit = $db->table("blacklist")->where($data)->find();
			if ($is_exit) {
				return $this->error("该规则已经存在！");
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
					$send_content = session("user_name") . " " . date("H:i:s") . " 新增" . $type . "短信过滤规则：开始时间：" . ($data['strtime'] ? $data['strtime'] : "空") . ",结束时间：" . ($data['endtime'] ? $data['endtime'] : "空") . "，过滤关键字：" . ($data['keywords'] ? $data['keywords'] : "空");
					$rootpath = ROOT_PATH . "/backups/black_sms/";
					if (!is_dir($rootpath)) {
						@mkdir($rootpath, 0775, true);
					}
					$smsfile = $rootpath . "/Add_" . $type . "_" . date("YmdHis") . ".txt";
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