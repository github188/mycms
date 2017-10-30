<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"E:\webproject\mycms/application/index\view\report\index.html";i:1509335102;}*/ ?>

<html>
<!--说明:
##subcat数组包含6列内容，依次是文字注释也就是巡检显示，位置id，SERVERID，hostname，操作系统类型，应用类型。
位置ID
"02"  西三旗
"03"  亦庄中金
"07"  东单
"99"  所有地方

操心系统编号对应
AIX  1
Solaris  2
Windows  4
Linux	8

应用类型编号对应
MQ	1
WAS	2
Oracle	4
Tong	8
Informix 16
CV 32
GTP 64

选择
选择所有 值 99
没有选择 值 100
正常选择 值 实际值

支持应用组合，比如MQ+WAS组合，那么应用类型值就是这二者的相加值3

-->
<head>
<title>系统巡检报告查询</title>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
<meta name='author' content='NONE'>

<BODY><H1 align=center>系统巡检报告查询</H1><PRE>
<font size=4><p align=center>正常情况下，可以查询今天第一次脚本巡检的结果，如果你需要查询历史巡检内容，请到生产操作间访问：http://102.200.2.224。
如果查询结果页面为乱码，请修改页面的编码为Unicode。</p></font>
<hr size=2 width=100% color=#ff0000></hr>
<script LANGUAGE="javascript">
<!--
var firmdate=20171015;
var onecount;
onecount=0;
    
