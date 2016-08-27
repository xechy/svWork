<%--
  Created by IntelliJ IDEA.
  User: Japa xie
  Date: 2016/8/27
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function() {
        $("#signupForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    remote:{
                        method:"post",
                        url:"${pageContext.request.contextPath}/user/checkName",
                        data: {
                            name: function () {
                                return $("#name").val();
                            }
                        }
                    }
                },
                phone: {
                    required: true,
                    minlength: 11,
                    maxlength: 11,
                    remote:{
                        method:"post",
                        url:"${pageContext.request.contextPath}/user/checkPhone",
                        data: {
                            phone: function () {
                                return $("#phone").val();
                            }
                        }
                    }
                },
                address: {
                    required: true,
                    minlength: 6
                },
                mail: {
                    required: true,
                    email: true,
                    remote:{
                        method:"post",
                        url:"${pageContext.request.contextPath}/user/checkEmail" ,
                        data: {
                            email: function () {
                                return $("#mail").val();
                            }
                        }
                    }
                },
                password: {
                    required: true,
                    minlength: 5
                },
                password_1: {
                    required: true,
                    minlength: 5,
                    equalTo: "#password"
                }


            },
            messages: {
                name: {
                    required: "请输入用户名",
                    minlength: "用户名必需由两个字母组成",
                    remote:  "账号已存在"
                },
                phone: {
                    required: "请输入电话号码",
                    minlength: "请输入正确的电话号码",
                    maxlength:"请输入正确的电话号码",
                    remote: "此号码已经注册"
                },
                address: {
                    required: "请输入地址",
                    minlength: "输入详细地址"
                },
                mail: {
                    required: "请输入电子邮箱",
                    email: "请填写正确的电子格式",
                    remote: "此电子邮箱已经注册"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于 5 个字母"
                },
                password_1: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于 5 个字母",
                    equalTo: "两次密码输入不一致"
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
