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
<%@ include file="../business/colunm.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">添加商品</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">添加商品</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">

                    <div class="panel-heading">商品详细信息 <div style="float:right;color: #bf800c" id="msg">${msg}</div></div>


                <div class="panel-body">
                    <div class="col-md-6">
                        <form role="form" action="${pageContext.request.contextPath}/goods/addGoods" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="bid" value="${loginBusiness.bid}">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="gname" class="form-control" placeholder="填写商品名称">
                            </div>

                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" name="price" class="form-control" placeholder="填写商品价格">
                            </div>
                            <div class="form-group">
                                <label>选择图片</label>
                                <input type="file" name="picture_1">
                            </div>

                            <div class="form-group">
                                <label>商品描述</label>
                                <textarea class="form-control" rows="10" name="gdescribe"></textarea>
                            </div>
                            <div style="float: right">
                                <button type="submit" class="btn btn-primary">Submit Button</button>
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
<script type="text/javascript">
    $(document).ready(function () {
        setTimeout(function () {    //设时延迟0.5s执行
            $("#msg").empty();
        }, 5000)
    })
</script>
</body>

</html>


