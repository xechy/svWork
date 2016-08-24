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

</head>

<body>
<%@ include file="column_admin.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">查看个人资料</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">查看个人资料</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    个人详细信息
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                            <input type="hidden" name="aid" value="${loginAdmin.aid}">
                            <div class="form-group">
                                <label>用户名</label>
                                <input type="text" name="aname" class="form-control" placeholder="${showAdmin.aname}" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label>电话</label>
                                <input type="text" name="aphone" class="form-control" placeholder="${showAdmin.aphone}" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label>电子邮箱</label>
                                <input type="text" name="amail" class="form-control" placeholder="${showAdmin.amail}" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label>注册日期</label>
                                <input type="text" name="adate" class="form-control" placeholder="${showAdmin.adate}" disabled="true"/>
                            </div>
                            <div style="float: right">
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


