<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/9
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>文件的上传和下载</title>
</head>
<body>
文件上传：
<form action="${pageContext.request.contextPath}/admin/comment/uploadAndImport" method="post" enctype="multipart/form-data">
    <input type="file" name="file" /> <br> <input type="submit" />
</form>

</body>
</html>
