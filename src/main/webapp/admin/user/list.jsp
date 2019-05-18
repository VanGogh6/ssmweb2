<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/10
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/bootstrap.min.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/jquery.min.js"></script>
        <script type="text/javascript"	src="${pageContext.request.contextPath}/static/res/js/bootstrap.min.js"></script>
        <script>
            function checkAll() {
                var selectFlag = document.getElementsByName("selectFlag");
                for (var i = 0; i < selectFlag.length; i++) {
                    selectFlag[i].checked = document.getElementById("ifAll").checked;
                }
            }
            function selectUser() {
                var selectFlag = document.getElementsByName("selectFlag");
                var flag = false;
                for (var i = 0; i < selectFlag.length; i++) {
                    if (selectFlag[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    alert("请选择需要删除的消息");
                    return;
                }
                if (window.confirm("确认删除吗")) {
                    document.Userform.submit();
                }
            }
        </script>
    </head>
    <body>
    <form	action="${pageContext.request.contextPath}/admin/user/list"	method="post" id="f1" class="form-inline">
		<div class="row alert alert-info form-inline"	style="margin: 0px; padding: 5px;">
            <a	href="${pageContext.request.contextPath}/admin/user/insertPre"	class="btn btn-info">添加用户</a>
            <a href="${pageContext.request.contextPath}/admin/user/importOutExcel"	class="btn btn-info">导出用户</a>
           <input  type="button" value="删除" class="btn btn-danger" onClick="selectUser()">
		</div>
	</form>
        <form name="Userform"  action="${pageContext.request.contextPath}/admin/user/deleteBatch" method="post">
            <table class="table table-striped table-bordered" >
                <tr>
                    <th width="10"  align="center">
                        <input type="checkbox" name="ifAll" id="ifAll" onClick="checkAll()">
                    </th>
                    <th>userID</th>
                    <th>姓名</th>
                    <th>头像</th>
                    <th>用户类型</th>
                    <th>博客</th>
                    <th>操作</th>
                </tr>
               <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>
                            <input type="checkbox" name="selectFlag"  value="${user.userId} ">
                        </td>
                        <td>
                                ${user.userId}
                        </td>
                        <td>
                                ${user.userName}
                        </td>
                        <td>
                            <img src= "${pageContext.request.contextPath}/static/upload/${user.imgUrl}" width="50px" height="50px">
                        </td>
                        <td>
                            <c:if test="${user.userLevel==1}">
                                管理员
                            </c:if>
                            <c:if test="${user.userLevel==2}">
                                普通用户
                            </c:if>
                        </td>
                        <td>
                            <input type="hidden" name="blogId"  value="${user.blog.blogId} ">
                                ${user.blog.blogName}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/user/importImg?userId=${user.userId}"  class="btn btn-info">更改头像</a>
                            <c:if test="${user.userLevel==1}">
                                <a href="${pageContext.request.contextPath}/admin/user/admin2user?userId=${user.userId}"  class="btn btn-info">取消管理员</a>
                            </c:if>

                            <c:if test="${sessionScope.user.userId==user.userId}">
                                <input type="button" class="btn-success" value="当前用户">
                            </c:if>

                            <c:if test="${user.userLevel==2}">
                                <a href="${pageContext.request.contextPath}/admin/user/user2admin?userId=${user.userId}"  class="btn btn-info">设为管理员</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
