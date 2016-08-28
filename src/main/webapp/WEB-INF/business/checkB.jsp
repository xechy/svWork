<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/27
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>

<script type="text/javascript">
    function check_1(f) {//检测函数
        if (f.bname.value == "") {//如果用户名为空
            alert("请输入用户名！");//弹出提示框
            f.bname.focus();//文本框获取焦点
            return false;//返回错误
        }
        if (f.bpassword.value == "") {
            alert("请输入密码！");
            f.bpassword.focus();
            return false;
        }
    }
</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script type="text/javascript">
    $(function() {
        $("#registerForm").validate({
            rules: {
                bname: {
                    required: true,
                    minlength: 2,
                    remote:{
                        method:"post",
                        url:"${pageContext.request.contextPath}/business/checkBname",
                        data: {
                            name: function () {
                                return $("#bname").val();
                            }
                        }
                    }
                },
                storeName: {
                    required: true,
                    minlength: 2,
                    remote:{
                        method:"post",
                        url:"${pageContext.request.contextPath}/business/checkStoreName",
                        data: {
                            name: function () {
                                return $("#storeName").val();
                            }
                        }
                    }
                },
                bPicture_1:{
                    required: true,
                    accept: '.jpg'
                },
                bphone: {
                    required: true,
                    minlength: 11,
                    maxlength: 11
                },
                baddress: {
                    required: true,
                    minlength: 6
                },
                bmail: {
                    required: true,
                    email: true
                },
            },
            messages: {
                bname: {
                    required: "请输入用户名",
                    minlength: "用户名必需由两个字母组成",
                    remote:  "账号已存在"
                },
                storeName: {
                    required: "请输入商铺名",
                    minlength: "商铺名必需由两个字母组成",
                    remote:  "商铺名已存在"
                },
                bPicture_1:{
                    required: "请选择一张图片",
                    accept: '只能选择jpg格式的图片'
                },
                bphone: {
                    required: "请输入电话号码",
                    minlength: "请输入正确的电话号码",
                    maxlength:"请输入正确的电话号码"
                },
                baddress: {
                    required: "请输入地址",
                    minlength: "输入详细地址"
                },
                bmail: {
                    required: "请输入电子邮箱",
                    email: "请填写正确的电子格式"
                }
            }
        });
    });
</script>
<style>
    .error{
        color: orange;
    }
</style>
</body>
</html>

