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
    <link href="${pageContext.request.contextPath}/resources/datatables/dataTables.css">
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.min.js" ></script>
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
            <a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                            class="glyphicon glyphicon-user"></span> ${loginBusiness.bname} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                        <li><a href="${pageContext.request.contextPath}/business/logout"><span
                                class="glyphicon glyphicon-log-out"></span> Logout</a></li>
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
        <li class="active"><a href="${pageContext.request.contextPath}/business/listUI"><span
                class="glyphicon glyphicon-th"></span>List-Goods</a></li>
        <li><a href="${pageContext.request.contextPath}/business/listOrderUI"><span
                class="glyphicon glyphicon-th"></span>List-Order</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="${pageContext.request.contextPath}/goods/addGoodsUI"><span
                class="glyphicon glyphicon-pencil"></span> 添加商品</a></li>
    </ul>

</div><!--/.sidebar-->

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


    <%--<div class="container-fluid main-content">--%>
        <%--<!-- DataTables Example -->--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-12">--%>
                <%--<div class="widget-container fluid-height clearfix">--%>
                    <%--<div class="heading">--%>
                        <%--<i class="icon-table"></i>报名情况--%>
                    <%--</div>--%>
                    <%--<div class="widget-content padded clearfix">--%>
                        <%--<table class="table table-bordered table-striped" id="datatable-editable">--%>
                            <%--<thead>--%>
                            <%--<th>商品名</th>--%>
                            <%--<th>简介</th>--%>
                            <%--<th>图片</th>--%>
                            <%--<th>操作</th>--%>
                            <%--</thead>--%>
                            <%--<tbody>--%>
                            <%--</tbody>--%>
                        <%--</table>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!-- end DataTables Example -->--%>
    <%--</div>--%>


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">GoodS Table</div>
                <div class="panel-body">
                    <table  class="table table-bordered table-striped" id="datatable-editable" >
                        <thead>
                            <th width="200px">商品名</th>
                            <th width="200px">简介</th>
                            <th width="200px">图片</th>
                            <th>操作</th>
                        <tbody>
                        </tbody>
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

<script type="text/javascript">
    $(document).ready(function() {
        $("#goods_page").addClass("current");
        var oTable= $("#datatable-editable").dataTable({
            "bProcessing": true, // 是否显示取数据时的那个等待提示
            "bServerSide": true,//这个用来指明是通过服务端来取数据
            "sPaginationType": "full_numbers", //分页风格，full_number会把所有页码显示出来（大概是，自己尝试）
            "iDisplayLength": 10,//每页显示10条数据
            "sAjaxSource": "${pageContext.request.contextPath}/goods/dataTable",//这个是请求的地址
            "fnServerData": retrieveData ,
            "oLanguage" : { // 汉化
                "sProcessing" : "正在加载数据...",
                "sLengthMenu" : "显示_MENU_条 ",
                "sZeroRecords" : "没有您要搜索的内容",
                "sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_  条)",
                "sInfoPostFix" : "",
                "sSearch" : "搜索",
                "sUrl" : "",
                "oPaginate" : {
                    "sFirst" : "第一页",
                    "sPrevious" : " 上一页 ",
                    "sNext" : " 下一页 ",
                    "sLast" : " 最后一页 "
                }
            },
            "aoColumns":
                    [
                        { "mData": "gname", 'sClass':'center'},
                        { "mData": "gdescribe", 'sClass':'center'},
                        { "mData": "picture", 'sClass':'center'},
                        {
                            "mDataProp": "gid",
                            "bSearchable": false,
                            "bSortable": false,
                            "fnRender": function(obj) {
                                var id=obj.aData.id;
                                var render=  '<a class="edit-row" target="_blank" href="${pageContext.request.contextPath}/admin/product/updateUI/'+id+'"><i class="icon-pencil"></i>编辑</a>';
                                render+= '&nbsp;/&nbsp;';
                                render +=  '<a class="delete-row" href="#" name='+id+'><i class="icon-remove"></i>删除</a>';
                                return render;
                            }
                        }

                    ]
        });

// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
        function retrieveData( sSource111,aoData111, fnCallback111) {
            var arrayObj=new Array(
                    { "mData": "gname", 'sClass':'center'},
                    { "mData": "gdescribe", 'sClass':'center'},
                    { "mData": "picture", 'sClass':'center'},
                    { "mData": "id", 'sClass':'center'});
            var searchtext="";
            var sort="";
            var order="";
            var pageOffset=0;
            var size=10;
            var sEcho=0;
            for(var i=0;i<aoData111.length;i++){
                var value=aoData111[i].value;
                if(aoData111[i].name=="iSortCol_0"){
                    sort=arrayObj[value].mData;
                }
                if(aoData111[i].name=="sSortDir_0"){
                    order=value;
                }
                if(aoData111[i].name=="sSearch"){
                    searchtext=value;
                }
                if(aoData111[i].name=="iDisplayStart"){
                    pageOffset=value
                }
                if(aoData111[i].name=="iDisplayLength"){
                    size=value
                }
                if(aoData111[i].name=="sEcho"){
                    sEcho=value;
                }

            }
            var page=Math.floor(pageOffset/size)+1;
            $.ajax({
                url : sSource111,//这个就是请求地址对应sAjaxSource
                data :{"sort":sort,"order":order,"pageOffset":pageOffset,"size":size,"searchText":searchtext,"page":page,"sEcho":sEcho},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
                type : 'post',
                dataType : 'json',
                async : false,
                success : function(result) {
                    console.info(result)
                    fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
                },
                error : function(msg) {
                }
            });
        }
        var nEditing = null;

        $('#datatable-editable').on('click', 'a.delete-row', function (e) {
            var id=$(this).attr("name");
            var nRow = $(this).parents('tr')[0];
            $.post("${pageContext.request.contextPath}/admin/product/delete/"+id, function(result){
                if(result.success){
                    oTable.fnDeleteRow( nRow );
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }else{
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }
                setTimeout(function(){    //设时延迟0.5s执行
                    $("#msg").attr("hidden","hidden");
                },5000)
            },"json");
        } );

    });
</script>

</body>

</html>

