<?php

require APP_PATH . "Common/Common/arrlists.php";

//记录点击次数
function click_action_log() {
    $clickdb = M("click_action_log");
    $logs['controller'] = CONTROLLER_NAME;
    $logs['action'] = ACTION_NAME;
    $logs['userid'] = session("userid");
    $logs['datetime'] = strtotime(date('Y-m-d H:i:s'));
    $logs['year'] = date('Y');
    $logs['month'] = date('m');
    $logs['date'] = date('d');
    $logs['hour'] = date('H');
    $logs['ip'] = get_real_ip();
    if ($logs['action'] == 'show' && $_GET['id'] && $logs['controller'] == 'Case') {
        $logs['caseid'] = $_GET['id'];
    } else {
        $logs['caseid'] = '';
    }
    $clickdb->add($logs);
}

// 获取客户端真实IP
function get_real_ip() {
    $ip = '';
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    }
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ips = explode(', ', $_SERVER['HTTP_X_FORWARDED_FOR']);
        if ($ip) {
            array_unshift($ips, $ip);
            $ip = FALSE;
        }
        for ($i = 0; $i < count($ips); $i++) {
            if (!eregi('^(10│172.16│192.168).', $ips[$i])) {
                $ip = $ips[$i];
                break;
            }
        }
    }
    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}

//导航权限验证
function NavChechPower($node) {
    if (in_array($node, array('TongEASY', 'MQ', 'TongGTP', 'Was', 'Count'))) {
        $zjjact = 'active';
    } else {
        $zjjact = '';
    }
    $db = M("User_power");
    global $power;
    $userid = session('userid');
    $classAll = M()->table("class a,user_power b ")->where(" a.classid=b.classid and b.userid='$userid'")->select();
    $lis = '';
    $zjjli = '';
    $zjj = '<li class="' . $zjjact . '"><a id="loginfo" role="button"  href="javascript:;">中间件 <span class="caret"></span></a> <ul id="mq_menu" class="nav nav-bar dropdown-menu"> ';
    foreach ($classAll as $key => $value) {
        $power_level = $value['power_level'];
        foreach ($power as $kp => $vp) {
            if (($power_level & $vp) == $vp && $kp == 'view') {
                if ($node == ucwords($value['action'])) {
                    $liact = 'active';
                } else {
                    $liact = '';
                }
                if (in_array($value['action'], array('tonggtp', 'tongeasy', 'was', 'mq', 'count'))) {
                    $zjjli .='  <li class="' . ucwords($value['action']) . '"> <a href="' . $value['url'] . '"><i class="fa ' . $value['icon'] . '"></i> ' . $value['classname'] . '</a></li>  ';
                } else {
                    $lis .= ' <li class="' . $liact . '"> <a href="' . $value['url'] . '">' . $value['classname'] . '</a></li>';
                }
            }
        }
    }
    $zjj .=$zjjli;
    $zjj .=' </ul> </li>';
    $navs = '';
    if ($zjjli) {
        $navs .= (string) $zjj;
    }
    $navs .= (string) $lis;

    return $navs;
}

//MQ导出到Execl
function ExcelExport($nav, $data, $sheetname) {
    echo $row = count($nav);
    $asc = 65;
    $style = 'A1:' . chr($asc + $row - 1) . '1';
    import("Org.Util.PHPExcel");
    $objPHPExcel = new \PHPExcel();
    // 如果excel文件后缀名为.xls，导入这个类
    import("Org.Util.PHPExcel.Reader.Excel5");
    // 如果excel文件后缀名为.xlsx，导入这下类
    // import("Org.Util.PHPExcel.Reader.Excel2007");
    // $PHPReader=new \PHPExcel_Reader_Excel2007();
    for ($i = 0; $i < count($nav); $i ++) {
        $y = chr($asc) . "1";
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($y, $nav[$i]);
        $objPHPExcel->getActiveSheet()
                ->getColumnDimension(chr($asc))
                ->setAutoSize(true);
        $asc ++;
    }
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFill()
            ->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFill()
            ->getStartColor()
            ->setARGB('dae3da');
    // // set font size bold
    $objPHPExcel->getActiveSheet()
            ->getDefaultStyle()
            ->getFont()
            ->setSize(12);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFont()
            ->setBold(true);

    //$objPHPExcel->getActiveSheet()->getStyle($style)->getAlignment()->setWrapText(TRUE);
    // $objPHPExcel->getActiveSheet()
    // ->getStyle('A2:J2')
    // ->getAlignment()
    // ->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
    // // 设置边框
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getBorders()
            ->getAllBorders()
            ->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

    // // 设置水平居中
    // $objPHPExcel->getActiveSheet()
    // ->getStyle('A1')
    // ->getAlignment()
    // ->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
    // $objPHPExcel->getActiveSheet()
    // ->getStyle('A')
    // ->getAlignment()
    // ->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
    // // 合并cell
    // $objPHPExcel->getActiveSheet()->mergeCells('A1:J1');
    $key = array_keys($data[0]);
    for ($i = 1; $i <= count($data); $i ++) {
        $m = 65;
        for ($j = 0; $j < count($nav); $j ++) {
            $st = chr($m);
            $objPHPExcel->getActiveSheet(0)->setCellValue($st . ($i + 1), $data[$i - 1][$key[$j]]);
            $m ++;
        }
        $objPHPExcel->getActiveSheet()
                ->getRowDimension($i)
                ->setRowHeight(22);
    }
    $objPHPExcel->getActiveSheet()->setTitle($sheetname);

    // Set active sheet index to the first sheet, so Excel opens this as the first sheet
    $objPHPExcel->setActiveSheetIndex(0);

    // excel头参数
    ob_end_clean();
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="MQ_' . $sheetname . date('YmdHis') . '.xls"'); // 日期为文件名后缀
    header('Cache-Control: max-age=0');

    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5'); // excel5为xls格式，excel2007为xlsx格式
    $objWriter->save('php://output');
}

