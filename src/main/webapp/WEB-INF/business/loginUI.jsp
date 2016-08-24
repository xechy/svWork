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
<!--检验是否存在相同的用户v名-->
<script type="text/javascript">
//    $(document).ready(function () {

        function checkName () {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/business/checkName/" + $("#txtName").val(),

                beforeSend: function (XMLHttpRequest) {
                    $("#showResult").text("正在查询");
                    $("#showResult").css("color", "blue");
                    //Pause(this,100000);
                },
                success: function (msg) {
                    if (msg == "") {
                        $("#showResult").html("用户名可用");
                        $("#showResult").css("color", "green");
                    } else {
                        $("#showResult").html(msg);
                        $("#showResult").css("color", "red");
                    }
                },
                complete: function (XMLHttpRequest, textStatus) {
                    //隐藏正在查询图片
                },
                error: function () {
                    //错误处理
                }
            });
        }
//        })
//    });
</script>
<!--检验是否存在相同的商铺名-->
<script type="text/javascript">
        function checkStroeName() {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/business/checkStoreName/" + $("#txtStoreName").val(),

                beforeSend: function (XMLHttpRequest) {
                    $("#showResult_1").text("正在查询");
                    $("#showResult_1").css("color", "blue");
                    //Pause(this,100000);
                },
                success: function (msg) {
                    if (msg == "") {
                        $("#showResult_1").html("商铺名可用");
                        $("#showResult_1").css("color", "green");
                    } else {
                        $("#showResult_1").html(msg);
                        $("#showResult_1").css("color", "red");
                    }
                },
                complete: function (XMLHttpRequest, textStatus) {
                    //隐藏正在查询图片
                },
                error: function () {
                    //错误处理
                }
            });
        }

</script>
<!--检验是否没有输入-->
<script type="text/javascript">
    function check(f) {//检测函数
        if (f.bname.value == "") {//如果用户名为空
            alert("请输入用户名！");//弹出提示框
            f.bname.focus();//文本框获取焦点
            return false;//返回错误
        }
        if (f.storeName.value == "") {
            alert("请输入商铺名！");
            f.storeName.focus();
            return false;
        }
        if (f.baddress.value == "") {
            alert("请输入地址！");
            f.baddress.focus();
            return false;
        }
        if (f.bphone.value == "") {
            alert("请输入电话号码！");
            f.bphone.focus();
            return false;
        }
        if (f.bmail.value == "") {
            alert("请输入邮箱！");
            f.bmail.focus();
            return false;
        }
    }
</script>

<script type="text/javascript">
    function check_1(f) {//检测函数
        if (f.bname.value == "") {//如果用户名为空
            alert("请输入用户名！");//弹出提示框
            f.bname.focus();//文本框获取焦点
            return false;//返回错误
        }
        if (f.bpassword.value == "") {
            alert("请输入密码！");
            f.bpassword.focus();
            return false;
        }
    }
</script>


<div class="form">
    <div id="landing">登录</div>
    <div id="registered">注册</div>
    <div class="fix"></div>
    <div id="landing-content">
        <div id="photo"><img src="${pageContext.request.contextPath}/img/photo.jpg"/>
        </div>
        <form onsubmit="return check_1(this)" action="${pageContext.request.contextPath}/business/login" method="post">
            <div style="font-size:xx-small;float: right;color: red">${result}</div>
            <div class="inp"><input type="text" placeholder="用户名" name="bname"/></div>
            <div class="inp"><input type="password" placeholder="密码" name="bpassword"/></div>
            <input class="login" type="submit" value="登录"/>
        </form>
        <div id="bottom"><a id="forgotpassword" href="${pageContext.request.contextPath}/business/forgetPasswordUI">忘记密码</a>
        </div>
    </div>
    <div id="registered-content">
        <form name="regfrom" action="${pageContext.request.contextPath}/business/saveBusiness" method="post"
              enctype="multipart/form-data" onsubmit="return check(this)">
            <div id="showResult" style="font-size:xx-small;float: right"></div>
            <div class="inp"><input id="txtName" type="text" placeholder="请输入用户名" name="bname" onblur="checkName()"/></div>
            <div id="showResult_1" style="font-size:xx-small;float: right"></div>
            <div class="inp"><input id="txtStoreName" type="text" placeholder="请输入商铺名" name="storeName" onblur="checkStroeName()"/></div>
            <div class="inp"><input type="file" name="bPicture_1" placeholder="选择图片"></div>
            <div class="inp"><input type="text" placeholder="请输入地址" name="baddress"/></div>
            <div class="inp"><input type="text" placeholder="请输入手机号码" name="bphone"/></div>
            <div class="inp"><input type="text" placeholder="请输入电子邮箱" name="bmail"/></div>
            <input class="login" type="submit" value="立即注册"/>
        </form>
    </div>
</div>


</body>

</html>