subcat = new Array();
subcat[0]= new Array("","02","0000","","","");
subcat[1]= new Array("网银监控服务器","03","0001","hxbhq1","1","6");
subcat[2]= new Array("银联前置冷备机","03","0002","ylqzap3","1","10");
subcat[3]= new Array("E商宝应用服务器A机","03","0003","epayapp01","1","66");
subcat[4]= new Array("E商宝应用服务器B机","03","0004","epayapp02","1","2");
subcat[5]= new Array("E商宝应用服务器C机","03","0005","epayapp03","1","2");
subcat[6]= new Array("E商宝数据库服务器A机","03","0006","epaydb01","1","4");
subcat[7]= new Array("E商宝数据库服务器B机","03","0007","epaydb02","1","4");
subcat[8]= new Array("新国结系统应用服务器A机","03","0008","gjjsapp1","1","66");
subcat[9]= new Array("新国结系统应用服务器B机","03","0009","gjjsapp2","1","2");
subcat[10]= new Array("新国结系统数据库服务器A机","03","0010","gjjsdb1","1","4");
subcat[11]= new Array("集中分行交换平台备机/客服交换主机","03","0011","pcsa","1","");
subcat[12]= new Array("村镇银行个人网银应用1机","03","0012","czwypap1","1","78");
subcat[13]= new Array("村镇银行个人网银应用2机","03","0013","czwypap2","1","78");
subcat[14]= new Array("资本项目数据采集系统1机","03","0014","zbxmsjcj1","1","70");
subcat[15]= new Array("资本项目数据采集系统1机","03","0015","zbxmsjcj2","1","70");
subcat[16]= new Array("西三旗CV服务器","02","0016","cvbackup1","4","32");
subcat[17]= new Array("中金CV服务器","03","0017","hxbackup","4","32");
subcat[18]= new Array("村镇CV服务器","03","0018","HX118","4","32");
subcat[19]= new Array("外汇牌价系统1机","03","0019","hlcj1","1","76");
subcat[20]= new Array("外汇牌价系统2机","03","0020","hlcj2","1","12");
subcat[21]= new Array("村镇银行个人网银柜面1机","03","0021","czwytap1","1","");
subcat[22]= new Array("村镇银行个人网银柜面2机","03","0022","czwytap2","1","");
subcat[23]= new Array("新网银数据库服务器C机","03","0023","nbdb3","1","4");
subcat[24]= new Array("新网银数据库服务器D机","03","0024","nbdb4","1","4");
subcat[25]= new Array("西三旗CSM备份服务器1","02","0025","csmserver1","1","");
subcat[26]= new Array("中金CSM备份服务器","03","0026","zjcsm","1","");
subcat[27]= new Array("数据归档系统数据库服务器1机","03","0027","sjgd1","1","4");
subcat[28]= new Array("数据归档系统数据库服务器2机","03","0028","sjgd2","1","4");
subcat[29]= new Array("门户服务器1","02","0029","portalweb1","1","2");
subcat[30]= new Array("门户服务器2","02","0030","portalweb2","1","2");
subcat[31]= new Array("档案管理数据库主机","02","0031","dangan1","1","4");
subcat[32]= new Array("档案管理数据库备机","02","0032","dangan1","1","4");
subcat[33]= new Array("网银RA应用服务器1","03","0033","nbraap1","1","2");
subcat[34]= new Array("网银RA应用服务器2","03","0034","nbraap2","1","2");
subcat[35]= new Array("银关通网关服务器1","03","0035","eportfront1","1","");
subcat[36]= new Array("银关通网关服务器2","03","0036","eportfront2","1","");
subcat[37]= new Array("网银RA数据库服务器1","03","0037","nbradb1","1","4");
subcat[38]= new Array("网银RA数据库服务器2","03","0038","nbradb2","1","4");
subcat[39]= new Array("数据归档系统应用服务器1机","03","0039","archive-host1","8","");
subcat[40]= new Array("数据归档系统应用服务器2机","03","0040","archive-host2","8","");
subcat[41]= new Array("E商宝SFTP服务器1机","03","0041","epaysftp01","1","64");
subcat[42]= new Array("企业征信A机","03","0042","qyzx1","1","68");
subcat[43]= new Array("企业征信B机","03","0043","qyzx1","1","68");
subcat[44]= new Array("信贷影像1机","03","0044","dcmsrun1","1","");
subcat[45]= new Array("信贷影像2机","03","0045","dcmsrun2","1","");
subcat[46]= new Array("总账应用服务器1机","03","0046","glap1","1","64");
subcat[47]= new Array("总账应用服务器2机","02","0047","glap2","1","64");
subcat[48]= new Array("总账数据库服务器1机","02","0048","gldb1","1","4");
subcat[49]= new Array("总账数据库服务器2机","02","0049","gldb2","1","4");
subcat[50]= new Array("集中监控tms1机","03","0050","tms1","1","2");
subcat[51]= new Array("集中监控tms2机","03","0051","tms2","1","2");
subcat[52]= new Array("村镇银行综合前置应用服务器3","03","0052","czzhqz3","1","8");
subcat[53]= new Array("村镇银行综合前置应用服务器4","03","0053","czzhqz4","1","8");
subcat[54]= new Array("村镇银行短信系统1机","03","0054","czsms1","1","70");
subcat[55]= new Array("村镇银行短信系统2机","03","0055","czsms2","1","70");
subcat[56]= new Array("中金数据抽取平台1机","03","0056","sjcqpt1","1","66");
subcat[57]= new Array("中金数据抽取平台2机","03","0057","sjcqpt2","1","66");
subcat[58]= new Array("中金电子票据系统应用1机","03","0058","dzpjap1","1","74");
subcat[59]= new Array("中金电子票据系统应用2机","03","0059","dzpjap2","1","74");
subcat[60]= new Array("村镇银行个人网银数据库1机","03","0060","czwypdb1","1","4");
subcat[61]= new Array("村镇银行个人网银数据库2机","03","0061","czwypdb2","1","4");
subcat[62]= new Array("村镇银行二代支付系统应用服务器1机","03","0062","czzfap1","1","76");
subcat[63]= new Array("公安部身份核验系统1机","03","0063","sfhc1","1","15");
subcat[64]= new Array("公安部身份核验系统2机","03","0064","sfhc2","1","15");
subcat[65]= new Array("村镇银行二代支付系统应用服务器2机","03","0065","czzfap2","1","76");
subcat[66]= new Array("村镇银行二代支付系统网关服务器1机","03","0066","czzfgw1","1","");
subcat[67]= new Array("村镇银行二代支付系统网关服务器2机","03","0067","czzfgw2","1","");
subcat[68]= new Array("E商宝SFTP服务器2机","03","0068","epaysftp02","1","");
subcat[69]= new Array("BEAI前置数据库A机","03","0069","esbdb1","1","4");
subcat[70]= new Array("BEAI前置数据库B机","03","0070","esbdb2","1","4");
subcat[71]= new Array("会计要素数据库1机","03","0071","kjysdb1","1","4");
subcat[72]= new Array("BEAI前置应用A机","03","0072","esbapp1","1","1");
subcat[73]= new Array("BEAI前置应用B机","03","0073","esbapp1","1","1");
subcat[74]= new Array("会计要素数据库2机","03","0074","kjysdb2","1","4");
subcat[75]= new Array("新反洗钱系统应用A机","03","0075","fxqap1","1","64");
subcat[76]= new Array("新反洗钱系统应用B机","03","0076","fxqap2","1","");
subcat[77]= new Array("新反洗钱系统数据库A机","03","0077","fxqdb1","1","4");
subcat[78]= new Array("新反洗钱系统数据库B机","03","0078","fxqdb2","1","4");
subcat[79]= new Array("数据交换系统1机","03","0079","sjjh1","1","70");
subcat[80]= new Array("数据交换系统2机","03","0080","sjjh2","1","70");
subcat[81]= new Array("信贷系统数据库服务器1机","03","0081","dcmsdb1","1","4");
subcat[82]= new Array("CV恢复2.164","03","0082","zj_hf_10g_a","1","");
subcat[83]= new Array("信贷系统数据库服务器2机","03","0083","dcmsdb2","1","68");
subcat[84]= new Array("个贷公积金系统A机","03","0084","gdhs1","1","72");
subcat[85]= new Array("数据仓库数据交换知识库数据库后台1机","03","0085","sjcksjjhzskdb1","1","4");
subcat[86]= new Array("数据仓库数据交换知识库数据库后台2机","03","0086","sjcksjjhzskdb2","1","4");
subcat[87]= new Array("个贷公积金系统B机","03","0087","gdhs2","1","72");
subcat[88]= new Array("数据仓库关键指标查询数据库服务器1机","03","0088","sjckgjzbcxdb1","1","4");
subcat[89]= new Array("数据仓库关键指标查询数据库服务器2机","03","0089","sjckgjzbcxdb2","1","4");
subcat[90]= new Array("资金业务系统应用1机","03","0090","zjywap1","1","74");
subcat[91]= new Array("资金业务系统应用2机","03","0091","zjywap2","1","74");
subcat[92]= new Array("数据管控后台数据库服务器1机","03","0092","sjcksjgkdb1","1","4");
subcat[93]= new Array("数据管控后台数据库服务器2机","03","0093","sjcksjgkdb2","1","4");
subcat[94]= new Array("外卡收单服务器A机","03","0094","wksd1","1","12");
subcat[95]= new Array("外卡收单服务器B机","03","0095","wksd2","1","12");
subcat[96]= new Array("外汇卡账务1机","03","0096","whkzw1","1","88");
subcat[97]= new Array("外汇卡账务2机","03","0097","whkzw2","1","88;");
subcat[98]= new Array("中金电子票据系统数据库1机","03","0098","dzpjdb1","1","5");
subcat[99]= new Array("中金电子票据系统数据库2机","03","0099","dzpjdb2","1","5");
subcat[100]= new Array("新国结系统数据库服务器B机","03","0100","gjjsdb2","1","4");
subcat[101]= new Array("数据门户数据库服务器1机","03","0101","sjckmhdb1","1","4");
subcat[102]= new Array("数据门户数据库服务器2机","03","0102","sjckmhdb1","1","4");
subcat[103]= new Array("银税共享1机","03","0103","ysgx1","1","7");
subcat[104]= new Array("银税共享2机","03","0104","ysgx2","1","7");
subcat[105]= new Array("中金核心查询打印系统1机","03","0105","hxcxdy1","1","10");
subcat[106]= new Array("中金核心查询打印系统2机","03","0106","hxcxdy2","1","10");
subcat[107]= new Array("p550la","01","0107","p550la","1","");
subcat[108]= new Array("新数据归档系统数据库ISO","03","0108","sjkbfyj5","1","4");
subcat[109]= new Array("境内外币支付服务器主机","02","0109","wbzf1","1","65");
subcat[110]= new Array("境内外币支付服务器备机","02","0110","wbzf2","1","65");
subcat[111]= new Array("同城灾备新核心Bancs","03","0111","drbancs","1","");
subcat[112]= new Array("支付密码新系统数据库1机","03","0112","zfmmsrv1","1","4");
subcat[113]= new Array("支付密码新系统数据库2机","03","0113","zfmmsrv2","1","4");
subcat[114]= new Array("同城灾备新核心Pcard","03","0114","drpcard","1","");
subcat[115]= new Array("村镇银行网银数据库服务器1机","03","0115","czwydb1","1","4");
subcat[116]= new Array("村镇银行网银数据库服务器2机","03","0116","czwydb2","1","4");
subcat[117]= new Array("村镇银行网银web服务器1机","03","0117","czwyweb1","8","");
subcat[118]= new Array("统一IT资源管理系统数据库服务器1机","03","0118","tyitzygldb1","1","4");
subcat[119]= new Array("中金GTP6管理服务器1机","03","0119","gtpm1","1","68");
subcat[120]= new Array("中金GTP6管理服务器2机","03","0120","gtpm2","1","68");
subcat[121]= new Array("村镇银行网银web服务器2机","03","0121","czwyweb2","8","");
subcat[122]= new Array("统一IT资源管理系统数据库服务器2机","03","0122","tyitzygldb2","1","4");
subcat[123]= new Array("村镇银行网银应用服务器1机","03","0123","czwyap1","1","74");
subcat[124]= new Array("村镇银行网银应用服务器2机","03","0124","czwyap2","1","74");
subcat[125]= new Array("村镇银行RA服务器1机","03","0125","czra1","1","6");
subcat[126]= new Array("村镇银行RA服务器2机","03","0126","czra2","1","6");
subcat[127]= new Array("客服应用服务器1机","03","0127","hxccag1","1","72");
subcat[128]= new Array("客服应用服务器2机","03","0128","hxccag2","1","72");
subcat[129]= new Array("客服CTI服务器1机","03","0129","cccti1","1","");
subcat[130]= new Array("客服CTI服务器2机","03","0130","cccti2","1","8");
subcat[131]= new Array("人力资源系统WEB1机","03","0131","hrweb1","1","");
subcat[132]= new Array("人力资源系统WEB2机","03","0132","hrweb2","1","");
subcat[133]= new Array("人力资源系统应用1机","03","0133","hrap1","1","2");
subcat[134]= new Array("人力资源系统应用2机","03","0134","hrap2","1","2");
subcat[135]= new Array("人力资源系统数据库1机","03","0135","hrdb1","1","4");
subcat[136]= new Array("人力资源系统数据库2机","03","0136","hrdb2","1","4");
subcat[137]= new Array("村镇银行信贷影像系统1机","03","0137","czxdimg1","1","");
subcat[138]= new Array("村镇银行信贷影像系统2机","03","0138","czxdimg1","1","");
subcat[139]= new Array("E商宝内网WEB服务器A机","03","0139","epayweb03","1","");
subcat[140]= new Array("E商宝内网WEB服务器B机","03","0140","epayweb04","1","");
subcat[141]= new Array("E商宝外网WEB服务器A机","03","0141","epayweb01","1","");
subcat[142]= new Array("E商宝外网WEB服务器B机","03","0142","epayweb02","1","");
subcat[143]= new Array("综合管理信息系统应用1","03","0143","portalweb-01","8","2");
subcat[144]= new Array("综合管理信息系统应用2","03","0144","portalweb-01","8","2");
subcat[145]= new Array("综合管理信息系统应用3","03","0145","portalweb-01","8","2");
subcat[146]= new Array("综合管理信息系统应用4","03","0146","portalweb-01","8","2");
subcat[147]= new Array("综合管理信息系统应用5","03","0147","portal18","8","2");
subcat[148]= new Array("综合管理信息系统应用6","03","0148","fjw115","8","2");
subcat[149]= new Array("综合管理信息系统应用7","03","0149","fjw116","8","2");
subcat[150]= new Array("综合管理信息系统应用8","03","0150","fjw117","8","2");
subcat[151]= new Array("综合管理信息系统应用9","03","0151","fjw118","8","2");
subcat[152]= new Array("综合管理信息系统应用10","03","0152","ldap42","8","2");
subcat[153]= new Array("综合管理信息系统应用11","03","0153","ldap43","8","2");
subcat[154]= new Array("反洗钱web服务器1","03","0154","fxqweb-01","8","2");
subcat[155]= new Array("反洗钱web服务器2","03","0155","fxqweb-02","8","2");
subcat[156]= new Array("生产数据下载应用服务器1","03","0156","sjfwptap1","1","66");
subcat[157]= new Array("生产数据下载应用服务器2","03","0157","sjfwptap2","1","66");
subcat[158]= new Array("客户风险统计报送服务器1","03","0158","khfxtjbs1","1","6");
subcat[159]= new Array("客户风险统计报送服务器2","03","0159","khfxtjbs2","1","6");
subcat[160]= new Array("村镇银行综合前置通讯机1","03","0160","czzhqztx1","1","8");
subcat[161]= new Array("村镇银行综合前置通讯机2","03","0161","czzhqztx2","1","8");
subcat[162]= new Array("村镇银行前置数据库1机","03","0162","czqzdb1","1","4");
subcat[163]= new Array("村镇银行前置数据库2机","03","0163","czqzdb1","1","4");
subcat[164]= new Array("村镇银行综合前置应用服务器1","03","0164","czzhqzap1","1","8");
subcat[165]= new Array("村镇银行综合前置应用服务器2","03","0165","czzhqzap2","1","8");
subcat[166]= new Array("网银批量服务器2机","03","0166","hxb2bapp2","1","10");
subcat[167]= new Array("网银第二集群CIF5机","03","0167","hxb2cif5","1","10");
subcat[168]= new Array("网银第二集群CIF6机","03","0168","hxb2cif6","1","10");
subcat[169]= new Array("网银第二集群个人网银应用服务器1机","03","0169","hxb2papp1","1","10");
subcat[170]= new Array("网银第二集群个人网银应用服务器2机","03","0170","hxb2papp2","1","10");
subcat[171]= new Array("网银第二集群企业网银应用服务器1机","03","0171","hxb2eapp1","1","10");
subcat[172]= new Array("网银第二集群企业网银应用服务器2机","03","0172","hxb2eapp2","1","10");
subcat[173]= new Array("网银第二集群外网Web1机","03","0173","hxb2web1","1","");
subcat[174]= new Array("网银第二集群外网Web2机","03","0174","hxb2web2","1","");
subcat[175]= new Array("合规管理系统应用和WEB1","03","0175","hgglapp1","1","2");
subcat[176]= new Array("合规管理系统应用和WEB2","03","0176","hgglapp2","1","2");
subcat[177]= new Array("合规管理系统db1","03","0177","cmsdb1","1","4");
subcat[178]= new Array("合规管理系统db2","03","0178","cmsdb2","1","4");
subcat[179]= new Array("网银批量服务器1机","03","0179","hxbebatb1","1","2");
subcat[180]= new Array("P2P洋钱罐数据库1机","03","0180","p2pzjcgdb9","1","4");
subcat[181]= new Array("P2P洋钱罐数据库2机","03","0181","p2pzjcgdb10","1","4");
subcat[182]= new Array("西三旗核心克隆系统1机","02","0182","bancs_clone1","1","4");
subcat[183]= new Array("西三旗核心克隆系统2机","02","0183","bancs_clone2","1","4");
subcat[184]= new Array("核心高可用系统1机","03","0184","bancs01","1","4");
subcat[185]= new Array("核心高可用系统2机","03","0185","bancs02","1","68");
subcat[186]= new Array("核心高可用系统3机","03","0186","bancs03","1","4");
subcat[187]= new Array("核心高可用系统4机","03","0187","bancs04","1","4");
subcat[188]= new Array("支付融资系统应用1机","03","0188","hxcataapp1","1","72");
subcat[189]= new Array("支付融资系统应用2机","03","0189","hxcataapp1","1","72");
subcat[190]= new Array("同城灾备BEAI系统应用1机","02","0190","beaiap01","1","");
subcat[191]= new Array("同城灾备BEAI系统应用2机","02","0191","beaiap02","1","");
subcat[192]= new Array("同城灾备BEAI系统数据库1机","02","0192","beaidb1","1","");
subcat[193]= new Array("同城灾备BEAI系统数据库2机","02","0193","beaidb2","1","");
subcat[194]= new Array("中金基金代销系统数据库备份库","03","0194","fundrpdb1","1","4");
subcat[195]= new Array("数据仓库报表集市数据库服务器1机","03","0195","sjckbbjsdb1","1","4");
subcat[196]= new Array("数据仓库报表集市数据库服务器2机","03","0196","sjckbbjsdb2","1","4");
subcat[197]= new Array("个人VIP系统应用服务器1机","02","0197","hxvipweb1","1","6");
subcat[198]= new Array("个人VIP系统应用服务器2机","02","0198","hxvipweb2","1","4");
subcat[199]= new Array("个人VIP系统数据库服务器1机","02","0199","hxvipdb1","1","4");
subcat[200]= new Array("个人VIP系统数据库服务器2机","02","0200","hxvipdb2","1","68");
subcat[201]= new Array("结售汇外汇门户数据库1机","02","0201","fxqdb1","1","4");
subcat[202]= new Array("结售汇外汇门户数据库2机","02","0202","fxqdb2","1","4");
subcat[203]= new Array("OA办公系统1机","07","0203","zhoa1","1","");
subcat[204]= new Array("OA办公系统2机","07","0204","zhoa2","1","");
subcat[205]= new Array("邮件系统A机","07","0205","MAIL1","1","");
subcat[206]= new Array("邮件系统B机","07","0206","MAIL2","1","");
subcat[207]= new Array("转账支付系统应用1机","02","0207","zzzf1","1","12");
subcat[208]= new Array("转账支付系统应用2机","02","0208","zzzf2","1","76");
subcat[209]= new Array("新资产托管系统数据库1机","03","0209","nzctgdb1","1","4");
subcat[210]= new Array("新资产托管系统数据库2机","03","0210","nzctgdb2","1","4");
subcat[211]= new Array("电子国债数据库1机","02","0211","dzgzdb1","1","4");
subcat[212]= new Array("电子国债数据库2机","02","0212","dzgzdb2","1","4");
subcat[213]= new Array("资本管理系统应用服务器1机","03","0213","zbglap1","1","2");
subcat[214]= new Array("资本管理系统应用服务器2机","03","0214","zbglap2","1","2");
subcat[215]= new Array("总行银联清算A机","02","0215","zhylqs1","1","12");
subcat[216]= new Array("总行银联清算B机","02","0216","zhylqs2","1","12");
subcat[217]= new Array("资本管理系统数据库服务器1机","","0217","zbgldb1","1","4");
subcat[218]= new Array("资本管理系统数据库服务器2机","","0218","zbgldb2","1","4");
subcat[219]= new Array("客服系统web服务器1机","03","0219","ccweb1","1","8");
subcat[220]= new Array("客服系统web服务器2机","03","0220","ccweb2","1","8");
subcat[221]= new Array("2K历史查询A机","03","0221","hx2khis1","1","12");
subcat[222]= new Array("2K历史查询B机","03","0222","hx2khis2","1","12");
subcat[223]= new Array("西三旗指纹认证系统1机","02","0223","zwrz1","1","4");
subcat[224]= new Array("西三旗指纹认证系统?机","02","0224","zwrz2","1","4");
subcat[225]= new Array("新网银内管系统A机","02","0225","hxb1mapp1","1","74");
subcat[226]= new Array("新网银内管系统B机","02","0226","hxb1mapp2","1","10");
subcat[227]= new Array("理财投资管理系统1机","02","0227","lctz1","1","6");
subcat[228]= new Array("理财投资管理系统2机","02","0228","lctz2","1","6");
subcat[229]= new Array("同城灾备基金代销系统web服务器","03","0229","dr_fund_web","1","");
subcat[230]= new Array("作业调度A机","02","0230","zydd1","1","4");
subcat[231]= new Array("作业调度B机","02","0231","zydd2","1","4");
subcat[232]= new Array("网银一集群外网WEB1","03","0232","hxb1web1","1","2");
subcat[233]= new Array("网银一集群外网WEB2","03","0233","hxb1web2","1","2");
subcat[234]= new Array("网银一集群内网WEB1","03","0234","hxb1web5","1","6");
subcat[235]= new Array("网银二集群内网WEB1","03","0235","hxb1web6","1","2");
subcat[236]= new Array("网银柜台服务1","03","0236","hxb2tapp1","1","8");
subcat[237]= new Array("网银柜台服务2","03","0237","hxb2tapp2","1","8");
subcat[238]= new Array("网银一集群个人网关服务1","03","0238","hxb1papp1","1","10");
subcat[239]= new Array("网银一集群个人网关服务2","03","0239","hxb1papp2","1","10");
subcat[240]= new Array("网银一集群企业银企服务1","03","0240","hxb1eapp1","1","10");
subcat[241]= new Array("网银一集群企业银企服务2","03","0241","hxb1eapp2","1","10");
subcat[242]= new Array("个人征信查询服务器1机","03","0242","grzxcx1","1","6");
subcat[243]= new Array("个人征信查询服务器2机","03","0243","grzxcx2","1","6");
subcat[244]= new Array("综合管理信息系统数据库1机","03","0244","zhglxx1","1","4");
subcat[245]= new Array("综合管理信息系统数据库2机","03","0245","zhglxx2","1","4");
subcat[246]= new Array("一体化监控应用服务器1机","03","0246","jkptapp1","1","");
subcat[247]= new Array("一体化监控应用服务器2机","03","0247","jkptapp2","1","");
subcat[248]= new Array("一体化监控数据库服务器1机","03","0248","jkptdb1","1","4");
subcat[249]= new Array("一体化监控数据库服务器2机","03","0249","jkptdb2","1","4");
subcat[250]= new Array("信贷系统应用服务器1","03","0250","dcmsap1","1","74");
subcat[251]= new Array("信贷系统应用服务器2","03","0251","dcmsap2","1","74");
subcat[252]= new Array("纪检监察服务器1机","03","0252","jjjc1","1","6");
subcat[253]= new Array("纪检监察服务器2机","03","0253","jjjc2","1","6");
subcat[254]= new Array("村镇银行数据抽取数据库1机","03","0254","","1","4");
subcat[255]= new Array("村镇银行数据抽取数据库2机","03","0255","","1","4");
subcat[256]= new Array("资金业务系统数据库1机","03","0256","zjywdb1","1","4");
subcat[257]= new Array("资金业务系统数据库2机","03","0257","zjywdb2","1","4");
subcat[258]= new Array("集中银联前置应用服务器1","03","0258","ylqzap1","1","");
subcat[259]= new Array("集中银联前置应用服务器2","03","0259","ylqzap2","1","");
subcat[260]= new Array("集中银联前置监控A机","03","0260","ylqzjk1","1","70");
subcat[261]= new Array("集中银联前置监控B机","03","0261","ylqzjk2","1","6");
subcat[262]= new Array("集中银联前置数据库服务器A机","03","0262","ylqzdb1","1","4");
subcat[263]= new Array("集中银联前置数据库服务器B机","03","0263","ylqzdb2","1","4");
subcat[264]= new Array("tops应用服务器1","03","0264","topsap1","1","");
subcat[265]= new Array("tops应用服务器2","03","0265","topsap2","1","");
subcat[266]= new Array("tops应用服务器3","03","0266","topsap3","1","");
subcat[267]= new Array("tops应用服务器4","03","0267","topsap4","1","");
subcat[268]= new Array("tops数据库服务器A机","03","0268","topsdb1","1","4");
subcat[269]= new Array("tops数据库服务器B机","03","0269","topsdb2","1","4");
subcat[270]= new Array("西三旗综合前置通讯机1","02","0270","zhqztx1","1","8");
subcat[271]= new Array("西三旗综合前置通讯机2","02","0271","zhqztx2","1","8");
subcat[272]= new Array("西三旗综合前置应用服务器1","02","0272","zhqzap1","1","8");
subcat[273]= new Array("西三旗综合前置应用服务器2","02","0273","zhqzap2","1","8");
subcat[274]= new Array("西三旗综合前置应用服务器3","02","0274","zhqzap3","1","8");
subcat[275]= new Array("西三旗综合前置应用服务器4","02","0275","zhqzap4","1","8");
subcat[276]= new Array("西三旗综合前置数据库服务器1","02","0276","zhqzdb1","1","4");
subcat[277]= new Array("西三旗综合前置数据库服务器2","02","0277","zhqzdb2","1","4");
subcat[278]= new Array("西三旗综合前置流量控制服务器1","02","0278","zhqzlk1","1","");
subcat[279]= new Array("西三旗综合前置流量控制服务器2","02","0279","zhqzlk2","1","");
subcat[280]= new Array("西三旗综合前置统计监控服务器1","02","0280","zhqztj1","1","4");
subcat[281]= new Array("西三旗综合前置统计监控服务器2","02","0281","zhqztj2","1","");
subcat[282]= new Array("企业征信查询系统1机","03","0282","qyzxcx1","1","6");
subcat[283]= new Array("企业征信查询系统2机","03","0283","qyzxcx2","1","6");
subcat[284]= new Array("电子现金系统1","03","0284","dzxj1","1","");
subcat[285]= new Array("电子现金系统2","03","0285","dzxj2","1","");
subcat[286]= new Array("集中监控系统1","03","0286","hxkjkap1","1","");
subcat[287]= new Array("集中监控系统2","03","0287","hxkjkap2","1","");
subcat[288]= new Array("外汇卡消费1","03","0288","whkxf1","1","24");
subcat[289]= new Array("外汇卡消费2","03","0289","whkxf2","1","24");
subcat[290]= new Array("村镇银行信贷系统应用服务器1机","03","0290","czdcmsap1","1","74");
subcat[291]= new Array("村镇银行信贷系统应用服务器2机","03","0291","czdcmsap2","1","74");
subcat[292]= new Array("数据准备系统1","03","0292","sjzb1","1","64");
subcat[293]= new Array("数据准备系统2","03","0293","sjzb1","1","");
subcat[294]= new Array("密钥管理系统1","03","0294","ickms1","1","");
subcat[295]= new Array("密钥管理系统2","03","0295","ickms2","1","");
subcat[296]= new Array("集中监控系统数据库1","03","0296","hxkjkdb1","1","4");
subcat[297]= new Array("集中监控系统数据库2","03","0297","hxkjkdb2","1","4");
subcat[298]= new Array("电子现金数据库系统1","03","0298","dzxjdb1","1","4");
subcat[299]= new Array("电子现金数据库系统2","03","0299","dzxjdb2","1","4");
subcat[300]= new Array("新数据归档系统数据库UTF","03","0300","sjkbfyj3","1","4");
subcat[301]= new Array("村镇银行报表应用A机","03","0301","dxrepapp1","1","8");
subcat[302]= new Array("村镇银行报表应用B机","03","0302","dxrepapp2","1","8");
subcat[303]= new Array("村镇银行数据抽取应用1机","03","0303","dxrepdb1","1","64");
subcat[304]= new Array("村镇银行数据抽取应用2机","03","0304","dxrepdb2","1","");
subcat[305]= new Array("村镇银行核心系统1机","03","0305","czbancs01","1","4");
subcat[306]= new Array("村镇银行核心系统2机","03","0306","czbancs02","1","68");
subcat[307]= new Array("村镇银行BEAI应用A机","03","0307","dxbeaiapp1","1","72");
subcat[308]= new Array("村镇银行BEAI应用B机","03","0308","dxbeaiapp2","1","8");
subcat[309]= new Array("一体机监控","","0309","","","");
subcat[310]= new Array("一体机监控","","0310","","","");
subcat[311]= new Array("村镇银行BEAI数据库A机","03","0311","dxbeaidb1","1","4");
subcat[312]= new Array("村镇银行BEAI数据库B机","03","0312","dxbeaidb2","1","4");
subcat[313]= new Array("支付融资系统应用3机","03","0313","cataapp3","1","74");
subcat[314]= new Array("支付融资系统应用4机","03","0314","cataapp4","1","10");
subcat[315]= new Array("网上支付跨行清算系统前置1机","03","0315","ebpsap1","1","1");
subcat[316]= new Array("网上支付跨行清算系统前置2机","03","0316","ebpsap2","1","1");
subcat[317]= new Array("网上支付跨行清算系统备用前置1机","03","0317","ebpsapby1","1","1");
subcat[318]= new Array("网上支付跨行清算系统备用前置2机","03","0318","ebpsapby2","1","1");
subcat[319]= new Array("旧支付融资数据库A机","03","0319","hxcatadb1","1","4");
subcat[320]= new Array("旧支付融资数据库B机","03","0320","hxcatadb2","1","4");
subcat[321]= new Array("CATA-BEAI外联A机","03","0321","beaiwl1","1","9");
subcat[322]= new Array("CATA-BEAI外联B机","03","0322","beaiwl2","1","9");
subcat[323]= new Array("支付融资系统数据库1机","03","0323","catadb3","1","4");
subcat[324]= new Array("支付融资系统数据库1机","03","0324","catadb4","1","4");
subcat[325]= new Array("自动化-后台数据库1机","03","0325","zdhdb3","1","4");
subcat[326]= new Array("自动化-后台数据库2机","03","0326","zdhdb4","1","4");
subcat[327]= new Array("同城灾备集中银联前置应用服务器2","03","0327","drxylqzqpp2","1","");
subcat[328]= new Array("中金B2B数据库服务器2机","03","0328","b2bdb2","1","4");
subcat[329]= new Array("B2B/B2C应用服务器1机","03","0329","netapp01","1","66");
subcat[330]= new Array("","03","0330","","1","68");
subcat[331]= new Array("二代支付系统前置服务器1机","03","0331","pmtsqz1","1","1");
subcat[332]= new Array("二代支付系统前置服务器2机","03","0332","pmtsqz2","1","1");
subcat[333]= new Array("会计要素应用1机","03","0333","kjysap1","1","66");
subcat[334]= new Array("会计要素应用2机","03","0334","kjysap2","1","66");
subcat[335]= new Array("资源管理A机","03","0335","zygl1","1","");
subcat[336]= new Array("资源管理B机","03","0336","zygl2","1","");
subcat[337]= new Array("黄金买卖系统1机","03","0337","hjjyapp1","1","72");
subcat[338]= new Array("黄金买卖系统2机","03","0338","hjjyapp2","1","72");
subcat[339]= new Array("黄金买卖系统数据库1机","03","0339","hjjydb1","1","4");
subcat[340]= new Array("黄金买卖系统数据库2机","03","0340","hjjydb2","1","4");
subcat[341]= new Array("中金客服数据库1机","03","0341","kfdb1","1","4");
subcat[342]= new Array("中金客服数据库2机","03","0342","kfdb2","1","4");
subcat[343]= new Array("中金客服CIF数据库1机","03","0343","kfcifdb1","1","4");
subcat[344]= new Array("中金客服CIF数据库2机","03","0344","kfcifdb2","1","4");
subcat[345]= new Array("资产托管系统应用A机","03","0345","zctgap1","1","");
subcat[346]= new Array("资产托管系统应用B机","03","0346","zctgap2","1","");
subcat[347]= new Array("资产托管系统数据库A机","03","0347","zctgdb1","1","4");
subcat[348]= new Array("资产托管系统数据库B机","03","0348","zctgdb2","1","4");
subcat[349]= new Array("二代支付系统管理端应用服务器1机","03","0349","edzfmgap1","1","");
subcat[350]= new Array("二代支付系统管理端应用服务器2机","03","0350","edzfmgap2","1","");
subcat[351]= new Array("二代支付系统管理端数据库服务器1机","03","0351","edzfmgdb1","1","4");
subcat[352]= new Array("二代支付系统管理端数据库服务器2机","03","0352","edzfmgdb2","1","4");
subcat[353]= new Array("二代支付系统数据库服务器1机","03","0353","edzfdb1","1","4");
subcat[354]= new Array("二代支付系统数据库服务器2机","03","0354","edzfdb2","1","4");
subcat[355]= new Array("二代支付系统应用服务器1机","03","0355","edzfap1","1","");
subcat[356]= new Array("二代支付系统应用服务器2机","03","0356","edzfap2","1","");
subcat[357]= new Array("待停机-旧资产托管系统应用1机","03","0357","tgapp1","1","");
subcat[358]= new Array("待停机-旧资产托管系统应用2机","03","0358","tgapp2","1","");
subcat[359]= new Array("待停机-旧资产托管系统数据库1机","03","0359","tgdata1","1","4");
subcat[360]= new Array("待停机-旧资产托管系统数据库2机","03","0360","tgdata2","1","4");
subcat[361]= new Array("中金指纹认证1机","03","0361","zwrz1","1","4");
subcat[362]= new Array("中金指纹认证2机","03","0362","zwrz2","1","4");
subcat[363]= new Array("转账支付系统数据库1机","03","0363","zzzfdb1","1","4");
subcat[364]= new Array("转账支付系统数据库2机","03","0364","zzzfdb2","1","4");
subcat[365]= new Array("信贷影像filenet数据库1机","03","0365","xdyxfndb1","1","4");
subcat[366]= new Array("信贷影像filenet数据库2机","03","0366","xdyxfndb2","1","4");
subcat[367]= new Array("支付融资智慧社区数据库1机","03","0367","zfrzzhsqdb1","1","4");
subcat[368]= new Array("支付融资智慧社区数据库2机","03","0368","zfrzzhsqdb2","1","4");
subcat[369]= new Array("创意管理系统数据库1机","03","0369","cygldb1","1","4");
subcat[370]= new Array("创意管理系统数据库2机","03","0370","cygldb2","1","4");
subcat[371]= new Array("核心高可用克隆1机","03","0371","clonebancs01","1","68");
subcat[372]= new Array("核心高可用克隆2机","03","0372","clonebancs02","1","4");
subcat[373]= new Array("供应链金融系统应用服务器1","03","0373","gylapp1","1","66");
subcat[374]= new Array("供应链金融系统应用服务器2","03","0374","gylapp2","1","2");
subcat[375]= new Array("供应链金融系统数据库服务器1","03","0375","gyldb1","1","4");
subcat[376]= new Array("供应链金融系统数据库服务器2","03","0376","gyldb2","1","4");
subcat[377]= new Array("供应链金融系统影像服务器1","03","0377","gylimg1","1","");
subcat[378]= new Array("供应链金融系统影像服务器2","03","0378","gylimg2","1","");
subcat[379]= new Array("核心高可用系统DG1","03","0379","bancsdg1","1","4");
subcat[380]= new Array("核心高可用系统DG2","03","0380","bancsdg2","1","4");
subcat[381]= new Array("供应链金融系统WEB服务器1","03","0381","gylweb1","1","");
subcat[382]= new Array("供应链金融系统WEB服务器2","03","0382","gylweb2","1","");
subcat[383]= new Array("手机银行数据库服务器A机","03","0383","sjdb1","1","4");
subcat[384]= new Array("手机银行数据库服务器B机","03","0384","sjdb2","1","4");
subcat[385]= new Array("手机银行金融接入应用A机","03","0385","sjjrap1","1","");
subcat[386]= new Array("手机银行金融接入应用B机","03","0386","sjjrap2","1","");
subcat[387]= new Array("手机银行金融接入Web-A","03","0387","sjjrjr1","1","");
subcat[388]= new Array("手机银行金融接入Web-B","03","0388","sjjrjr2","1","");
subcat[389]= new Array("手机银行内管服务器A机","03","0389","sjmg1","1","2");
subcat[390]= new Array("手机银行内管服务器B机","03","0390","sjmg2","1","2");
subcat[391]= new Array("手机银行日志服务器","03","0391","sjlog","1","");
subcat[392]= new Array("手机银行生活接入应用A机","03","0392","sjshap1","1","2");
subcat[393]= new Array("手机银行生活接入应用B机","03","0393","sjshap2","1","2");
subcat[394]= new Array("手机银行生活接入Web-A","03","0394","sjshjr1","1","2");
subcat[395]= new Array("手机银行生活接入Web-B","03","0395","sjshjr2","1","2");
subcat[396]= new Array("手机银行生活支付前置A机","03","0396","sjshzfqz1","1","");
subcat[397]= new Array("手机银行生活支付前置B机","03","0397","sjshzfqz2","1","");
subcat[398]= new Array("村镇银行信贷系统数据库服务器1机","03","0398","czdcmsdb1","1","4");
subcat[399]= new Array("村镇银行信贷系统数据库服务器2机","03","0399","czdcmsdb2","1","4");
subcat[400]= new Array("中金个人征信系统1机","03","0400","grzx1","1","64");
subcat[401]= new Array("会计报表数据库服务器A机","03","0401","kjbb-db1","2","");
subcat[402]= new Array("南通CRM-DB","03","0402","mis-bak","2","4");
subcat[403]= new Array("新数据归档系统数据库GBK","03","0403","sjkbfyj2","1","4");
subcat[404]= new Array("集中分行CRM-DB1","03","0404","FHCRMDB1","2","");
subcat[405]= new Array("集中分行CRM-DB2","03","0405","FHCRMDB2","2","");
subcat[406]= new Array("集中分行CRM-DB3","03","0406","FHCRMDB3","2","");
subcat[407]= new Array("集中分行CRM-DB4","03","0407","FHCRMDB3","2","");
subcat[408]= new Array("新建分行CRM数据库","03","0408","CRM-Test-HQ","2","");
subcat[409]= new Array("集中报表服务器1机","03","0409","jzrpap1","1","2");
subcat[410]= new Array("总行综合信息管理系统A机","03","0410","crmd1        ","2","");
subcat[411]= new Array("集中报表服务器2机","03","0411","jzrpap2","1","2");
subcat[412]= new Array("华夏稽核系统A机","03","0412","jihe1","1","68");
subcat[413]= new Array("稽核系统批量处理机        ","03","0413","jhcs         ","2","");
subcat[414]= new Array("总行CRM系统数据库服务器A机","03","0414","crm1         ","2","");
subcat[415]= new Array("对公CRM公共集市库服务器1机","03","0415","hxbccrm1","1","68");
subcat[416]= new Array("对公CRM公共集市库服务器2机","03","0416","hxbccrm2","1","68");
subcat[417]= new Array("对公CRM客户营销分析库服务器1机","03","0417","hxbacrm1","1","4");
subcat[418]= new Array("对公CRM客户营销分析库服务器2机","03","0418","hxbacrm2","1","4");
subcat[419]= new Array("对公CRM应用操作库服务器1机","03","0419","hxbocrm1","1","4");
subcat[420]= new Array("对公CRM应用操作库服务器2机","03","0420","hxbocrm2","1","4");
subcat[421]= new Array("对公CRM应用服务器1机","03","0421","hxbcrmweb1","1","2");
subcat[422]= new Array("对公CRM应用服务器1机","03","0422","hxbcrmweb2","1","2");
subcat[423]= new Array("总行综合信息管理系统B机   ","03","0423","crmd2        ","2","");
subcat[424]= new Array("华夏稽核系统B机","03","0424","jihe2","1","4");
subcat[425]= new Array("总行CRM系统数据库服务器B机","03","0425","crm2         ","2","");
subcat[426]= new Array("集中报表数据库		   ","03","0426","jzbb-db      ","2","");
subcat[427]= new Array("外汇买卖系统1机","03","0427","whmm1","2","80");
subcat[428]= new Array("外汇买卖系统2机","03","0428","whmm2","2","80");
subcat[429]= new Array("分行CRM-DB5","03","0429","FHCRMDB5","2","");
subcat[430]= new Array("分行CRM-DB6","03","0430","FHCRMDB5","2","");
subcat[431]= new Array("分行CRM-DB7","03","0431","FHCRMDB5","2","");
subcat[432]= new Array("分行CRM-DB8","03","0432","FHCRMDB5","2","");
subcat[433]= new Array("中金个人征信系统2机","03","0433","grzx2","1","70");
subcat[434]= new Array("中金SWIFT系统网关1机","03","0434","swiftsag1","1","");
subcat[435]= new Array("中金SWIFT系统网关2机","03","0435","swiftsag2","1","");
subcat[436]= new Array("中金SWIFT系统应用1机","03","0436","swiftsaa2","1","65");
subcat[437]= new Array("中金SWIFT系统应用2机","03","0437","swiftsaa2","1","65");
subcat[438]= new Array("新资本协议SAS服务器1机","03","0438","xzbxy1","1","");
subcat[439]= new Array("新资本协议SAS服务器2机","03","0439","xzbxy2","1","");
subcat[440]= new Array("村镇银行银联前置系统1机","03","0440","czylqz1","1","64");
subcat[441]= new Array("村镇银行银联前置系统2机","03","0441","czylqz2","1","64");
subcat[442]= new Array("华夏网站数据库1机","03","0442","hxbweb-db1","2","4");
subcat[443]= new Array("华夏网站数据库2机","03","0443","hxbweb-db2","2","4");
subcat[444]= new Array("中金综合前置通讯机1","03","0444","zhqztx1","1","8");
subcat[445]= new Array("中金综合前置通讯机2","03","0445","zhqztx2","1","8");
subcat[446]= new Array("中金综合前置应用1","03","0446","zhqzap1","1","");
subcat[447]= new Array("中金综合前置应用2","03","0447","zhqzap2","1","");
subcat[448]= new Array("中金综合前置应用3","03","0448","zhqzap3","1","");
subcat[449]= new Array("中金综合前置应用4","03","0449","zhqzap4","1","");
subcat[450]= new Array("中金综合前置流控1","03","0450","zhqzlk1","1","");
subcat[451]= new Array("中金综合前置流控2","03","0451","zhqzlk2","1","");
subcat[452]= new Array("中金综合前置监控1","03","0452","zhqzjk1","1","4");
subcat[453]= new Array("中金综合前置监控2","03","0453","zhqzjk2","1","4");
subcat[454]= new Array("中金综合前置数据库1","03","0454","zhqzdb1","1","4");
subcat[455]= new Array("中金综合前置数据库2","03","0455","zhqzdb2","1","4");
subcat[456]= new Array("外联应用网关数据库1机","03","0456","wlyywgdb1","1","4");
subcat[457]= new Array("外联应用网关数据库2机","03","0457","wlyywgdb2","1","4");
subcat[458]= new Array("村镇银行数据准备系统1机","03","0458","czsjzb1","1","64");
subcat[459]= new Array("村镇银行数据准备系统2机","03","0459","czsjzb2","1","64");
subcat[460]= new Array("B2B/B2CWEB服务器2机","03","0460","netweb02","1","");
subcat[461]= new Array("中金综合前置应用5","03","0461","zhqzap5","1","8");
subcat[462]= new Array("个人CRM WEB/应用服务器1机","03","0462","pcrmapp1","1","2");
subcat[463]= new Array("个人CRM WEB/应用服务器2机","03","0463","pcrmapp2","1","2");
subcat[464]= new Array("个人CRM在线服务数据库服务器1机","03","0464","pcrmodb1","1","4");
subcat[465]= new Array("个人CRM在线服务数据库服务器2机","03","0465","pcrmodb2","1","4");
subcat[466]= new Array("个人CRM抽取数据库服务器1机","03","0466","pcrmedb1","1","4");
subcat[467]= new Array("个人CRM抽取数据库服务器2机","03","0467","pcrmedb2","1","4");
subcat[468]= new Array("中金核心报表历史库1机","03","0468","bbptdb3","1","4");
subcat[469]= new Array("中金核心报表历史库2机","03","0469","bbptdb4","1","4");
subcat[470]= new Array("三方存管高可用应用服务器1机","03","0470","sfap1","1","72");
subcat[471]= new Array("三方存管高可用应用服务器2机","03","0471","sfap2","1","72");
subcat[472]= new Array("三方存管高可用交易数据库1机","03","0472","sfdb1","1","4");
subcat[473]= new Array("三方存管高可用交易数据库2机","03","0473","sfdb2","1","4");
subcat[474]= new Array("三方存管高可用报表数据库1机","03","0474","sfrpdb1","1","4");
subcat[475]= new Array("三方存管高可用报表数据库2机","03","0475","sfrpdb2","1","4");
subcat[476]= new Array("三方存管高可用WEB服务器1机","03","0476","sfweb1","1","2");
subcat[477]= new Array("三方存管高可用WEB服务器2机","03","0477","sfweb2","1","2");
subcat[478]= new Array("村镇银行理财系统web1机","03","0478","czlcap1","1","");
subcat[479]= new Array("村镇银行理财系统web2机","03","0479","czlcap2","1","");
subcat[480]= new Array("核心高可用系统数据备份","03","0480","bancsdatabak","1","");
subcat[481]= new Array("资产托管客户电子化服务系统_数据库1机","03","0481","zctgdzhptdb1","1","4");
subcat[482]= new Array("资产托管客户电子化服务系统_数据库2机","03","0482","zctgdzhptdb2","1","4");
subcat[483]= new Array("村镇银行支付密码系统数据库1机","03","0483","czzfmmdb1","1","4");
subcat[484]= new Array("村镇银行支付密码系统数据库2机","03","0484","czzfmmdb2","1","4");
subcat[485]= new Array("反欺诈系统数据库1机","03","0485","rewsdb1","1","68");
subcat[486]= new Array("反欺诈系统数据库2机","03","0486","rewsdb2","1","68");
subcat[487]= new Array("村镇银行银联前置/数据准备/密钥管理数据库1机","03","0487","czsjzbdb1","1","4");
subcat[488]= new Array("村镇银行银联前置/数据准备/密钥管理数据库2机","03","0488","czsjzbdb2","1","4");
subcat[489]= new Array("村镇银行密钥管理系统1机","03","0489","czmygl1","1","");
subcat[490]= new Array("村镇银行密钥管理系统2机","03","0490","czmygl2","1","");
subcat[491]= new Array("村镇银行理财系统数据库1机","03","0491","czlcdb1","1","4");
subcat[492]= new Array("村镇银行理财系统数据库2机","03","0492","czlcdb2","1","4");
subcat[493]= new Array("中金外汇清算系统数据库服务器1机","03","0493","whqsdb1","1","4");
subcat[494]= new Array("中金外汇清算系统数据库服务器2机","03","0494","whqsdb2","1","4");
subcat[495]= new Array("合同管理系统/法律事务服务器1机","03","0495","htgldb1","1","4");
subcat[496]= new Array("合同管理系统/法律事务服务器2机","03","0496","htgldb2","1","4");
subcat[497]= new Array("做市商服务器1机","03","0497","ZSS1","4","4");
subcat[498]= new Array("BEAI监控应用服务器","03","0498","beaijkap1","1","");
subcat[499]= new Array("BEAI监控数据库服务器","03","0499","beaijkdb","1","4");
subcat[500]= new Array("中金综合前置应用6","03","0500","zhqzap6","1","8");
subcat[501]= new Array("支付密码旧系统数据库1机","03","0501","zfmmdb3","1","4");
subcat[502]= new Array("支付密码旧系统数据库2机","03","0502","zfmmdb4","1","4");
subcat[503]= new Array("客服抽数","02","0503","cif","4","4");
subcat[504]= new Array("审计自动化系统数据库1机","03","0504","zdhdb1","1","4");
subcat[505]= new Array("审计自动化系统数据库2机","03","0505","zdhdb2","1","4");
subcat[506]= new Array("备付金存管系统数据库1机","03","0506","bfjcg1","1","4");
subcat[507]= new Array("备付金存管系统数据库2机","03","0507","bfjcg2","1","4");
subcat[508]= new Array("新网站数据库1机","03","0508","wzdb1","1","4");
subcat[509]= new Array("新网站数据库2机","03","0509","wzdb2","1","4");
subcat[510]= new Array("中金B2B数据库服务器1机","03","0510","b2bdb1","1","4");
subcat[511]= new Array("直销银行手机后台服务应用1机","03","0511","essjapp1","1","2");
subcat[512]= new Array("直销银行手机后台服务应用2机","03","0512","essjapp2","1","2");
subcat[513]= new Array("直销银行Web1机","03","0513","eaweb1","1","");
subcat[514]= new Array("直销银行Web2机","03","0514","eaweb2","1","");
subcat[515]= new Array("直销银行接入应用1机","03","0515","eaapp1","1","2");
subcat[516]= new Array("直销银行接入应用2机","03","0516","eaapp2","1","2");
subcat[517]= new Array("直销银行内管1机","03","0517","emapp1","1","2");
subcat[518]= new Array("直销银行内管2机","03","0518","emapp2","1","2");
subcat[519]= new Array("直销银行后台服务应用1机","03","0519","esapp1","1","74");
subcat[520]= new Array("直销银行后台服务应用2机","03","0520","esapp2","1","74");
subcat[521]= new Array("直销银行手机接入应用1机","03","0521","easjapp1","1","2");
subcat[522]= new Array("直销银行手机接入应用2机","03","0522","easjapp2","1","2");
subcat[523]= new Array("直销银行数据库1机","03","0523","eadb1","1","4");
subcat[524]= new Array("直销银行数据库2机","03","0524","eadb2","1","4");
subcat[525]= new Array("直销银行日志服务器","03","0525","ealogserver","1","");
subcat[526]= new Array("中金财富管理web1机","03","0526","wmsweb1","1","2");
subcat[527]= new Array("中金财富管理web2机","03","0527","wmsweb2","1","2");
subcat[528]= new Array("中金财富管理bat1机","03","0528","wmsbat1","1","66");
subcat[529]= new Array("中金财富管理bat2机","03","0529","wmsbat2","1","66");
subcat[530]= new Array("中金财富管理rpt1机","03","0530","wmsrpt1","1","");
subcat[531]= new Array("中金财富管理rpt2机","03","0531","wmsrpt2","1","");
subcat[532]= new Array("中金财富管理数据库1机","03","0532","wmsdb1","1","68");
subcat[533]= new Array("中金财富管理数据库2机","03","0533","wmsdb2","1","68");
subcat[534]= new Array("影像流-LDAP系统1机","03","0534","ldap1","1","2");
subcat[535]= new Array("影像流-LDAP系统2机","03","0535","ldap2","1","2");
subcat[536]= new Array("影像流-MQ集群系统1机","03","0536","yxjzmq1","1","1");
subcat[537]= new Array("影像流-MQ集群系统2机","03","0537","yxjzmq2","1","1");
subcat[538]= new Array("影像流-MQ集群系统3机","03","0538","yxjzmq3","1","1");
subcat[539]= new Array("影像流-MQ集群系统4机","03","0539","yxjzmq4","1","1");
subcat[540]= new Array("影像流-MQ集群系统5机","03","0540","yxjzmq5","1","1");
subcat[541]= new Array("影像流-MQ集群系统6机","03","0541","yxjzmq6","1","1");
subcat[542]= new Array("影像流-WODM Decision Server Events数据库1机","03","0542","evtdb1","1","4");
subcat[543]= new Array("影像流-WODM Decision Server Events数据库2机","03","0543","evtdb2","1","4");
subcat[544]= new Array("影像流-WODM Decision Server Rules数据库1机","03","0544","rulesdb1","1","4");
subcat[545]= new Array("影像流-WODM Decision Server Rules数据库2机","03","0545","rulesdb2","1","4");
subcat[546]= new Array("影像流-风险监控系统数据分析数据库1机","03","0546","sjfxdb1","1","4");
subcat[547]= new Array("影像流-风险监控系统数据分析数据库2机","03","0547","sjfxdb2","1","4");
subcat[548]= new Array("影像流-风险监控系统数据分析应用1机","03","0548","","1","66");
subcat[549]= new Array("影像流-风险监控系统数据分析应用2机","03","0549","","1","66");
subcat[550]= new Array("影像流-风险监控系统数据解析数据库1机","03","0550","sjjxdb1","1","4");
subcat[551]= new Array("影像流-风险监控系统数据解析数据库2机","03","0551","sjjxdb2","1","4");
subcat[552]= new Array("影像流-风险监控系统数据解析应用1机","03","0552","sjjxap1","1","");
subcat[553]= new Array("影像流-风险监控系统数据解析应用2机","03","0553","sjjxap2","1","");
subcat[554]= new Array("影像流-归档查询数据库1机","03","0554","sjgddb1","1","4");
subcat[555]= new Array("影像流-归档查询数据库2机","03","0555","sjgddb2","1","4");
subcat[556]= new Array("影像流-集中验印系统数据库1机","03","0556","jzyydb1","1","4");
subcat[557]= new Array("影像流-集中验印系统数据库2机","03","0557","jzyydb2","1","4");
subcat[558]= new Array("影像流-集中验印系统应用1机","03","0558","yanyinap1","1","66");
subcat[559]= new Array("影像流-集中验印系统应用2机","03","0559","yanyinap2","1","66");
subcat[560]= new Array("影像流-集中作业平台FileNet AE应用1机","03","0560","bpcap1","1","2");
subcat[561]= new Array("影像流-集中作业平台FileNet AE应用2机","03","0561","bpcap2","1","2");
subcat[562]= new Array("影像流-集中作业平台FileNet CE数据库1机","03","0562","cedb1","1","4");
subcat[563]= new Array("影像流-集中作业平台FileNet CE数据库2机","03","0563","cedb2","1","4");
subcat[564]= new Array("影像流-集中作业平台FileNet CE应用1机","03","0564","fnceap1","1","2");
subcat[565]= new Array("影像流-集中作业平台FileNet CE应用2机","03","0565","fnceap2","1","2");
subcat[566]= new Array("影像流-集中作业平台FileNet PE数据库1机","03","0566","pedb1","1","4");
subcat[567]= new Array("影像流-集中作业平台FileNet PE数据库2机","03","0567","pedb2","1","4");
subcat[568]= new Array("影像流-集中作业平台FileNet PE应用1机","03","0568","fnpeap1","1","2");
subcat[569]= new Array("影像流-集中作业平台FileNet PE应用2机","03","0569","fnpeap2","1","2");
subcat[570]= new Array("影像流-内容管理系统/影像后端系统数据库1机","03","0570","yxjzdb1","1","4");
subcat[571]= new Array("影像流-内容管理系统/影像后端系统数据库2机","03","0571","yxjzdb2","1","4");
subcat[572]= new Array("影像流-影像前端系统数据库1机","03","0572","absdb1","1","4");
subcat[573]= new Array("影像流-影像前端系统数据库2机","03","0573","absdb2","1","4");
subcat[574]= new Array("华夏稽核新系统1机","03","0574","hxjhdb1","1","4");
subcat[575]= new Array("华夏稽核新系统2机","03","0575","hxjhdb2","1","4");
subcat[576]= new Array("IC卡多应用网关服务器1机","03","0576","icgateway1","1","65");
subcat[577]= new Array("IC卡多应用网关服务器2机","03","0577","icgateway2","1","65");
subcat[578]= new Array("IC卡多应用平台应用服务器1机","03","0578","icmappap1","1","64");
subcat[579]= new Array("IC卡多应用平台应用服务器2机","03","0579","icmappap2","1","64");
subcat[580]= new Array("网银对公数据库服务器1机","03","0580","enbdb1","1","4");
subcat[581]= new Array("网银对公数据库服务器2机","03","0581","enbdb2","1","4");
subcat[582]= new Array("理财类系统理财报表数据库1机","03","0582","lclrpdb1","1","4");
subcat[583]= new Array("理财类系统理财报表数据库2机","03","0583","lclrpdb2","1","4");
subcat[584]= new Array("理财类系统理财交易数据库1机","03","0584","lcljydb1","1","4");
subcat[585]= new Array("理财类系统理财交易数据库2机","03","0585","lcljydb2","1","4");
subcat[586]= new Array("理财类系统银保通应用数据库1机","03","0586","lclybtdb1","1","4");
subcat[587]= new Array("理财类系统银保通应用数据库2机","03","0587","lclybtdb2","1","4");
subcat[588]= new Array("理财类系统应用服务器1机","03","0588","lclap1","1","74");
subcat[589]= new Array("理财类系统应用服务器2机","03","0589","lclap2","1","74");
subcat[590]= new Array("理财类系统应用服务器3机","03","0590","lclap3","1","74");
subcat[591]= new Array("理财类系统应用服务器4机","03","0591","lclap4","1","74");
subcat[592]= new Array("理财类系统应用服务器5机","03","0592","lclap5","1","74");
subcat[593]= new Array("理财类系统应用服务器6机","03","0593","lclap6","1","74");
subcat[594]= new Array("短信备用服务器1机","03","0594","hxsmsby1","1","");
subcat[595]= new Array("短信备用服务器2机","03","0595","hxsmsby2","1","");
subcat[596]= new Array("短信数据库服务器1机","03","0596","hxsmsdb1","1","4");
subcat[597]= new Array("短信数据库服务器2机","03","0597","hxsmsdb2","1","4");
subcat[598]= new Array("短信文件服务器1机","03","0598","hxsmsfile1","1","64");
subcat[599]= new Array("短信文件服务器2机","03","0599","hxsmsfile2","1","64");
subcat[600]= new Array("短信应用服务器1机","03","0600","hxsmsapp1","1","2");
subcat[601]= new Array("短信应用服务器2机","03","0601","hxsmsapp2","1","2");
subcat[602]= new Array("财税库行系统1机","03","0602","cskh1","1","73");
subcat[603]= new Array("财税库行系统2机","03","0603","cskh2","1","73");
subcat[604]= new Array("数据仓库关键移动指标查询数据库1机","03","0604","sjckgjydzbcxdb1","1","4");
subcat[605]= new Array("数据仓库关键移动指标查询数据库2机","03","0605","sjckgjydzbcxdb2","1","4");
subcat[606]= new Array("数据仓库SAS数据库1机","03","0606","sasdb1","1","4");
subcat[607]= new Array("数据仓库SAS数据库2机","03","0607","sasdb2","1","4");
subcat[608]= new Array("数据仓库风险集市数据库1机","03","0608","sjckfxjsdb1","1","4");
subcat[609]= new Array("数据仓库风险集市数据库2机","03","0609","sjckfxjsdb2","1","4");
subcat[610]= new Array("数据仓库客户集市数据库1机","03","0610","sjckkhjsdb1","1","4");
subcat[611]= new Array("数据仓库客户集市数据库2机","03","0611","sjckkhjsdb2","1","4");
subcat[612]= new Array("理财类基金交易数据库1机","03","0612","nlcjjjydb1","1","4");
subcat[613]= new Array("理财类基金交易数据库2机","03","0613","nlcjjjydb2","1","4");
subcat[614]= new Array("理财类基金报表数据库1机","03","0614","nlcjjrpdb1","1","4");
subcat[615]= new Array("理财类基金报表数据库2机","03","0615","nlcjjrpdb2","1","4");
subcat[616]= new Array("理财类支付宝数据库1机","03","0616","nlczfbdb1","1","4");
subcat[617]= new Array("理财类支付宝数据库2机","03","0617","nlczfbdb2","1","4");
subcat[618]= new Array("同城灾备核心高可用系统1机","03","0618","bancs01","1","");
subcat[619]= new Array("同城灾备核心高可用系统2机","03","0619","bancs02","1","");
subcat[620]= new Array("村镇银行理财类应用服务器1机","03","0620","czlcgkyap1","1","70");
subcat[621]= new Array("村镇银行理财类应用服务器2机","03","0621","czlcgkyap2","1","70");
subcat[622]= new Array("信用卡互联与清算应用服务器1机","03","0622","xykhlqsap1","1","72");
subcat[623]= new Array("信用卡互联与清算应用服务器2机","03","0623","xykhlqsap2","1","72");
subcat[624]= new Array("信用卡互联与清算数据库服务器1机","03","0624","xykhlqsdb1","1","4");
subcat[625]= new Array("信用卡互联与清算数据库服务器2机","03","0625","xykhlqsdb2","1","4");
subcat[626]= new Array("管理会计数据库1机","03","0626","mapdb1","1","4");
subcat[627]= new Array("管理会计数据库2机","03","0627","mapdb2","1","4");
subcat[628]= new Array("管理会计数据库3机","03","0628","mapdb3","1","4");
subcat[629]= new Array("管理会计数据库4机","03","0629","mapdb4","1","4");
subcat[630]= new Array("管理会计数据集市数据库1机","03","0630","fdmdb1","1","4");
subcat[631]= new Array("管理会计数据集市数据库2机","03","0631","fdmdb2","1","4");
subcat[632]= new Array("手机银行金融接入应用3机","03","0632","sjjrap3","1","");
subcat[633]= new Array("手机银行金融接入应用4机","03","0633","sjjrap4","1","");
subcat[634]= new Array("手机银行金融web接入3机","03","0634","sjjrjr3","1","");
subcat[635]= new Array("手机银行金融web接入4机","03","0635","sjjrjr4","1","");
subcat[636]= new Array("数据归档数据库3机","03","0636","sjgddb3","1","4");
subcat[637]= new Array("数据归档数据库4机","03","0637","sjgddb4","1","4");
subcat[638]= new Array("核心查询打印历史查询1机","02","0638","rephisapp1","1","64");
subcat[639]= new Array("核心查询打印历史查询2机","02","0639","rephisapp2","1","64");
subcat[640]= new Array("合同管理-法律事务数据库1机","03","0640","htgldb1","1","4");
subcat[641]= new Array("合同管理-法律事务数据库2机","03","0641","htgldb2","1","4");
subcat[642]= new Array("B2B/B2C应用服务器2机","03","0642","netapp02","1","66");
subcat[643]= new Array("B2B/B2C应用服务器3机","03","0643","localhost","1","66");
subcat[644]= new Array("人民币跨境支付系统前置1机","03","0644","cipspmtsqz1","1","1");
subcat[645]= new Array("人民币跨境支付系统前置2机","03","0645","cipspmtsqz2","1","1");
subcat[646]= new Array("人民币跨境支付系统备份前置1机","03","0646","cipspmtsqzby1","1","1");
subcat[647]= new Array("人民币跨境支付系统备份前置2机","03","0647","cipspmtsqzby2","1","1");
subcat[648]= new Array("人民币跨境支付系统应用1机","03","0648","cipsap1","1","65");
subcat[649]= new Array("人民币跨境支付系统应用2机","03","0649","cipsap2","1","65");
subcat[650]= new Array("人民币跨境支付系统管理端应用1机","03","0650","cipsmgap1","1","");
subcat[651]= new Array("人民币跨境支付系统管理端应用2机","03","0651","cipsmgap2","1","");
subcat[652]= new Array("国结报表应用1机","03","0652","xgjrpap1","1","2");
subcat[653]= new Array("国结报表应用2机","03","0653","xgjrpap2","1","2");
subcat[654]= new Array("国结报表数据库1机","03","0654","xgjdgdb1","1","4");
subcat[655]= new Array("国结报表数据库2机","03","0655","xgjdgdb2","1","4");
subcat[656]= new Array("指纹认证高可用数据库1机","03","0656","zwrzgkydb1","1","4");
subcat[657]= new Array("指纹认证高可用数据库2机","03","0657","zwrzgkydb2","1","4");
subcat[658]= new Array("监管EAST1机","03","0658","sjckzzj1","1","4");
subcat[659]= new Array("监管EAST2机","03","0659","sjckzzj2","1","4");
subcat[660]= new Array("AMFE应用1机","03","0660","","1","2");
subcat[661]= new Array("AMFE应用2机","03","0661","","1","2");
subcat[662]= new Array("AMFE数据库1机","03","0662","","1","5");
subcat[663]= new Array("AMFE数据库2机","03","0663","","1","5");
subcat[664]= new Array("支付融资系统数据库1机","03","0664","zfrzdb1","1","4");
subcat[665]= new Array("支付融资系统数据库2机","03","0665","zfrzdb2","1","4");
subcat[666]= new Array("二代支付系统前置备用服务器1机","03","0666","pmtsqzby1","1","1");
subcat[667]= new Array("二代支付系统前置备用服务器2机","03","0667","pmtsqzby2","1","1");
subcat[668]= new Array("BEAI高可用应用1机","03","0668","beaiap01","1","72");
subcat[669]= new Array("BEAI高可用应用2机","03","0669","beaiap02","1","72");
subcat[670]= new Array("BEAI高可用应用3机","03","0670","beaiap03","1","72");
subcat[671]= new Array("BEAI高可用应用4机","03","0671","beaiap04","1","72");
subcat[672]= new Array("BEAI高可用数据库1机","03","0672","beaidb01","1","4");
subcat[673]= new Array("BEAI高可用数据库2机","03","0673","beaidb02","1","4");
subcat[674]= new Array("个人CRM分析性数据库1机","03","0674","fxcrmdb1","1","4");
subcat[675]= new Array("个人CRM分析性数据库2机","03","0675","fxcrmdb2","1","4");
subcat[676]= new Array("理财投资管理应用1机","03","0676","lctzglap1","1","66");
subcat[677]= new Array("理财投资管理应用2机","03","0677","lctzglap2","1","66");
subcat[678]= new Array("理财投资管理数据库1机","03","0678","lctzgldb1","1","4");
subcat[679]= new Array("理财投资管理数据库2机","03","0679","lctzgldb2","1","4");
subcat[680]= new Array("村镇银行诈骗交易数据库1机","03","0680","czzpjydb1","1","4");
subcat[681]= new Array("村镇银行诈骗交易数据库2机","03","0681","czzpjydb2","1","4");
subcat[682]= new Array("同城灾备核心高可用系统3机","03","0682","bancs03","1","");
subcat[683]= new Array("同城灾备核心高可用系统4机","03","0683","bancs04","1","");
subcat[684]= new Array("同城灾备BEAI系统应用3机","03","0684","beaiap03","1","");
subcat[685]= new Array("同城灾备BEAI系统应用4机","03","0685","beaiap04","1","");
subcat[686]= new Array("同城灾备理财类应用1机","03","0686","lclap1","1","");
subcat[687]= new Array("同城灾备理财类应用2机","03","0687","lclap2","1","");
subcat[688]= new Array("同城灾备理财类应用3机","03","0688","lclap3","1","");
subcat[689]= new Array("同城灾备理财类应用4机","03","0689","lclap4","1","");
subcat[690]= new Array("同城灾备理财类应用5机","03","0690","lclap5","1","");
subcat[691]= new Array("同城灾备理财类应用6机","03","0691","lclap6","1","");
subcat[692]= new Array("同城灾备理财类银保通数据库1机","03","0692","lclybtdb1","1","");
subcat[693]= new Array("同城灾备理财类银保通数据库2机","03","0693","lclybtdb2","1","");
subcat[694]= new Array("同城灾备理财类基金交易数据库1机","03","0694","nlcjjjydb1","1","");
subcat[695]= new Array("同城灾备理财类基金交易数据库2机","03","0695","nlcjjjydb2","1","");
subcat[696]= new Array("同城灾备理财类基金报表数据库1机","03","0696","nlcjjrpdb1","1","");
subcat[697]= new Array("同城灾备理财类基金报表数据库2机","03","0697","nlcjjrpdb2","1","");
subcat[698]= new Array("同城灾备理财类理财交易数据库1机","03","0698","lcljydb1","1","");
subcat[699]= new Array("同城灾备理财类理财交易数据库2机","03","0699","lcljydb2","1","");
subcat[700]= new Array("新综合管理信息系统-portal01","03","L001","portal01","8","");
subcat[701]= new Array("新综合管理信息系统-portal02","03","L002","portal02","8","");
subcat[702]= new Array("新综合管理信息系统-portal03","03","L003","portal03","8","");
subcat[703]= new Array("新综合管理信息系统-portal04","03","L004","portal04","8","");
subcat[704]= new Array("新综合管理信息系统-portal05","03","L005","portal05","8","");
subcat[705]= new Array("新综合管理信息系统-portal06","03","L006","portal06","8","");
subcat[706]= new Array("新综合管理信息系统-portalsrv01","03","L007","portalsrv01","8","");
subcat[707]= new Array("新综合管理信息系统-portalsrv02","03","L008","portalsrv02","8","");
subcat[708]= new Array("新综合管理信息系统-portalweb01","03","L009","portalweb01","8","");
subcat[709]= new Array("新综合管理信息系统-portalweb02","03","L010","portalweb02","8","");
subcat[710]= new Array("新综合管理信息系统-portalweb03","03","L011","portalweb03","8","");
subcat[711]= new Array("新综合管理信息系统-portalweb04","03","L012","portalweb04","8","");
subcat[712]= new Array("新综合管理信息系统-portal07","03","L013","portal07","8","");
subcat[713]= new Array("新综合管理信息系统-portal08","03","L014","portal08","8","");
subcat[714]= new Array("合同管理应用A机-HetongAppA","03","L016","HetongAppA","8","");
subcat[715]= new Array("合同管理应用B机-HetongAppB","03","L015","HetongAppB","8","");
subcat[716]= new Array("村镇反洗黑钱-jyhxbank","03","L018","jyhxbank","8","");
subcat[717]= new Array("村镇反洗黑钱-fxq-zj","03","L017","fxq-zj","8","");
subcat[718]= new Array("微信银行-WX-TIMER-A","03","L019","WX-TIMER-A","8","");
subcat[719]= new Array("微信银行-WX-TIMER-B","03","L020","WX-TIMER-B","8","");
subcat[720]= new Array("微信银行-WX-GATEWAY-A","03","L021","WX-GATEWAY-A","8","");
subcat[721]= new Array("微信银行-WX-GATEWAY-B","03","L022","WX-GATEWAY-B","8","");
subcat[722]= new Array("微信银行-WX-GATEWAY-C","03","L023","WX-GATEWAY-C","8","");
subcat[723]= new Array("微信银行-WX-PWXWEB-A","03","L024","WX-PWXWEB-A","8","");
subcat[724]= new Array("微信银行-WX-PWXWEB-B","03","L025","WX-PWXWEB-B","8","");
subcat[725]= new Array("微信银行-WX-PWXWEB-C","03","L026","WX-PWXWEB-C","8","");
subcat[726]= new Array("微信银行-WX-MNG-A","03","L027","WX-MNG-A","8","");
subcat[727]= new Array("微信银行-WX-MNG-B","03","L028","WX-MNG-B","8","");
subcat[728]= new Array("微信银行-WX-INWEB-A","03","L029","WX-INWEB-A","8","");
subcat[729]= new Array("微信银行-WX-INWEB-B","03","L030","WX-INWEB-B","8","");
subcat[730]= new Array("微信银行-WX-INWEB-C","03","L031","WX-INWEB-C","8","");
subcat[731]= new Array("微信银行-WX-OUTWEB-A","03","L032","WX-OUTWEB-A","8","");
subcat[732]= new Array("微信银行-WX-OUTWEB-B","03","L033","WX-OUTWEB-B","8","");
subcat[733]= new Array("微信银行-WX-OUTWEB-C","03","L034","WX-OUTWEB-C","8","");
subcat[734]= new Array("微信银行-wxyhdb1","03","L035","wxyhdb1","8","");
subcat[735]= new Array("微信银行-wxyhdb2","03","L036","wxyhdb2","8","");
subcat[736]= new Array("天津微信银行-TJWX-APP-A","03","L037","TJWX-APP-A","8","");
subcat[737]= new Array("天津微信银行-TJWX-APP-B","03","L038","TJWX-APP-B","8","");
subcat[738]= new Array("天津微信银行-TJWX-TIMER-A","03","L039","TJWX-TIMER-A","8","");
subcat[739]= new Array("天津微信银行-TJWX-TIMER-B","03","L040","TJWX-TIMER-B","8","");
subcat[740]= new Array("天津微信银行-tjwxdb1","03","L041","tjwxdb1","8","");
subcat[741]= new Array("天津微信银行-tjwxdb2","03","L042","tjwxdb2","8","");
subcat[742]= new Array("IT综合管理平台-itzhgldb1","03","L043","itzhgldb1","8","");
subcat[743]= new Array("IT综合管理平台-itzhgldb2","03","L044","itzhgldb2","8","");
subcat[744]= new Array("IT综合管理平台-portalcon1","03","L045","portalcon1","8","");
subcat[745]= new Array("IT综合管理平台-portalcon2","03","L046","portalcon2","8","");
subcat[746]= new Array("IT综合管理平台-portalids1","03","L047","portalids1","8","");
subcat[747]= new Array("IT综合管理平台-portalids2","03","L048","portalids2","8","");
subcat[748]= new Array("IT综合管理平台-portalids3","03","L049","portalids3","8","");
subcat[749]= new Array("IT综合管理平台-portalids4","03","L050","portalids4","8","");
subcat[750]= new Array("IT综合管理平台-ITZHGLWEB01","03","L051","ITZHGLWEB01","8","");
subcat[751]= new Array("IT综合管理平台-ITZHGLWEB02","03","L052","ITZHGLWEB02","8","");
subcat[752]= new Array("个人CRM移动终端服务器-pcrmmfa","03","L053","pcrmmfa","8","");
subcat[753]= new Array("个人CRM移动终端服务器-pcrmmfb","03","L054","pcrmmfb","8","");
subcat[754]= new Array("个人CRM移动终端数据库服务器一机-pcmmdmdb1","03","L055","pcmmdmdb1","8","");
subcat[755]= new Array("个人CRM移动终端数据库服务器二机-pcmmdmdb2","03","L056","pcmmdmdb2","8","");
subcat[756]= new Array("影像流-集中作业平台内管系统1机-nbgl1","03","L057","nbgl1","8","");
subcat[757]= new Array("影像流-集中作业平台内管系统2机-nbgl2","03","L058","nbgl2","8","");
subcat[758]= new Array("影像流-风险监控系统1机-armsap1","03","L059","armsap1","8","");
subcat[759]= new Array("影像流-风险监控系统2机-armsap2","03","L060","armsap2","8","");
subcat[760]= new Array("影像流-影像前端系统1机-absap1","03","L061","absap1","8","");
subcat[761]= new Array("影像流-影像前端系统2机-absap2","03","L062","absap2","8","");
subcat[762]= new Array("影像流-影像前端系统3机-absap3","03","L063","absap3","8","");
subcat[763]= new Array("影像流-影像前端系统4机-absap4","03","L064","absap4","8","");
subcat[764]= new Array("影像流-影像前端系统5机-absap5","03","L065","absap5","8","");
subcat[765]= new Array("影像流-影像前端系统6机-absap6","03","L066","absap6","8","");
subcat[766]= new Array("影像流-影像前端系统7机-absap7","03","L067","absap7","8","");
subcat[767]= new Array("影像流-影像前端系统8机-absap8","03","L068","absap8","8","");
subcat[768]= new Array("影像流-归档查询系统1机-guidangap1","03","L069","guidangap1","8","");
subcat[769]= new Array("影像流-归档查询系统2机-guidangap2","03","L070","guidangap2","8","");
subcat[770]= new Array("影像流-集中作业平台内管系统数据库1机-nbgldb1","03","L071","nbgldb1","8","");
subcat[771]= new Array("影像流-集中作业平台内管系统数据库2机-nbgldb2","03","L072","nbgldb2","8","");
subcat[772]= new Array("招聘系统应用1机-ZPXT-WAS01","03","L073","ZPXT-WAS01","8","");
subcat[773]= new Array("招聘系统应用2机-ZPXT-WAS02","03","L074","ZPXT-WAS02","8","");
subcat[774]= new Array("招聘系统应用3机-ZPXT-WAS03","03","L075","ZPXT-WAS03","8","");
subcat[775]= new Array("招聘系统WEB1机-ZPXT-WEB01","03","L076","ZPXT-WEB01","8","");
subcat[776]= new Array("招聘系统WEB2机-ZPXT-WEB02","03","L077","ZPXT-WEB02","8","");
subcat[777]= new Array("招聘系统数据库1机-ZPXT-DB01","03","L078","ZPXT-DB01","8","");
subcat[778]= new Array("招聘系统数据库2机-ZPXT-DB02","03","L079","ZPXT-DB02","8","");
subcat[779]= new Array("理财WEB服务器1机-lclweb1","03","L080","lclweb1","8","");
subcat[780]= new Array("理财WEB服务器2机-lclweb2","03","L081","lclweb2","8","");
subcat[781]= new Array("理财WEB服务器3机-lclweb3","03","L082","lclweb3","8","");
subcat[782]= new Array("理财WEB服务器4机-lclweb4","03","L083","lclweb4","8","");
subcat[783]= new Array("短信平台-hxsmsgw1","03","L084","hxsmsgw1","8","");
subcat[784]= new Array("短信平台-hxsmsgw2","03","L085","hxsmsgw2","8","");
subcat[785]= new Array("短信平台-hxsmsmas1","03","L086","hxsmsmas1","8","");
subcat[786]= new Array("短信平台-hxsmsmas2","03","L087","hxsmsmas2","8","");
subcat[787]= new Array("外汇清算-hxwhqsapp1","03","L088","hxwhqsapp1","8","");
subcat[788]= new Array("外汇清算-hxwhqsapp2","03","L089","hxwhqsapp2","8","");
subcat[789]= new Array("影像流-影像前端系统-absap9","02","L090","absap9","8","");
subcat[790]= new Array("影像流-影像前端系统-absap10","02","L091","absap10","8","");
subcat[791]= new Array("影像流-影像前端系统-absap11","02","L092","absap11","8","");
subcat[792]= new Array("影像流-影像前端系统-absap12","02","L093","absap12","8","");
subcat[793]= new Array("影像流-影像前端系统-absap13","02","L094","absap13","8","");
subcat[794]= new Array("影像流-影像前端系统-absap14","02","L095","absap14","8","");
subcat[795]= new Array("AMFE-AMFEWEB1","03","L096","AMFEWEB1","8","");
subcat[796]= new Array("AMFE-AMFEWEB2","03","L097","AMFEWEB2","8","");
subcat[797]= new Array("作业调度数据库1机","03","0797","zydddb1","1","4");
subcat[798]= new Array("作业调度数据库2机","03","0798","zydddb2","1","4");
subcat[799]= new Array("null","","0699","","","");
subcat[800]= new Array("黄金买卖-黄金风险控制系统A机-riskservera","03","L098","riskservera","8","");
subcat[801]= new Array("黄金买卖-黄金风险控制系统B机-riskserverb","03","L099","riskserverb","8","");
subcat[802]= new Array("村镇银行-村镇个人网银01机-czgrwyweb1","03","L100","czgrwyweb1","8","");
subcat[803]= new Array("村镇银行-村镇个人网银02机-czgrwyweb2","03","L101","czgrwyweb2","8","");
subcat[804]= new Array("数据仓库-数据仓库关键查询服务器1机-sjckgjcx1","03","L102","sjckgjcx1","8","");
subcat[805]= new Array("数据仓库-数据仓库关键查询服务器2机-sjckgjcx2","03","L103","sjckgjcx2","8","");
subcat[806]= new Array("数据仓库-数据仓库管控APP1机-sjckgkapp1","03","L104","sjckgkapp1","8","");
subcat[807]= new Array("数据仓库-数据仓库管控APP2机-sjckgkapp2","03","L105","sjckgkapp2","8","");
subcat[808]= new Array("数据仓库-数据仓库调度1机-sjckdd1","03","L106","sjckdd1","8","");
subcat[809]= new Array("数据仓库-数据仓库调度2机-sjckdd2","03","L107","sjckdd2","8","");
subcat[810]= new Array("数据仓库-数据门户1机-SJCKportal1","03","L108","SJCKportal1","8","");
subcat[811]= new Array("数据仓库-数据门户2机-SJCKportal2","03","L109","SJCKportal2","8","");
subcat[812]= new Array("数据仓库-数据门户3机-SJCKportal3","03","L110","SJCKportal3","8","");
subcat[813]= new Array("数据仓库-数据门户4机-SJCKportal4","03","L111","SJCKportal4","8","");
subcat[814]= new Array("数据仓库-数据门户5机-SJCKportal5","03","L112","SJCKportal5","8","");
subcat[815]= new Array("数据仓库-数据门户6机-SJCKportal6","03","L113","SJCKportal6","8","");
subcat[816]= new Array("自动化-自动化1机-BBSA01","03","L114","BBSA01","8","");
subcat[817]= new Array("自动化-自动化2机-BBSA02","03","L115","BBSA02","8","");
subcat[818]= new Array("自动化-应用发布服务器1机-BRPM01","03","L116","BRPM01","8","");
subcat[819]= new Array("自动化-应用发布服务器2机-BRPM02","03","L117","BRPM02","8","");
subcat[820]= new Array("自动化-网络自动化服务器1机-BNA01","03","L118","BNA01","8","");
subcat[821]= new Array("自动化-网络自动化服务器2机-BNA02","03","L119","BNA02","8","");
subcat[822]= new Array("自动化-配置管理数据库1机-CMDB01","03","L120","CMDB01","8","");
subcat[823]= new Array("自动化-配置管理数据库2机-CMDB02","03","L121","CMDB02","8","");
subcat[824]= new Array("自动化-自动发现工具1机-ADDM01","03","L122","ADDM01","8","");
subcat[825]= new Array("自动化-自动发现工具2机-ADDM02","03","L123","ADDM02","8","");
subcat[826]= new Array("自动化-介质服务器1机-image01","03","L124","image01","8","");
subcat[827]= new Array("自动化-介质服务器2机-image02","03","L125","image02","8","");
subcat[828]= new Array("自动化-报表服务器-BBDSSA01","03","L126","BBDSSA01","8","");
subcat[829]= new Array("自动化-裸机安装服务器1机-ZDH-PXE01","03","L127","PXE01","8","");
subcat[830]= new Array("自动化-网络自动化跳转服务器-ZDH-Devagent01","03","L128","Devagent01","8","");
subcat[831]= new Array("自动化-自动化跳转服务器1机-ZDH-repeat01","03","L129","repeat01","8","");
subcat[832]= new Array("自动化-ADDM代理服务器-addmagent01","03","L130","addmagent01","8","");
subcat[833]= new Array("微信银行-拦截服务器1-WX-INTERCEPTOR-A","03","L135","WX-INTERCEPTOR-A","8","");
subcat[834]= new Array("微信银行-拦截服务器2-WX-INTERCEPTOR-B","03","L136","WX-INTERCEPTOR-B","8","");
subcat[835]= new Array("微信银行-拦截服务器3-WX-INTERCEPTOR-C","03","L137","WX-INTERCEPTOR-C","8","");
subcat[836]= new Array("微信银行-拦截服务器4-WX-INTERCEPTOR-D","03","L138","WX-INTERCEPTOR-D","8","");
subcat[837]= new Array("微信银行-拦截服务器5-WX-INTERCEPTOR-E","03","L139","WX-INTERCEPTOR-E","8","");
subcat[838]= new Array("微信银行-拦截服务器6-WX-INTERCEPTOR-F","03","L140","WX-INTERCEPTOR-F","8","");
subcat[839]= new Array("微信银行-应用服务器1-WX-PROMOTEWEB-A","03","L141"," WX-PROMOTEWEB-A","8","");
subcat[840]= new Array("微信银行-应用服务器2-WX-PROMOTEWEB-B","03","L142"," WX-PROMOTEWEB-B","8","");
subcat[841]= new Array("微信银行-应用服务器3-WX-PROMOTEWEB-C","03","L143"," WX-PROMOTEWEB-C","8","");
subcat[842]= new Array("微信银行-应用服务器4-WX-PROMOTEWEB-D","03","L144"," WX-PROMOTEWEB-D","8","");
subcat[843]= new Array("微信银行-缓存服务器1-WX-REDIS-A","03","L145","WX-REDIS-A","8","");
subcat[844]= new Array("微信银行-缓存服务器2-WX-REDIS-B","03","L146","WX-REDIS-B","8","");
subcat[845]= new Array("微信银行-缓存服务器3-WX-REDIS-C","03","L147","WX-REDIS-C","8","");
subcat[846]= new Array("外联应用网关系统-应用服务器1-wlapp1","03","L148","wlapp1","8","");
subcat[847]= new Array("外联应用网关系统-应用服务器2-wlapp2","03","L149","wlapp2","8","");
subcat[848]= new Array("外联应用网关系统-应用服务器3-wlapp3","03","L150","wlapp3","8","");
subcat[849]= new Array("外联应用网关系统-应用服务器4-wlapp4","03","L151","wlapp4","8","");
subcat[850]= new Array("外联应用网关系统-应用服务器5-wlapp5","03","L152","wlapp5","8","");
subcat[851]= new Array("外联应用网关系统-应用服务器6-wlapp6","03","L153","wlapp6","8","");
subcat[852]= new Array("外联应用网关系统-公网通讯服务器1-wlyywgtx1","03","L154","wlyywgtx1","8","");
subcat[853]= new Array("外联应用网关系统-公网通讯服务器2-wlyywgtx2","03","L155","wlyywgtx2","8","");
subcat[854]= new Array("外联应用网关系统-管理控制服务器1-wlyywggk1","03","L156","wlyywggk1","8","");
subcat[855]= new Array("外联应用网关系统-管理控制服务器2-wlyywggk2","03","L157","wlyywggk2","8","");
subcat[856]= new Array("影像流-海口分行影像流DB1-hkfhyxldb1","03","L158","hkfhyxldb1","8","4");
subcat[857]= new Array("影像流-海口分行影像流DB2-hkfhyxldb2","03","L159","hkfhyxldb2","8","4");
subcat[858]= new Array("影像流-海口分行影像流影像缓存-fhyxlyxhc1","03","L160","fhyxlyxhc1","8","");
subcat[859]= new Array("手机银行-手机银行消息推送1-sjyhxxts1","03","L161","sjyhxxts1","8","");
subcat[860]= new Array("手机银行-手机银行消息推送2-sjyhxxts2","03","L162","sjyhxxts2","8","");
subcat[861]= new Array("手机银行-手机银行应用1-sjyhtsapp1","03","L163","sjyhtsapp1","8","");
subcat[862]= new Array("手机银行-手机银行应用2-sjyhtsapp2","03","L164","sjyhtsapp2","8","");
subcat[863]= new Array("手机银行-手机银行管理1-sjyhtsmng1","03","L165","sjyhtsmng1","8","");
subcat[864]= new Array("手机银行-手机银行管理2-sjyhtsmng2","03","L166","sjyhtsmng2","8","");
subcat[865]= new Array("数据仓库-数据仓库移动关键指标WEB1-ydgjzbweb1","03","L167","ydgjzbweb1","8","");
subcat[866]= new Array("数据仓库-数据仓库移动关键指标WEB2-ydgjzbweb2","03","L168","ydgjzbweb2","8","");
subcat[867]= new Array("数据仓库-数据仓库移动关键指标APP1-ydgjzbapp1","03","L169","ydgjzbapp1","8","");
subcat[868]= new Array("数据仓库-数据仓库移动关键指标APP2-ydgjzbapp2","03","L170","ydgjzbapp2","8","");
subcat[869]= new Array("智能机器人-小I前置服务器A-irbtfronta","03","L171","irbtfronta","8","");
subcat[870]= new Array("智能机器人-小I前置服务器B-irbtfrontb","03","L172","irbtfrontb","8","");
subcat[871]= new Array("智能机器人-小I引擎服务器A-irbtenginea","03","L173","irbtenginea","8","");
subcat[872]= new Array("智能机器人-小I引擎服务器B-irbtengineb","03","L174","irbtengineb","8","");
subcat[873]= new Array("智能机器人-小I引擎服务器C-irbtenginec","03","L175","irbtenginec","8","");
subcat[874]= new Array("智能机器人-小I管理服务器A-irbtmanagea","03","L176","irbtmanagea","8","");
subcat[875]= new Array("智能机器人-小I管理服务器B-irbtmanageb","03","L177","irbtmanageb","8","");
subcat[876]= new Array("智能机器人-小I数据库服务器A-irbtdb1","03","L178","irbtdb1","8","");
subcat[877]= new Array("智能机器人-小I数据库服务器B-irbtdb2","03","L179","irbtdb2","8","");
subcat[878]= new Array("村镇门户反洗钱数据库-村镇门户反洗钱数据库1机-czmhfxqdb1","03","L180","czmhfxqdb1","8","4");
subcat[879]= new Array("村镇门户反洗钱数据库-村镇门户反洗钱数据库2机-czmhfxqdb2","03","L181","czmhfxqdb2","8","4");
subcat[880]= new Array("村镇反洗钱门户-村镇反洗钱门户1机-czfxqmh1","03","L182","czfxqmh1","8","");
subcat[881]= new Array("村镇反洗钱门户-村镇反洗钱门户2机-czfxqmh2","03","L183","czfxqmh2","8","");
subcat[882]= new Array("合同管理系统-合同管理应用1机-htglapp1","03","L184","htglapp1","8","");
subcat[883]= new Array("合同管理系统-合同管理应用2机-htglapp2","03","L185","htglapp2","8","");
subcat[884]= new Array("数据归档系统-数据归档应用A机-archive-host1","03","L186","archive-host1","8","");
subcat[885]= new Array("数据归档系统-数据归档应用B机-archive-host2","03","L187","archive-host2","8","");
subcat[886]= new Array("反欺诈系统-反欺诈数据采集A机-rewsrt1","03","L188","rewsrt1","8","");
subcat[887]= new Array("反欺诈系统-反欺诈数据采集B机-rewsrt2","03","L189","rewsrt2","8","");
subcat[888]= new Array("反欺诈系统-反欺诈数据采集C机-rewsrt3","03","L190","rewsrt3","8","");
subcat[889]= new Array("反欺诈系统-反欺诈数据采集D机-rewsrt4","03","L191","rewsrt4","8","");
subcat[890]= new Array("反欺诈系统-反欺诈应用A机-rewsqpp1","03","L192","rewsqpp1","8","");
subcat[891]= new Array("反欺诈系统-反欺诈应用B机-rewsqpp2","03","L193","rewsqpp2","8","");
subcat[892]= new Array("国际收支申报系统-结售汇报表系统应用1机-fxqweb-01","03","L194","fxqweb-1","8","");
subcat[893]= new Array("国际收支申报系统-结售汇报表系统应用2机-fxqweb-02","03","L195","fxqweb-2","8","");
subcat[894]= new Array("国际收支申报系统-结售汇报表系统应用3机-ldap42","03","L196","ldap42","8","");
subcat[895]= new Array("国际收支申报系统-结售汇报表系统应用4机-ldap43","03","L197","ldap43","8","");
subcat[896]= new Array("TOPS系统-TOPS新平台接入前置A机-TPOS-NEW-A","03","L198","TPOS-NEW-A","8","");
subcat[897]= new Array("TOPS系统-TOPS新平台接入前置B机-TPOS-NEW-B","03","L199","TPOS-NEW-B","8","");
subcat[898]= new Array("TOPS系统-TOPS新平台接入前置备机-TPOS-NEW-BAK","03","L200","TPOS-NEW-BAK","8","");
subcat[899]= new Array("MPOS系统-MPOS系统MPP应用1机-mposmppap1","03","L201","mposmppap1","8","");
subcat[900]= new Array("MPOS系统-MPOS系统MPP应用2机-mposmppap2","03","L202","mposmppap2","8","");
subcat[901]= new Array("MPOS系统-MPOS系统MPP管理机1机-mposmppgl1","03","L203","mposmppgl1","8","");
subcat[902]= new Array("MPOS系统-MPOS系统MPP管理机2机-mposmppgl2","03","L204","mposmppgl2","8","");
subcat[903]= new Array("MPOS系统-MPOS系统代理服务器1机-mposmppdl1","03","L205","mposmppdl1","8","");
subcat[904]= new Array("MPOS系统-MPOS系统代理服务器2机-mposmppdl2","03","L206","mposmppdl2","8","");
subcat[905]= new Array("抵制押品系统-抵制押品数据库1机-dzypdb1","03","L207","dzypdb1","8","4");
subcat[906]= new Array("抵制押品系统-抵制押品数据库2机-dzypdb2","03","L208","dzypdb2","8","4");
subcat[907]= new Array("抵制押品系统-抵制押品应用1机-dzypapp1","03","L209","dzypapp1","8","");
subcat[908]= new Array("抵制押品系统-抵制押品应用2机-dzypapp2","03","L210","dzypapp2","8","");
subcat[909]= new Array("视频客服-智能视频客服vta1机-znkfvta1","03","L211","znkfvta1","8","");
subcat[910]= new Array("视频客服-智能视频客服vta2机-znkfvta2","03","L212","znkfvta2","8","");
subcat[911]= new Array("视频客服-智能视频客服vtm1机-znkfvtm1","03","L213","znkfvtm1","8","");
subcat[912]= new Array("视频客服-智能视频客服vtm2机-znkfvtm2","03","L214","znkfvtm2","8","");
subcat[913]= new Array("视频客服-智能客服人脸识别服务器1-znkfrlsb1","03","L215","znkfrlsb1","8","");
subcat[914]= new Array("视频客服-智能客服人脸识别服务器2-znkfrlsb2","03","L216","znkfrlsb2","8","");
subcat[915]= new Array("视频客服-智能客服GenesysMM服务器1-znkfmm1","03","L217","znkfmm1","8","");
subcat[916]= new Array("视频客服-智能客服GenesysMM服务器2-znkfmm2","03","L218","znkfmm2","8","");
subcat[917]= new Array("视频客服-智能视频客服sip1机-znkfsip1","03","L219","znkfsip1","8","");
subcat[918]= new Array("视频客服-智能视频客服sip2机-znkfsip2","03","L220","znkfsip2","8","");
subcat[919]= new Array("视频客服-智能视频客服etp1机-znkfetpag1","03","L221","znkfetpag1","8","");
subcat[920]= new Array("视频客服-智能视频客服etp2机-znkfetpag2","03","L222","znkfetpag2","8","");
subcat[921]= new Array("视频客服-在线客服1机-znzxkfapp1","03","L223","znzxkfapp1","8","");
subcat[922]= new Array("视频客服-在线客服WEB1机-znzxkfweb1","03","L224","znzxkfweb1","8","");
subcat[923]= new Array("视频客服-在线客服WEB2机-znzxkfweb2","03","L225","znzxkfweb2","8","");
subcat[924]= new Array("视频客服-视频客服数据库1-dbgxpt1","03","L226","dbgxpt1","8","4");
subcat[925]= new Array("视频客服-视频客服数据库1-dbgxpt2","03","L227","dbgxpt2","8","4");
subcat[926]= new Array("银企对帐回单系统-数据库1机-yqdzhddb1","03","L228","yqdzhddb1","8","4");
subcat[927]= new Array("银企对帐回单系统-数据库2机-yqdzhddb2","03","L229","yqdzhddb2","8","4");
subcat[928]= new Array("银企对帐回单系统-应用服务器1机-yqdzhdapp1","03","L230","yqdzhdapp1","8","");
subcat[929]= new Array("银企对帐回单系统-应用服务器2机-yqdzhdapp2","03","L231","yqdzhdapp2","8","");
subcat[930]= new Array("管理会计系统-应用服务器1机-glkjapp1","03","L232","glkjapp1","8","");
subcat[931]= new Array("管理会计系统-应用服务器2机-glkjapp2","03","L233","glkjapp2","8","");
subcat[932]= new Array("管理会计系统-报表服务器1机-glkjbb1","03","L234","glkjbb1","8","");
subcat[933]= new Array("管理会计系统-报表服务器2机-glkjbb2","03","L235","glkjbb2","8","");
subcat[934]= new Array("市场数据管理信息系统-应用服务器1机-scsjap1","03","L236","scsjap1","8","");
subcat[935]= new Array("市场数据管理信息系统-应用服务器2机-scsjap2","03","L237","scsjap2","8","");
subcat[936]= new Array("影像流-银川分行影像流影像缓存-ycfhyxlyxhc1","03","L238","ycfhyxlyxhc1","8","");
subcat[937]= new Array("数据仓库-数据仓库灵活查询1机-sjcklhcx1","03","L239","sjcklhcx1","8","");
subcat[938]= new Array("数据仓库-数据仓库灵活查询2机-sjcklhcx2","03","L240","sjcklhcx2","8","");
subcat[939]= new Array("E商宝-E商宝外网传输1机-esbwwcs1","03","L241","esbwwcs1","8","");
subcat[940]= new Array("数据仓库-数据仓库调度3机-sjckdd3","03","L242","sjckdd3","8","");
subcat[941]= new Array("黄金高可用-内网通讯接口1机-hjnwtx1","03","L243","hjnwtx1","8","");
subcat[942]= new Array("黄金高可用-内网通讯接口2机-hjnwtx2","03","L244","hjnwtx2","8","");
subcat[943]= new Array("黄金高可用-黄金高可用交易服务器1机-hjjy1","03","L245","hjjy1","8","");
subcat[944]= new Array("黄金高可用-黄金高可用交易服务器2机-hjjy2","03","L246","hjjy2","8","");
subcat[945]= new Array("黄金高可用-外网通讯接口机1机-hjwwtx1","03","L247","hjwwtx1","8","");
subcat[946]= new Array("黄金高可用-外网通讯接口机2机-hjwwtx2","03","L248","hjwwtx2","8","");
subcat[947]= new Array("黄金高可用-黄金高可用-风控服务器1机-hjfk1","03","L249","hjfk1","8","");
subcat[948]= new Array("黄金高可用-黄金高可用-风控服务器2机-hjfk2","03","L250","hjfk2","8","");
subcat[949]= new Array("黄金高可用-黄金高可用-风控服务器3-hjfk3","03","L251","hjfk3","8","");
subcat[950]= new Array("供应链-供应链电子验印应用A机-gyldzyy1","03","L252","gyldzyy1","8","");
subcat[951]= new Array("供应链-供应链电子验印应用B机-gyldzyy2","03","L253","gyldzyy2","8","");
subcat[952]= new Array("会计风险-会计业务风险监测数据分析-kjfxjcsjfx1","03","L254","kjfxjcsjfx1","8","");
subcat[953]= new Array("会计风险-会计业务风险监测应用1机-kjfxjcapp1","03","L255","kjfxjcapp1","8","");
subcat[954]= new Array("会计风险-会计业务风险监测应用2机-kjfxjcapp2","03","L256","kjfxjcapp2","8","");
subcat[955]= new Array("操作风险控制系统-操作风险应用1机-czfxapp1","03","L257","czfxapp1","8","");
subcat[956]= new Array("操作风险控制系统-操作风险应用2机-czfxapp2","03","L258","czfxapp2","8","");
subcat[957]= new Array("操作风险控制系统-操作风险数据库共享平台1机-dbgxpt1","03","L259","dbgxpt1","8","4");
subcat[958]= new Array("操作风险控制系统-操作风险数据库共享平台2机-dbgxpt2","03","L260","dbgxpt2","8","4");
subcat[959]= new Array("报表平台系统-报表平台应用1机-bbptapp1","03","L261","bbptapp1","8","");
subcat[960]= new Array("报表平台系统-报表平台应用2机-bbptapp2","03","L262","bbptapp2","8","");
subcat[961]= new Array("报表平台系统-报表平台应用3机-bbptapp3","03","L263","bbptapp3","8","");
subcat[962]= new Array("报表平台系统-ods/ODS数据库1机-bbptdb1","03","L264","bbptdb1","8","4");
subcat[963]= new Array("报表平台系统-ods/ODS数据库2机-bbptdb2","03","L265","bbptdb2","8","4");
subcat[964]= new Array("零售非零售-零售应用处理服务器1机-lsnpapp1","03","L266","lsnpapp1","8","");
subcat[965]= new Array("零售非零售-零售应用处理服务器2机-lsnpapp2","03","L267","lsnpapp2","8","");
subcat[966]= new Array("零售非零售-零售策略与报表服务器1机-lsclbb1","03","L268","lsclbb1","8","");
subcat[967]= new Array("零售非零售-零售策略与报表服务器2机-lsclbb2","03","L269","lsclbb2","8","");
subcat[968]= new Array("零售非零售-非零售应用处理服务器1机-flsnpapp1","03","L270","flsnpapp1","8","");
subcat[969]= new Array("零售非零售-非零售应用处理服务器2机-flsnpapp2","03","L271","flsnpapp2","8","");
subcat[970]= new Array("零售非零售--零售数据库服务器1机-lspjxtdb1","03","L272","lspjxtdb1","8","");
subcat[971]= new Array("零售非零售--零售数据库服务器2机-lspjxtdb2","03","L273","lspjxtdb2","8","");
subcat[972]= new Array("零售非零售--非零售数据库服务器1机-flspjxtdb1","03","L274","flspjxtdb1","8","");
subcat[973]= new Array("零售非零售--非零售数据库服务器2机-flspjxtdb2","03","L275","flspjxtdb2","8","");
subcat[974]= new Array("电子化培训平台--电子化平台应用1机-dzhptapp1","03","L276","dzhptapp1","8","");
subcat[975]= new Array("电子化培训平台--电子化平台应用2机-dzhptapp2","03","L277","dzhptapp2","8","");
subcat[976]= new Array("电子化培训平台--电子化平台应用3机-dzhptapp3","03","L278","dzhptapp3","8","");
subcat[977]= new Array("市场风险管理系统--市场风险管理应用1机-scfxglapp1","03","L279","scfxglapp1","8","");
subcat[978]= new Array("市场风险管理系统--市场风险管理应用2机-scfxglapp2","03","L280","scfxglapp2","8","");
subcat[979]= new Array("市场风险管理和手工补录系统--手工补录应用1机-sgblapp1","03","L281","sgblapp1","8","");
subcat[980]= new Array("市场风险管理和手工补录系统--手工补录应用2机-sgblapp2","03","L282","sgblapp2","8","");
subcat[981]= new Array("市场风险管理和手工补录系统--X86数据库共享平台3机-sjkgxpt3","03","L283","sjkgxpt3","8","4");
subcat[982]= new Array("市场风险管理和手工补录系统--X86数据库共享平台4机-sjkgxpt4","03","L284","sjkgxpt4","8","4");
subcat[983]= new Array("统一IT资源管理系统--X86数据库共享平台5机-sjkgxpt5","03","L285","sjkgxpt5","8","4");
subcat[984]= new Array("统一IT资源管理系统--X86数据库共享平台6机-sjkgxpt6","03","L286","sjkgxpt6","8","4");
subcat[985]= new Array("统一IT资源管理系统--统一IT资源管理应用1机-tyitzyglapp1","03","L287","tyitzyglapp1","8","");
subcat[986]= new Array("统一IT资源管理系统--统一IT资源管理应用2机-tyitzyglapp2","03","L288","tyitzyglapp2","8","");
subcat[987]= new Array("资产托管系统--资产托管应用1机-zctgapp1","03","L289","zctgapp1","8","");
subcat[988]= new Array("资产托管系统--资产托管应用2机-zctgapp2","03","L290","zctgapp2","8","");
subcat[989]= new Array("舆情系统服务器--信息抓取服务器网络1机-yqwlzq1","03","L291","yqwlzq1","8","");
subcat[990]= new Array("舆情系统服务器--信息抓取服务器网络2机-yqwlzq2","03","L292","yqwlzq2","8","");
subcat[991]= new Array("舆情系统服务器--舆情信息处理与存储服务器1机-yqhadoop1","03","L293","yqhadoop1","8","");
subcat[992]= new Array("舆情系统服务器--舆情信息处理与存储服务器2机-yqhadoop2","03","L294","yqhadoop2","8","");
subcat[993]= new Array("舆情系统服务器--舆情信息处理与存储服务器3机-yqhadoop3","03","L295","yqhadoop3","8","");
subcat[994]= new Array("舆情系统服务器--舆情信息处理与存储服务器4机-yqhadoop4","03","L296","yqhadoop4","8","");
subcat[995]= new Array("舆情系统服务器--舆情信息处理与存储服务器5机-yqhadoop5","03","L297","yqhadoop5","8","");
subcat[996]= new Array("舆情系统服务器--舆情系统数据库1机-yqgbasedb1","03","L298","yqgbasedb1","8","4");
subcat[997]= new Array("舆情系统服务器--舆情系统数据库2机-yqgbasedb2","03","L299","yqgbasedb2","8","4");
subcat[998]= new Array("舆情系统服务器--信息抓取服务器1机-yqzq1","03","L300","yqzq1","8","");
subcat[999]= new Array("舆情系统服务器--信息抓取服务器2机-yqzq2","03","L301","yqzq2","8","");
subcat[1000]= new Array("指纹授权高可用系统--指纹授权APP1机-zwrzapp1","03","L302","zwrzapp1","8","");
subcat[1001]= new Array("指纹授权高可用系统--指纹授权APP2机-zwrzapp2","03","L303","zwrzapp2","8","");
subcat[1002]= new Array("指纹授权高可用系统--指纹授权APP3机-zwrzapp3","03","L304","zwrzapp3","8","");
subcat[1003]= new Array("客户洗钱风险系统--客户洗钱风险系统app1机-khxqfxapp1","03","L305","khxqfxapp1","8","");
subcat[1004]= new Array("客户洗钱风险系统--客户洗钱风险系统app2机-khxqfxapp2","03","L306","khxqfxapp2","8","");
subcat[1005]= new Array("客户洗钱风险系统--客户洗钱风险系统db1机-khxqfxdb1","03","L307","khxqfxdb1","8","");
subcat[1006]= new Array("客户洗钱风险系统--客户洗钱风险系统db2机-khxqfxdb2","03","L308","khxqfxdb2","8","");
subcat[1007]= new Array("档案管理系统--档案管理APP1机-daglapp1","03","L309","daglapp1","8","");
subcat[1008]= new Array("档案管理系统--档案管理APP2机-daglapp2","03","L310","daglapp2","8","");
subcat[1009]= new Array("档案管理系统--档案管理APP3机-daglapp3","03","L311","daglapp3","8","");
subcat[1010]= new Array("档案管理系统--档案管理APP4机-daglapp4","03","L312","daglapp4","8","");
subcat[1011]= new Array("外联网关系统--外联网关mq1机-wlmq1","03","L313","wlmq1","8","1");
subcat[1012]= new Array("外联网关系统--外联网关mq2机-wlmq2","03","L314","wlmq2","8","1");
subcat[1013]= new Array("苏州双活系统--苏州双活客服gvpdb1机-szshkfgvpdb1","03","L315","szshkfgvpdb1","8","4");
subcat[1014]= new Array("苏州双活系统--苏州双活客服gvpdb2机-szshkfgvpdb2","03","L316","szshkfgvpdb2","8","4");
subcat[1015]= new Array("苏州双活系统--苏州双活rm1机-szshrm1","03","L317","szshrm1","8","");
subcat[1016]= new Array("苏州双活系统--苏州双活rm2机-szshrm2","03","L318","szshrm2","8","");
subcat[1017]= new Array("数据仓库调度系统--数据仓库调度4机-sjckdd4","03","L319","sjckdd4","8","");
subcat[1018]= new Array("数据仓库调度系统--数据仓库调度5机-sjckdd5","03","L320","sjckdd5","8","");
subcat[1019]= new Array("移动运维数据库1机","03","1019","ydywappdb1","1","4");
subcat[1020]= new Array("移动运维数据库2机","03","1020","ydywappdb2","1","4");
subcat[1021]= new Array("村镇银行客服系统数据库1机","03","1021","czkfdb1","1","4");
subcat[1022]= new Array("村镇银行客服系统数据库2机","03","1022","czkfdb2","1","4");
subcat[1023]= new Array("EAST2.0--EAST2APP1机-east2app1","03","L325","east2app1","8","");
subcat[1024]= new Array("EAST2.0--EAST2APP2机-east2app2","03","L326","east2app2","8","");
subcat[1025]= new Array("支付融资安全可控--支付融资安全可控APP1机-zfrzaqkkapp1","03","L327","zfrzaqkkapp1","8","");
subcat[1026]= new Array("支付融资安全可控--支付融资安全可控APP2机-zfrzaqkkapp2","03","L328","zfrzaqkkapp2","8","");
subcat[1027]= new Array("村镇指纹应用--村镇指纹应用APP1机-czzwapp1","03","L329","czzwapp1","8","");
subcat[1028]= new Array("村镇指纹应用--村镇指纹应用APP2机-czzwapp2","03","L330","czzwapp2","8","");
subcat[1029]= new Array("客户数据分析FI系统-客户数据分析1机-khsjfx1","03","L331","khsjfx1","8","");
subcat[1030]= new Array("客户数据分析FI系统-客户数据分析2机-khsjfx2","03","L332","khsjfx2","8","");
subcat[1031]= new Array("客户数据分析FI系统-客户数据分析3机-khsjfx3","03","L333","khsjfx3","8","");
subcat[1032]= new Array("客户数据分析FI系统-客户数据分析4机-khsjfx4","03","L334","khsjfx4","8","");
subcat[1033]= new Array("客户数据分析FI系统-客户数据分析5机-khsjfx5","03","L335","khsjfx5","8","");
subcat[1034]= new Array("客户数据分析FI系统-客户数据分析6机-khsjfx6","03","L336","khsjfx6","8","");
subcat[1035]= new Array("客户数据分析FI系统-客户数据分析7机-khsjfx7","03","L337","khsjfx7","8","");
subcat[1036]= new Array("客户数据分析FI系统-客户数据分析8机-khsjfx8","03","L338","khsjfx8","8","");
subcat[1037]= new Array("客户数据分析FI系统-客户数据分析9机-khsjfx9","03","L339","khsjfx9","8","");
subcat[1038]= new Array("客户数据分析FI系统-客户数据分析10机-khsjfx10","03","L340","khsjfx10","8","");
subcat[1039]= new Array("数据恢复-数据恢复14机-sjhf14","03","L341","sjhf14","8","4");
subcat[1040]= new Array("数据恢复-数据恢复15机-sjhf15","03","L342","sjhf15","8","4");
subcat[1041]= new Array("数据库共享平台9","3","L381","sjkgxpt9","8","4");
subcat[1042]= new Array("数据库共享平台10","3","L382","sjkgxpt10","8","4");
subcat[1043]= new Array("分析型CRM系统-GP数据库服务器1机","3","L363","fxxcrmgpdb1","8","");
subcat[1044]= new Array("分析型CRM系统-GP数据库服务器2机","3","L364","fxxcrmgpdb2","8","");
subcat[1045]= new Array("分析型CRM系统-GP数据库服务器3机","3","L365","fxxcrmgpdb3","8","");
subcat[1046]= new Array("分析型CRM系统-GP数据库服务器4机","3","L366","fxxcrmgpdb4","8","");
subcat[1047]= new Array("微信银行-北京微信银行APP1机","3","L343","bjwx-app-1","8","2");
subcat[1048]= new Array("微信银行-北京微信银行APP2机","3","L344","bjwx-app-2","8","2");
subcat[1049]= new Array("微信银行-北京微信银行TIMER1机","3","L345","bjwx-timer-1","8","2");
subcat[1050]= new Array("微信银行-北京微信银行TIMER2机","3","L346","bjwx-timer-2","8","2");
subcat[1051]= new Array("客户数据分析-客户数据分析采集1机","3","L347","khsjfxcj1","8","2");
subcat[1052]= new Array("客户数据分析-客户数据分析采集2机","3","L348","khsjfxcj2","8","2");
subcat[1053]= new Array("客户数据分析-客户数据分析APP1机","3","L349","khsjfxapp1","8","2");
subcat[1054]= new Array("客户数据分析-客户数据分析APP2机","3","L350","khsjfxapp2","8","2");
subcat[1055]= new Array("客户数据分析-客户数据分析ETL1机","3","L351","khsjfxetl1","8","64");
subcat[1056]= new Array("客户数据分析-客户数据分析ETL2机","3","L352","khsjfxetl2","8","64");
subcat[1057]= new Array("资产负债-资产负债应用1机","3","L353","zcfzapp1","8","2");
subcat[1058]= new Array("资产负债-资产负债应用2机","3","L354","zcfzapp2","8","2");
subcat[1059]= new Array("资产负债-X86数据库共享平台7机","3","L355","sjkgxpt7","8","4");
subcat[1060]= new Array("资产负债-X86数据库共享平台8机","3","L356","sjkgxpt8","8","4");
subcat[1061]= new Array("客户数据分析系统-REDIS集群1机","3","L357","khsjfxrds1","8","");
subcat[1062]= new Array("客户数据分析系统-REDIS集群2机","3","L358","khsjfxrds2","8","");
subcat[1063]= new Array("客户数据分析系统-REDIS集群3机","3","L359","khsjfxrds3","8","");
subcat[1064]= new Array("客户数据分析系统-REDIS集群4机","3","L360","khsjfxrds4","8","");
subcat[1065]= new Array("客户数据分析系统-REDIS集群5机","3","L361","khsjfxrds5","8","");
subcat[1066]= new Array("客户数据分析系统-REDIS集群6机","3","L362","khsjfxrds6","8","");
subcat[1067]= new Array("支付融资-POS贷国产化应用1机","3","L367","zfrzposdapp1","8","2");
subcat[1068]= new Array("支付融资-POS贷国产化应用2机","3","L368","zfrzposdapp2","8","2");
subcat[1069]= new Array("同城灾备黄金高可用交易服务器1","3","L369","xsqhjjy1","8","");
subcat[1070]= new Array("同城灾备黄金高可用交易服务器2","3","L370","xsqhjjy2","8","");
subcat[1071]= new Array("同城灾备黄金高可用内网通讯接口机1","3","L371","xsqhjnwtx1","8","");
subcat[1072]= new Array("同城灾备黄金高可用内网通讯接口机2","3","L372","xsqhjnwtx2","8","");
subcat[1073]= new Array("同城灾备黄金高可用-风控服务器1","3","L373","xsqhjfk1","8","");
subcat[1074]= new Array("同城灾备黄金高可用-风控服务器2","3","L374","xsqhjfk2","8","");
subcat[1075]= new Array("增值税管理平台-增值税管理平台应用1机","3","L375","zzsapp1","8","2");
subcat[1076]= new Array("增值税管理平台-增值税管理平台应用2机","3","L376","zzsapp2","8","2");
subcat[1077]= new Array("增值税管理平台-增控管理系统应用1机","3","L377","zzsskapp1","8","2");
subcat[1078]= new Array("增值税管理平台-增控管理系统应用2机","3","L378","zzsskapp2","8","2");
subcat[1079]= new Array("影像应用-影像应用APP1机","3","L379","yxapp1","8","2");
subcat[1080]= new Array("影像应用-影像应用APP2机","3","L380","yxapp2","8","2");
subcat[1081]= new Array("监控大数据平台1机","3","L383","bigdata1","8","");
subcat[1082]= new Array("监控大数据平台2机","3","L384","bigdata2","8","");
subcat[1083]= new Array("监控大数据平台3机","3","L385","bigdata3","8","");
subcat[1084]= new Array("监控大数据平台4机","3","L386","bigdata4","8","");
subcat[1085]= new Array("监控大数据平台5机","3","L387","bigdata5","8","");
subcat[1086]= new Array("监控大数据平台6机","3","L388","bigdata6","8","");
subcat[1087]= new Array("监控大数据平台7机","3","L389","bigdata7","8","");
subcat[1088]= new Array("监控大数据平台8机","3","L390","bigdata8","8","");
subcat[1089]= new Array("监控大数据平台9机","3","L391","bigdata9","8","");
subcat[1090]= new Array("监控大数据平台10-机","3","L392","bigdata10","8","");
subcat[1091]= new Array("","3","1091","","","");
subcat[1092]= new Array("增值税管理平台","3","L393","zzsdl1","8","");
subcat[1093]= new Array("增值税管理平台-增值税代理2机","3","L394","zzsdl2","8","");
subcat[1094]= new Array("供应链电子验印数据库1机","3","1094","gylyydb1","1","4");
subcat[1095]= new Array("供应链电子验印数据库2机","3","1095","gylyydb2","1","4");
subcat[1096]= new Array("会计业务风险监测数据库1机","3","0700","kjfxjcdb1","1","4");
subcat[1097]= new Array("会计业务风险监测数据库2机","3","0701","kjfxjcdb2","1","4");
subcat[1098]= new Array("网银系统动态口令（OTP）应用1机","3","0702","otpap1","1","2");
subcat[1099]= new Array("网银系统动态口令（OTP）应用2机","3","0703","otpap1","1","2");
subcat[1100]= new Array("网银系统动态口令（OTP）数据库1机","3","0704","otpdb1","1","4");
subcat[1101]= new Array("网银系统动态口令（OTP）数据库2机","3","0705","otpdb2","1","4");
subcat[1102]= new Array("西三旗核心报表历史库1机","3","0706","rephisdb1","1","4");
subcat[1103]= new Array("西三旗核心报表数据库2机","3","0707","rephisdb2","1","4");
subcat[1104]= new Array("村镇银行数据抽取报表数据库1机","3","1104","czsjcqbbdb1","1","4");
subcat[1105]= new Array("村镇银行数据抽取报表数据库2机","3","1105","czsjcqbbdb2","1","4");
subcat[1106]= new Array("电商服务系统数据库1机","3","L395","dsfwxtdb1","8","4");
subcat[1107]= new Array("电商服务系统数据库2机","3","L396","dsfwxtdb2","8","4");
subcat[1108]= new Array("村镇银行指纹认证数据库1机","3","1106","czzwdb1","1","4");
subcat[1109]= new Array("村镇银行指纹认证数据库2机","3","1107","czzwdb2","1","4");
subcat[1110]= new Array("村镇银行密钥管理和集中银联DG备库","3","1112","mygl","1","4");
subcat[1111]= new Array("村镇银行电子现金和IC卡DG备库","3","1113","sjzb","1","4");
subcat[1112]= new Array("指纹授权app1机","2","L397","zwrzapp1","8","6");
subcat[1113]= new Array("指纹授权app2机","2","L398","zwrzapp2","8","6");
subcat[1114]= new Array("指纹授权app3","2","L399","zwrzapp3","8","6");
subcat[1115]= new Array("理财类高可用WEB服务器--理财银宝通WEB1机","3","L400","lclweb1","8","2");
subcat[1116]= new Array("理财类高可用WEB服务器理财银宝通WEB2机","3","L401","lclweb2","8","2");
subcat[1117]= new Array("理财类高可用WEB服务器基金中间业务WEB1机","3","L402","lclweb3","8","2");
subcat[1118]= new Array("理财类高可用WEB服务器基金中间业务WEB2机","3","L403","lclweb4","8","2");
subcat[1119]= new Array("移动代理服务器短信网关代理1机","3","L404","hxsmsgw1","8","4");
subcat[1120]= new Array("移动代理服务器短信网关代理2机","3","L405","hxsmsgw2","8","4");
subcat[1121]= new Array("移动代理服务器短信移动代理1机","3","L406","hxsmsmas1","8","");
subcat[1122]= new Array("移动代理服务器短信移动代理2机","3","L407","hxsmsmas2","8","");
subcat[1123]= new Array("黄金系统数据库1机","3","1123","hjdb1","1","4");
subcat[1124]= new Array("黄金系统数据库2机","3","1124","hjdb2","1","4");
subcat[1125]= new Array("手机银行web接入1机","3","L408","sjyhwebjr1","8","");
subcat[1126]= new Array("手机银行web接入2机","3","L409","sjyhwebjr2","8","");
subcat[1127]= new Array("手机银行web接入3机","3","L410","sjyhwebjr3","8","");
subcat[1128]= new Array("手机银行web接入4机","3","L411","sjyhwebjr4","8","");
subcat[1129]= new Array("手机银行web接入5机","3","L412","sjyhwebjr5","8","");
subcat[1130]= new Array("手机银行web接入6机","3","L413","sjyhwebjr6","8","");
subcat[1131]= new Array("手机银行web接入7机","3","L414","sjyhwebjr7","8","");
subcat[1132]= new Array("手机银行web接入8机","3","L415","sjyhwebjr8","8","");
subcat[1133]= new Array("手机银行web接入9机","3","L416","sjyhwebjr9","8","");
subcat[1134]= new Array("手机银行web接入10机","3","L417","sjyhwebjr10","8","");
subcat[1135]= new Array("P2Pweb/应用服务器1机","3","L418","p2papp1","8","");
subcat[1136]= new Array("P2Pweb/应用服务器2机","3","L419","p2papp2","8","2");
subcat[1137]= new Array("手机银行app1机","3","L420","sjyhapp1","8","");
subcat[1138]= new Array("手机银行app2机","3","L421","sjyhapp2","8","");
subcat[1139]= new Array("手机银行app3机","3","L422","sjyhapp3","8","");
subcat[1140]= new Array("手机银行app4机","3","L423","sjyhapp4","8","");
subcat[1141]= new Array("手机银行app5机","3","L424","sjyhapp5","8","");
subcat[1142]= new Array("手机银行app6机","3","L425","sjyhapp6","8","");
subcat[1143]= new Array("手机银行app7机","3","L426","sjyhapp7","8","");
subcat[1144]= new Array("手机银行app8机","3","L427","sjyhapp8","8","");
subcat[1145]= new Array("手机银行app9机","3","L428","sjyhapp9","8","");
subcat[1146]= new Array("手机银行app10机","3","L429","sjyhapp10","8","");
subcat[1147]= new Array("手机银行图片服务器1机","3","L430","sjyhpic1","8","");
subcat[1148]= new Array("手机银行图片服务器2机","3","L431","sjyhpic2","8","");
subcat[1149]= new Array("手机银行数据采集服务器1机","3","L432","sjyhcj1","8","");
subcat[1150]= new Array("手机银行数据采集服务器2机","3","L433","sjyhcj2","8","");
subcat[1151]= new Array("手机银行内管服务器1机","3","L434","sjyhmg1","8","64");
subcat[1152]= new Array("手机银行内管服务器2机","3","L435","sjyhmg2","8","64");
subcat[1153]= new Array("手机银行内存服务器1机","3","L436","sjyhmem1","8","");
subcat[1154]= new Array("手机银行内存服务器2机","3","L437","sjyhmem2","8","");
subcat[1155]= new Array("手机银行内存服务器3机","3","L438","sjyhmem3","8","");
subcat[1156]= new Array("手机银行内存服务器4机","3","L439","sjyhmem4","8","");
subcat[1157]= new Array("诈骗WEB服务器1机","3","L440","zpjyczweb1","8","");
subcat[1158]= new Array("诈骗WEB服务器2机","3","L441","zpjyczweb2","8","");
subcat[1159]= new Array("诈骗APP服务器1机","3","L442","zpjyczapp1","8","");
subcat[1160]= new Array("诈骗APP服务器2机","3","L443","zpjyczapp2","8","");
subcat[1161]= new Array("电商服务系统web接入1机","3","L446","dsxtweb1","8","");
subcat[1162]= new Array("电商服务系统web接入2机","3","L447","dsxtweb2","8","");
subcat[1163]= new Array("电商服务系统web接入3机","3","L448","dsxtweb3","8","");
subcat[1164]= new Array("电商服务系统web接入4机","3","L449","dsxtweb4","8","");
subcat[1165]= new Array("电商服务系统web接入5机","3","L450","dsxtweb5","8","");
subcat[1166]= new Array("电商服务系统web接入6机","3","L451","dsxtweb6","8","");
subcat[1167]= new Array("电商服务系统web接入7机","3","L452","dsxtweb7","8","");
subcat[1168]= new Array("电商服务系统web接入8机","3","L453","dsxtweb8","8","");
subcat[1169]= new Array("电商服务系统图片服务器1机","3","L454","dsxttp1","8","");
subcat[1170]= new Array("电商服务系统图片服务器2机","3","L455","dsxttp2","8","");
subcat[1171]= new Array("诈骗交易处置数据库1机","3","L444","zpjyczdb1","8","4");
subcat[1172]= new Array("诈骗交易处置数据库2机","3","L445","zpjyczdb2","8","4");
subcat[1173]= new Array("电商服务系统APP服务器1机","3","L456","dsxtapp1","8","2");
subcat[1174]= new Array("电商服务系统APP服务器2机","3","L457","dsxtapp2","8","2");
subcat[1175]= new Array("电商服务系统APP服务器3机","3","L458","dsxtapp3","8","2");
subcat[1176]= new Array("电商服务系统APP服务器4机","3","L459","dsxtapp4","8","2");
subcat[1177]= new Array("电商服务系统APP服务器5机","3","L460","dsxtapp5","8","2");
subcat[1178]= new Array("电商服务系统APP服务器6机","3","L461","dsxtapp6","8","2");
subcat[1179]= new Array("电商服务系统APP服务器7机","3","L462","dsxtapp7","8","2");
subcat[1180]= new Array("电商服务系统APP服务器8机","3","L463","dsxtapp8","8","2");
subcat[1181]= new Array("电商服务系统APP服务器9机","3","L464","dsxtapp9","8","2");
subcat[1182]= new Array("电商服务系统APP服务器10机","3","L465","dsxtapp10","8","2");
subcat[1183]= new Array("电商服务系统APP服务器11机","3","L466","dsxtapp11","8","2");
subcat[1184]= new Array("电商服务系统APP服务器12机","3","L467","dsxtapp12","8","2");
subcat[1185]= new Array("电商服务系统内存服务器1机","3","L468","dsxtmem1","8","");
subcat[1186]= new Array("电商服务系统内存服务器2机","3","L469","dsxtmem2","8","");
subcat[1187]= new Array("电商定时任务服务器1机","3","L470","dsxtdsrw1","8","2");
subcat[1188]= new Array("电商定时任务服务器2机","3","L471","dsxtdsrw2","8","2");
subcat[1189]= new Array("电商日志服务器","3","L472","dsxtlog","8","");
subcat[1190]= new Array("同业业务系统生产应用服务器1机","3","L473","tyywapp1","8","6");
subcat[1191]= new Array("同业业务系统生产应用服务器2机","3","L474","tyywapp2","8","6");
subcat[1192]= new Array("ITIL二期缓存服务器1机","3","L475","itsmhc1","8","");
subcat[1193]= new Array("ITIL二期缓存服务器2机","3","L476","itsmhc2","8","");
subcat[1194]= new Array("村镇诈骗web1机","3","L477","czzpjyweb1","8","6");
subcat[1195]= new Array("村镇诈骗web2机","3","L478","czzpjyweb2","8","6");
subcat[1196]= new Array("村镇诈骗app1机","3","L479","czzpjyapp1","8","4");
subcat[1197]= new Array("村镇诈骗app2机","3","L480","czzpjyapp2","8","4");
subcat[1198]= new Array("微信分行通讯子系统1机","3","L481","wx-fhtx1","8","2");
subcat[1199]= new Array("微信分行通讯子系统2机","3","L482","wx-fhtx2","8","2");
subcat[1200]= new Array("资产托管客服电子化平台管理1机","3","L487","zctgkfptmg1","8","74");
subcat[1201]= new Array("资产托管客服电子化平台管理2机","3","L488","zctgkfptmg2","8","74");
subcat[1202]= new Array("P2P资金存管系统数据库1机","3","1202","p2pzjcgdb1","1","4");
subcat[1203]= new Array("P2P资金存管系统数据库2机","3","1203","p2pzjcgdb2","1","4");
subcat[1204]= new Array("同城灾备理财类理财报表数据库1机","3","1204","lclrpdb1","1","");
subcat[1205]= new Array("同城灾备理财类理财报表数据库2机","3","1205","lclrpdb2","1","");
subcat[1206]= new Array("同城灾备中间业务支付宝数据库1机","3","1206","nlczfbdb1","1","");
subcat[1207]= new Array("同城灾备中间业务支付宝数据库2机","3","1207","nlczfbdb2","1","");
subcat[1208]= new Array("微信文件服务器1机","3","1208","wxsmzf1","1","64");
subcat[1209]= new Array("微信文件服务器2机","3","1209","wxsmzf2","1","64");
subcat[1210]= new Array("信贷影像系统filenet应用1机","3","1210","xdyxfnceap1","1","2");
subcat[1211]= new Array("信贷影像系统filenet应用2机","3","1211","xdyxfnceap2","1","2");
subcat[1212]= new Array("信贷影像系统filenet数据库1机","3","1212","","1","4");
subcat[1213]= new Array("信贷影像系统filenet数据库2机","3","1213","","1","4");
subcat[1214]= new Array("创意管理系统应用服务器ap1机","3","L512","cyglap1","8","");
subcat[1215]= new Array("创意管理系统应用服务器ap2机","3","L513","cyglap2","8","2");
subcat[1216]= new Array("黄金高可用系统（2016）-黄金APP前置机1","3","L526","hjappqz1","8","");
subcat[1217]= new Array("黄金高可用系统（2016）-黄金APP前置机2","3","L527","hjappqz2","8","");
subcat[1218]= new Array("黄金高可用系统（2016）-黄金报盘机1","3","L528","hjbpj1","8","");
subcat[1219]= new Array("黄金高可用系统（2016）-黄金报盘机2","3","L529","hjbpj2","8","");
subcat[1220]= new Array("EAST数据质量校验","3","L530","eastsjzlap1","8","2");
subcat[1221]= new Array("灾备环境手机银行金融web1","3","L531","sjyhwebjr1","8","");
subcat[1222]= new Array("灾备环境手机银行金融web2","3","L532","sjyhwebjr2","8","");
subcat[1223]= new Array("灾备环境手机银行金融web3","3","L533","sjyhwebjr3","8","");
subcat[1224]= new Array("灾备环境手机银行金融web4","3","L534","sjyhwebjr4","8","");
subcat[1225]= new Array("灾备环境手机银行金融web5","3","L535","sjyhwebjr5","8","");
subcat[1226]= new Array("灾备环境手机银行金融web6","3","L536","sjyhwebjr6","8","");
subcat[1227]= new Array("灾备环境手机银行金融web7","3","L537","sjyhwebjr7","8","");
subcat[1228]= new Array("灾备环境手机银行金融web8","3","L538","sjyhwebjr8","8","");
subcat[1229]= new Array("灾备环境手机银行金融web9","3","L539","sjyhwebjr9","8","");
subcat[1230]= new Array("灾备环境手机银行金融web10","3","L540","sjyhwebjr10","8","");
subcat[1231]= new Array("灾备环境手机银行Android推送服务器1","3","L541","sjyhxxts1","8","");
subcat[1232]= new Array("灾备环境手机银行Android推送服务器2","3","L542","sjyhxxts2","8","");
subcat[1233]= new Array("灾备环境手机银行推送应用服务器1","3","L543","sjyhtsapp1","8","");
subcat[1234]= new Array("灾备环境手机银行推送应用服务器2","3","L544","sjyhtsapp2","8","");
subcat[1235]= new Array("灾备环境手机银行推送任务管理服务器1","3","L545","sjyhtsmng1","8","");
subcat[1236]= new Array("灾备环境手机银行推送任务管理服务器2","3","L546","sjyhtsmng2","8","");
subcat[1237]= new Array("callcenter在线客服系统APP","3","L547","znzxkfapp1","8","");
subcat[1238]= new Array("callcenter在线客服系统WEB1","3","L548","znzxkfweb1","8","");
subcat[1239]= new Array("callcenter在线客服系统WEB2","3","L549","znzxkfweb2","8","");
subcat[1240]= new Array("灾备环境手机银行登录AP1","3","L550","sjyhapp1","8","");
subcat[1241]= new Array("灾备环境手机银行登录AP2","3","L551","sjyhapp2","8","");
subcat[1242]= new Array("灾备环境手机银行生活AP1","3","L552","sjyhapp3","8","");
subcat[1243]= new Array("灾备环境手机银行生活AP2","3","L553","sjyhapp4","8","");
subcat[1244]= new Array("灾备环境手机银行金融AP1","3","L554","sjyhapp5","8","");
subcat[1245]= new Array("灾备环境手机银行金融AP2","3","L555","sjyhapp6","8","");
subcat[1246]= new Array("灾备环境手机银行金融AP3","3","L556","sjyhapp7","8","");
subcat[1247]= new Array("灾备环境手机银行金融AP4","3","L557","sjyhapp8","8","");
subcat[1248]= new Array("灾备环境手机银行服务AP1","3","L558","sjyhapp9","8","");
subcat[1249]= new Array("灾备环境手机银行服务AP2","3","L559","sjyhapp10","8","");
subcat[1250]= new Array("灾备环境手机银行图片1","3","L560","sjyhpic1","8","");
subcat[1251]= new Array("灾备环境手机银行图片2","3","L561","sjyhpic2","8","");
subcat[1252]= new Array("灾备环境手机银行数据采集1","3","L562","sjyhcj1","8","");
subcat[1253]= new Array("灾备环境手机银行数据采集2","3","L563","sjyhcj2","8","");
subcat[1254]= new Array("灾备环境手机银行内管1","3","L564","sjyhmg1","8","");
subcat[1255]= new Array("灾备环境手机银行内管2","3","L565","sjyhmg2","8","");
subcat[1256]= new Array("灾备环境手机银行内存服务器1","3","L566","sjyhmem1","8","");
subcat[1257]= new Array("灾备环境手机银行内存服务器2","3","L567","sjyhmem2","8","");
subcat[1258]= new Array("灾备环境手机银行内存服务器3","3","L568","sjyhmem3","8","");
subcat[1259]= new Array("灾备环境手机银行内存服务器4","3","L569","sjyhmem4","8","");
subcat[1260]= new Array("自助报账db1机","3","L570","zzbzdb1","8","");
subcat[1261]= new Array("自助报账db2机","3","L571","zzbzdb2","8","");
subcat[1262]= new Array("自助报账ap1机","3","L572","zzbzap1","8","");
subcat[1263]= new Array("自助报账ap2机","3","L573","zzbzap2","8","");
subcat[1264]= new Array("自助报账影像缓存1机","3","L574","zzbzyxhc1","8","");
subcat[1265]= new Array("自助报账影像缓存2机","3","L575","zzbzyxhc2","8","");
subcat[1266]= new Array("灾备环境手机银行日志服务器","3","L576","sjyhlog1","8","2");
subcat[1267]= new Array("自动化二期zdhhdca01","3","L577","zdhhdca01","8","2");
subcat[1268]= new Array("自动化二期zdhhdca02","3","L578","zdhhdca02","8","2");
subcat[1269]= new Array("村镇银行个人征信查询系统前置数据库1机","3","1269","czgrzxcx1","1","4");
subcat[1270]= new Array("村镇银行个人征信查询系统前置数据库2机","3","1270","czgrzxcx2","1","4");
subcat[1271]= new Array("实物贵金属销售数据库1机","3","1271","gjsxsdb1","1","4");
subcat[1272]= new Array("实物贵金属销售数据库2机","3","1272","gjsxsdb2","1","4");
subcat[1273]= new Array("p2p资金存管系统数据库3机","3","1273","p2pzjcgdb3","1","4");
subcat[1274]= new Array("p2p资金存管系统数据库4机","3","1274","p2pzjcgdb4","1","4");
subcat[1275]= new Array("反洗钱名单监测数据库1机","3","1275","fxqmdjcdb1","1","4");
subcat[1276]= new Array("反洗钱名单监测数据库2机","3","1276","fxqmdjcdb2","1","4");
subcat[1277]= new Array("","3","","","","");
subcat[1278]= new Array("应用日志监控分析1机","3","L579","yyrzjkfx1","8","");
subcat[1279]= new Array("客服知识库数据库1机","3","L584","kfzskdb1","8","4");
subcat[1280]= new Array("客服知识库数据库2机","3","L585","kfzskdb2","8","4");
subcat[1281]= new Array("结售汇外汇账户1","3","L588","jshwhzh01","8","2");
subcat[1282]= new Array("结售汇外汇账户2","3","L589","jshwhzh02","8","2");
subcat[1283]= new Array("结售汇外汇账户3","3","L590","jshwhzh03","8","2");
subcat[1284]= new Array("结售汇外汇账户4","3","L591","jshwhzh04","8","2");
subcat[1285]= new Array("客服人脸识别应用3机","3","L617","kfrlsbap3","8","4");
subcat[1286]= new Array("移动运维管理app(前置服务器)1机","3","L629","ydywappqz1","8","");
subcat[1287]= new Array("移动运维管理app(前置服务器)2机","3","L630","ydywappqz1","8","");
subcat[1288]= new Array("移动运维管理app（文件服务器)","3","L631","ydywappqz1","8","");
subcat[1289]= new Array("移动运维管理app（dmc服务器）","3","L632","ydywappqz1","8","");
subcat[1290]= new Array("移动运维管理app（应用服务器）1机","3","L633","ydywappap1","8","");
subcat[1291]= new Array("移动运维管理app（应用服务器）2机","3","L634","ydywappap2","8","");
subcat[1292]= new Array("移动办公应用服务器1机","3","L643","oaydap1","8","");
subcat[1293]= new Array("移动办公应用服务器2机","3","L644","oaydap2","8","");
subcat[1294]= new Array("移动办公应用服务器3机","3","L645","oaydap3","8","");
subcat[1295]= new Array("移动办公应用服务器4机","3","L646","oaydap4","8","");
subcat[1296]= new Array("移动办公数据库(mysql)1机","3","L647","oaydap1","8","");
subcat[1297]= new Array("移动办公数据库(mysql)2机","3","L648","oaydap2","8","");
subcat[1298]= new Array("移动办公消息服务器DMZ区1机","3","L649","oaydmsg1","8","");
subcat[1299]= new Array("移动办公消息服务器DMZ区2机","3","L650","oaydmsg2","8","");
subcat[1300]= new Array("反洗钱系统-反洗钱系统app1机（应用服务器）","3","L635","xfxqap1","8","");
subcat[1301]= new Array("反洗钱系统-反洗钱系统app2机（应用服务器）","3","L636","xfxqap2","8","");
subcat[1302]= new Array("","3","","","","");
subcat[1303]= new Array("黄金同城灾备-黄金报盘机1","2","L639","hjbp1","8","");
subcat[1304]= new Array("移动运维前置1机","3","L653","ydywappqz1","8","");
subcat[1305]= new Array("移动运维前置2机","3","L654","ydywappqz2","8","");
subcat[1306]= new Array("移动办公前置服务器1机","3","L655","oaydqz1","8","");
subcat[1307]= new Array("移动办公前置服务器2机","3","L656","oaydqz2","8","");
subcat[1308]= new Array("银企集中对账及回单管理系统生产环境应用服务器1","3","L657","yqjzhdgl1","8","");
subcat[1309]= new Array("银企集中对账及回单管理系统生产环境应用服务器2","3","L658","yqjzhdgl2","8","");
subcat[1310]= new Array("反假币信息报送系统应用服务器1机","3","L659","fjbxxbs1","8","");
subcat[1311]= new Array("反假币信息报送系统应用服务器2机","3","L660","fjbxxbs2","8","");
subcat[1312]= new Array("公安部身份联网核查系统数据库服务器1","3","L671","gabsfhcdb1","8","4");
subcat[1313]= new Array("公安部身份联网核查系统数据库服务器2","3","L672","gabsfhcdb2","8","4");
subcat[1314]= new Array("E商宝网联平台-WEB服务器3","3","L680","esbwlwb3","8","");
subcat[1315]= new Array("E商宝网联平台-WEB服务器4","3","L681","esbwlwb4","8","");
subcat[1316]= new Array("E商宝网联平台-Zookeeper服务器1","3","L682","esbwlzkp1","8","");
subcat[1317]= new Array("E商宝网联平台-Zookeeper服务器2","3","L683","esbwlzkp2","8","");
subcat[1318]= new Array("E商宝网联平台-Zookeeper服务器3","3","L684","esbwlzkp3","8","");
subcat[1319]= new Array("E商宝网联平台-Redis服务器1","3","L685","esbwlredis1","8","");
subcat[1320]= new Array("E商宝网联平台-Redis服务器2","3","L686","esbwlredis2","8","");
subcat[1321]= new Array("E商宝网联平台-应用服务器1","3","L687","esbwlap1","8","");
subcat[1322]= new Array("E商宝网联平台-应用服务器2","3","L688","esbwlap2","8","");
subcat[1323]= new Array("E商宝网联平台-应用服务器3","3","L689","esbwlap3","8","");
subcat[1324]= new Array("E商宝网联平台-应用服务器4","3","L690","esbwlap4","8","");
subcat[1325]= new Array("E商宝网联平台-网关应用服务器1","3","L691","esbwlwgap1","8","");
subcat[1326]= new Array("E商宝网联平台-网关应用服务器2","3","L692","esbwlwgap2","8","");
subcat[1327]= new Array("E商宝网联平台批处理服务器1","3","L693","esbwlpcl1","8","");
subcat[1328]= new Array("E商宝网联平台批处理服务器2","3","L694","esbwlpcl2","8","");
subcat[1329]= new Array("E商宝网联平台MyCat服务器1","3","L695","esbwlmycat1","8","");
subcat[1330]= new Array("E商宝网联平台MyCat服务器2","3","L696","esbwlmycat2","8","");
subcat[1331]= new Array("E商宝网联平台Mysql服务器1","3","L697","esbwlmysql1","8","");
subcat[1332]= new Array("E商宝网联平台Mysql服务器2","3","L698","esbwlmysql2","8","");
subcat[1333]= new Array("E商宝网联平台Mysql服务器3","3","L699","esbwlmysql3","8","");
subcat[1334]= new Array("E商宝网联平台Mysql服务器4","3","L700","esbwlmysql4","8","");
subcat[1335]= new Array("E商宝网联平台WEB服务器1","3","L701","esbwlwb1","8","");
subcat[1336]= new Array("E商宝网联平台WEB服务器1","3","L702","esbwlwb2","8","");
subcat[1337]= new Array("E商宝网联平台Oracle数据库服务器1","3","L703","esbwldb1","8","4");
subcat[1338]= new Array("E商宝网联平台Oracle数据库服务器2","3","L704","esbwldb2","8","4");
subcat[1339]= new Array("资产托管客户服务电子化平台网银应用服务器1机","3","L483","zctgkfptwy1","8","");
subcat[1340]= new Array("资产托管客户服务电子化平台网银应用服务器2机","3","L484","zctgkfptwy2","8","");
subcat[1341]= new Array("资产托管客户服务电子化平台柜面微信交易应用服务器1机","3","L485","zctgkfptwx1","8","");
subcat[1342]= new Array("资产托管客户服务电子化平台柜面微信交易应用服务器2机","3","L486","zctgkfptwx2","8","");
subcat[1343]= new Array("资产托管客户服务电子化平台客服平台web1机","3","L489","zctgkfptweb1","8","");
subcat[1344]= new Array("资产托管客户服务电子化平台客服平台web2机","3","L490","zctgkfptweb2","8","");
subcat[1345]= new Array("路透Itrox1机","3","L491","bjrmds1","8","");
subcat[1346]= new Array("路透Itrox2机","3","L492","bjrmds2","8","");
subcat[1347]= new Array("路透Itrox3机","3","L493","bjrmds3","8","");
subcat[1348]= new Array("录音录像系统应用服务器1机","3","L494","lylxap1","8","");
subcat[1349]= new Array("录音录像系统应用服务器2机","3","L495","lylxap2","8","");
subcat[1350]= new Array("录音录像系统文件服务器1机(已关机不在使用)","3","L496","lylxwj1","8","");
subcat[1351]= new Array("录音录像系统文件服务器2机(已关机不在使用)","3","L497","lylxwj2","8","");
subcat[1352]= new Array("录音录像系统数据库服务器1机","3","L498","lylxdb1","8","");
subcat[1353]= new Array("录音录像系统数据库服务器2机","3","L499","lylxdb2","8","");
subcat[1354]= new Array("自动化二期-HDCABSA3机","3","L500","HDCABSA3","8","");
subcat[1355]= new Array("自动化二期-HDCABSA4机","3","L501","HDCABSA4","8","");
subcat[1356]= new Array("自动化二期-HDCABRPM3机","3","L502","HDCABRPM3","8","");
subcat[1357]= new Array("自动化二期-HDCABRPM4机","3","L503","HDCABRPM4","8","");
subcat[1358]= new Array("自动化二期-HDCABNAAGENT1机(网络管)","3","L504","HDCABNAAGENT1","8","");
subcat[1359]= new Array("自动化二期-HDCABNAAGENT2机(网络管)","3","L505","HDCABNAAGENT2","8","");
subcat[1360]= new Array("自动化二期-HDCABNAAGENT3机(网络管)","3","L506","HDCABNAAGENT3","8","");
subcat[1361]= new Array("自动化二期-HDCABNAAGENT4机(网络管)","3","L507","HDCABNAAGENT4","1","");
subcat[1362]= new Array("自动化二期-HDCABAO1机","3","L508","HDCABAO1","8","");
subcat[1363]= new Array("自动化二期-HDCAAR1机(不用管)","3","L509","HDCAAR1","8","");
subcat[1364]= new Array("自动化二期-HDCAAR2机(不用管)","3","L510","HDCAAR2","8","");
subcat[1365]= new Array("自动化二期-HDCAADDMVA01机(不用管)","3","L511","HDCAADDMVA01","8","");
subcat[1366]= new Array("北京分行员工助手APP","3","L514","aideFront","8","");
subcat[1367]= new Array("北京分行员工助手DB","3","L515","aideDB","8","");
subcat[1368]= new Array("手机银行app11机","3","L516","sjyhapp11","8","");
subcat[1369]= new Array("手机银行app12机","3","L517","sjyhapp12","8","");
subcat[1370]= new Array("手机银行app13机","3","L518","sjyhapp13","8","");
subcat[1371]= new Array("手机银行app14机","3","L519","sjyhapp14","8","");
subcat[1372]= new Array("手机银行web接入11机","3","L520","sjyhwebjr11","8","");
subcat[1373]= new Array("手机银行web接入12机","3","L521","sjyhwebjr12","8","");
subcat[1374]= new Array("数据管控项目--企业级数据管控应用服务器1机","3","L522","qysjgkap1","8","");
subcat[1375]= new Array("数据管控项目--企业级数据管控应用服务器2机","3","L523","qysjgkap2","8","");
subcat[1376]= new Array("反欺诈应用A机(HA-new)","3","L524","fqzapp1","8","");
subcat[1377]= new Array("反欺诈应用B机(HA-new)","3","L525","fqzapp2","8","");
subcat[1378]= new Array("应用日志监控分析2机","3","L580","yyrzjkfx2","8","");
subcat[1379]= new Array("应用日志监控分析3机","3","L581","yyrzjkfx3","8","");
subcat[1380]= new Array("应用日志监控分析4机","3","L582","yyrzjkfx4","8","");
subcat[1381]= new Array("应用日志监控分析5机","3","L583","yyrzjkfx5","8","");
subcat[1382]= new Array("综合前置应用7机","3","L586","zhqzap7","8","");
subcat[1383]= new Array("综合前置应用8机","3","L587","zhqzap8","8","");
subcat[1384]= new Array("客服人脸识别应用1机","3","L592","kfrlsbap1","8","");
subcat[1385]= new Array("客服人脸识别应用2机","3","L593","kfrlsbap2","8","");
subcat[1386]= new Array("新直销银行web服务器1机","3","L594","xzxyhwb1","8","");
subcat[1387]= new Array("新直销银行web服务器2机","3","L595","xzxyhwb2","8","");
subcat[1388]= new Array("新直销银行直销渠道1机","3","L596","xzxyhqd1","8","");
subcat[1389]= new Array("新直销银行直销渠道2机","3","L597","xzxyhqd2","8","");
subcat[1390]= new Array("新直销银行直销服务中心1机","3","L598","xzxyhfwzx1","8","");
subcat[1391]= new Array("新直销银行直销服务中心2机","3","L599","xzxyhfwzx2","8","");
subcat[1392]= new Array("新直销银行直销服务中心3机","3","L600","xzxyhfwzx3","8","");
subcat[1393]= new Array("新直销银行直销服务中心4机","3","L601","xzxyhfwzx4","8","");
subcat[1394]= new Array("新直销银行直销服务中心5机","3","L602","xzxyhfwzx5","8","");
subcat[1395]= new Array("新直销银行直销服务中心6机","3","L603","xzxyhfwzx6","8","");
subcat[1396]= new Array("新直销银行直销服务中心7机","3","L604","xzxyhfwzx7","8","");
subcat[1397]= new Array("新直销银行直销服务中心8机","3","L605","xzxyhfwzx8","8","");
subcat[1398]= new Array("新直销银行前置渠道1机","3","L606","xzxyhqzqd1","8","");
subcat[1399]= new Array("新直销银行前置渠道2机","3","L607","xzxyhqzqd2","8","");
subcat[1400]= new Array("新直销银行内管服务中心1机","3","L608","xzxyhng1","8","");
subcat[1401]= new Array("新直销银行内管服务中心2机","3","L609","xzxyhng2","8","");
subcat[1402]= new Array("新直销银行缓存服务器1机","3","L610","xzxyhhc1","8","");
subcat[1403]= new Array("新直销银行缓存服务器2机","3","L611","xzxyhhc2","8","");
subcat[1404]= new Array("新直销银行缓存服务器3机","3","L612","xzxyhhc3","8","");
subcat[1405]= new Array("新直销银行SOA服务器1机","3","L613","xzxyhsoa1","8","");
subcat[1406]= new Array("新直销银行SOA服务器2机","3","L614","xzxyhsoa2","8","");
subcat[1407]= new Array("新直销银行SOA服务器3机","3","L615","xzxyhsoa3","8","");
subcat[1408]= new Array("新直销银行日志服务器1机","3","L616","xzxyhlog1","8","");
subcat[1409]= new Array("P2P_WEB管理端/应用服务器1","3","L618","p2papp3","8","");
subcat[1410]= new Array("P2P_WEB管理端/应用服务器2","3","L619","p2papp4","8","");
subcat[1411]= new Array("数据服务系统-WAS应用服务器1","3","L620","sjfwapp1","8","");
subcat[1412]= new Array("数据服务系统-WAS应用服务器2","3","L621","sjfwapp2","8","");
subcat[1413]= new Array("数据服务系统-WAS应用服务器3","3","L622","sjfwapp3","8","");
subcat[1414]= new Array("数据服务系统-WAS应用服务器4","3","L623","sjfwapp4","8","");
subcat[1415]= new Array("数据服务系统-BI分析服务器1","3","L624","sjfwbifx1","8","");
subcat[1416]= new Array("数据服务系统-BI分析服务器2","3","L625","sjfwbifx2","8","");
subcat[1417]= new Array("数据服务系统-BI分析服务器3","3","L626","sjfwbifx3","8","");
subcat[1418]= new Array("金融IC卡多应用平台备用服务器1机","3","1418","icmappby1","1","2");
subcat[1419]= new Array("金融IC卡多应用平台备用服务器2机","3","1419","icmappby2","1","2");
subcat[1420]= new Array("支付融资-P2P存管内网文件服务器1机","3","1420","p2pwjcs3","1","64");
subcat[1421]= new Array("支付融资-P2P存管内网文件服务器2机","3","1421","p2pwjcs4","1","64");
subcat[1422]= new Array("B2B-B2C邮件服务器1机","3","1422","b2bweb1","1","");
subcat[1423]= new Array("B2B-B2C邮件服务器2机","3","1423","b2bweb2","1","");
subcat[1424]= new Array("网银日志服务器","3","1424","nbnfs1","1","");
subcat[1425]= new Array("支付融资-P2P存管外网文件服务器1机","3","1425","p2pwjcs1","1","");
subcat[1426]= new Array("支付融资-P2P存管外网文件服务器2机","3","1426","p2pwjcs2","1","");
subcat[1427]= new Array("新作业调度应用1机","3","1427","zydd1","1","");
subcat[1428]= new Array("新作业调度应用2机","3","1428","zydd2","1","");
subcat[1429]= new Array("村镇银行企业征信1机","3","1429","czzx1","1","");
subcat[1430]= new Array("村镇银行企业征信2机","3","1430","czzx2","1","");
subcat[1431]= new Array("村镇银行核心系统编译机","3","1431","bancs01","1","");
subcat[1432]= new Array("p2p资金存管系统数据库5机","3","1432","p2pzjcgdb5","1","4");
subcat[1433]= new Array("p2p资金存管系统数据库6机","3","1433","p2pzjcgdb6","1","4");
subcat[1434]= new Array("p2p资金存管系统数据库7机","3","1434","p2pzjcgdb7","1","4");
subcat[1435]= new Array("p2p资金存管系统数据库8机","3","1435","p2pzjcgdb8","1","4");
subcat[1436]= new Array("集中自助tops数据库1机","3","1436","xtopsdb1","1","4");
subcat[1437]= new Array("集中自助tops数据库2机","3","1437","xtopsdb2","1","4");
subcat[1438]= new Array("客服CIF数据库1机","3","1438","kfcifdb1","1","4");
subcat[1439]= new Array("客服CIF数据库2机","3","1439","kfcifdb2","1","4");
subcat[1440]= new Array("直销银行入金项目数据库1机","3","1440","xzxyhrjdb1","1","4");
subcat[1441]= new Array("直销银行入金项目数据库2机","3","1441","xzxyhrjdb2","1","4");
subcat[1442]= new Array("外联网关MQ3机","3","1442","wlyywgmq3","1","1");
subcat[1443]= new Array("外联网关MQ4机","3","1443","wlyywgmq4","1","1");
subcat[1444]= new Array("新境内外币支付系统数据库1机","3","1444","wbzfdb1","1","4");
subcat[1445]= new Array("新境内外币支付系统数据库2机","3","1445","wbzfdb2","1","4");
subcat[1446]= new Array("境内外币支付pmts前置1机","3","1446","wbzfpmts1","1","1");
subcat[1447]= new Array("境内外币支付pmts前置2机","3","1447","wbzfpmts2","1","1");
subcat[1448]= new Array("","3","","","","");
subcat[1449]= new Array("","3","","","","");
subcat[1450]= new Array("","3","","","","");
subcat[1451]= new Array("","3","","","","");
subcat[1452]= new Array("","3","","","","");
subcat[1453]= new Array("","3","","","","");
subcat[1454]= new Array("","3","","","","");
subcat[1455]= new Array("","3","","","","");
subcat[1456]= new Array("","3","","","","");
subcat[1457]= new Array("","3","","","","");
subcat[1458]= new Array("","3","","","","");
subcat[1459]= new Array("","3","","","","");
subcat[1460]= new Array("反欺诈系统-数据采集服务器1","3","L627","fqzsjcj1","8","");
subcat[1461]= new Array("反欺诈系统-数据采集服务器2","3","L628","fqzsjcj2","8","");
subcat[1462]= new Array("境内外币支付系统app1机（应用服务器）","3","L637","jnwbap1","8","");
subcat[1463]= new Array("境内外币支付系统app2机（应用服务器）","3","L638","jnwbap2","8","");
subcat[1464]= new Array("黄金报盘机2-hjbp2","3","L640","hjbp2","8","");
subcat[1465]= new Array("黄金APP前置机1","3","L641","hjappqz1","8","");
subcat[1466]= new Array("黄金APP前置机2","3","L642","hjappqz2","8","");
subcat[1467]= new Array("移动办公数据库服务器（RAC）1机","3","L651","oayddb1","8","4");
subcat[1468]= new Array("移动办公数据库服务器（RAC）2机","3","L652","oayddb2","8","4");
subcat[1469]= new Array("网站门户系统-生产环境应用服务器1机","3","L661","wzmhap1","8","");
subcat[1470]= new Array("网站门户系统-生产环境应用服务器2机","3","L662","wzmhap2","8","");
subcat[1471]= new Array("网站门户系统-生产环境CMS及防篡改服务器1机","3","L663","wzmhcms1","8","");
subcat[1472]= new Array("网站门户系统-生产环境CMS及防篡改服务器2机","3","L664","wzmhcms2","8","");
subcat[1473]= new Array("网站门户系统-生产环境web服务器1机","3","L665","wzmhwb1","8","");
subcat[1474]= new Array("网站门户系统-生产环境web服务器2机","3","L666","wzmhwb2","8","");
subcat[1475]= new Array("生产环境繁简通服务器1机","3","L667","wzmhfjt1","8","");
subcat[1476]= new Array("生产环境繁简通服务器2机","3","L668","wzmhfjt2","8","");
subcat[1477]= new Array("网站门户系统-生产环境数据库服务器1机","3","L669","wzmhdb1","8","4");
subcat[1478]= new Array("网站门户系统-生产环境数据库服务器2机","3","L670","wzmhdb2","8","");
subcat[1479]= new Array("在线客服、录音等应用数据库服务器1机","3","L673","kfcifdb1","8","4");
subcat[1480]= new Array("在线客服、录音等应用数据库服务器1机","3","L674","kfcifdb2","8","");
subcat[1481]= new Array("移动办公-队列服务器1机","3","L675","oaydque1","8","");
subcat[1482]= new Array("移动办公-队列服务器2机","3","L676","oaydque2","8","");
subcat[1483]= new Array("移动办公-内存数据库服务器1机","3","L677","oaydmemdb1","8","4");
subcat[1484]= new Array("内存数据库服务器2机","3","L678","oaydmemdb2","8","4");
subcat[1485]= new Array("电子化培训平台与外网app同步数据反洗钱从外网取黑名单数据","3","L679","xfxqhmd1","8","");
subcat[1486]= new Array("反洗钱系统-生产环境名单监测应用服务器1","3","L705","fxqmdjc1","8","");
subcat[1487]= new Array("反洗钱系统-生产环境名单监测应用服务器2","3","L706","fxqmdjc2","8","");
subcat[1488]= new Array("新直销银行入金应用服务器1机","3","L707","xzxyhrjap1","8","");
subcat[1489]= new Array("新直销银行入金应用服务器2机","3","L708","xzxyhrjap2","8","");
subcat[1490]= new Array("新直销银行入金应用服务器3机","3","L709","xzxyhrjap3","8","");
subcat[1491]= new Array("新直销银行入金应用服务器4机","3","L710","xzxyhrjap4","8","");
subcat[1492]= new Array("新直销银行入金缓存服务器1机","3","L711","xzxyhrjhc1","8","");
subcat[1493]= new Array("新直销银行入金缓存服务器2机","3","L712","xzxyhrjhc2","8","");
subcat[1494]= new Array("新直销银行入金缓存服务器3机","3","L713","xzxyhrjhc3","8","");
subcat[1495]= new Array("即时通信应用服务器1机","3","L714","oatxap1","8","");
subcat[1496]= new Array("即时通信应用服务器2机","3","L715","oatxap2","8","");
subcat[1497]= new Array("即时通信应用服务器3机","3","L716","oatxap3","8","");
subcat[1498]= new Array("即时通信应用服务器4机","3","L717","oatxap4","8","");
subcat[1499]= new Array("即时通信应用服务器5机","3","L718","oatxap5","8","");
subcat[1500]= new Array("即时通信应用服务器6机","3","L719","oatxap6","8","");
subcat[1501]= new Array("即时通信应用服务器7机","3","L720","oatxap7","8","");
subcat[1502]= new Array("即时通信数据库服务器1机","3","L721","oatxdb1","8","");
subcat[1503]= new Array("即时通信数据库服务器2机","3","L722","oatxdb2","8","");
subcat[1504]= new Array("即时通信数据库服务器3机","3","L723","oatxdb3","8","");
subcat[1505]= new Array("移动OA应用服务器1机","3","L724","oaapp1","8","");
subcat[1506]= new Array("移动OA应用服务器2机","3","L725","oaapp2","8","");
subcat[1507]= new Array("安全支撑消息中心1机","3","L726","oaaqcenter1","8","");
subcat[1508]= new Array("安全支撑消息中心2机","3","L727","oaaqcenter2","8","");
subcat[1509]= new Array("即时通信消息服务器1机","3","L728","oatxmsg1","8","");
subcat[1510]= new Array("即时通信消息服务器2机","3","L729","oatxmsg2","8","");
subcat[1511]= new Array("即时通信消息服务器3机","3","L730","oatxmsg3","8","");
subcat[1512]= new Array("即时通信消息服务器4机","3","L731","oatxmsg4","8","");
subcat[1513]= new Array("即时通信消息服务器5机","3","L732","oatxmsg5","8","");
subcat[1514]= new Array("新机房监控-新版RFID采集服务器","3","L733","xrfidcj1","8","");
subcat[1515]= new Array("支付融资（智慧社区）应用1机","3","1515","zfrzzhsqap1","1","66");
subcat[1516]= new Array("支付融资（智慧社区）应用2机","3","1516","zfrzzhsqap2","1","66");
subcat[1517]= new Array("B2B/B2C应用服务器4机","3","1517","localhost","1","66");
subcat[1518]= new Array("","3","1518","","1","4");
subcat[1519]= new Array("","3","1519","","1","");
subcat[1520]= new Array("","3","1520","","1","");
subcat[1521]= new Array("","3","1521","","1","");
subcat[1522]= new Array("","3","1522","","1","");
subcat[1523]= new Array("","3","1523","","1","");
subcat[1524]= new Array("","3","1524","","1","");
subcat[1525]= new Array("","3","1525","","1","");
subcat[1526]= new Array("","3","1526","","1","");
subcat[1527]= new Array("","3","1527","","1","");
subcat[1528]= new Array("","3","1528","","1","");
subcat[1529]= new Array("","3","1529","","1","");
subcat[1530]= new Array("","3","1530","","1","");
subcat[1531]= new Array("","3","1531","","1","");
subcat[1532]= new Array("移动办公前置服务器3机","3","L734","oaydqz3","8","");
subcat[1533]= new Array("移动办公前置服务器4机","3","L735","oaydqz4","8","");
subcat[1534]= new Array("沃趣rac1机","3","L736","hxdb1","8","4");
subcat[1535]= new Array("沃趣rac2机","3","L737","hxdb2","8","4");
subcat[1536]= new Array("22","3","2222","22","1","1");
subcat[1537]= new Array("","","","","","");
subcat[1538]= new Array("预填单系统应用服务器1","3","L738","ytdap1","8","");
subcat[1539]= new Array("预填单系统应用服务器2","3","L739","ytdap2","8","");
subcat[1540]= new Array("预填单系统应用服务器3","3","L740","ytdap3","8","");
subcat[1541]= new Array("终端密钥集中管理-集中自助设备前置系统应用服务器1","3","L741","xtopsap1","8","");
subcat[1542]= new Array("终端密钥集中管理-集中自助设备前置系统应用服务器2","3","L742","xtopsap2","8","");
subcat[1543]= new Array("终端密钥集中管理-集中自助设备前置系统应用服务器3","3","L743","xtopsap3","8","");
subcat[1544]= new Array("终端密钥集中管理-集中自助设备前置系统应用服务器4","3","L744","xtopsap4","8","");
subcat[1545]= new Array("人民银行账户管理应用服务器1机","3","L745","rhzhglap1","8","");
subcat[1546]= new Array("人民银行账户管理应用服务器2机","3","L746","rhzhglap2","8","");
subcat[1547]= new Array("人民银行账户管理系统-人民银行账户管理应用服务器1机","3","L747","rhzhglwas1","8","2");
subcat[1548]= new Array("人民银行账户管理系统-人民银行账户管理应用服务器1机","3","L748","rhzhglwas2","8","2");
subcat[1549]= new Array("人民银行账户管理系统-数据库共享平台11机","3","L749","dbgxpt11","8","4");
subcat[1550]= new Array("人民银行账户管理系统-数据库共享平台12机","3","L750","dbgxpt12","8","4");
subcat[1551]= new Array("千里眼系统-千里眼系统应用服务器1机","3","L751","qlyap1","8","");
subcat[1552]= new Array("千里眼系统-千里眼系统应用服务器2机","3","L752","qlyap2","8","");
subcat[1553]= new Array("千里眼系统-千里眼系统匹配应用服务器1机","3"," L753","qlyppap1","8","");
subcat[1554]= new Array("千里眼系统-千里眼系统匹配应用服务器2机","3"," L754","qlyppap2","8","");
subcat[1555]= new Array("千里眼系统-千里眼系统数据库服务器1机","3","L755","qlydb1","8","");
subcat[1556]= new Array("千里眼系统-千里眼系统数据库服务器2机","3"," L756","qlydb2","8","");
subcat[1557]= new Array("p2p(三期和四期)-p2p应用服务器5机","3","L757","p2papp5","8","");
subcat[1558]= new Array("p2p(三期和四期)-p2p应用服务器6机","3","L758","p2papp6 ","8","");
subcat[1559]= new Array("p2p(三期和四期)-p2p应用服务器7机","3","L759","p2papp7","8","");
subcat[1560]= new Array("p2p(三期和四期)-p2p应用服务器8机","3","L760","p2papp8","8","");
subcat[1561]= new Array("理财报送系统1机","3","L761","lcbs1","8","");
subcat[1562]= new Array("理财报送系统2机","3","L762","lcbs2","8","");
subcat[1563]= new Array("信贷高时效系统交易子系统应用服务器1机","3","L763","xdgsxap1","8","70");
subcat[1564]= new Array("信贷高时效系统交易子系统应用服务器2机","3","L764","xdgsxap2","8","70");
subcat[1565]= new Array("信贷高时效系统交易子系统数据库1机","3","L765","xdgsxdb1","8","4");
subcat[1566]= new Array("信贷高时效系统交易子系统数据库2机","3","L766","xdgsxdb2","8","4");
subcat[1567]= new Array("一体化运维管理平台监控系统柜面助手应用服务器1机","3","L767","gmzsap1","8","");
subcat[1568]= new Array("一体化运维管理平台监控系统柜面助手应用服务器2机","3","L768","gmzsap2","8","");
subcat[1569]= new Array("一体化运维管理平台监控系统柜面助手应用服务器3机","3","L769","gmzsap3","8","");
subcat[1570]= new Array("一体化运维管理平台监控系统柜面助手应用服务器4机","3","L770","gmzsap4","8","");
subcat[1571]= new Array("非税收入代缴电子凭证库应用服务器1机","3","L771","dzpzkap1","8","");
subcat[1572]= new Array("非税收入代缴电子凭证库应用服务器2机","3","L772","dzpzkap2","8","");
subcat[1573]= new Array("非税收入代缴电子凭证库电子印章服务器1机","3","L773","dzpzkyz1","8","");
subcat[1574]= new Array("非税收入代缴电子凭证库电子印章服务器2机","3","L774","dzpzkyz2","8","");   
subcat[1575]= new Array("qweq","3","1577","qeqw","1","8");
subcat[1576]= new Array("dsfs","3","1578","sdf","1","16");
subcat[1577]= new Array("南京分行微信服务系统-微信银行（分行1）对内WEB服务器1","3","L775","fhwxweb1","8","");
subcat[1578]= new Array("南京分行微信服务系统-微信银行（分行1）对内WEB服务器2","3","L776","fhwxweb2","8","");
subcat[1579]= new Array("南京分行微信服务系统-微信银行（分行1）APP服务器1","3","L777","fhwxapp1","8","");
subcat[1580]= new Array("南京分行微信服务系统-微信银行（分行1）APP服务器2","3","L778","fhwxapp2","8","");
subcat[1581]= new Array("南京分行微信服务系统-微信银行（分行1）批量服务器1","3","L779","fhwxtimer1","8","");
subcat[1582]= new Array("南京分行微信服务系统-微信银行（分行1）批量服务器2","3","L780","fhwxtimer2","8","");
subcat[1583]= new Array("南京分行微信服务系统-X86数据库共享平台15机","3","L781","dbgxpt15","8","4");
subcat[1584]= new Array("南京分行微信服务系统-X86数据库共享平台16机","3","L782","dbgxpt16","8","4");
subcat[1585]= new Array("网银系统-网银Web服务器1","3","L783","xwywb1","8","");
subcat[1586]= new Array("网银系统-网银Web服务器2","3","L784","xwywb2","8","");
subcat[1587]= new Array("网银系统-网银Web服务器6-xwywb3","3","L785","xwywb3","8","");
subcat[1588]= new Array("网银系统-网银Web服务器6-xwywb4","3","L786","xwywb4","8","");
subcat[1589]= new Array("网银系统-网银Web服务器6-xwywb5","3","L787","xwywb5","8","");
subcat[1590]= new Array("网银系统-网银Web服务器6-xwywb6","3","L788","xwywb6","8","");
subcat[1591]= new Array("扬州分行-网点服务信息动态查询服务器","3","L789","yzfhxxcx1","8","");
subcat[1592]= new Array("财税库行应用1机","3","L790","cskhap1","8","");
subcat[1593]= new Array("财税库行应用2机","3","L791","cskhap2","8","");
subcat[1594]= new Array("监控大数据平台11机","3","L792","bigdata11","8","");
subcat[1595]= new Array("监控大数据平台12机","3","L793","bigdata12","8","");
subcat[1596]= new Array("CallCenter系统","3","L794","kfsip1","8","");
subcat[1597]= new Array("CallCenter系统","3","L795","kfsip2","8","");
subcat[1598]= new Array("CallCenter系统","3","L796","kfgvpwb1","8","2");
subcat[1599]= new Array("CallCenter系统","3","L797","kfgvpwb2","8","2");
subcat[1600]= new Array("CallCenter系统","3","L798","kfgvpwb3","8","2");
subcat[1601]= new Array("CallCenter系统","3","L799","kfgvpwb4","8","2");



