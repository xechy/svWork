<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/13
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lumino - Forms</title>

    <link href="${pageContext.request.contextPath}/resources/admin_css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/datepicker3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/styles.css" rel="stylesheet">

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>

<body>


<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">


    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">找回密码</h2>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="color:deepskyblue">${error}</div>
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <form role="form" action="${pageContext.request.contextPath}/business/receivePassword"
                              method="post">
                            <div class="form-group">
                                <label>商铺名</label>
                                <input type="text" name="storeName" class="form-control" placeholder="输入商铺名"/>
                            </div>
                            <div class="form-group">
                                <label>注册邮箱</label>
                                <input type="text" name="bmail" class="form-control" placeholder="输入注册邮箱"/>
                            </div>
                            <div class="form-group">
                                <label>注册手机号码</label>
                                <input type="text" name="bphone" class="form-control" placeholder="输入注册手机号码"/>
                            </div>
                            <div style="float: right">
                                <button type="submit" class="btn btn-primary">提交</button>
                                <button type="reset" class="btn btn-default">Reset Button</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div><!-- /.col-->
        </div><!-- /.row -->
    </div>
</div><!--/.main-->

<script src="${pageContext.request.contextPath}/resources/admin_js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>

</body>

</html>


