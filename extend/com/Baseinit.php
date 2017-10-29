<?php
namespace com;
use app\index\model\Menu;
use think\Controller;
use think\Db;
use think\Request;

class Baseinit extends Controller {
	public function _initialize() {
		$session_admin_id = session('ADMIN_ID');
		if (!empty($session_admin_id)) {
			$user = Db::name('user')->where(['id' => $session_admin_id])->find();

			if (!$this->checkAccess($session_admin_id)) {
				$this->error("您没有访问权限！");
			}
			$this->assign("admin", $user);
		} else {
			if ($this->request->isPost()) {
				$this->error("您还没有登录！", url("index/publics/login"));
			} else {
				header("Location:" . url("index/publics/login"));
				exit();
			}
		}
		$this->initMenu();
		$this->assign("menus", session("menus"));
		$this->assign('userinfo', session('userinfo'));
	}
	/**
	 * 初始化后台菜单
	 */
	public function initMenu() {
		$menuModel = new Menu();
		$menus = $menuModel->menuTree();
		session("menus", $menus);
		return $menus;
	}
	/**
	 *  检查后台用户访问权限
	 * @param int $userId 后台用户id
	 * @return boolean 检查通过返回true
	 */
	private function checkAccess($userId) {
		// 如果用户id是1，则无需判断
		if ($userId == 1) {
			return true;
		}

		$module = $this->request->module();
		$controller = $this->request->controller();
		$action = $this->request->action();
		$rule = $module . $controller . $action;

		$notRequire = ["adminIndexindex", "adminMainindex"];
		if (!in_array($rule, $notRequire)) {
			return auth_check($userId);
		} else {
			return true;
		}
	}
}