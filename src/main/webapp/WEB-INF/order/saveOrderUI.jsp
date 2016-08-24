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
</head>
<body>

<script type="text/javascript">
    $(document).ready(function () {
        var tbody = "";
        var num_price = 0;
        var num_gname = "";
        var bid= 0;
        $.ajax({
            url: "${pageContext.request.contextPath}/goods/searchByUId/${loginUser.id}",
            type: 'GET',
            cache: false,
            dataType: 'json',
            async: 'false',
            success: function (data) {
                $.each(data, function (n, value) {
                    var count = 0;
                    var trs = "";
                    if (count % 6 != 0) {
                        trs += " <li><a href='${pageContext.request.contextPath}/goods/addID/" + value.gid + " '> " +
                                value.gname + " ￥" + value.price +
                                "</a></li>";
                    } else {
                        trs += " <li class='last'><a href='${pageContext.request.contextPath}/goods/addID/" + value.gid + " '> " +
                                value.gname + " ￥" + value.price +
                                "</a></li>";
                    }
                    tbody += trs;
                    num_price += value.price;
                    num_gname += value.gname+" ";
                    bid = value.business.bid;
                });
                $("#project").append(tbody);
                $("#num_price_div").append(num_price);
                $("#num_price").val(num_price);
                $("#num_gname").val(num_gname);
                $("#bid").val(bid);
            },
            error: function () {
                alert("error");
            }
        });
    });
</script>

<div class="header">
    <div class="container">
        <div class="logo">
            <h1><a href="${pageContext.request.contextPath}/user/homeUI">Lazy TakeOUT</a></h1>
        </div>
        <div class="top_right">
            <ul>
                <li>${loginUser.name}</li>
                |
                <li><a href="${pageContext.request.contextPath}/user/show/${loginUser.id}">查看个人资料</a></li>
                |
                <li><a href="${pageContext.request.contextPath}/order/searchOrderUI">查看订单状态</a></li>|
                <li><a href="${pageContext.request.contextPath}/user/logout">登出</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="single">
    <div class="container">
        <div class="single_box1">
            <div class="col-sm-7 col_6">
                <ul class="size">
                    <h1><div style="color: #6ce26c">请核对订单信息</div></h1>
                </ul>
                <p class="movie_option"><strong>
                    <div id="addIDMsg" style="color: #bf800c">${addIDMsg}</div>
                </strong></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="tags">
            <h4 class="tag_head">购物车</h4>

            <ul class="tags_images" id="project">
                <div class="clearfix"></div>
            </ul>
            <div style="float: right" id="num_price_div">总价：￥</div>
            <form action="${pageContext.request.contextPath}/order/saveOrder/${loginUser.id}" method="post">
                <input type="hidden" name="price" id="num_price" />
                <input type="hidden" name="gname" id="num_gname" />
                <input type="hidden" name="bid" id="bid"/>
                <input style="float: right" class="btn_3" type="submit" value="  下单  "/>
            </form>
            </div>
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