onecount=700;
hostname="hostname"

function changelocation()
  {
    document.form1.oslist.length = 0; 
    
    document.form1.oslist.options[0] = new Option('===选择操作系统===','100');  
    document.form1.oslist.options[1] = new Option('===所有系统===','99');
    document.form1.oslist.options[2] = new Option('AIX','1');
    document.form1.oslist.options[3] = new Option('Solaris','2');
    document.form1.oslist.options[4] = new Option('Windows','4');
    document.form1.oslist.options[5] = new Option('Linux','8');                     
    
    document.form1.applist.length = 0;
    document.form1.applist.options[0] = new Option('===选择应用类型===','100');      
    
    document.form1.systemlist.length = 0;
    document.form1.systemlist.options[0] = new Option('===服务器列表===','');
  }
     
      
function changeos()
  {   
    document.form1.applist.length = 0; 
    
    document.form1.applist.options[0] = new Option('===选择应用类型===','100');
    document.form1.applist.options[1] = new Option('===所有应用===','99');
    document.form1.applist.options[2] = new Option('MQ','1');
    document.form1.applist.options[3] = new Option('WAS','2');
    document.form1.applist.options[4] = new Option('Oracle','4');
    document.form1.applist.options[5] = new Option('TongEASY','8');
    document.form1.applist.options[6] = new Option('Informix','16');
    document.form1.applist.options[7] = new Option('CV','32');
    document.form1.applist.options[7] = new Option('GTP','64');
    document.form1.systemlist.length = 0;
    document.form1.systemlist.options[0] = new Option('===服务器列表===','');
            //王晓刚修改于 2014 08 21 根据操作系统查询服务器列表  当前操作越过了选择应用类型直接根据local 根 os来查询所有system
       try
       {
       	 var temps=new Array();
         for(var i=0;i<subcat.length;i++){
         	//地址选择所有地点
         	if(document.form1.location.value==99){
         	 if(subcat[i][4]==document.form1.oslist.value&&(subcat[i][0]!=""||subcat[i][0]!="null")){ 
         	 	 temps.push(subcat[i]);
         	 }
         	}
         	else{
         		 if(subcat[i][4]==document.form1.oslist.value&&(subcat[i][0]!=""||subcat[i][0]!="null")&&(subcat[i][1]==document.form1.location.value)){ 
         	 	 temps.push(subcat[i]);
         	 		}
         		}
         } 
         for(var j=0;j<temps.length;j++){ 
         	document.form1.systemlist.options[j] = new Option(temps[j][0],temps[j][2]);
         } 
         document.form1.systemlist.value=document.form1.systemlist.options[0].value;
       }
       catch(e){
       	alert("新增根据操作系统查询所有服务器部分代码出错！"+e)
       }
  }

