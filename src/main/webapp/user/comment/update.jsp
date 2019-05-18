<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/9
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>修改试题</h1>
<form action="${pageContext.request.contextPath}/user/comment/update" method="post">
    <table border="0">
        <input type="hidden" name="commentId" value="${comment.commentId}">
        <tr>
            <td>评论内容</td>
            <td><input type="text" name="content" value="${comment.content}"></td>
        </tr>
        <tr>
            <td>时间</td>
            <td><input type="date" name="dateTime" value="${comment.dateTime}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="更新"></td>
        </tr>
    </table>
</form>
</body>
</html>
