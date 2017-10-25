<?php
namespace app\index\controller;
use think\Controller;
use think\Db;

class Menu extends Controller {
	function index() {
		$this->assign('title', '菜单管理');
		$list = db("mc_menu")->order('sort asc,id asc')->column('*', 'id');
		$list = int_to_string($list, array('hide' => array(1 => '是', 0 => '否')));
		if (!empty($list)) {
			$tree = new \com\Tree();
			$list = $tree->toFormatTree($list);
		}
		$this->assign('list', $list);
		return $this->fetch();
	}
	/**
	 * 新增菜单
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
	/**
	 * 编辑菜单
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-25T15:16:42+0800
	 */
	public function edit($id = 0) {
		if (input('post.')) {
			$post = input('post.');
			$id = $post['id'];
			if (db('mc_menu')->where("id='$id'")->update($post)) {
				return $this->success('编辑成功', url('menu/index'));
			} else {
				return $this->error($errormsg ? $errormsg : '数据未改变');
			};
		} else {
			$this->assign('title', '新增菜单');
			$info = db('mc_menu')->find($id);
			$menus = db('mc_menu')->select();
			$tree = new \com\Tree();
			$menus = $tree->toFormatTree($menus);
			if (!empty($menus)) {
				$menus = array_merge(array(0 => array('id' => 0, 'title_show' => '顶级菜单')), $menus);
			} else {
				$menus = array(0 => array('id' => 0, 'title_show' => '顶级菜单'));
			}
			$this->assign('Menus', $menus);
			if (false === $info) {
				return $this->error('获取后台菜单信息错误');
			}
			$this->assign('info', $info);
			return $this->fetch('edit');
		}
	}
	/**
	 * 删除菜单
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-25T16:07:40+0800
	 */
	public function del() {
		$id = $this->getArrayParam('id');

		if (empty($id)) {
			return $this->error('请选择要操作的数据!');
		}

		$map = array('id' => array('in', $id));
		if (db('Menu')->where($map)->delete()) {
			session('admin_menu_list', null);
			//记录行为
			action_log('update_menu', 'Menu', $id, session('user_auth.uid'));
			return $this->success('删除成功');
		} else {
			return $this->error('删除失败！');
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