function tobinChange(n)
  {
    if(!isNaN(n) && n>0)
       {
	    if(n%2==0)
	       {
	           return tobinChange(n/2)+"0";
	       }
            else
            	{
	            if(n>2)
		       {
			   return tobinChange(parseInt(n/2))+(n%2);
		       }
		    else
		    	{
		            return tobinChange(0)+n;
		    	}
	    	}
       	}
    else
    	{
	    return "";
	}
   }

function changeapp(locationid,osid,appid)
  {   
    var locationid=locationid;
    var osid=osid;
    var appid=appid;
    var i;

    document.form1.systemlist.length = 0; 
    if (locationid == 99)
        {
            if (osid == 99)
                {
                   if (appid == 99)
                       {
                           document.form1.systemlist.length=0
            	           for (i=0;i < subcat.length; i++)
        	  	       {
           	    		   if (subcat[i][0] != "null")
           	      		       { 
            				  document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      		       }        
        	  	       }        
  	      	       }
  	           else
  	      	       {
  	        	   switch(appid)
				{
           	    		    case "100":
           	    		        {
           	    		    	    document.form1.systemlist.length = 0;
    				    	    document.form1.systemlist.options[0] = new Option('===服务器列表===','');
    					}
    					break;
 	      	       			
  	      	       		    default:
  	      	       			{
  	      	       			    document.form1.systemlist.length=0;
		    		    	    for (i=0;i < subcat.length; i++)
        	  	       			{       	    		      
				   	            if (subcat[i][5] != "")
				   	          	{
	 			   	          	    if ((subcat[i][5] & appid) == appid)
                		       				{ 
          			   	    	    	    	    document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      		       				}        
        	  	       				} 
        	  	       			}
  	      	       			}
  	        		}
  	        	}
  	        }
            else
          	{
          	    if (appid == 99)
                        {
                            document.form1.systemlist.length=0
                    	    for (i=0;i < subcat.length; i++)
                	        {
                   	            if (subcat[i][4] == osid)
                   	                { 
                    		            document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                              		}        
                	  	}        
          	        }
          	    else
          	        {
 	        	   switch(appid)
				{
           	    		    case "100":
           	    		        {
           	    		    	    document.form1.systemlist.length = 0;
    				    	    document.form1.systemlist.options[0] = new Option('===服务器列表===','');
    					}
    					break;
 	      	       			
  	      	       		    default:
  	      	       			{
  	      	       			    document.form1.systemlist.length=0;
		    		    	    for (i=0;i < subcat.length; i++)
        	  	       			{       	    		      
				   	            if (subcat[i][5] != "")
				   	          	{
	 			   	          	    if ((subcat[i][5] & appid) == appid && subcat[i][4] == osid )
                		       				{ 
          			   	    	    	    	    document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      		       				}        
        	  	       				} 
        	  	       			}
  	      	       			}
  	        		}          	            
          	      	}
          	}
        }
    else
        {
            if (osid == 99)
          	{
            	    if (appid == 99)
              		{
                	    document.form1.systemlist.length=0
            		    for (i=0;i < subcat.length; i++)
        	  		{
           	    		    if (subcat[i][1] == locationid)
           	      			{ 
            				    document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      			}        
        	  		}        
  	      		}
  	      	
  	            else
  	                {
 	        	    switch(appid)
			 	{
           	    	 	    case "100":
           	    	 	        {
           	    	 	    	    document.form1.systemlist.length = 0;
    			 	    	    document.form1.systemlist.options[0] = new Option('===服务器列表===','');
    			 		}
    			 		break;
 	      	       	 		
  	      	       	 	    default:
  	      	       	 		{
  	      	       	 		    document.form1.systemlist.length=0;
		    	 	    	    for (i=0;i < subcat.length; i++)
        	  	        			{       	    		      
			 	   	            if (subcat[i][5] != "")
			 	   	          	{
	 		 	   	          	    if ((subcat[i][5] & appid) == appid && subcat[i][1] == locationid)
                	 	       				{ 
          		 	   	    	    	    	    document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      	 	       				}        
        	  	        				} 
        	  	        			}
  	      	       	 		}
  	        	 	}          	            
  	              	}
  	  	}
  	    else
  	  	{
  	    	    if (appid == 99)
              		{
                	    document.form1.systemlist.length=0
            		    for (i=0;i < subcat.length; i++)
        	  		{
           	    		    if (subcat[i][1] == locationid && subcat[i][4] == osid)
           	      			{ 
            				    document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      			}        
        	  		}        
  	      		}
  	    	    else
  	      		{
 	        	    switch(appid)
			 	{
           	    	 	    case "100":
           	    	 	        {
           	    	 	    	    document.form1.systemlist.length = 0;
    			 	    	    document.form1.systemlist.options[0] = new Option('===服务器列表===','');
    			 		}
    			 		break;
 	      	       	 		
  	      	       	 	    default:
  	      	       	 		{
  	      	       	 		    document.form1.systemlist.length=0;
		    	 	    	    for (i=0;i < subcat.length; i++)
        	  	        			{       	    		      
			 	   	            if (subcat[i][5] != "")
			 	   	          	{
	 		 	   	          	    if ((subcat[i][5] & appid) == appid && subcat[i][1] == locationid && subcat[i][4] == osid)
                	 	       				{ 
          		 	   	    	    	    	    document.form1.systemlist.options[document.form1.systemlist.length] = new Option(subcat[i][0], subcat[i][2]);
                      	 	       				}        
        	  	        				} 
        	  	        			}
  	      	       	 		}
  	        	 	}          	            
  	      		}
  	  	}
      	}     
      sortOption();
  }	     
 
