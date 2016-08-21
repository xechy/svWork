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

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/UEditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/UEditor/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>

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
                            class="glyphicon glyphicon-user"></span> ${loginAdmin.aname} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/logout"><span
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
        <li class="active"><a href="${pageContext.request.contextPath}/admin/tables-UserUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-User</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-BusinessUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-Business</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-OrderUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-GoodsUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-Goods</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/tables-UEditorUI"><span
                class="glyphicon glyphicon-list-alt"></span> Tables-UEditor</a></li>
        <li role="presentation" class="divider"></li>

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


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Advanced Table</div>
                <div class="panel-body">
                    <div>
                        <h1>TEST UEditor</h1>
                        <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
                    </div>
                    <div id="btns">
                        <div>
                            <button onclick="getAllHtml()">获得整个html的内容</button>
                            <button onclick="getContent()">获得内容</button>
                            <button onclick="setContent()">写入内容</button>
                            <button onclick="setContent(true)">追加内容</button>
                            <button onclick="getContentTxt()">获得纯文本</button>
                            <button onclick="getPlainTxt()">获得带格式的纯文本</button>
                            <button onclick="hasContent()">判断是否有内容</button>
                            <button onclick="setFocus()">使编辑器获得焦点</button>
                            <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
                            <button onmousedown="setblur(event)">编辑器失去焦点</button>

                        </div>
                        <div>
                            <button onclick="getText()">获得当前选中的文本</button>
                            <button onclick="insertHtml()">插入给定的内容</button>
                            <button id="enable" onclick="setEnabled()">可以编辑</button>
                            <button onclick="setDisabled()">不可编辑</button>
                            <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
                            <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
                            <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
                        </div>

                        <div>
                            <button onclick="getLocalData()">获取草稿箱内容</button>
                            <button onclick="clearLocalData()">清空草稿箱</button>
                        </div>

                    </div>
                    <div>
                        <button onclick="createEditor()">
                            创建编辑器
                        </button>
                        <button onclick="deleteEditor()">
                            删除编辑器
                        </button>
                    </div>
                    <script type="text/javascript">
                        //实例化编辑器
                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                        var ue = UE.getEditor('editor');
                        function isFocus(e) {
                            alert(UE.getEditor('editor').isFocus());
                            UE.dom.domUtils.preventDefault(e)
                        }
                        function setblur(e) {
                            UE.getEditor('editor').blur();
                            UE.dom.domUtils.preventDefault(e)
                        }
                        function insertHtml() {
                            var value = prompt('插入html代码', '');
                            UE.getEditor('editor').execCommand('insertHtml', value)
                        }
                        function createEditor() {
                            enableBtn();
                            UE.getEditor('editor');
                        }
                        function getAllHtml() {
                            alert(UE.getEditor('editor').getAllHtml())
                        }
                        function getContent() {
                            var arr = [];
                            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
                            arr.push("内容为：");
                            arr.push(UE.getEditor('editor').getContent());
                            alert(arr.join("\n"));
                        }
                        function getPlainTxt() {
                            var arr = [];
                            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
                            arr.push("内容为：");
                            arr.push(UE.getEditor('editor').getPlainTxt());
                            alert(arr.join('\n'))
                        }
                        function setContent(isAppendTo) {
                            var arr = [];
                            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
                            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
                            alert(arr.join("\n"));
                        }
                        function setDisabled() {
                            UE.getEditor('editor').setDisabled('fullscreen');
                            disableBtn("enable");
                        }
                        function setEnabled() {
                            UE.getEditor('editor').setEnabled();
                            enableBtn();
                        }
                        function getText() {
                            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
                            var range = UE.getEditor('editor').selection.getRange();
                            range.select();
                            var txt = UE.getEditor('editor').selection.getText();
                            alert(txt)
                        }
                        function getContentTxt() {
                            var arr = [];
                            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
                            arr.push("编辑器的纯文本内容为：");
                            arr.push(UE.getEditor('editor').getContentTxt());
                            alert(arr.join("\n"));
                        }
                        function hasContent() {
                            var arr = [];
                            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
                            arr.push("判断结果为：");
                            arr.push(UE.getEditor('editor').hasContents());
                            alert(arr.join("\n"));
                        }
                        function setFocus() {
                            UE.getEditor('editor').focus();
                        }
                        function deleteEditor() {
                            disableBtn();
                            UE.getEditor('editor').destroy();
                        }
                        function disableBtn(str) {
                            var div = document.getElementById('btns');
                            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                            for (var i = 0, btn; btn = btns[i++];) {
                                if (btn.id == str) {
                                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                                } else {
                                    btn.setAttribute("disabled", "true");
                                }
                            }
                        }
                        function enableBtn() {
                            var div = document.getElementById('btns');
                            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                            for (var i = 0, btn; btn = btns[i++];) {
                                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                            }
                        }
                        function getLocalData() {
                            alert(UE.getEditor('editor').execCommand("getlocaldata"));
                        }
                        function clearLocalData() {
                            UE.getEditor('editor').execCommand("clearlocaldata");
                            alert("已清空草稿箱")
                        }
                    </script>
                </div>
            </div>
        </div>
    </div><!--/.row-->
    <div class="row">
    </div>
</div><!--/.main-->


<script src="${pageContext.request.contextPath}/resources/admin_js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_js/bootstrap-table.js"></script>
<script>
    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>
</body>

</html>


