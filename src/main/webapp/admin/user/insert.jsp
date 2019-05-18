<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/10
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/jquery.min.js"></script>
    <script type="text/javascript"	src="${pageContext.request.contextPath}/static/res/js/bootstrap.min.js"></script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/admin/user/insert" method="post">
        <h4 class="text-danger">默认密码为1，为了安全请及时告知用户登录自己的账号修改密码</h4>
        <label>账户</label>
        <input class="input-group" name="userId"  placeholder="请输入账号">
        <label>姓名</label>
        <input class="input-group" name="userName"  placeholder="请输入姓名">
        <label>博客</label>
        <SELECT  name="blogId" style="width: 130px;">
            <c:forEach items="${list}" var="blog">
                <option value="${blog.blogId}" <c:if test="${blog.blogId==comment.blogId}">selected </c:if> > ${blog.blogName} </option>
            </c:forEach>
        </SELECT>
        <input class="btn-primary" type="submit" value="注册">
    </form>
</body>
</html>
