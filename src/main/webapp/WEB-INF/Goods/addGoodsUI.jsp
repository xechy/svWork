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

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/UEditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/UEditor/zh-cn.js"></script

</head>

<body>
<%@ include file="../business/colunm.jsp" %>

<script type="text/javascript">
    function check(f) {
        if (f.gname.value == ""){
            $("#gnameMsg").empty();
            $("#gnameMsg").append("请输入商品名");
            f.gname.focus();
            return false;
        }
        if (f.price.value == ""){
            $("#priceMsg").empty();
            $("#priceMsg").append("请输入价格");
            f.price.focus();
            return false;
        }
        if (isNaN(f.price.value)){
            $("#priceMsg").empty();
            $("#priceMsg").append("请输入正确的价格");
            f.price.focus();
            return false;
        }
        if(f.picture_1.value ==""){
            $("#picture_1Msg").empty();
            $("#picture_1Msg").append("请选择一张图片");
            f.picture_1.focus();
            return false;
        }
        fileExt=f.picture_1.value.substr(f.picture_1.value.lastIndexOf(".")).toLowerCase();
        if (fileExt != '.jpg'){
            $("#picture_1Msg").empty();
            $("#picture_1Msg").append("请选择正确的文件类型");
            f.picture_1.focus();
            return false;
        }
        if (f.getD.value == ""){
            $("#editor").focus();
            $("#gdescribeMsg").empty();
            $("#gdescribeMsg").append("请写入内容");
            return false;
        }
    }
</script>

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

                <div class="panel-heading">商品详细信息
                    <div style="float:right;color: #bf800c" id="msg">${msg}</div>
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <form role="form" action="${pageContext.request.contextPath}/goods/addGoods" method="post"
                              enctype="multipart/form-data" onsubmit="return check(this)">
                            <input type="hidden" name="bid" value="${loginBusiness.bid}">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" id="gname" name="gname" class="form-control" placeholder="填写商品名称">
                                <div style="float: right;color: orange" id="gnameMsg"></div>
                            </div>

                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" id="price" name="price" class="form-control" placeholder="填写商品价格">
                                <div style="float: right;color: orange" id="priceMsg"></div>
                            </div>
                            <div class="form-group">
                                <label>选择图片</label>
                                <input type="file" id="picture_1" name="picture_1">
                                <div style="float: right;color: orange" id="picture_1Msg"></div>
                            </div>

                            <div class="form-group">
                                <label>商品描述</label>
                                <input type="hidden" name="gdescribe" id="getD"/>
                                <script id="editor" type="text/plain" style="width:735px;height:250px;">
                                </script>
                                <div style="float: right;color: orange" id="gdescribeMsg"></div>
                            </div>
                            <div style="float: right">
                                <button type="submit" class="btn btn-primary" onclick="getContent()">Submit Button</button>
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
<%--<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        setTimeout(function () {    //设时延迟0.5s执行
            $("#msg").empty();
        }, 5000)
    })
</script>

<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    function isFocus(e) {
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function getContent() {
//        alert(UE.getEditor('editor').getContent());
        $("#getD").val(UE.getEditor('editor').getContent());
            return true;
    }
</script>
</body>

</html>


