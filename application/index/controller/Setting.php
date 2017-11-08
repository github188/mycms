<?php
namespace app\index\controller;
use com\Baseinit;
use think\Db;

class Setting extends Baseinit {
	public function info() {
		$this->assign('info', DB::name('user')->where("id='" . session("ADMIN_ID") . "'")->find());
		return $this->fetch();
	}
	/**
	 * 提交个人信息修改
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-07T16:02:03+0800
	 */
	public function infoPost() {
		if (input("post.")) {
			$id = input("post.id");
			if ($id != session("ADMIN_ID")) {
				return $this->error("非法操作");
			}
			$is_e = DB::name('user')->where("id='$id'")->find();
			if ($is_e) {
				DB::name('user')->where("id='$id'")->update(input("post."));
				return $this->success("ok");
			} else {
				return $this->error("用户信息不存在！");
			}
		} else {
			return false;
		}
	}
	public function password() {
		$this->assign('id', session("ADMIN_ID"));
		return $this->fetch();
	}
	/**
	 * 提交个人密码修改
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-07T16:01:34+0800
	 */
	public function passwordPost() {
		if (input("post.old_password") && input("post.user_password")) {
			$id = session("ADMIN_ID");
			$pw = md5(md5(input("post.old_password")) . "zzh");
			$newpw = md5(md5(input("post.user_password")) . "zzh");
			if ($pw === $newpw) {
				return $this->error("新旧密码不能相同！");
			}
			$is_e = DB::name('user')->where("id='$id' and user_password='$pw'")->find();
			if ($is_e) {
				if (DB::name('user')->where("id='$id' and user_password='$pw'")->update(array('user_password' => $newpw))) {
					return $this->success("ok");
				} else {
					return $this->error("请重试");
				}

			} else {
				return $this->error("原密码错误");
			}
		} else {
			return $this->error("参数错误！");
		}
	}
	/**
	 * 验证原密码是否正确
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-11-07T16:54:51+0800
	 */
	public function checkPassword() {
		if (input("post.pw")) {
			$id = session("ADMIN_ID");
			$pw = md5(md5(input("post.pw")) . "zzh");
			$is_e = DB::name('user')->where("id='$id' and user_password='$pw'")->find();
			if ($is_e) {
				return $this->success("ok");
			} else {
				return $this->error("原密码错误");
			}
		} else {
			return $this->error("参数错误！");
		}
	}
}