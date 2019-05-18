<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>添加文章</h1>
<form action="${pageContext.request.contextPath}/admin/comment/insert" method="post">
    <table border="0">
        <tr>
            <td>评论内容</td>
            <td><input type="text" name="content" value="题材新颖"></td>
        </tr>
        <tr>
            <td>评论时间</td>
            <td><input type="date" name="dateTime"></td>
        </tr>
        <tr>
            <td>评论博客名</td>
            <td>
                <SELECT  name="blogId" style="width: 130px;">
                    <c:forEach items="${blogs}" var="blog">
                        <option value="${blog.blogId}"> ${blog.blogName}</option>
                    </c:forEach>
                </SELECT>
            </td>
        </tr>
    </table>
    <input type="submit" value="添加">
</form>
</body>
</html>
