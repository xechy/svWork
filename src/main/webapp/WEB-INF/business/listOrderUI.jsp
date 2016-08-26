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
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading"><div style="float: right;color: #1006F1">${updateMsg}</div>Advanced Table </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th width="10px"> ID </th>
                            <th width="150px"> 本单商品名 </th>
                            <th width="150px"> 状态 </th>
                            <th width="50px"> 本单价格 </th>
                            <th width="50px"> 下单客户 </th>
                            <th width="200px"> 送货地址 </th>
                            <th width="150px"> 客户电话 </th>
                            <th width="200px"> 下单日期 </th>
                            <th width="50px"> 操作 </th>
                        </tr>
                        <tbody>
                        <c:forEach items="${pageList.recordList }" var="order">
                            <tr>
                                <td> ${order.oid} </td>
                                <td> ${order.gname} </td>
                                <td> ${order.state} </td>
                                <td>  ￥ ${order.price} </td>
                                <td>  ${order.getUser().name} </td>
                                <td>  ${order.getUser().address} </td>
                                <td>  ${order.getUser().phone} </td>
                                <td> ${order.odate} </td>
                                <td>
                                    <c:if test="${order.state eq'等待商家接单'}">
                                    <a href="${pageContext.request.contextPath}/business/updateBooking/${order.oid}">接单</a>
                                    </c:if>
                                    <c:if test="${order.state eq'商家已接单'}">
                                    <a href="${pageContext.request.contextPath}/business/updateBooking/${order.oid}">送货</a>
                                    </c:if>
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
<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-table.js"></script>

</body>

</html>

