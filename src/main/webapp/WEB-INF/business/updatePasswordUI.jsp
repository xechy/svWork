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

<c:if test="${loginBusiness != null}">
    <%@ include file="../business/colunm.jsp" %>
</c:if>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">修改密码</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">修改密码</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    修改密码
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <form action="${pageContext.request.contextPath}/business/updatePassword" method="post">
                            <input type="hidden" name="bid"
                                   <c:if test="${loginBusiness.bid != null}">value="${loginBusiness.bid}" </c:if>
                                   <c:if test="${receiveBusiness.bid != null}">value="${receiveBusiness.bid}"</c:if>
                            >
                            <div class="form-group">
                                <label>新密码</label>
                                <input type="password" name="bpassword" class="form-control" placeholder="输入新密码"/>
                            </div>
                            <div style="float: right">
                                <button type="submit" class="btn btn-primary">提交</button>
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