//单文件文件下载
function download($files) {
    // // ob_start();
    // $file_path = iconv("utf-8", "GB2312//IGNORE",$files);  
    $file_path = $files;
    $buffer = 102400; //一次返回102400个字节  
    if (!file_exists($file_path)) {
        echo "<script type='text/javascript'> alert('对不起！该文件不存在或已被删除！'); </script>";

        return;
    }
    $fp = fopen($file_path, "r");
    $file_size = filesize($file_path);
    $file_data = '';
    while (!feof($fp)) {
        $file_data .= fread($fp, $buffer);
    }
    fclose($fp);

    //Begin writing headers  
    header("Pragma: public");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("Cache-Control: public");
    header("Content-Description: File Transfer");
    header("Content-type:application/octet-stream;");
    header("Accept-Ranges:bytes");
    header("Accept-Length:" . filesize($file_path));
    header("Content-Disposition:attachment; filename=" . iconv("utf-8", "GB2312//IGNORE", basename($file_path)));
    header("Content-Transfer-Encoding: binary");
    echo $file_data;
}

//按文件生成压缩包
function fzip($filename, $arr) {
    $zip = new \ZipArchive();
    if ($zip->open($filename, \ZIPARCHIVE::OVERWRITE) !== TRUE) {
        exit("cannot open <$filename>\n");
    }
    foreach ($arr as $val) {
        if (file_exists($val['url'])) {
            $zip->addFile($val['url'], iconv("utf-8", "GB2312//IGNORE", basename($val['url'])));
        } else {
            // echo "创建false";
        }
    }
    $zip->close();
}

//url转换
function urlch($url) {
    $url = urlencode($url);
    $a = array("%3A", "%2F", "%40");
    $b = array(":", "/", "@");
    return str_replace($a, $b, $url);
}

//删除所目录下有文件 
function deleteAll($path) {
    $op = dir($path);
    while (false != ($item = $op->read())) {
        if ($item == '.' || $item == '..') {
            continue;
        }
        if (is_dir($op->path . '/' . $item)) {
            deleteAll($op->path . '/' . $item);
            rmdir($op->path . '/' . $item);
        } else {
            unlink($op->path . '/' . $item);
        }
    }
}

