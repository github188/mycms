<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>My Cloud Web System</title>
    </head>
    <body style="margin-top:15%;">
        <?php
        if (empty($_POST['user'])) {
            ?>
            <div align="center">
                <p style="font-size:20px;"><strong>此路是我开，此树是我栽</strong></p>
                <form action="<?php $PHP_SELF ?>" method=POST >
                    <p>用户：<input name="user" type="text" id="user"></p>
                    <p>密码：<input name="pwd" type="password" id="pwd"></p>
                    <p><input type="submit" name="Submit" text="提交"> <input type="reset"></p>
                </form>
            </div>
            <?php
        } else {
            $user = $_POST['user'];
            $pwd = $_POST['pwd'];
            if ($user == "admin" && $pwd == "admin") {
                echo "success";
                session_start();
                $_SESSION['user'] = $user;
                header('Location:index.php');
            }
        }
        ?>
    </body>
</html>