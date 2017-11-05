<?php
namespace app\index\controller;
use com\Baseinit;
use think\Db;

class Host extends Baseinit {
	public function _initialize() {
		parent::_initialize();
		$this->assign("title", "系统工具");
	}
	/**
	 * 新上线主机添加
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-03T10:50:48+0800
	 */
	public function index() {
		return $this->fetch('tool/host');
	}
	/**
	 * 添加到数据库
	 */
	public function addPost() {
		// $locationarr[2] = "西三旗";
		// $locationarr[3] = "亦庄中金";
		// $locationarr[7] = "东单 ";
		// $osarr[1] = "AIX";
		// $osarr[2] = "Solaris";
		// $osarr[4] = "Windows";
		// $osarr[8] = "Linux";
		// $apparr[1] = "MQ";
		// $apparr[2] = "WAS";
		// $apparr[4] = "Oracle";
		// $apparr[8] = "TongEASY";
		// $apparr[16] = "Informix";
		// $apparr[32] = "CV";
		// $apparr[64] = "GTP";
		if (input("post.")) {
			$nodename = input("post.nodename");
			$hostname = input("post.hostname");
			$server_id = input("post.server_id");
			if (empty($nodename)) {
				return $this->error("节点名不能为空！");
			}
			if (empty($hostname)) {
				return $this->error("主机名不能为空！");
			}
			if (empty($server_id)) {
				return $this->error("服务ID不能为空！");
			}
			session("hostdata", input("post."));
			$this->singleData(input("post."));
			return $this->success('ok', '', input('post.'));
		} else {
			return $this->error('参数错误');
		}
	}
	/**
	 * 处理单个数据
	 * @param  string $data post提交的数据
	 */
	public function singleData($data = '') {
		//$data = session("hostdata");
		$index = REPORT_PATH . "index.html";
		$index_handle = fopen($index, "r") or die("index文件不存在");
		$old_index_content = fread($index_handle, filesize($index));
		fclose($index_handle);
		preg_match_all("/subcat = new Array().+\/\/end/is", $old_index_content, $old_index_matchs);
		$old_index_lists = $old_index_matchs[0][0];
		preg_match_all("/\(\"(.*)\"\);/", $old_index_lists, $old_index_datalists);

		//dump($old_index_datalists);
		$old_nums = count($old_index_datalists[1]);
		$new_add_list = "";
		$arrayid = $old_nums - 1;
		$txtcont = "";
		$new_into_data = "";
		$appid = '';
		foreach ($data['applist'] as $value) {
			$appid = (int) $appid + $value;
		}
		$old_nums = count($old_index_datalists[1]);
		$arrayid = $old_nums;
		$new_add_list .= 'subcat[' . $arrayid . ']= new Array("' . $data['nodename'] . '","' . $data['location_id'] . '","' . $data['server_id'] . '","' . trim($data['hostname']) . '","' . $data['os_type'] . '","' . $appid . '");' . "\r\n";

		$new_into_data = $data['nodename'] . "," . $data['location_id'] . "," . $data['server_id'] . "," . $data['hostname'] . "," . $data['os_type'] . "," . $appid . "\r\n";
		$into_data_all = '';
		foreach ($old_index_datalists[1] as $ov) {
			$ovl = explode(',', $ov);
			$templn = $m = '';
			foreach ($ovl as $cols) {
				$templn .= $m . trim($cols, '\"');
				$m = ",";
			}
			$into_data_all .= $templn . "\r\n";
		}
		$into_data_all . $new_into_data;
		$all_new_index_data = str_replace("//end", "", $old_index_lists) . $new_add_list . "//end";
		if (!is_dir(ROOT_PATH . "backups/index/" . date('Ym') . "/")) {
			mkdir(ROOT_PATH . "backups/index/" . date('Ym') . "/", 777, true);
		}
		copy($index, ROOT_PATH . "/backups/index/" . date('Ym') . "/" . date('YmdHis') . "-index.html");
		$indexh = fopen($index, "w+") or die("10001");
		$newcont = preg_replace("/subcat = new Array().+\/\/end/is", $all_new_index_data, $old_index_content);
		$update_index = fwrite($indexh, $newcont);
		fclose($indexh);
		unset($data['id']);
		unset($data['applist']);
		$data['apps'] = $appid;
		$data['userid'] = session("ADMIN_ID");
		$data['date'] = date("Y-m-d H:i:s");
		if (!Db::name("report_index_log")->where("hostname='" . $data['hostname'] . "'")->find()) {
			$res = Db::name("report_index_log")->insert($data);
		}
	}
	public function batch() {
		return $this->fetch("Tool/host_batch");
	}
	public function batchPost() {
		if (input("post.data")) {
			$data = str_replace("\r\n", "", input("post.data"));
			$data = str_replace("；", ";", $data);
			$lists = explode(";", $data);
			foreach ($lists as $key => $value) {
				if (empty($value)) {
					continue;
				}
				$value = str_replace("，", ",", $value);
				$arr = explode(",", $value);
				$insert['nodename'] = trim($arr[0]);
				$insert['location_id'] = trim($arr[1]);
				$insert['server_id'] = trim($arr[2]);
				$insert['hostname'] = trim($arr[3]);
				$insert['os_type'] = trim($arr[4]);
				$applist = trim(trim($arr[5], "["), "]");
				$applist = trim(trim($applist, "【"), "】");
				$insert['applist'] = explode("|", $applist);
				$this->singleData($insert);
			}
			return $this->success('ok');
		} else {
			return $this->error('参数错误');
		}
	}
}