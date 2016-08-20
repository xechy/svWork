<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href='http://fonts.useso.com/css?family=Quicksand:300,400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });
        });
    </script>
    <script src="js/menu_jquery.js"></script>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>

<script type="text/javascript">
    $(document).ready(function () {
        var tbody = "";
        $.ajax({
            url: "${pageContext.request.contextPath}/goods/searchGoods/${bid}",
            type: 'GET',
            cache: false,
            dataType: 'json',
            async: 'false',
            success: function (data) {
                $.each(data, function (n, value) {
                    var count = 0;
                    var trs = "";
                    if (count % 6 != 0) {
                        trs += " <li><a href='${pageContext.request.contextPath}/order/searchGoodsUI/" + value.gid + " '> " +
                                "<img src='${pageContext.request.contextPath}/resources/file/goods/" + value.picture + "' class='img-responsive'  alt=''/>" +
                                "<div class='tab_desc'>" +
                                "<p>" + value.gname + "</p>" +
                                "<h4>"+ value.gdescribe +
                                "</h4></div></a></li>";
                    } else {
                        trs += " <li class='last'><li><a href='${pageContext.request.contextPath}/order/searchGoodsUI/" + value.gid + " '> " +
                                "<img src='${pageContext.request.contextPath}/resources/file/goods/" + value.picture + "' class='img-responsive'  alt=''/>" +
                                "<div class='tab_desc'>" +
                                "<p>" + value.gname + "</p>" +
                                "<h4>"+ value.gdescribe +
                                "</h4></div></a></li>";
                    }
                    tbody += trs;
                });
                $("#project").append(tbody);
            },
            error: function () {
                alert("error");
            }
        });
    });
</script>
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
<div class="header">
    <div class="container">
        <div class="logo">
            <h1><a href="${pageContext.request.contextPath}/user/homeUI">Lazy TakeOUT</a></h1>
        </div>
        <div class="top_right">
            <ul>
                <c:choose>
                    <c:when test="${loginUser!=null}">
                        <li>${loginUser.name}</li>|
                        <li><a href="${pageContext.request.contextPath}/user/show/${loginUser.id}">查看个人资料</a></li>|
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
                                            <div  style="font-size:xx-small;float: right;color: red">${msg}</div>
                                            <input type="submit" id="login" value="登录">
                                            <label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住我</i></label>
                                        </fieldset>
                                        <span><a href="${pageContext.request.contextPath}/user/forgetUI">忘记密码?</a></span>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="col-md-10 sap_tabs">
    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
        <ul class="resp-tabs-list">
            <li class="resp-tab-item" aria-controls="tab_item-0" role="tab">
                <a href="${pageContext.request.contextPath}/user/homeUI">
                    <span>更改收货地址</span></a></li>
            <div class="clearfix"></div>
        </ul>
        <div class="resp-tabs-container">
            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                <ul class="tab_img" id="project">
                </ul>
            </div>
            <div class="clearfix"></div>
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
</body>
</html>