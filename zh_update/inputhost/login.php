<?php
error_reporting( E_ALL&~E_NOTICE );
session_start();
if ($_SESSION['username']&&$_SESSION["act"] == "inputhost") {
    if (!$_GET["action"]){ 
    require_once 'add.php';
    exit();
    }
} 
header("content-Type: text/html; charset=utf-8");
require_once 'config.php'; 
if ($_POST) {
    if ($_GET["action"] == "changepwd" && $_GET["action"]) {
        $oldp = $_POST["oldpassword"];
        if ($userlist[$_SESSION["username"]] && $userlist[$_SESSION["username"]] == $oldp) {
            echo "10000";
        } else {
            echo "100001";
        }
    } elseif ($_GET["action"] == "docpwd" && $_GET["action"]) {
        $oldp = $_POST["oldpassword"];
        $new2 = $_POST["newpassword2"];
        if ($userlist[$_SESSION["username"]] && $userlist[$_SESSION["username"]] == $oldp) {
            $cont = "<?php"."\r\n";
            $cont .="\$userlist=array("."\r\n";
            foreach ($userlist as $k=>$v){
                if($k==$_SESSION["username"]) {  
                    $cont .="    '".$_SESSION["username"]."'=>'".$new2."'"."\r\n";
                }else{
                $cont .="    '".$k."'=>'".$v."',"."\r\n";
                }
            }            
            $cont .=");";
            $userlist[$_SESSION["username"]] =$new2;
            $handle = fopen("config.php", "w") or die("10001");  
            if(fwrite($handle, $cont)){
                echo "10000";
            }
            fclose($handle);
        } else {
            echo "100001";
        }
    } else {
        $user = $_POST['username'];
        $password = $_POST['password'];
        if ($userlist[$user] && $userlist[$user] == $password) {
            $_SESSION["username"] = $user;
            $_SESSION["act"] = "inputhost";
            echo "10000";
        } else {
            echo "用户名或密码错误";
        }
    }
}