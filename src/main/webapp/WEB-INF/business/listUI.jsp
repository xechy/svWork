<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/11
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lumino - Tables</title>

    <link href="${pageContext.request.contextPath}/resources/admin_css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/datepicker3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/bootstrap-table.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/resources/admin_js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<%@ include file="colunm.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">Tables</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tables</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Advanced Table</div>
                <div class="panel-body">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/goods/addGoodsUI">添加商品</a>
                    <table data-toggle="table" data-url="${pageContext.request.contextPath}/admin/searchBusiness"
                           data-show-refresh="true"
                           data-show-toggle="true"
                           data-show-columns="true"
                           data-search="true"
                           data-select-item-name="toolbar1"
                           data-pagination="true"
                           data-sort-name="name"
                           data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="state" data-checkbox="true">Item ID</th>
                            <th data-field="id" data-sortable="true">Item ID</th>
                            <th data-field="name" data-sortable="true">Item Name</th>
                            <th data-field="price" data-sortable="true">Item Price</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div>

<script src="${pageContext.request.contextPath}/resources/admin_js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-table.js"></script>

</body>

</html>

