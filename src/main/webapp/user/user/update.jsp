<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/12
  Time: 11:11
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
<h1>修改</h1>
<form action="${pageContext.request.contextPath}/user/user/update" method="post">
    <table border="0">

        <tr>
            <td>用户头像</td>
            <td><img src="${pageContext.request.contextPath}/static/upload/${user.imgUrl}"  width="50px" height="50px"></td>
        </tr>
        <tr>
            <td>修改用户名</td>
            <td><input type="text" name="userName" value="${user.userName}"></td>
        </tr>
        <tr>
            <td>操作历史数据</td>
            <td>
                <textarea  name="opt"  width="200px" height="500px" >${user.opt}</textarea>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="更新"></td>
        </tr>
    </table>
</form>
</body>
</html>

