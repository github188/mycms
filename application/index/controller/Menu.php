<?php
namespace app\index\controller;
use think\Controller;
class Menu extends Controller{
	function index(){
		$this->assign('title','菜单管理');
		return $this->fetch();
	}
	/**
	 * 新增/编辑菜单
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-24T16:37:39+0800
	 */
	public function add(){  
		if(request()->isPost()){ 
			return $this->success('新增成功', input("post."));
		}else{
			$this->assign('title','新增菜单');
			return $this->fetch('edit');
		} 
	}
}