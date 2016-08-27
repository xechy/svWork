<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/24
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Lazy TakeOUT</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                            class="glyphicon glyphicon-user"></span> ${loginAdmin.aname} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${pageContext.request.contextPath}/admin/show/${loginAdmin.aid}"><span class="glyphicon glyphicon-cog"></span> 查看个人资料</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/logout"><span
                                class="glyphicon glyphicon-log-out"></span> 登出</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
        </div>
    </form>
    <ul class="nav menu">
        <li><a href="${pageContext.request.contextPath}/admin/tables-UserUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-User</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-BusinessUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-Business</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-OrderUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-GoodsUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-Goods</a></li>
        <li role="presentation" class="divider"></li>
    </ul>

</div>
</body>
</html>