function sub_achieveurl(systemlist)
{		
	if (systemlist.indexOf("L") >= 0){
		
		hour = "03";
	
		url = "linuxreport/" + systemlist+"/" + systemlist + "."+firmdate+hour+".html";
	}else{
	    url = systemlist+"/"+"report."+firmdate+".html";

	}
	window.open(url);
}

function achieveurl()
{	
	var systemlist = String(document.form1.systemlist.value);
	
	if (systemlist.indexOf("L") >= 0){

			hour = "03";
		url = "linuxreport/" + systemlist+"/" + systemlist + "."+firmdate+hour+".html";
	}else{
		url = systemlist+"/"+"report."+firmdate+".html";
	}
	window.open(url);
}

function achieveurl1()
{
	var systemlist = String(document.form1.systemlist.value);
	if (systemlist.indexOf("L") >= 0){
		var hourval = new Date().getHours();
		if (hourval >= 14){
			hour = "11";
		}else{
			hour = "03";
		}
		url = "linuxreport/" + systemlist+"/" + systemlist + "."+firmdate+".html";
	}else{
		url = systemlist+"/"+"report."+firmdate+".html";
	}
	window.open(url);
}
//-->
</script>
<form name="form1" action=""  method="post" target="">
<font size=5><b>可以通过系统名称、主机名进行关键字模糊查询：<input type="text" id="search" value="搜一搜！" style="color:gray;" onfocus="this.value=''; this.style.color='black'" onkeydown="return enterSumbit();"/><input type="button" id="search_btn" value="搜索" onClick="searchKey();" /></b>

