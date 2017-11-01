<?php

global $mqarr;
global $mqsee;
global $nav;
global $example1;
global $exportarr;
global $rearray;
global $msp; //月份转换
global $taskarr;
global $quarr;
global $gtpinfo;
global $easyarr;
global $easexamp;
global $power;
global $os_aix;
global $os_hardware;
global $mreport_class;
global $dblarr;
global $mqiarr;
global $nshowks;
global $mqywarr;
global $address;
global $mqywsc;
global $pagesize;
global $tongeasy_appout;
global $waskey;
global $was_example;
$waskey = array(
    'osenvir' => '系统环境',
    'osclass' => '系统分类',
    'osname' => '系统名称',
    'hostname' => '主机名称',
    'manager_ip' => '管理IP',
    'username' => '用户名',
    'was_ver' => 'Was版本号',
    'add_date' => '添加/修改日期'
);
$was_example = array(
    'osenvir' => '系统环境',
    'osclass' => '手机银行',
    'osname' => '手机生活系统',
    'hostname' => 'sjshap1',
    'manager_ip' => '108.201.194.10',
    'username' => 'was',
    'was_ver' => '8.0.0.5',
    'add_date' => '2014-06-07'
);
$tongeasy_appout = array(
    'id' => '序号',
    'app_name' => '应用名称',
    'nodenum' => '节点个数'
);
$pagesize = 16;
$example1 = array(
    'os_name' => '例如：AMFE数据库1机',
    'setting' => '例如：生产',
    'hostname' => '例如：amfedb1',
    'os_ver' => '例如：AIX 7.1.0.0',
    'ip' => '例如：102.200.129.93 ',
    'mq_ver' => '例如：7.0.1.11',
    'pattern' => '例如：HA',
    'qm_name' => '例如：QM_MTPS_0003040000_01',
    'qm_status' => '例如：Runing',
    'backups' => '',
    'mq_explain' => '',
    'serve_ip' => '例如：102.80.34.18',
    'manager' => '例如：马勇13910592436'
);
$example2 = array(
    'os_name' => '例如：AMFE数据库1机',
    'mq_date' => '2014.9.3',
    'setting' => '生产',
    'ip' => '例如：102.200.129.93',
    'password' => 'root',
    'os_ver' => '例如：AIX 7.1.0.0',
    'hostname' => '例如：amfedb1',
    'os_limit' => '无限制',
    'file_logsize' => '/usr/mqm ；/var/mqm剩余4.47G',
    'mq_ver' => '例如：7.0.1.11',
    'pattern' => 'HA',
    'manager' => '例如：马勇13910592436',
    'cscript' => '项目组提供脚本',
    'mq_explain' => '/dev/lv_mqm /dev/lv_mq_log',
    'doit' => '杨光',
    'other' => ''
);
$mqywsc = array(
    'os_name' => '系统（项目）名称',
    'setting' => '环境',
    'hostname' => '主机名',
    'os_ver' => '系统类型及版本',
    'ip' => '管理IP',
    'mq_ver' => 'MQ版本',
    'pattern' => '模式',
    'qm_name' => '队列管理器名称',
    'qm_status' => '队列管理器状态',
    'backups' => '备份情况',
    'mq_explain' => '其他说明',
    'serve_ip' => '服务IP',
    'manager' => '负责人和联系方式'
);
$mqywarr = array(
    'os_name' => '系统（项目）名称',
    'mq_date' => '时间',
    'setting' => '环境',
    'ip' => 'IP',
    'password' => '口令',
    'os_ver' => '系统类型及版本',
    'hostname' => '主机名',
    'qm_name' => '队列管理器名称',
    'os_limit' => '系统资源限制',
    'file_logsize' => '安装路径及日志文件系统大小',
    'mq_ver' => 'MQ版本',
    'pattern' => '模式',
    'manager' => '相应负责人',
    'cscript' => '创建对象脚本',
    'mq_explain' => '其他说明',
    'doit' => '实施人',
    'other' => '其他'
);
$nshowks = array(
    'year', 'month', 'url', 'status', 'status_tag', 'status_name', 'status_css'
);
$mqiarr = array(
    'sys_name' => '所属系统名称',
    'host_name' => '主机名称',
    'os_ver' => '操作系统及版本',
    'manage_ip' => '管理地址',
    'mq_ver' => 'MQ版本号',
    'deploy' => '部署方式',
    'qm_name' => '队列管理器名称',
    'qm_status' => '队列管理器状态',
    'backups' => '备份情况',
    'remark' => '备  注',
    'serve_ip' => '服务IP',
    'principal' => '负责人和联系方式'
);
$dblarr = array(
    'id' => 'ID',
    'username' => '姓名',
    'telephone' => '办公电话',
    'mobile_phone' => '手机',
    'email' => '邮箱',
    'qq' => 'QQ',
    'weixin' => '微信',
    'job' => '职务'
);
$address = array(
    'username' => '姓名',
    'job' => '职务',
    'telephone' => '办公电话',
    'mobile_phone' => '手机',
    'department' => '部门',
    'keshi' => '科室',
    'beizhu' => '备注',
    'qq' => 'QQ',
    'email' => 'Email',
    'weixin' => '微信'
);
$mreport_class = array('TongGTP', 'TongEASY', 'MQ'
);
$os_hardware = array(
    'codeid' => '编号',
    'system_class' => '系统',
    'type' => '类型',
    'is_virtualization' => '是否虚拟化',
    'scene' => '场景',
    'examine_way' => '检查方式',
    'judge_way' => '判断方式',
    'label' => 'LABEL：Location',
    'vpd' => 'VPD',
    'probable_causes' => 'Probable Causes',
    'reason_for_failure' => 'REASON FOR FAILURE',
    'other' => 'other'
);
$os_aix = array(
    'codeid' => '编号',
    'system_class' => '系统',
    'type' => '类型',
    'is_virtualization' => '是否虚拟化',
    'scene' => '场景',
    'examine_way' => '检查方式',
    'judge_way' => '判断方式',
    'is_group' => '是否组合'
);
$power = array(
    "add" => 1,
    "delete" => 2,
    "edit" => 4,
    "view" => 8,
    "upload" => 16,
    "verify" => 32
);
$easexamp = array(
    "sys_name" => "E商宝应用服务器A机",
    "app_name" => "E商宝应用服务器",
    "sys_ver" => "AIX_6100-06-06-1140",
    "node_ver" => "TE4625_P1_AIX71_JDK1",
    "user_name" => "was",
    "node_name" => "sesba",
    "sys_ip" => "172.16.132.11:192.168.254.224",
    'manager' => '张三',
    'phone' => '13988888888'
);
$easyarr = array(
    "sys_name" => "系统名",
    "app_name" => "应用名称",
    "sys_ver" => "系统版本号",
    "node_ver" => "TongEASY版本号",
    "user_name" => "用户名",
    "node_name" => "节点名",
    "sys_ip" => "服务/管理IP",
    'manager' => '联系人',
    'phone' => '电话'
);
$gtpinfo = array(
    'nodename' => '节点名',
    'nodeip' => '节点IP',
    'nodeport' => '端口号',
    'nodetype' => '节点类型',
    'gtpversion' => 'GTP版本',
    'remark' => '备  注');