//问题集导出到Execl
function quexport($nav, $data, $sheetname) {
    ini_set("memory_limit", "1024M"); // 不够继续加大
    set_time_limit(0);
    $row = count($nav);
    $asc = 65;
    $style = 'A1:' . chr($asc + $row - 1) . '1';
    $datastyle = 'A2:' . chr($asc + $row - 1) . (count($data) + 1);
    $allstyle = 'A1:' . chr($asc + $row - 1) . (count($data) + 1);
    import("Org.Util.PHPExcel");
    $objPHPExcel = new \PHPExcel();
    // 如果excel文件后缀名为.xls，导入这个类
    import("Org.Util.PHPExcel.Reader.Excel5");
    // 如果excel文件后缀名为.xlsx，导入这下类
    // import("Org.Util.PHPExcel.Reader.Excel2007");
    // $PHPReader=new \PHPExcel_Reader_Excel2007();
    for ($i = 0; $i < count($nav); $i ++) {
        $y = chr($asc) . "1";
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($y, $nav[$i]);
        $objPHPExcel->getActiveSheet()
                ->getColumnDimension(chr($asc))
                ->setAutoSize(true);
        $asc ++;
    }
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFill()
            ->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFill()
            ->getStartColor()
            ->setARGB('dae3da');
    // // set font size bold
    $objPHPExcel->getActiveSheet()
            ->getDefaultStyle()
            ->getFont()
            ->setSize(12);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFont()
            ->setBold(true);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getBorders()
            ->getAllBorders()
            ->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
    $key = array_keys($data[0]);
    for ($i = 1; $i <= count($data); $i ++) {
        $m = 65;
        for ($j = 0; $j < count($nav); $j ++) {
            $st = chr($m);
            //$encode = mb_detect_encoding($data[$i - 1][$key[$j]], array('GB2312','GBK','UTF-8','ASCII'));
            if (substr($sheetname, 0, 3) == 'Ton') {
                $data[$i - 1][$key[$j]] = iconv('gb2312', "utf-8", $data[$i - 1][$key[$j]]);
                //$data[$i - 1][$key[$j]] = iconv("utf-8","gbk",$data[$i - 1][$key[$j]]);
            }
            //$data[$i - 1][$key[$j]] = iconv("gb2312","utf-8",$data[$i - 1][$key[$j]]);
            $objPHPExcel->getActiveSheet(0)->setCellValue($st . ($i + 1), $data[$i - 1][$key[$j]]);
            $m ++;
        }
        if ($i > 1) {
            $objPHPExcel->getActiveSheet()
                    ->getRowDimension($i)
                    ->setRowHeight(52);
        }
    }
    //die();
    //$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(55);
    // $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
    // $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(12);
    $objPHPExcel->getActiveSheet()->getStyle($allstyle)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
    $objPHPExcel->getActiveSheet()->getStyle($allstyle)->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
    //换行
    // $objPHPExcel->getActiveSheet() ->getStyle('F2:F1000')->getAlignment()->setShrinkToFit(true);//字体变小以适应宽
    $objPHPExcel->getActiveSheet()->getStyle($datastyle)->getAlignment()->setWrapText(true); //自动换行   
    $objPHPExcel->getActiveSheet()->setTitle($sheetname);

    // Set active sheet index to the first sheet, so Excel opens this as the first sheet
    $objPHPExcel->setActiveSheetIndex(0);

    // excel头参数
    ob_end_clean();
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="' . $sheetname . date('YmdHis') . '.xls"'); // 日期为文件名后缀
    header('Cache-Control: max-age=0');

    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5'); // excel5为xls格式，excel2007为xlsx格式
    $objWriter->save('php://output');
}

//Was节点导出到Execl
function wasexport($nav, $data, $sheetname) {
    ini_set("memory_limit", "1024M"); // 不够继续加大
    set_time_limit(0);
    $row = count($nav);
    $asc = 65;
    $style = 'A1:' . chr($asc + $row - 1) . '1';
    import("Org.Util.PHPExcel");
    $objPHPExcel = new \PHPExcel();
    import("Org.Util.PHPExcel.Reader.Excel5");
    for ($i = 0; $i < count($nav); $i ++) {
        $y = chr($asc) . "1";
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($y, $nav[$i]);
        $objPHPExcel->getActiveSheet()
                ->getColumnDimension(chr($asc))
                ->setAutoSize(true);
        $asc ++;
    }
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFill()
            ->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFill()
            ->getStartColor()
            ->setARGB('dae3da');
    // // set font size bold
    $objPHPExcel->getActiveSheet()
            ->getDefaultStyle()
            ->getFont()
            ->setSize(12);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getFont()
            ->setBold(true);
    $objPHPExcel->getActiveSheet()
            ->getStyle($style)
            ->getBorders()
            ->getAllBorders()
            ->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
    $key = array_keys($data[0]);
    for ($i = 1; $i <= count($data); $i ++) {
        $m = 65;
        for ($j = 0; $j < count($nav); $j ++) {
            $st = chr($m);
            $objPHPExcel->getActiveSheet(0)->setCellValue($st . ($i + 1), $data[$i - 1][$key[$j]]);
            $m ++;
        }
        $objPHPExcel->getActiveSheet()
                ->getRowDimension($i)
                ->setRowHeight(22);
    }
    $objPHPExcel->getActiveSheet()->setTitle($sheetname);

    // Set active sheet index to the first sheet, so Excel opens this as the first sheet
    $objPHPExcel->setActiveSheetIndex(0);

    // excel头参数
    // ob_end_clean();
    // header('Content-Type: application/vnd.ms-excel');
    // header('Content-Disposition: attachment;filename="' . $sheetname . date('YmdHis') . '.xls"'); // 日期为文件名后缀
    // header('Cache-Control: max-age=0');

    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5'); // cel5为xls格式，excel2007为xlsx格式
    $pathurl = './Public/upload/temp/'.date("Y-m-d");
    shell_exec(" mkdir -pv $pathurl");
    $url = $pathurl.'/'.$sheetname . date('YmdHis') . '.xls';
    $objWriter->save($url);
    return $url;
    //$objWriter->save('php://output');
}

