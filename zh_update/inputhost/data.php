<?php
error_reporting(E_ALL & ~E_NOTICE);
$locationarr[2] = "西三旗";
$locationarr[3] = "亦庄中金";
$locationarr[7] = "东单 ";
$osarr[1] = "AIX";
$osarr[2] = "Solaris";
$osarr[4] = "Windows";
$osarr[8] = "Linux";
$apparr[1] = "MQ";
$apparr[2] = "WAS";
$apparr[4] = "Oracle";
$apparr[8] = "TongEASY";
$apparr[16] = "Informix";
$apparr[32] = "CV";
$apparr[64] = "GTP";
$allnum = count($_POST['nodename']);
$sharedata ="";
if($_POST){
   for ($i_a = 0; $i_a < $allnum; $i_a++) {
        $keyid_a = $keyid_a + 1;
        if ($_POST['applist'][$i_a]) {
            $appid = 0;
            $apptrue = "";
            $p = "";
            foreach ($_POST['applist'][$i_a] as $k => $v) { 
                $apptrue .=$p . $apparr[$v];
                $p = ",";
            }
        } else {
            $appid = "";
        }  
        $html .= "<table width='525' height='240' id='formtable'> 
            <tr>
                                    <th colspan='5'>主机".($i_a+1)."</th> 
                                </tr>
                                <tr>
                                    <th align='right'>系统名称：</th>
                                    <td colspan='4'>". $_POST['nodename'][$i_a] ."</td>
                                </tr>                            
                                <tr>
                                    <th width='90'  align='right'>主机名：</th>
                                    <td colspan='4'>" . $_POST['hostname'][$i_a] . "</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th align='right'>所在地：</th>
                                    <td colspan='4'>" . $locationarr[$_POST['location_id'][$i_a]] . "</td>

                                </tr>
                                <tr>
                                    <th align='right'>操作系统：</th>
                                    <td colspan='4'>" . $osarr[$_POST['os_type'][$i_a]] . "</td>

                                </tr>
                                <tr>
                                    <th align='right'>应用类型：</th>
                                    <td colspan='4'>" . $apptrue."</td>

                                </tr>
                                <tr>
                                    <th align='right'>服务ID：</th>
                                    <td colspan='4'> " . $_POST['server_id'][$i_a] . "</td>

                                </tr>
                            </table> "; 
        $html .="<hr>";
   }
   echo $html;
}