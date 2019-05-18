<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>show-loginfo</title>
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
        <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    </head>
<body>
<table class="table  table-striped">
    <tr>
        <th>序号</th>
        <th>账户</th>
        <th>姓名</th>
        <th>权限</th>
        <th>登录时间</th>
    </tr>
    <c:forEach items="${list}" var="logInfo">
        <tr>
            <td>
                    ${logInfo.id}
            </td>
            <td>
                    ${logInfo.user.userId}
            </td>
            <td>
                    ${logInfo.user.userName}
            </td>
            <td>
                <c:if test="${logInfo.user.userLevel==1}">
                    管理员
                </c:if>
                <c:if test="${logInfo.user.userLevel==2}">
                    普通用户
                </c:if>
            </td>
            <td>
                    ${logInfo.logintime}
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
