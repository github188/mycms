<?php
namespace app\index\controller;
use com\Baseinit;
use think\Db;

class Link extends Baseinit {
	/**
	 * 超链接管理首页
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-08T16:25:05+0800
	 */
	public function index() {
		$result = DB::name('link')->where('status=1')->select();
		$this->assign("list", $result);
		return $this->fetch();
	}
	public function add() {
		return $this->fetch("link/edit");
	}
	/**
	 * 添加超链
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-08T14:48:21+0800
	 */
	public function addPost() {
		if (input('post.')) {
			$data = input('post.');
			unset($data['id']);
			try {
				$res = Db::name('link')->strict(false)->field(true)->insert($data);
			} catch (\Exception $e) {
				return $this->error($e, 'system_error', $data);
				exit;
			}
			if ($res) {
				return $this->success('ok', url("Link/index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			return $this->error("数据为空！");
		}
	}
	/**
	 * 编辑超链页面
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-08T16:55:49+0800
	 */
	public function edit($id = 0) {

	}
}