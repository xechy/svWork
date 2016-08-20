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


<body>

    <form action="${pageContext.request.contextPath}/goods/addGoods" enctype="multipart/form-data" method="post">
        名字：<input type="text" name="gname"/>
        描述：<input type="text" name="describe"/>
        价格：<input type="text" name="price"/>
        图片：<input type="file" name="picture"/>
        <input type="submit" value="提交"/>
    </form>


</body>

</html>


