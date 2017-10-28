<?php
namespace com;
class Tree_bak {
	protected $formatTree;
	public function listToTree($list, $pk = 'id', $pid = 'pid', $child = '_child', $root = 0) {
		// 创建Tree
		$tree = array();
		if (is_array($list)) {
			// 创建基于主键的数组引用
			$refer = array();
			foreach ($list as $key => $data) {
				$refer[$data[$pk]] = &$list[$key];
			}
			foreach ($list as $key => $data) {
				// 判断是否存在parent
				$parentId = $data[$pid];
				if ($root == $parentId) {
					$tree[] = &$list[$key];
				} else {
					if (isset($refer[$parentId])) {
						$parent = &$refer[$parentId];
						$parent['childs'][] = $data['id'];
						$parent[$child][] = &$list[$key];
					}
				}
			}
		}
		return $tree;
	}
	/**
	 * 生成深度为1的数组
	 * @author 钟朝辉 <zzhhuii@qq.com>
	 * @date   2017-10-25T11:40:21+0800
	 * @param  array                   $tree  数组
	 * @param  integer                  $level 深度
	 * @return 数组
	 */
	public function _toFormatTree($tree, $level = 1) {
		foreach ($tree as $key => $value) {
			$temp = $value;
			if (isset($temp['_child'])) {
				$temp['_child'] = true;
				$temp['level'] = $level;
			} else {
				$temp['_child'] = false;
				$temp['level'] = $level;
			}
			array_push($this->formatTree, $temp);
			if (isset($value['_child'])) {
				$this->_toFormatTree($value['_child'], ($level + 1));
			}
		}
	}
	public function cat_empty_deal($cat, $next_parentid, $pid = 'pid', $empty = "&nbsp;&nbsp;&nbsp;") {
		$str = "";
		if ($cat[$pid]) {
			for ($i = 2; $i < $cat['level']; $i++) {
				$str .= $empty . "|";
			}
			if ($cat[$pid] != $next_parentid && !$cat['_child']) {
				$str .= $empty . "└─&nbsp;";
			} else {
				$str .= $empty . "├─&nbsp;";
			}
		}
		return $str;
	}
	public function toFormatTree($list, $name = 'name', $pk = 'id', $pid = 'pid', $root = 0) {
		if (empty($list)) {
			return false;
		}
		$list = $this->listToTree($list, $pk, $pid, '_child', $root);
		$this->formatTree = array();
		$this->_toFormatTree($list);
		foreach ($this->formatTree as $key => $value) {
			$index = ($key + 1);
			$next_parentid = isset($this->formatTree[$index][$pid]) ? $this->formatTree[$index][$pid] : '';
			$value['level_show'] = $this->cat_empty_deal($value, $next_parentid);
			$value['name_show'] = $value['level_show'] . $value[$name];
			$data[] = $value;
		}
		return $data;
	}
}