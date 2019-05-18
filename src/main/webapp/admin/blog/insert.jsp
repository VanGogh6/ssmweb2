<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>添加博客</h1>
        <form action="${pageContext.request.contextPath}/admin/blog/insert" method="post">
            <table border="0">
                <tr>
                    <td>博客编号</td>
                    <td><input type="text" name="blogId" value="10"></td>
                </tr>
                <tr>
                    <td>博客名称</td>
                    <td><input type="text" name="blogName" value="很好"></td>
                </tr>
            </table>
            <input type="submit" value="添加">
        </form>

    </body>
</html>
