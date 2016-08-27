<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/11
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lumino - Tables</title>

    <link href="${pageContext.request.contextPath}/resources/admin_css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/datepicker3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/bootstrap-table.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin_css/styles.css" rel="stylesheet">
</head>

<body>
<%@ include file="column_admin.jsp" %>

<script type="text/javascript">
    function check(f) {
        if (f.excel.value == ""){
            $("#excelMsg").empty();
            $("#excelMsg").append("请选择导入文件");
            f.excel.focus();
            return false;
        }
        excelExt=f.excel.value.substr(f.excel.value.lastIndexOf(".")).toLowerCase();
        if (excelExt != ".xlsx" || excelExt !="xls"){
            $("#excelMsg").empty();
            $("#excelMsg").append("请选择正确的文件类型");
            f.excel.focus();
            return false;
        }
    }
</script>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">Tables</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">User</h1>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">User Table</div>
                <div class="panel-body">

                    <div style="float:left">
                        <form action="${pageContext.request.contextPath}/excel/uploadUser" enctype="multipart/form-data"
                              method="post" onsubmit="return check(this)">
                            <div class="form-group" style="clear: both">
                                <div style="float:left">
                                    <input id="excel" type="file" name="excel">
                                </div>
                                <div style="float:left">
                                    <button type="submit" class="btn btn-primary">导入</button>
                                </div>
                                <div style="float:left">
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/excel/download">导出</a>
                                </div>
                                <div style="float:left;color: orange" id="excelMsg"></div>
                            </div>
                        </form>
                    </div>

                    <table data-toggle="table" data-url="${pageContext.request.contextPath}/admin/searchUser"
                           data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
                           data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name"
                           data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="name" data-sortable="true">姓名</th>
                            <th data-field="phone" data-sortable="true">电话</th>
                            <th data-field="mail" data-sortable="true">邮箱</th>
                            <th data-field="address" data-sortable="true">地址</th>
                            <th data-field="sex" data-sortable="true">性别</th>
                            <th data-field="date" data-sortable="true">日期</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div><!--/.main-->

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


