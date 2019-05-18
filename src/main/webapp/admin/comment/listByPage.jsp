<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
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
            function selectComment() {
                var selectFlag = document.getElementsByName("selectFlag");
                var flag = false;
                for (var i = 0; i < selectFlag.length; i++) {
                    if (selectFlag[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    alert("请选择需要删除的数据！");
                    return;
                }
                if (window.confirm("确认删除吗？")) {
                    document.Studentform.submit();
                }
            }
        </script>
    </head>
    <body>
    <form
		action="${pageContext.request.contextPath}/admin/comment/listByPage"
		method="post" id="f1" class="form-inline">
		<div class="row alert alert-info form-inline"
			style="margin: 0px; padding: 5px;">
			<div class="form-group">
				 <input type="text" class="form-control"
					name="commentId" placeholder="请输入文章编号或文章主题" />
			</div>
			<input type="submit" value="查询信息" class="btn btn-success" />
            <a	href="${pageContext.request.contextPath}/admin/comment/insertPre"	class="btn btn-info">添加信息</a>
            <a href="${pageContext.request.contextPath}/admin/comment/import.jsp"	class="btn btn-info">导入信息</a>
            <a href="${pageContext.request.contextPath}/admin/comment/exportExcel" class="btn btn-info">导出信息</a>
            <input  type="button" value="删除" class="btn btn-danger" onClick="selectComment()">
		</div>
	</form>
         
        <form name="Studentform"  action="${pageContext.request.contextPath}/admin/comment/deleteBatchByNos" method="post">
            <table class="table table-striped table-bordered" >
                <tr>
                    <th width="10"  align="center">
                        <input type="checkbox" name="ifAll" id="ifAll"
                               onClick="checkAll()">
                    </th>
                    <th>文章编号</th>
                    <th>文章主题</th>
                    <th>创建时间</th>
                    <th>博客名</th>
                    <th>操作</th>
                </tr>
                </tr>
               <c:forEach items="${list}" var="comment">
                <tr>
                    <td>
                        <input type="checkbox" name="selectFlag" value="${comment.commentId} ">
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
                        ${comment.blog.blogName}
                    </td>

                     <td>
                    <a href="${pageContext.request.contextPath}/admin/comment/updatePre?commentId=${comment.commentId}"  class="btn btn-info">更新</a>
                </td>
                </tr>     
                </c:forEach>
                 <tr>
			  	<td colspan="7">
			  		第 ${currentPage} / ${totalSize}
			  		&nbsp;
			  		每页显示${pageSize}条  &nbsp;&nbsp;&nbsp;
			  		总的记录数${totalSize} &nbsp;&nbsp;&nbsp;
			  		<c:if test="${currentPage !=1 }">
			  			<a href="${pageContext.request.contextPath}/admin/comment/listByPage?commentId=${commentId}&currentPage=1">首页</a>
						| <a href="${pageContext.request.contextPath}/admin/comment/listByPage?commentId=${commentId}&currentPage=${currentPage-1 }">上一页</a>
			  		</c:if>
			  		<c:forEach begin="1" end="${totalPage}" var="i">
			  			<c:if test="${currentPage == i }">
			  				${i}
			  			</c:if>
			  			<c:if test="${currentPage != i }">
			  				<a href="admin/comment/listByPage?commentId=${commentId}&currentPage=${i }">${i }</a>
			  			</c:if>
			  		</c:forEach>
			  		<c:if test="${currentPage !=totalSize}">
			  			<a href="${pageContext.request.contextPath}/admin/comment/listByPage?commentId=${commentId}&currentPage=${currentPage+1 }">下一页</a> |
			  			<a href="${pageContext.request.contextPath}/admin/comment/listByPage?commentId=${commentId}&currentPage=${totalSize}">尾页</a>
			  		</c:if>
			  	</td>
			  </tr>
            </table>
        </form>
    </body>
</html>