$quarr = array(
    'xmsel' => "项目",
    'happentime' => "发生时间",
    'environment' => "系统环境",
    'systemname' => "系统名称",
    'describe' => "问题描述及分析",
    'result' => "处理方法及结果",
    'manager' => "处理人",
    'remark' => "备注"
);
$taskarr = array(
    'srcnodename' => '源节点',
    'srcnodeip' => '源节点IP',
    'taskname' => '任务名称',
    'srcdir' => '源目录',
    'srcdiralias' => '源目录别名',
    'taskrule' => '通配符',
    'destnodename' => '目的节点',
    'destnodeip' => '目的节点IP',
    'destdir' => '目的目录',
    'destdiralias' => '目的目录别名'
);
$msp = array(
    '01' => '一月',
    '02' => '二月',
    '03' => '三月',
    '04' => '四月',
    '05' => '五月',
    '06' => '六月',
    '07' => '七月',
    '08' => '八月',
    '09' => '九月',
    '10' => '十月',
    '11' => '十一月',
    '12' => '十二月'
);
$rearray = array(
    'id' => '',
    'report_name' => '文件名',
    'xmsel' => '项目',
    'size' => '文件大小',
    'year' => '年',
    'month' => '月',
    'indate' => '添加日期',
    'url' => ''
);
$mqsee = array(
    'sys_name' => '所属系统名称',
    'hanj' => '所属环境',
    'host_name' => '主机名称',
    'os_ver' => '操作系统及版本',
    'manage_ip' => '管理地址',
    'mq_ver' => 'MQ版本号',
    'deploy' => '部署方式',
    'qm_name' => '队列管理器名称',
    'qm_status' => '队列管理器状态',
    'serve_ip' => '服务IP',
    'principal' => '负责人和联系方式',
    'remark' => '备  注'
);
$nav = array(
    "ID号",
    "所属系统名称",
    "所属环境",
    "主机名称",
    "操作系统及版本",
    "管理地址",
    "MQ版本号",
    "部署方式",
    "队列管理器名称",
    "队列管理器状态",
    "备注",
    "服务IP",
    "负责人和联系方式",
    "添加时间",
    "修改时间",
    "修改人"
);
$mqarr = array(
    'sys_name' => '所属系统名称',
    'hanj' => '所属环境',
    'host_name' => '主机名称',
    'os_ver' => '操作系统及版本',
    'manage_ip' => '管理地址',
    'mq_ver' => 'MQ版本号',
    'deploy' => '部署方式',
    'qm_name' => '队列管理器名称',
    'qm_status' => '队列管理器状态',
    'remark' => '备  注',
    'serve_ip' => '服务IP',
    'principal' => '负责人和联系方式',
    'ch_user' => '修改人'
);
$exportarr = array(
    'sys_name' => '所属系统名称',
    'hanj' => '所属环境',
    'host_name' => '主机名称',
    'os_ver' => '操作系统及版本',
    'manage_ip' => '管理地址',
    'mq_ver' => 'MQ版本号',
    'deploy' => '部署方式',
    'qm_name' => '队列管理器名称',
    'qm_status' => '队列管理器状态',
    'remark' => '备  注',
    'serve_ip' => '服务IP',
    'principal' => '负责人和联系方式',
    'date' => '添加时间'
);
