<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/11
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/admin/user/updateImg?userId=${userId}" enctype="multipart/form-data">
        选择文件:<input type="file" name="file">
        <input type="submit" value="上传">
    </form>
</body>
</html>