//GTP导出任务到Execl
function gtpoutexcel($nav, $data, $sheetname) {
    ini_set("memory_limit", "1024M"); // 不够继续加大
    set_time_limit(0);
    $row = count($nav);
    $asc = 65;
    $style = 'A1:' . chr($asc + $row - 1) . '1';
    import("Org.Util.PHPExcel");
    $objPHPExcel = new \PHPExcel();
    // 如果excel文件后缀名为.xls，导入这个类
    import("Org.Util.PHPExcel.Reader.Excel5");
    /* @实例化 */
    /* @实例化 */
    $obpe = new PHPExcel();
    /* 设置宽度 */

//创建一个新的工作空间(sheet) 

    $snum = 0;
    foreach ($data as $ks => $testa) {
        if ($snum > 0) {
            $obpe->createSheet();
        }
        $obpe->setactivesheetindex($snum);
        $ht = 65;
        for ($i = 0; $i < count($nav); $i ++) {
            $hy = chr($ht) . "1";
            $obpe->setActiveSheetIndex($snum)->setCellValue($hy, $nav[$i]);
            $obpe->getActiveSheet($snum)->getColumnDimension(chr($ht))->setAutoSize(true);
            $ht++;
        }
        $obpe->getActiveSheet($snum)->getStyle($style)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
        $obpe->getActiveSheet($snum)
                ->getStyle($style)
                ->getFill()
                ->getStartColor()
                ->setARGB('dae3da');
        // // set font size bold
        $obpe->getActiveSheet($snum)
                ->getDefaultStyle()
                ->getFont()
                ->setSize(12);
        $obpe->getActiveSheet($snum)
                ->getStyle($style)
                ->getFont()
                ->setBold(true);
        $obpe->getActiveSheet($snum)
                ->getStyle($style)
                ->getBorders()
                ->getAllBorders()
                ->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

        $key = array_keys($testa[0]);
        for ($i = 1; $i <= count($testa); $i ++) {
            if (!$testa[$i - 1])
                continue;
            $sf = 65;
            for ($j = 0; $j < count($testa[0]); $j ++) {
                $gt = chr($sf);
                $obpe->getActiveSheet()->setCellValue($gt . ($i + 1), $testa[$i - 1][$key[$j]]);
                $sf ++;
            }
            if ($i > 1) {
                $obpe->getActiveSheet()->getRowDimension($i)->setRowHeight(22);
            }
        }

        $datastyle = 'A2:' . chr($asc + $row - 1) . (count($testa) + 1);
        $allstyle = 'A1:' . chr($asc + $row - 1) . (count($testa) + 1);
        $obpe->getActiveSheet($snum)->getStyle($datastyle)->getAlignment()->setWrapText(true); //自动换行
        $obpe->getActiveSheet($snum)->getStyle($allstyle)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $obpe->getActiveSheet($snum)->getStyle($allstyle)->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $snum++;
        $obpe->getActiveSheet()->setTitle($ks);
    }
//写入内容  
    $obwrite = PHPExcel_IOFactory::createWriter($obpe, 'Excel5');
//ob_end_clean();  
    header('Pragma: public');
    header('Expires: 0');
    header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
    header('Content-Type:application/force-download');
    header('Content-Type:application/vnd.ms-execl');
    header('Content-Type:application/octet-stream');
    header('Content-Type:application/download');
    header('Content-Disposition:attachment;filename="' . $sheetname . date('YmdHis') . '.xls"');
    header('Content-Transfer-Encoding:binary');
    $obwrite->save('php://output');
}

//权限验证
function chpower($userid, $opt) {
    global $power;
    $dbuser = M("User");
    $useres = $dbuser->find($userid);
    $userpower = $useres['power_level'];
    if (!$useres) {
        return "10001";
        //echo json_encode(array('code'=>10001,'message'=>'请登录后再进行该项操作'));
        exit();
        die();
    }
    if (($userpower & $power[$opt]) == $power[$opt]) {
        return "ok";
    } else {
        return "no";
    }
}

