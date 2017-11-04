<?php
namespace app\index\controller;
use com\Baseinit;

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
		if (input("post.")) {
			return $this->success('ok', '', input('post.'));
		} else {
			return $this->err('参数错误');
		}
	}
	public function batch() {
		return $this->fetch('tool/hostbatch');
	}
}