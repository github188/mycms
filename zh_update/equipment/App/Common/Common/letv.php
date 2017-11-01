<?php 
class LeshiController {
    public $userid = '811658';//用户id
    public $secret = '7d5f69f32fe375df8dc0e7d0c6112774';//私钥
    public $user_unique = 'dvxd5xoakn';//用户唯一标识码，由乐视网统一分配并提供 UUID
    public $zhibo_apiurl = 'http://api.open.letvcloud.com/live/execute';//直播接口地址
    public $dianbo_apiurl = 'http://api.letvcloud.com/open.php';//点播接口地址
    public $zhibo_ver = '3.0';//直播协议版本
    public $dianbo_ver = '2.0';//点播协议版本
      
    public function __construct(){
  
    }
      
  
      
    /*
     * 直播api
     * $api_name string 直播接口名
     * $param array 直播参数
     */
    public function zhibo($api_name,$param=''){
        $param['method'] = $api_name;
        return $this->_sendZhiboApi($param);//请求接口
    }
      
    /*
     * 点播api
     * $api_name string 点播接口名
     * $param array 点播参数
     */
    public function dianbo($api_name,$param=''){
        $param['api'] = $api_name;
        return $this->_sendDianboApi($param);//请求接口
    }
      
      
    //发送直播api请求
    protected function _sendZhiboApi($param){
        $param['ver'] = $this->zhibo_ver;//直播版本号
        $param['userid'] = $this->userid;//用户数字id
        $param['timestamp'] = time()*1000;//时间戳 毫秒
        $param['sign'] = $this->_getSign($param);//获取签名
        $json = $this->_curlPost($this->zhibo_apiurl,$param);
        return json_decode($json,true);
    }
      
    //发送点播api请求
    protected function _sendDianboApi($param){
        $param['ver'] = $this->dianbo_ver;//协议版本号，统一取值为2.0
        $param['user_unique'] = $this->user_unique;//用户唯一标识码，由乐视网统一分配并提供
        $param['timestamp'] = time()*1000;//当前Unix时间戳
        $param['format'] = 'json';//返回参数格式：支持json和xml两种方式
        $param['sign'] = $this->_getSign($param);//获取签名
        $json = $this->_curlPost($this->dianbo_apiurl,$param);
        $res = json_decode($json,true); 
        if($res['code'] == 0){
            return isset($res['data']) ? $res['data'] : true;
        }
        return false;
    }
      
      
      
    //作用：生成签名
    protected function _getSign($param){
        //签名步骤一：按字典序排序参数
        ksort($param);
        $String = $this->_formatBizQueryParaMap($param);//拼接数组
        //签名步骤二：在string后加入KEY
        $String = $String.$this->secret;
        //签名步骤三：MD5加密
        $String = md5($String);
        return $String;
    }
      
    //拼接数组
    protected function _formatBizQueryParaMap($paraMap, $urlencode){
        $buff = "";
        ksort($paraMap);
        foreach ($paraMap as $k => $v){
            if($urlencode){
                $v = urlencode($v);
            }
            $buff .= $k . $v;
        } 
        return $buff;
    }
      
    //发送curl 请求
    public function _curlPost($url,$data){
        $ch = curl_init();
        $header = "Accept-Charset: utf-8";  
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $tmpInfo = curl_exec($ch);
        curl_close($ch);
          
        return $tmpInfo;
    }
      
}