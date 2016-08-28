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

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>

<body>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="colunm.jsp" %>
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
                <div class="panel-heading"><div style="float: right;color: #1006F1">${deleteMsg}</div>Advanced Table </div>
                <div class="panel-body">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/goods/addGoodsUI">添加商品</a>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                        <th width="10px"> ID </th>
                        <th width="150px"> 商品名 </th>
                        <th width="150px"> 简介 </th>
                        <th width="50px"> 价格 </th>
                        <th width="200px"> 上架日期 </th>
                        <th width="100px"> 图片 </th>
                        <th width="50px"> 操作 </th>
                        </tr>
                        <tbody>
                        <c:forEach items="${pageList.recordList }" var="goods">
                            <tr>
                            <td> ${goods.gid} </td>
                            <td> ${goods.gname} </td>
                            <td> ${goods.gdescribe} </td>
                            <td> ${goods.price} </td>
                            <td> <fmt:formatDate value="${goods.gdate}" pattern="yyyy-MM--dd HH:mm:ss"/> </td>
                            <td> <img src="${pageContext.request.contextPath}/resources/file/goods/${goods.picture}" width="100px"> </td>
                            <td>
                                 <a href="${pageContext.request.contextPath}/business/deleteGoods/${goods.gid}">删除</a>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        </thead>
                    </table>
                    <%@ include file="../common.jsp" %>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div>



<script src="${pageContext.request.contextPath}/resources/admin_js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-table.js"></script>

</body>

</html>

