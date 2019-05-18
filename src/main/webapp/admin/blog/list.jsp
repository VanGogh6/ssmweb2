
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>JSP Page</title>
    <script>
        function del(id) {
            if (confirm("你确定要删除吗")) {
                window.location = "${pageContext.request.contextPath}/admin/blog/delete?id=" + id;
            }
        }
    </script>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/blog/insert.jsp">添加博客</a>
<h1>博客数据</h1>
<table class="table  table-striped">

    <tr>
        <th>序号</th>
        <th>博客账号</th>
        <th>博客名</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach items="${list}" var="blog">

        <tr>
            <td>
                    ${blog.id}
            </td>
            <td>
                    ${blog.blogId}
            </td>
            <td>
                    ${blog.blogName}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/blog/updatePre/?id=${blog.id}">更新</a>
            </td>
            <td>
                <a href="javascript:del('${blog.id}')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
