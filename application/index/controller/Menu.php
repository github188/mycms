<?php
namespace app\index\controller;
use com\Baseinit;
use com\Tree;
use think\Db;

class Menu extends Baseinit {
	public function _initialize() {
		parent::_initialize();
		$this->assign("title", "菜单管理");
	}
	public function index() {
		session('admin_menu_index', 'Menu/index');
		$result = Db::name('menu')->order(["list_order" => "ASC"])->select();
		$tree = new Tree();
		$tree->icon = ['&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ '];
		$tree->nbsp = '&nbsp;&nbsp;&nbsp;';
		$newMenus = [];
		foreach ($result as $m) {
			$newMenus[$m['id']] = $m;
		}
		foreach ($result as $key => $value) {

			$result[$key]['pid_node'] = ($value['pid']) ? ' class="child-of-node-' . $value['pid'] . '"' : '';
			$result[$key]['style'] = empty($value['pid']) ? '' : 'display:none;';
			$result[$key]['str_manage'] = '<a href="' . url("Menu/add", ["pid" => $value['id']])
			. '">添加子菜单 </a>  <a href="' . url("Menu/edit", ["id" => $value['id']])
			. '">编辑</a>  <a class="js-ajax-delete" href="' . url("Menu/delete", ["id" => $value['id']]) . '">删除</a> ';
			$result[$key]['status'] = $value['status'] ? "显示" : "隐藏";
			if (APP_DEBUG) {
				$result[$key]['app'] = $value['app'] . "/" . $value['controller'] . "/" . $value['action'];
			}
		}
		$tree->init($result);
		$str = "<tr id='node-\$id' \$pid_node style='\$style'>
                        <td style='padding-left:20px;'><input name='list_orders[\$id]' type='text' size='3' value='\$list_order' class='input input-order'></td>
                        <td>\$id</td>
                        <td>\$spacer\$name</td>
                        <td>\$app</td>
                        <td>\$status</td>
                        <td>\$str_manage</td>
                    </tr>";
		$category = $tree->getTree(0, $str);
		$this->assign("category", $category);
		return $this->fetch();
	}
	/**
	 * 新增菜单
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-24T16:37:39+0800
	 */
	public function add($pid = 0) {
		$tree = new Tree();
		$parentId = $pid;
		$result = Db::name('menu')->order(["list_order" => "ASC"])->select();
		$array = [];
		foreach ($result as $r) {
			$r['selected'] = $r['id'] == $parentId ? 'selected' : '';
			$array[] = $r;
		}
		$str = "<option value='\$id' \$selected>\$spacer \$name</option>";
		$tree->init($array);
		$selectCategory = $tree->getTree(0, $str);
		$this->assign("select_category", $selectCategory);
		$this->assign("info", array("posturl" => url("Menu/addPost")));
		return $this->fetch("menu/edit");
	}
	public function addPost() {
		if (input('post.')) {
			$data = input('post.');
			try {
				$res = Db::name('menu')->strict(false)->field(true)->insert($data);
			} catch (\Exception $e) {
				return $this->error($e, 'system_error', $data);
				exit;
			}

			$app = input("post.app");
			$controller = input("post.controller");
			$action = input("post.action");
			$param = input("post.param");
			$authRuleName = "$app/$controller/$action";
			$menuName = input("post.name");
			$findAuthRuleCount = Db::name('auth_rule')->where([
				'app' => $app,
				'name' => $authRuleName,
				'type' => 'admin_url',
			])->count();
			if (empty($findAuthRuleCount)) {
				Db::name('auth_rule')->insert([
					"name" => $authRuleName,
					"app" => $app,
					"type" => "admin_url", //type 1-admin rule;2-user rule
					"title" => $menuName,
					'param' => $param,
				]);
			}
			if ($res) {
				return $this->success('ok', url("index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			return $this->error("数据为空！");
		}
	}
	/**
	 * 编辑菜单
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-25T15:16:42+0800
	 */
	public function edit($id = 0) {
		$tree = new Tree();
		$rs = Db::name('menu')->where(["id" => $id])->find();
		$rs['posturl'] = url("Menu/editPost");
		$result = Db::name('menu')->order(["list_order" => "ASC"])->select();
		$array = [];
		foreach ($result as $r) {
			$r['selected'] = $r['id'] == $rs['pid'] ? 'selected' : '';
			$array[] = $r;
		}
		$str = "<option value='\$id' \$selected>\$spacer \$name</option>";
		$tree->init($array);
		$selectCategory = $tree->getTree(0, $str);
		$this->assign("info", $rs);
		$this->assign("select_category", $selectCategory);
		return $this->fetch();
	}
	/**
	 * 后台菜单编辑提交保存
	 * @menu(
	 *     'name'   => '后台菜单编辑提交保存',
	 *     'parent' => 'index',
	 *     'display'=> false,
	 *     'hasView'=> false,
	 *     'order'  => 10000,
	 *     'icon'   => '',
	 *     'remark' => '后台菜单编辑提交保存',
	 *     'param'  => ''
	 * )
	 */
	public function editPost() {
		if (input("post.")) {
			$id = input("post.id");
			$oldMenu = Db::name('menu')->where(['id' => $id])->find();
			Db::name('menu')->strict(false)->field(true)->where(['id' => $id])->update(input("post."));
			$app = input("post.app");
			$controller = input("post.controller");
			$action = input("post.action");
			$param = input("post.param");
			$authRuleName = "$app/$controller/$action";
			$menuName = input("post.name");

			$findAuthRuleCount = Db::name('auth_rule')->where([
				'app' => $app,
				'name' => $authRuleName,
				'type' => 'admin_url',
			])->count();
			if (empty($findAuthRuleCount)) {
				$oldApp = $oldMenu['app'];
				$oldController = $oldMenu['controller'];
				$oldAction = $oldMenu['action'];
				$oldName = "$oldApp/$oldController/$oldAction";
				$findOldRuleId = Db::name('auth_rule')->where(["name" => $oldName])->value('id');
				if (empty($findOldRuleId)) {
					Db::name('auth_rule')->insert([
						"name" => $authRuleName,
						"app" => $app,
						"type" => "admin_url",
						"title" => $menuName,
						"param" => $param,
					]); //type 1-admin rule;2-user rule
				} else {
					Db::name('auth_rule')->where(['id' => $findOldRuleId])->update([
						"name" => $authRuleName,
						"app" => $app,
						"type" => "admin_url",
						"title" => $menuName,
						"param" => $param]); //type 1-admin rule;2-user rule
				}
			} else {
				Db::name('auth_rule')->where([
					'app' => $app,
					'name' => $authRuleName,
					'type' => 'admin_url',
				])->update(["title" => $menuName, 'param' => $param]); //type 1-admin rule;2-user rule
			}
			return $this->success("保存成功！", url("Menu/index"));
		}
	}
	/**
	 * 后台菜单删除
	 * @menu(
	 *     'name'   => '后台菜单删除',
	 *     'parent' => 'index',
	 *     'display'=> false,
	 *     'hasView'=> false,
	 *     'order'  => 10000,
	 *     'icon'   => '',
	 *     'remark' => '后台菜单删除',
	 *     'param'  => ''
	 * )
	 */
	public function delete($id) {
		$count = Db::name('menu')->where(["pid" => $id])->count();
		$oldMenu = Db::name('menu')->where(["id" => $id])->find();
		$oldApp = $oldMenu['app'];
		$oldController = $oldMenu['controller'];
		$oldAction = $oldMenu['action'];
		$oldName = "$oldApp/$oldController/$oldAction";
		if ($count > 0) {
			$this->error("该菜单下还有子菜单，无法删除！");
		}
		if (Db::name('menu')->delete($id) !== false) {
			Db::name('auth_rule')->where(["name" => $oldName])->delete();
			$this->success("删除菜单成功！");
		} else {
			$this->error("删除失败！");
		}
	}
	public function test() {

	}
}