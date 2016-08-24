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
<%@ include file="../business/colunm.jsp"%>

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
                    个人详细信息 |
                    <a href="${pageContext.request.contextPath}/business/updatePasswordUI" class="btn btn-primary">修改密码</a>
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <form role="form" action="${pageContext.request.contextPath}/business/update" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="bid" value="${loginBusiness.bid}">
                            <div class="form-group">
                                <label>用户名</label>
                                <input type="text" name="bname" class="form-control" placeholder="${businessShow.bname}" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label>商铺名</label>
                                <input type="text" name="storeName" class="form-control" placeholder="${businessShow.storeName}" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label>电话</label>
                                <input type="text" name="bphone" class="form-control" placeholder="${businessShow.bphone}"/>
                            </div>
                            <div class="form-group">
                                <label>电子邮箱</label>
                                <input type="text" name="bmail" class="form-control" placeholder="${businessShow.bmail}"/>
                            </div>
                            <div class="form-group">
                                <label>详细地址</label>
                                <input type="text" name="baddress" class="form-control" placeholder="${businessShow.baddress}"/>
                            </div>
                            <div class="form-group">
                                <label>入驻日期</label>
                                <input type="text" name="bdate" class="form-control" placeholder="${businessShow.bdate}" disabled="true"/>
                            </div>
                            <div style="float: right">
                            <button type="submit" class="btn btn-primary">修改</button>
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


