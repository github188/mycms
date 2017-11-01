<?php
namespace Home\Controller;
use Think\Controller;
class CheckfileController extends Controller{
    function index(){
        $this->flushList();
        $this->display();
    }
    function doCheck(){
        if($_POST){
            $strtime = trim($_POST['strtime']);
            $endtime = trim($_POST['endtime']);
            $rootpath = 'F:/gtp_file_check/';
            $filename = date("YmdHis");
            $cfile = $rootpath.$filename;
            $content = $strtime." ".$endtime;
            if(!$content||$content==' '){
                echo json_encode(array('msg'=>"参数错误！"));
                exit;
            }
            $fopen = fopen($cfile,"w");
            fwrite($fopen,$content);
            fclose($fopen);
            $data['strtime']=$strtime;
            $data['endtime']=$endtime;
            $data['filename']=$filename;
            $db=M('check_file_result');
            $is_exit = $db->where($data)->find();
            if(!$is_exit){
                $data['indate']=date("Y-m-d H:i:s");
                $data['status']='N';
                $db->add($data); 
                $this->checkingToTemp();
            }
            echo json_encode(array('code'=>'10000','msg'=>"正在查询，请稍后！"));
        }else{
            echo json_encode(array('msg'=>"参数错误！"));
        }
    }
    /*  
    flushList 首页列表函数
    */
    function flushList(){
        $db=M('check_file_result');
        $data['pagesize']=15; 
        $res = $db->limit(0,$data['pagesize'])->order("indate desc")->select();
        $data['total']=$db->count();
        $data['page'] =  ceil($data['total']/$data['pagesize']); 
        if($data['page']<=1){
            $data['disabled']='disabled';
        }else{
            $data['disabled']='';
        }  
        // dump($res);exit;
        $power['delete'] = 'ok';
        $power['edit'] = 'ok';
        $this->assign("powers",$power);
        $this->assign('pages', $data);
        $this->assign('infolist', $res);
    }
    /*  
    pageFlush 翻页函数
    */
    function pageFlush(){
        $this->searchResult();
        if($_GET['pagesize']){
            $pagesize = trim($_GET['pagesize']);
            if($_GET['keywords']&&$_GET['key']){
                $key = trim($_GET['key']);
                $keywords = str_replace("*","%",trim($_GET['keywords']));
                $keywords = trim($keywords,"%");
                $where = "$key like '%$keywords%'";
            }else{
                 $where = '1';
            }
            
            $db=M('check_file_result'); 
            if($_GET['page']){
                $start = ($_GET['page']-1)*$pagesize;
                $end = $pagesize;
                $nowpage = $_GET['page'];
            }else{
                $start = 0;
                $end = $pagesize;
                $nowpage = 1;
            } 
            $res = $db->where($where)->limit($start,$end)->order("indate desc")->select();
            $total = $db->where($where)->count();
            if($res){
                $srs['total'] = $total;
                $srs['maxpage'] = ceil($total/$pagesize);
                $srs['pages'] = $nowpage;
                $srs['pagesize'] = $pagesize;
                $srs['data']=$res;
                echo json_encode(array('code' => 10000, 'message' => '成功','result'=>$srs));
            }else{
                echo json_encode(array('code' => 10001, 'message' => '搜索信息不存在'));
            }
           
        }else{
             echo json_encode(array("code"=>10002,'message' => '参数错误'));
        } 
    }
    /*  
    checking 获取正在查询的文件名
    */
    function checkingToTemp(){
        $db=M("check_file_result");
        $res = $db->where("status!='Y'")->select(); 
        $content = $p='';
        foreach($res as $v){
            $content .=$p.$v['filename'];
            $p="\n";
        }
        $temp = "F:/gtp_file_check_result/checking_filename_temp.txt";
        $old_temp = glob("F:/gtp_file_check_result/checking_filename*");
        foreach($old_temp as $val){
            unlink($val);
        }
        $fopen = fopen($temp,"w");
        fwrite($fopen,$content);
        fclose($fopen);
    }
    /*  
    searchResult 查看结果文件是否返回
    */
    function searchResult(){
        $temp = "F:/gtp_file_check_result/checking_filename_temp.txt";
        $arrfile = explode("\n",file_get_contents($temp));
        foreach($arrfile as $filename){ 
            if(!$filename){
                continue;
            }
            $allf = "F:/gtp_file_check_result/".$filename.".chkrult*";
            $chkfinish = "F:/gtp_file_check_result/".$filename.".chkfinish*";
            $file = glob($allf)?glob($allf):glob($chkfinish);
            if($file){ 
                $db = M("check_file_result");
                $data['status']='Y'; 
                $up = $db->where("filename='$filename'")->save($data); 
            }
        }
    } 
    function scanResult(){
        if($_GET['filename']){
            $db = M("check_file_result");
            $filename = $_GET['filename'];
            $allf = "F:/gtp_file_check_result/".$filename.".chkrult*";
            $chkfinish = "F:/gtp_file_check_result/".$filename.".chkfinish*";
            $file = glob($allf)?glob($allf):glob($chkfinish);
            if($file){
                $result = $file[0];
                $content = explode("\n",file_get_contents($result));
                $show ='';
                foreach($content as $v){
                    $show .= $v."<br>";
                }  
                $data['status']='Y';
                $data['result']=$show;
                $up = $db->where("filename='$filename'")->save($data);
            echo json_encode(array("code"=>10000,'file'=>$file,'a'=>$allf,'msg'=>$show));
            }else{
                $is_ok = $db->where("filename='$filename'")->find();
                if($is_ok['status']=='Y'){
                    echo json_encode(array('code'=>10001,'a'=>$allf,'msg'=>"正在查询......"));
                }else{
                    echo json_encode(array('file'=>$file,'a'=>$allf,'msg'=>"正在查询......"));
                } 
            }
        }else{
            echo json_encode(array('msg'=>"参数错误！"));
        }
    }
    /*
     deleteHistoryLog 删除历史记录
    */
    function deleteHistoryLog(){
        if(trim($_GET['filename'])){
            $db = M("check_file_result"); 
            $filename = trim($_GET['filename']); 
            $delete = $db->where("filename='$filename'")->delete();
            if($delete){
                echo json_encode(array("code"=>10000,'msg'=>'删除成功！')); 
            }else{
                echo json_encode(array("code"=>10001,'msg'=>'数据库繁忙，请稍后重试！')); 
            } 
        }else{
            echo json_encode(array('msg'=>"参数错误！"));
        }
    }
    function cTable(){
        $db = M();
        $sql = "
         create table  if not exits check_file_result (
             id int(11) ,
             strtime datetime,
             endtime datetime,
             result text
         )
        ";
        //$db->query("drop  check_file_result");
       // $db->query($sql);
        dump($db->query("show full columns check_file_result"));
    }
}