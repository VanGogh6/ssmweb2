<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>修改班级</h1>
        <form action="${pageContext.request.contextPath}/admin/blog/update" method="post">
            <input value="${blog.id}" type="hidden" name="id">
            <table border="0">
                <tr>
                    <td>博客编号</td>
                    <td><input type="text" name="blogId" value="${blog.blogId} "></td>
                </tr>
                <tr>
                    <td>博客名称</td>
                    <td><input type="text" name="blogName" value="${blog.blogName}"></td>
                </tr>
            <tr>
                <td><input type="submit" value="更新"></td>
            </tr>
        </table>
    </form>
</body>
</html>
