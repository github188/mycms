<?php
namespace app\index\controller;
use com\Baseinit;

class Report extends Baseinit {
	public function _empty($name) {
		return $this->developing();
	}
	public function index() {
		return $this->fetch('iframe');
	}

}