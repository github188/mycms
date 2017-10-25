<?php
namespace app\index\controller;
use think\Controller;
use think\Db;

class Menu extends Controller {
	function index() {
		$this->assign('title', '菜单管理');
		return $this->fetch();
	}
	/**
	 * 新增/编辑菜单
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-24T16:37:39+0800
	 */
	public function add() {
		if (input('post.')) {
			$post = input('post.');
			$db = db('mc_menu');
			$data['title'] = trim($post['title']);
			if ($db->insert($post)) {
				return $this->success('新增成功', url('menu/index'));
			} else {
				return $this->error($errormsg ? $errormsg : '数据库繁忙，请稍后重试！');
			};
		} else {
			$this->assign('title', '新增菜单');
			$menus = db('mc_menu')->select();
			$tree = new \com\Tree();
			$menus = $tree->toFormatTree($menus);
			if (!empty($menus)) {
				$menus = array_merge(array(0 => array('id' => 0, 'title_show' => '顶级菜单')), $menus);
			} else {
				$menus = array(0 => array('id' => 0, 'title_show' => '顶级菜单'));
			}
			$this->assign('Menus', $menus);
			return $this->fetch('edit');
		}
	}
	public function test() {
		$menus = db('mc_menu')->select();
		//dump($menus);
		$tree = new \com\Tree();
		$menus = $tree->toFormatTree($menus);
		if (!empty($menus)) {
			$menus = array_merge(array(0 => array('id' => 0, 'title_show' => '顶级菜单')), $menus);
		} else {
			$menus = array(0 => array('id' => 0, 'title_show' => '顶级菜单'));
		}
		// dump($menus);
		// exit;
		$this->assign('Menus', $menus);
		return $this->fetch('edit');
	}
}