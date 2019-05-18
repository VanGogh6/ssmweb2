<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/11
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
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
        <th>账户</th>
        <th>操作记录</th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <c:if test="${user.opt!=null}">
            <tr>
                <td>
                        ${user.userId}
                </td>
                <td>
                        ${user.opt}
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>

