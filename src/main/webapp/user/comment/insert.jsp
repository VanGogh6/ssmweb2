<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>添加文章</h1>
<form action="${pageContext.request.contextPath}/user/comment/insert" method="post">
    <table border="0">
        <tr>
            <td>主题</td>
            <td><input type="text" name="content" value="菜鸟的逆袭"></td>
        </tr>
        <tr>
            <td>创建时间</td>
            <td><input type="date" name="dateTime"></td>
        </tr>
    </table>
    <input type="submit" value="添加">
</form>
</body>
</html>
