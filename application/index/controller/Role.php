<?php
namespace app\index\controller;
use app\index\model\Menu;
use com\Baseinit;
use com\Tree;
use think\Db;

class Role extends Baseinit {
	public function _initialize() {
		parent::_initialize();
		$this->assign("title", "角色管理");
	}
	public function index() {
		$this->assign('title', '角色管理');
		$list = db('role')->select();
		$this->assign('list', $list);
		return $this->fetch();
	}
	public function checkName($role_name = '', $id = 0) {
		if (!empty($role_name)) {
			$sid = db('role')->where("role_name='$role_name'")->value('id');
			if ($sid) {
				if (!empty($id) && $sid == $id) {
					return $this->success("ok");
				} else {
					return $this->error("角色已经存在");
				}
			} else {
				return $this->success("ok");
			}
			// if (db('role')->where()->find()) {
			// 	return $this->error("角色已经存在");
			// } else {
			// 	return $this->success("ok");
			// };
		} else {
			return $this->error("参数错误！");
		}
	}
	public function add() {
		$this->assign("title", "新增角色");
		if (input("post.")) {
			$data = input("post.");
			unset($data['id']);
			$data['create_time'] = time();
			try {
				$res = db("role")->insert($data);
			} catch (\Exception $e) {
				return $this->error($e, 'system_error', $data);
				exit;
			}
			if ($res) {
				return $this->success('ok', url("index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			return $this->fetch('edit');
		}
	}
	public function edit($id = 0) {
		$this->assign("title", "新增角色");
		if (input("post.")) {
			$data = input("post.");
			$data['update_time'] = time();
			try {
				$res = db("role")->where(array("id" => $data['id']))->update($data);
			} catch (\Exception $e) {
				return $this->error($e, 'system_error', $data);
				exit;
			}
			if ($res) {
				return $this->success('ok', url("index"));
			} else {
				return $this->error("数据库繁忙！");
			}
		} else {
			$info = db("role")->find($id);
			$this->assign("info", $info);
			return $this->fetch('edit');
		}
	}
	/*
		del 删除角色
	*/
	public function del($id = 0) {
		if ($id == 1) {
			$this->error("超级管理员角色不能被删除！");
		}
		$count = Db::name('RoleUser')->where(['role_id' => $id])->count();
		if ($count > 0) {
			$this->error("该角色已经有用户！");
		} else {
			$status = Db::name('role')->delete($id);
			if (!empty($status)) {
				Db::name('AuthAccess')->where("role_id='$id'")->delete();
				$this->success("删除成功！", url('Role/index'));
			} else {
				$this->error("删除失败！");
			}
		}
	}
	/**
	 * 设置角色权限
	 * @adminMenu(
	 *     'name'   => '设置角色权限',
	 *     'parent' => 'index',
	 *     'display'=> false,
	 *     'hasView'=> true,
	 *     'order'  => 10000,
	 *     'icon'   => '',
	 *     'remark' => '设置角色权限',
	 *     'param'  => ''
	 * )
	 */
	public function auth($id) {
		$auth_access = Db::name("auth_access");
		$adminMenuModel = new Menu();
		$roleId = $id;
		if (empty($roleId)) {
			$this->error("参数错误！");
		}
		$tree = new Tree();
		$tree->icon = ['│ ', '├─ ', '└─ '];
		$tree->nbsp = '&nbsp;&nbsp;&nbsp;';

		$result = $adminMenuModel->menuCache();

		$newMenus = [];
		$privilegeData = $auth_access->where(["role_id" => $roleId])->column("rule_name"); //获取权限表数据
		foreach ($result as $m) {
			$newMenus[$m['id']] = $m;
		}
		foreach ($result as $n => $t) {
			$result[$n]['checked'] = ($this->_isChecked($t, $privilegeData)) ? ' checked' : '';
			$result[$n]['level'] = $this->_getLevel($t['id'], $newMenus);
			$result[$n]['style'] = empty($t['pid']) ? '' : 'display:none;';
			$result[$n]['parentIdNode'] = ($t['pid']) ? ' class="child-of-node-' . $t['pid'] . '"' : '';
		}

		$str = "<tr id='node-\$id'\$parentIdNode  style='\$style'>
                   <td style='padding-left:30px;'>\$spacer<input type='checkbox' name='menuId[]' value='\$id' level='\$level' \$checked onclick='javascript:checknode(this);'> \$name</td>
    			</tr>";
		$tree->init($result);
		$info = Db::name("role")->field('role_name')->find($roleId);
		$category = $tree->getTree(0, $str);
		$this->assign("info", $info);
		$this->assign("category", $category);
		$this->assign("roleId", $roleId);
		return $this->fetch();
	}
	/**
	 * 检查指定菜单是否有权限
	 * @param array $menu menu表中数组
	 * @param $privData
	 * @return bool
	 */
	private function _isChecked($menu, $privData) {
		$app = $menu['app'];
		$model = $menu['controller'];
		$action = $menu['action'];
		$name = strtolower("$app/$model/$action");
		if ($privData) {
			if (in_array($name, $privData)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}
	/**
	 * 获取菜单深度
	 * @param $id
	 * @param array $array
	 * @param int $i
	 * @return int
	 */
	protected function _getLevel($id, $array = [], $i = 0) {
		if ($array[$id]['pid'] == 0 || empty($array[$array[$id]['pid']]) || $array[$id]['pid'] == $id) {
			return $i;
		} else {
			$i++;
			return $this->_getLevel($array[$id]['pid'], $array, $i);
		}
	}
	/**
	 * 角色授权提交
	 * @adminMenu(
	 *     'name'   => '角色授权提交',
	 *     'parent' => 'index',
	 *     'display'=> false,
	 *     'hasView'=> false,
	 *     'order'  => 10000,
	 *     'icon'   => '',
	 *     'remark' => '角色授权提交',
	 *     'param'  => ''
	 * )
	 */
	public function authPost() {
		if (input("post.")) {
			$roleId = input("post.roleId");
			if (!$roleId) {
				return $this->error("需要授权的角色不存在！", url("Role/index"));
			}
			$menuIds = input("post.")['menuId'];
			if (is_array($menuIds) && count($menuIds) > 0) {
				Db::name("auth_access")->where(["role_id" => $roleId, 'type' => 'admin_url'])->delete();
				foreach ($menuIds as $menuId) {
					$menu = Db::name("menu")->where(["id" => $menuId])->field("app,controller,action")->find();
					if ($menu) {
						$app = $menu['app'];
						$model = $menu['controller'];
						$action = $menu['action'];
						$name = strtolower("$app/$model/$action");
						Db::name("auth_access")->insert(["role_id" => $roleId, "rule_name" => $name, 'type' => 'admin_url']);
					}
				}

				return $this->success("授权成功！");
			} else {
				//当没有数据时，清除当前角色授权
				Db::name("auth_access")->where(["role_id" => $roleId])->delete();
				return $this->success("授权成功！");
			}
		}
	}
}