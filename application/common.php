<?php
use think\Db;
use think\Request;

function a($name = '', $info = '') {
	if (empty($name)) {
		return $info . "不能为空!";
	} else {
		return 'ok';
	}
}
//参数错误返回json
function parameterErr() {
	echo json_encode(array("statu" => 'err', "msg" => "parameter err"));
	exit;
}
function int_to_string($data, $map = array()) {
	if ($data === false || $data === null) {
		return $data;
	}
	$data = (array) $data;
	foreach ($data as $key => $row) {
		foreach ($map as $col => $pair) {
			if (isset($row[$col]) && isset($pair[$row[$col]])) {
				$data[$key][$col . "_text"] = $pair[$row[$col]];
			}
		}
	}
	return $data;
}
/**
 * 密码加密处理
 * @param  [type] $pd    密码
 * @param  string $param 参数
 * @return string        加密后的字符串
 */
function md5_password($pd, $param = '') {
	if (empty($param)) {
		$param = 'zzh';
	}
	return md5(md5($pd) . $param);
}

/**
 * 获取网站根目录
 * @return string 网站根目录
 */
function get_root_path() {
	$request = Request::instance();
	$root = $request->root();
	$root = str_replace('/index.php', '', $root);
	if (defined('APP_NAMESPACE') && APP_NAMESPACE == 'api') {
		$root = preg_replace('/\/api$/', '', $root);
		$root = rtrim($root, '/');
	}
	return $root;
}
/**
 * CMF密码比较方法,所有涉及密码比较的地方都用这个方法
 * @param string $password 要比较的密码
 * @param string $passwordInDb 数据库保存的已经加密过的密码
 * @return boolean 密码相同，返回true
 */
function compare_password($password, $passwordInDb) {
	if (md5_password($password) == $passwordInDb) {
		return true;
	} else {
		return false;
	}
}
/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param boolean $adv 是否进行高级模式获取（有可能被伪装）
 * @return string
 */
function get_client_ip($type = 0, $adv = false) {
	return request()->ip($type, $adv);
}
/**
 * 生成用户 token
 * @param $userId
 * @param $deviceType
 * @return string 用户 token
 */
function generate_user_token($userId, $deviceType) {
	$userTokenQuery = Db::name("user_token")
		->where('user_id', $userId)
		->where('device_type', $deviceType);
	$findUserToken = $userTokenQuery->find();
	$currentTime = time();
	$expireTime = $currentTime + 24 * 3600 * 180;
	$token = md5(uniqid()) . md5(uniqid());
	if (empty($findUserToken)) {
		Db::name("user_token")->insert([
			'token' => $token,
			'user_id' => $userId,
			'expire_time' => $expireTime,
			'create_time' => $currentTime,
			'device_type' => $deviceType,
		]);
	} else {
		Db::name("user_token")
			->where('user_id', $userId)
			->where('device_type', $deviceType)
			->update([
				'token' => $token,
				'expire_time' => $expireTime,
				'create_time' => $currentTime,
			]);
	}

	return $token;
}
/**
 * 获取当前登录的管理员ID
 * @return int
 */
function get_current_admin_id() {
	return session('ADMIN_ID');
}
/**
 * 检查权限
 * @param $userId  int        要检查权限的用户 ID
 * @param $name string|array  需要验证的规则列表,支持逗号分隔的权限规则或索引数组
 * @param $relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
 * @return boolean            通过验证返回true;失败返回false
 */
function auth_check($userId, $name = null, $relation = 'or') {
	if (empty($userId)) {
		return false;
	}

	if ($userId == 1) {
		return true;
	}

	$authObj = new com\Auth();
	if (empty($name)) {
		$request = request();
		$module = $request->module();
		$controller = $request->controller();
		$action = $request->action();
		$name = strtolower($module . "/" . $controller . "/" . $action);
	}
	return $authObj->check($userId, $name, $relation);
}
