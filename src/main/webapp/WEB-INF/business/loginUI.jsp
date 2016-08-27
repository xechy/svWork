<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<title>
    用户登录
</title>
<head>
    <meta charset="UTF-8"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.min.js " type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger.js " type="text/javascript"></script>
    <script>
        $(document).ready(function () {

            $(".form").slideDown(500);

            $("#landing").addClass("border-btn");

            $("#registered").click(function () {
                $("#landing").removeClass("border-btn");
                $("#landing-content").hide(500);
                $(this).addClass("border-btn");
                $("#registered-content").show(500);

            })

            $("#landing").click(function () {
                $("#registered").removeClass("border-btn");
                $(this).addClass("border-btn");

                $("#landing-content").show(500);
                $("#registered-content").hide(500);
            })
        });
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            /*font-family: "微软雅黑";*/
        }

        body {
            background: #F7F7F7;
        }

        .form {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -185px;
            margin-top: -210px;
            height: 420px;
            width: 340px;
            font-size: 18px;
            -webkit-box-shadow: 0px 0px 10px #A6A6A6;
            background: #fff;
        }

        .border-btn {
            border-bottom: 1px solid #ccc;
        }

        #landing,
        #registered {
            float: left;
            text-align: center;
            width: 170px;
            padding: 15px 0;
            color: #545454;
        }

        #landing-content {
            clear: both;
        }

        .inp {
            height: 30px;
            margin: 0 auto;
            margin-bottom: 30px;
            width: 200px;
        }

        .inp > input {
            text-align: center;
            height: 30px;
            width: 200px;
            margin: 0 auto;
            transition: all 0.3s ease-in-out;
        }

        .login {
            border: 1px solid #A6A6A6;
            color: #a6a6a6;
            height: 30px;
            width: 202px;
            text-align: center;
            font-size: 13.333333px;
            margin-left: 70px;
            line-height: 30px;
            margin-top: 30px;
            transition: all 0.3s ease-in-out;
        }

        .login:hover {
            background: #A6A6A6;
            color: #fff;
        }

        #bottom {
            margin-top: 30px;
            font-size: 13.333333px;
            color: #a6a6a6;
        }

        #registeredtxt {
            float: left;
            margin-left: 80px;
        }

        #forgotpassword {
            float: right;
            margin-right: 80px;
        }

        #photo {
            border-radius: 80px;
            border: 1px solid #ccc;
            height: 80px;
            width: 80px;
            margin: 0 auto;
            overflow: hidden;
            clear: both;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        #photo > img:hover {
            -webkit-transform: rotateZ(360deg);
            -moz-transform: rotateZ(360deg);
            -o-transform: rotateZ(360deg);
            -ms-transform: rotateZ(360deg);
            transform: rotateZ(360deg);
        }

        #photo > img {
            height: 80px;
            width: 80px;
            -webkit-background-size: 220px 220px;
            border-radius: 60px;
            -webkit-transition: -webkit-transform 1s linear;
            -moz-transition: -moz-transform 1s linear;
            -o-transition: -o-transform 1s linear;
            -ms-transition: -ms-transform 1s linear;
        }

        #registered-content {
            margin-top: 40px;
            display: none;
        }

        .fix {
            clear: both;
        }

        .form {
            display: none;
        }
    </style>
</head>

<body>
<%@include file="checkB.jsp"%>
<div class="form">
    <div id="landing">登录</div>
    <div id="registered">注册</div>
    <div class="fix"></div>
    <div id="landing-content">
        <div id="photo"><img src="${pageContext.request.contextPath}/img/photo.jpg"/>
        </div>
        <form onsubmit="return check_1(this)" action="${pageContext.request.contextPath}/business/login" method="post">
            <div class="inp"><input type="text" placeholder="用户名" name="bname"/></div>
            <div class="inp"><input type="password" placeholder="密码" name="bpassword"/></div>
            <div class="inp"> <div style="float: right;color: orange">${result}</div><input class="login" type="submit" value="登录"/></div>
        </form>
        <div id="bottom" class="inp"><a id="forgotpassword" href="${pageContext.request.contextPath}/business/forgetPasswordUI">忘记密码</a>
        </div>
    </div>
    <div id="registered-content">
        <form name="regfrom" action="${pageContext.request.contextPath}/business/saveBusiness" method="post"
              enctype="multipart/form-data" id="registerForm">
            <div class="inp"><input id="bname" type="text" placeholder="请输入用户名" name="bname"/></div>
            <div class="inp"><input id="storeName" type="text" placeholder="请输入商铺名" name="storeName"/></div>
            <div class="inp"><input id="bPicture_1" type="file" name="bPicture_1" placeholder="选择图片"></div>
            <div class="inp"><input id="baddress" type="text" placeholder="请输入地址" name="baddress"/></div>
            <div class="inp"><input id="bphone" type="text" placeholder="请输入手机号码" name="bphone"/></div>
            <div class="inp"><input id="bmail" type="text" placeholder="请输入电子邮箱" name="bmail"/></div>
            <input class="login" type="submit" value="立即注册"/>
        </form>
    </div>
</div>


</body>

</html>