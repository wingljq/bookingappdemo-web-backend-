<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
</head>

<link rel="stylesheet" type="text/css" href="/beautyappdemo/Public/js/layer.css" />

<script src="/beautyappdemo/Public/js/jquery.min.js"></script>
<script src="/beautyappdemo/Public/js/layer.js"></script>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    body {
        background: #f0f0f0;
        font-family: Helvetica Neue;
        color: #5AABBC;
        font-style: normal;
        font-weight: lighter;
        padding: 0;
    }

    .boxTitle {
        font-size: 24px;
        margin: 20px 0 30px;
    }

    .loginBox {
        width: 540px;
        height: 250px;
        background-color: #ffffff;
        text-align: center;
        border-radius: 20px;
        filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
        margin: 0 auto;
        position: relative;
        top: 50%;
        transform: translateY(30%);
        padding: 15px 0 70px;
    }

    .inputName {
        font-size: 18px;
        margin: 0 0 3px;
    }

    .inputStyle {
        outline: none;
        background: #e0e1e5;
        border: none;
        width: 300px;
        padding: 7px 20px;
        border-radius: 18px;
        margin-bottom: 20px;
    }

    .loginBtn {
        width: 90px;
        padding: 10px 20px;
        border-radius: 33px;
        font-size: 20px;
        background-color: #5AABBC;
        color: #ffffff;
        text-align: center;
        margin: 5px auto 0;
    }

    .forgetPwd {
        font-size: 16px;
        float: right;
        margin-right: 10px;
        margin-top: -20px;
        color: rgba(167, 172, 195, 1);
    }
</style>

<body style="height: 100%;">

    <div class="loginBox" style="height: auto;">
        <form id="form" method="POST">
            <div>
                <!-- <img src="/beautyappdemo/Public/image/favicon.ico"> -->
                <h1>Backend</h1>
            </div>
            <br />

            <div>
                <p class="inputName" style="">Account</p>
                <p><input type="text" class="inputStyle" name="userName" style="" /></p>
            </div>

            <div>
                <p class="inputName" style="">Password</p>
                <p><input type="password" class="inputStyle" name="password" style="" /></p>
            </div>

            <!-- <div>
				<p  class="inputName" style="" >Verification code</p>
				<p><input type="text" class="inputStyle"  name="vcode"  style="" /></p>
			</div> -->

            <div class="text-center">
                <div id="login" type="submit" class="loginBtn">Login</div>
            </div>

            <!-- 				<div class="forgetPwd">Forget password</div>
 -->
        </form>

    </div>

</body>

</html>

<script>
    $('#login').click(function () {
        var email = $('input[name=userName]').val();
        var password = $('input[name=password]').val();



        if (!email) {
            layer.msg('請輸入有效的賬戶');
            return false;
        }
        if (!password) {
            layer.msg('請輸入有效的密碼');
            return false;
        }


        $.ajax({
            url: "<?php echo U('login/loginData');?>",
            type: "post",
            dataType: "json",
            data: new FormData($('#form')[0]),
            processData: false,
            contentType: false,
            success: function (res) {

                if (res.code == 0) {
                    location.href = "<?php echo U('index/index');?>"
                }
                layer.msg(res.msg);
            }
        })
    });
</script>