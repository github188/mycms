<?php
namespace app\index\controller;
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