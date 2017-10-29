<?php
namespace app\index\controller;
use com\Baseinit;

class Setting extends Baseinit {
	public function info() {
		return $this->fetch();
	}
	public function infoPost() {

	}
	public function password() {
		return $this->fetch();
	}
	public function passwordPost() {

	}

}