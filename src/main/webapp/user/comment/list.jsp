
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/res/js/bootstrap.min.js"></script>
        <script>
            function checkAll() {
                var selectFlag = document.getElementsByName("selectFlag");
                for (var i = 0; i < selectFlag.length; i++) {
                    selectFlag[i].checked = document.getElementById("ifAll").checked;
                }
            }
            function selectStudent() {
                var selectFlag = document.getElementsByName("selectFlag");
                var flag = false;
                for (var i = 0; i < selectFlag.length; i++) {
                    if (selectFlag[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    alert("请选择需要删除的信息");
                    return;
                }
                if (window.confirm("确认删除吗")) {
                    document.Studentform.submit();
                }
            }
        </script>
    </head>
    <body>
        <form action="selectLike" method="post" id="f1" class="form-inline">
            <div class="row alert alert-info form-inline"  style="margin: 0px; padding: 5px;">
                <div class="form-group">
                     <input type="text" class="form-control" name="commentId" placeholder="请输入文章编号" />
                </div>
                <input type="submit" value="查询信息" class="btn btn-success" />
                <a	href="insert.jsp"	class="btn btn-info">添加信息</a>
                <input   type="button" value="删除" class="btn btn-danger" onClick="selectStudent()">
            </div>
        </form>
        <form name="Studentform"  action="${pageContext.request.contextPath}/user/comment/deleteBatchByNos" method="post">
            <table class="table table-striped table-bordered" >
                <tr>
                    <th width="10"  align="center">
                        <input type="checkbox" name="ifAll" id="ifAll"  onClick="checkAll()">
                    </th>
                    <th>编号</th>
                    <th>主题</th>
                    <th>创建时间</th>
                </tr>
               <c:forEach items="${list}" var="comment">
                <tr>
                    <td>
                        <input type="checkbox" name="selectFlag" value="${comment.commentId}">
                    </td>
                    <td>
                        ${comment.commentId}
                    </td>
                    <td>
                        ${comment.content}
                    </td>
                    <td>
                        ${comment.dateTime}
                    </td>
                     <td>
                         <a href="${pageContext.request.contextPath}/user/comment/updatePre?commentId=${comment.commentId}"  class="btn btn-info">更新</a>
                     </td>
                </tr>     
                </c:forEach>
            </table>
        </form>
    </body>
</html>