//新验证权限
function checkpower($a, $p) {
    global $power;
    $userid = session('userid');
    $res = M()->table("class a,user_power b")->where(" a.action='$a' and a.classid=b.classid ")->find();
    $power_level = $res['power_level'];
    if (($power_level & $power[$p]) == $power[$p]) {
        return 1;
    } else {
        return 0;
    }
}

function utf8_strcut($str, $start, $length = null) {
    preg_match_all('/./us', $str, $match);
    $chars = is_null($length) ? array_slice($match[0], $start) : array_slice($match[0], $start, $length);
    unset($str);
    return implode('', $chars);
}

function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null) {
    $config = C('THINK_EMAIL');
    vendor('PHPMailer.class#phpmailer'); //从PHPMailer目录导class.phpmailer.php类文件
    vendor('SMTP');
    $mail = new PHPMailer(); //PHPMailer对象

    $mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码

    $mail->IsSMTP(); // 设定使用SMTP服务

    $mail->SMTPDebug = 0; // 关闭SMTP调试功能
// 1 = errors and messages
// 2 = messages only

    $mail->SMTPAuth = true; // 启用 SMTP 验证功能

    $mail->SMTPSecure = 'ssl'; // 使用安全协议

    $mail->Host = $config['SMTP_HOST']; // SMTP 服务器

    $mail->Port = $config['SMTP_PORT']; // SMTP服务器的端口号

    $mail->Username = $config['SMTP_USER']; // SMTP服务器用户名

    $mail->Password = $config['SMTP_PASS']; // SMTP服务器密码

    $mail->SetFrom($config['FROM_EMAIL'], $name);

    $replyEmail = $config['REPLY_EMAIL'] ? $config['REPLY_EMAIL'] : $config['FROM_EMAIL'];

    $replyName = $config['REPLY_NAME'] ? $config['REPLY_NAME'] : $config['FROM_NAME'];

    $mail->AddReplyTo($replyEmail, $replyName);

    $mail->Subject = $subject;

    $mail->AltBody = "text/html";

    $mail->MsgHTML($body);

    $mail->AddAddress($to, $name);

    if (is_array($attachment)) { // 添加附件
        foreach ($attachment as $file) {

            is_file($file) && $mail->AddAttachment($file);
        }
    }
    if ($mail->Send()) {
        $re = date('Y-m-d H:i:s') . "|ok|" . $to . "-主题：" . $subject . "<br>";
    } else {
        $re = date('Y-m-d H:i:s') . "|error|" . $mail->ErrorInfo . '|' . $to . '-主题：' . $subject . "<br>";
    }
    return $re;
    //return $mail->Send() ? "发送成功！" : $mail->ErrorInfo;
}

function think_send_mail163($to, $name, $subject = '', $body = '', $attachment = null) {
    $config = C('THINK_EMAIL2');
    vendor('PHPMailer.class#phpmailer'); //从PHPMailer目录导class.phpmailer.php类文件
    vendor('SMTP');
    $mail = new PHPMailer(); //PHPMailer对象 
    $mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码 
    $mail->IsSMTP(); // 设定使用SMTP服务 
    $mail->SMTPDebug = 0; // 关闭SMTP调试功能
// 1 = errors and messages
// 2 = messages only 
    $mail->SMTPAuth = true; // 启用 SMTP 验证功能 
    $mail->SMTPSecure = 'ssl'; // 使用安全协议 
    $mail->Host = $config['SMTP_HOST']; // SMTP 服务器 
    $mail->Port = $config['SMTP_PORT']; // SMTP服务器的端口号 
    $mail->Username = $config['SMTP_USER']; // SMTP服务器用户名 
    $mail->Password = $config['SMTP_PASS']; // SMTP服务器密码 
    $mail->SetFrom($config['FROM_EMAIL'], $name);
    $replyEmail = $config['REPLY_EMAIL'] ? $config['REPLY_EMAIL'] : $config['FROM_EMAIL'];
    $replyName = $config['REPLY_NAME'] ? $config['REPLY_NAME'] : $config['FROM_NAME'];
    $mail->AddReplyTo($replyEmail, $replyName);
    $mail->Subject = $subject;
    $mail->AltBody = "text/html";
    $mail->MsgHTML($body);
    $mail->AddAddress($to, $name);
    if (is_array($attachment)) { // 添加附件
        foreach ($attachment as $file) {
            is_file($file) && $mail->AddAttachment($file);
        }
    }
    if ($mail->Send()) {
        $re = date('Y-m-d H:i:s') . "|ok|主题：" . $subject;
    } else {
        $re = date('Y-m-d H:i:s') . "|error|" . $mail->ErrorInfo . '|主题：' . $subject;
    }
    return $re;
    //return $mail->Send() ? "发送成功！" : $mail->ErrorInfo;
}