<b>可以通过服务器位置、系统类型、应用类型进行查询：</b>

<select name="location" 
onChange="changelocation()">
<option value="03"selected>亦庄中金</option>
<option value="02">西三旗</option>
<option value="07">东单</option>
<option value="99">所有地方</option>
<option></option>
</select><select name="oslist" 
onChange="changeos()">
<option>====选择操作系统====</option>
</select><select name="applist" 
onChange="changeapp(document.form1.location.options[document.form1.location.selectedIndex].value,document.form1.oslist.options[document.form1.oslist.selectedIndex].value,document.form1.applist.options[document.form1.applist.selectedIndex].value)">
<option>====选择应用类型====</option>
</select><select name="systemlist" id="systemlist"> 
<option>===服务器列表0===</option>
</select><input type="button" value="查询相关巡检报告" onclick="achieveurl();">
</form>
</font><hr>
<div id="search_result"></div>

<script LANGUAGE="javascript"> 
<!-- 
changelocation(document.form1.location.options[document.form1.location.selectedIndex].value); 
//--> 
</script>

　　<script language="JavaScript"><!--
　　function YYYYMMDDstart(form,year,month,day)
　　{
　　 MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
　　 //先给年下拉框赋内容
　　 var y = new Date().getFullYear();
　　 for (var i = (y-3); i < (y+10); i++) //以今年为准，前3年，后10年
　　 year.options.add(new Option(i,i));
　　 //赋月份的下拉框
　　 for (var i = 1; i < 13; i++)
　　 month.options.add(new Option(i,i));
　　 year.value = y;
　　 month.value = new Date().getMonth() + 1;
　　 var n = MonHead[new Date().getMonth()];
　　 if (new Date().getMonth() ==1 && IsPinYear(year.options[year.selectedIndex].value)) n++;
　　 writeDay(n,day); //赋日期下拉框Author:meizz
　　 day.value = new Date().getDate();
　　}
　　function YYYYDD(str,month,day) //年发生变化时日期发生变化(主要是判断闰平年)
　　{
　　 var MMvalue = month.options[month.selectedIndex].value;
　　 if (MMvalue == "" ){ var e = day; optionsClear(e); return;}
　　 var n = MonHead[MMvalue - 1];
　　 if (MMvalue ==2 && IsPinYear(str)) n++;
　　 writeDay(n,day)
　　}
　　function MMDD(str,year,day) //月发生变化时日期联动
　　{
　　 var YYYYvalue = year.options[year.selectedIndex].value;
　　 if (YYYYvalue == "" ){ var e = day; optionsClear(e); return;}
　　 var n = MonHead[str - 1];
　　 if (str ==2 && IsPinYear(YYYYvalue)) n++;
　　 writeDay(n,day)
　　}
　　function writeDay(n,day) //据条件写日期的下拉框
　　{
　　 var e = day; optionsClear(e);
　　 for (var i=1; i<(n+1); i++)
　　 e.options.add(new Option(i,i));
　　}
　　function IsPinYear(year)//判断是否闰平年
　　{ return(0 == year%4 && (year%100 !=0 || year%400 == 0));}
　　function optionsClear(e)
　　{
　　 for (var i=e.options.length; i>0; i--)
　　 e.remove(i);
　　}
    
    



    function sortRule(a, b){
        var x = a._text;
        var y = b._text;
        return x.localeCompare(y);
    }
    function op(){
        var _value;
        var _text;
    }

    function sortOption(){
        var obj = document.getElementById("systemlist");
        var tmp = new Array();
        for (var i=0;i<obj.options.length;i++){
            var ops = new op();
            ops._value = obj.options[i].value;
            ops._text = obj.options[i].text;
            if(ops._text != null && ops._text != ""){
                tmp.push(ops);
            }
        }
        tmp.sort(sortRule);
        for (var j=0;j<tmp.length;j++){
            obj.options[j].value = tmp[j]._value;
            obj.options[j].text = tmp[j]._text;
        }
    }

    function searchKey(){
		//var keywords = document.getElementById("search").value.trim();
		var keywords = document.getElementById("search").value.replace(/(^\s*)|(\s*$)/g, '');
		var $restArea = document.getElementById("search_result");
		var restArr = new Array();
		//alert(keywords);
		if(keywords == "" || keywords == null){
			resthtml = "";
		}else{
			var resthtml = "<hr>\n";
			var keyarr = keywords.split(" ");
			for(var i=0; i<keyarr.length; i++){
				if(keyarr[i] != "")
					restArr = restArr.concat(searchArray(keyarr[i]));
			}
			restArr = removeDuplElem(restArr);
			if(restArr.length > 0){
				resthtml += "<input type='button' value='查看选中项' onClick='showChecked();'\>\n";
				resthtml += "<table id='searchtab' style='' border=0 width=800px>\n";
				for(var j=0; j<restArr.length; j++){
					var sysname = restArr[j][0];
					var index = restArr[j][2];
					var hostname = restArr[j][3];
					
					resthtml += "<tr><td><input type='radio' name='rad' value='" + index + "'/></td><td>" + index + "</td><td>" + hostname + "</td><td>" + sysname + "</td></tr>\n";
				
				}
				resthtml += "</table>\n";
			}
		}
		//alert("html:" + resthtml);
		$restArea.innerHTML = resthtml;
	}
	//转到压缩页面 根据id来确定是aix 或者是linux系统 linux以l开头
  function gotodown(id){   
  	window.location.href="http://102.200.2.224:8085/default.aspx?sid="+id+"";  
  }
	function searchArray(keyword){
		var restArr = new Array();
		for(var seq=0; seq<subcat.length; seq++){
			 //王晓刚修改于2014 08 21 本次修改增加了搜索tag 新增按照地址，操作系统，软件类别查询
     if(subcat[seq][0]==""||subcat[seq][0]=="null")
     	 continue; 
			var new_add,new_os,new_soft="";
			switch(subcat[seq][1]){
				case "02":
					new_add="西三旗";
					break;
				case "03":
					new_add="亦庄中金";
					break;
				case "07":
					new_add="东单";
					break;
				case "99":
					new_add="所有地方";
					break; 
			}
				switch(subcat[seq][4]){
				case "1":
					new_os="AIX";
					break;
				case "2":
					new_os="Solaris";
					break;
				case "4":
					new_os="Windows";
					break;
				case "8":
					new_os="Linux";
					break; 
			}
			new_os=new_os.toLowerCase();
			
			//按照应用类型来组织字符串 搞不懂为什么要把应用类型加起来 加起来之后没法确定是由那些应用组成的  这里只做了能确定的判断   
			var newkey_soft=keyword.toLowerCase();
			var flag=subcat[seq][5];
			if(flag!=""&&flag!=null){
				switch(newkey_soft){
						case "mq": 
						 if(flag=="1"||flag=="3"||flag=="5"||flag=="9"||flag=="17"||flag=="33"||flag=="7"||flag=="13"||flag=="25"||flag=="49"||flag=="63"){
						 	restArr.push(subcat[seq]);
						 }
						break;
						case "was": 
						 if(flag=="2"||flag=="3"||flag=="6"||flag=="10"||flag=="18"||flag=="34"||flag=="7"||flag=="14"||flag=="26"||flag=="50"||flag=="63"){
						 	restArr.push(subcat[seq]);
						 }
						break;
						case "oracle": 
						 if(flag=="4"||flag=="5"||flag=="6"||flag=="12"||flag=="20"||flag=="36"||flag=="7"||flag=="14"||flag=="28"||flag=="52"||flag=="63"){
						 	restArr.push(subcat[seq]);
						 }
						break;
						case "tong": 
						 if(flag=="8"||flag=="9"||flag=="10"||flag=="12"||flag=="24"||flag=="40"||flag=="11"||flag=="14"||flag=="28"||flag=="56"||flag=="63"){
						 	restArr.push(subcat[seq]);
						 }
						break;
						case "cv": 
						 if(flag=="32"||flag=="33"||flag=="34"||flag=="36"||flag=="40"||flag=="48"||flag=="35"||flag=="38"||flag=="44"||flag=="56"||flag=="63"){
						 	restArr.push(subcat[seq]);
						 }
						break;
				}
			}
			//新增结束
			var data = subcat[seq][0] + "|" + subcat[seq][2] + "|" + subcat[seq][3]+new_add+new_os;
			if(data.indexOf(keyword) != -1){
				restArr.push(subcat[seq]);
				//alert(data);
			}
		}
		//alert("function:searchArray:restArr:length=" + restArr.length);
		return restArr;
	}
    
	function removeDuplElem(array){ 
	    for(var i=0; i<array.length; i++){
			for(var j=i+1; j<array.length; j++){
				if(array[i] == array[j]){
					array.splice(j,1);//删除指定下标的元素
					i=-1;
					break;
				}
			}
		}
		return array;  
	} 

	function showChecked(){
		var $obj = document.getElementsByName("rad");
		var index;  
        for (var i=0;i<$obj.length;i++){  
			if($obj[i].checked)
				index = $obj[i].value;   
		}
		sub_achieveurl(String(index));
	}

	function enterSumbit(){ 
		var event=arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异  
		if (event.keyCode == 13){ 
			searchKey(); 
			return false;
		}
    } 
  function getDateStr(){
  	var date = new Date();
  	var year = String(date.getFullYear());
  	var month = String(date.getMonth()+1);
  	var day = String(date.getDate());
  	if (month.length<2)
			month="0"+month;
		if (day.length<2)
			day="0"+day;
  	return year+month+day;
  }
  function showSysList(type, cols){
  	var date = getDateStr();
  	var $listarea = document.getElementById("search_result");
  	var html = "<table>";
		//var cols = 5;
		var col = 0;
		var newtr = "";
		var sys_type;
		var url_plus = "";
		if(type == "was"){
			sys_type = 2;
			url_plus = "#WAS健康检查";
		}else if(type == "oracle"){
			sys_type = 4;
		}else if(type == "mq"){
			sys_type = 1;
			url_plus = "#MQ队列管理器信息";
		}
		for (i=0;i < subcat.length; i++){
			var apptype = subcat[i][5];
			if (( apptype % (sys_type * 2) ) / sys_type != 1){
				//alert(apptype);
				continue;
			}
			var sysname = subcat[i][0];
			var sysseq = subcat[i][2];
			//alert(apptype + "====" + sysname);
			if (col == 0){
				newtr = "<tr>";
			}
			newtr = newtr + "<td><a href='http://102.200.2.224/report/" + sysseq + "/report." + date + ".html" + url_plus + "' target='about_blank'>" + sysname + "</a></td>";
			col++;
			if (col == cols){
				html += newtr + "</tr>";
				col = 0;
			}
		}
		html += newtr + "</tr>";
		html += "</table>";
		$listarea.innerHTML = html;
	}  
　　//-->
</script>
</body>
</html>

