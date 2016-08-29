<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/11
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forms</title>

    <link href="${pageContext.request.contextPath}/resources/admin_css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/datepicker3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/resources/admin_js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="row">
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">Admin Log in<div style="float: right;color: orange">${result}</div></div>
            <div class="panel-body">
                <form role="form" name="regfrom" action="${pageContext.request.contextPath}/admin/login" method="post">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="Name" name="aname" type="text">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="apassword" type="password">
                        </div>
                        <div style="float: right">
                            <input type="submit" class="btn btn-primary" value="登录"/>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->



<script src="${pageContext.request.contextPath}/resources/admin_js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>
<script>
    !function ($) {
        $(document).on("click","ul.nav li.parent > a > span.icon", function(){
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>
</body>

</html>


