<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Photo-Hub Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel='stylesheet' type='text/css'/>
    <%--<link href='http://fonts.useso.com/css?family=Quicksand:300,400,700' rel='stylesheet' type='text/css'>--%>
    <%--<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/menu_jquery.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
<script type="text/javascript">
    function check(f) {//检测函数
        if (f.name.value == "") {//如果用户名为空
            alert("请输入用户名！");//弹出提示框
            f.name.focus();//文本框获取焦点
            return false;//返回错误
        }
        if (f.password.value == "") {
            alert("请输入密码！");
            f.password.focus();
            return false;
        }
        return true;
    }
</script>

<script type="text/javascript">
    function check_1(f) {//检测函数
        if (f.password.value == "") {//如果用户名为空
            alert("请输入新密码！");//弹出提示框
            f.password.focus();//文本框获取焦点
            return false;//返回错误
        }
        if (f.password_1.value == "") {
            alert("请再次输入新密码！");
            f.password_1.focus();
            return false;
        }
        if (f.password.value != f.password_1.value) {
            alert("请输入相同密码！");
            f.password_1.focus();
            return false;
        } else {
            return true;
        }
        return true;
    }
</script>
<div class="header">
    <div class="container">
        <div class="logo">
            <h1><a href="${pageContext.request.contextPath}/user/homeUI">Lazy TakeOUT</a></h1>
        </div>
        <div class="top_right">
            <ul>
                <c:choose>
                    <c:when test="${loginUser}!=null">
                        <li>${loginUser.name}</li>|
                        <li><a href="${pageContext.request.contextPath}/user/show/${loginUser.id}">查看个人资料</a></li>|
                        <li><a href="${pageContext.request.contextPath}/order/searchOrder/${loginUser.id}">查看我的订单</a></li>|
                        <li><a href="${pageContext.request.contextPath}/user/logout">登出</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/user/registerUI">注册</a></li>|
                        <li class="login">
                            <div id="loginContainer"><a href="#" id="loginButton"><span>登录</span></a>
                                <div id="loginBox">
                                    <form id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post" onsubmit="return check(this)">
                                        <fieldset id="body">
                                            <fieldset>
                                                <label>用户名</label>
                                                <input type="text" name="name" id="name">
                                            </fieldset>
                                            <fieldset>
                                                <label>密码</label>
                                                <input type="password" name="password" id="password">
                                            </fieldset>
                                            <input type="submit" id="login" value="登录">
                                            <label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住我</i></label>
                                        </fieldset>
                                        <span><a href="${pageContext.request.contextPath}/user/forgetUI">忘记密码?</a></span>
                                    </form>
                                </div>
                            </div>
                        </li>
                        <div  style="font-size:xx-small;float: right;color: red">${msg}</div>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="register">
    <div class="container">
        <form action="${pageContext.request.contextPath}/user/updatePassword" method="post" onsubmit="return check_1(this)">
            <div class="register-top-grid">
                <h1>填写新密码信息</h1>
                <input type="hidden" name="id" value="${loginUser.id}">
                <div>
                    <span>新密码<label>*</label></span>
                    <input type="password" name="password">
                </div>
                <div>
                    <span>再次填写新密码<label>*</label></span>
                    <input type="password" name="password_1">
                </div>
            </div>
            <input class="register-but" type="submit" value="提交">
        </form>

    </div>
</div>
</div>
<div class="grid_2">
    <div class="container">
        <div class="col-md-3 col_2">
            <h3>Stock Photo<br>Categories</h3>
        </div>
        <div class="col-md-9 col_5">
            <div class="col_1_of_5 span_1_of_5">
                <ul class="list1">
                    <li><a href="#">Abstract</a></li>
                    <li><a href="#">Animals/Wildlife</a></li>
                    <li><a href="#">The Arts</a></li>
                    <li><a href="#">Backgrounds/Textures</a></li>
                    <li><a href="#">Beauty/Fashion</a></li>
                    <li><a href="#">Buildings/Landmarks</a></li>
                </ul>
            </div>
            <div class="col_1_of_5 span_1_of_5">
                <ul class="list1">
                    <li><a href="#">Business/Finance</a></li>
                    <li><a href="#">Celebrities</a></li>
                    <li><a href="#">Editorial</a></li>
                    <li><a href="#">Education</a></li>
                    <li><a href="#">Food and Drink</a></li>
                    <li><a href="#">Healthcare/Medical</a></li>
                </ul>
            </div>
            <div class="col_1_of_5 span_1_of_5">
                <ul class="list1">
                    <li><a href="#">Holidays</a></li>
                    <li><a href="#">Illustrations/Clip-Art</a></li>
                    <li><a href="#">Industrial</a></li>
                    <li><a href="#">Interiors</a></li>
                    <li><a href="#">Miscellaneous</a></li>
                    <li><a href="#">Model Released Only</a></li>
                </ul>
            </div>
            <div class="col_1_of_5 span_1_of_5">
                <ul class="list1">
                    <li><a href="#">Nature</a></li>
                    <li><a href="#">Objects</a></li>
                    <li><a href="#">Parks/Outdoor</a></li>
                    <li><a href="#">People</a></li>
                    <li><a href="#">Religion</a></li>
                    <li><a href="#">Science</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="grid_3">
    <div class="container">
        <ul id="footer-links">
            <li><a href="#">Terms of Use</a></li>
            <li><a href="#">Royalty Free License</a></li>
            <li><a href="#">Extended License</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="support.html">Support</a></li>
            <li><a href="about.html">About Us</a></li>
            <li><a href="faq.html">FAQ</a></li>
            <li><a href="#">Categories</a></li>
        </ul>
        <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.777moban.com/">777模板</a>
        </p>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        setTimeout(function () {    //设时延迟0.5s执行
            $("#msg").empty();
        }, 5000)
    })
</script>
</body>
</html>