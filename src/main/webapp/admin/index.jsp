<%--
  Created by IntelliJ IDEA.
  User: wf520
  Date: 2019/5/10
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <title></title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/index.css" type="text/css" media="screen" />
            <script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/jquery.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/tendina.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/static/res/js/common.js"></script>
    </head>
    <body>
        <!--顶部-->
        <div class="layout_top_header">
            <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #8d8d8d">管理后台</span></div>
            <div id="ad_setting" class="ad_setting"></div>
        </div>
        <!--顶部结束-->
        <!--菜单-->
        <div class="layout_left_menu">
            <ul id="menu">
                 <li class="childUlLi">
                    <a href="#"  target="menuFrame"><i class="glyph-icon icon-home"></i>博客管理</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin/blog/list" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>显示全部记录</a>
                        </li>
                    </ul>
                </li>
                
                <li class="childUlLi">
                    <a href="#"  target="menuFrame"><i class="glyph-icon icon-home"></i>文章管理</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin/comment/listByPage" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>显示全部记录</a>
                        </li>
                    </ul>
                </li>
                
                 <li class="childUlLi">
                    <a href="#"  target="menuFrame"><i class="glyph-icon icon-home"></i>用户管理</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin/user/list" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>显示全部记录</a>
                        </li>
                    </ul>
                </li>
              <li class="childUlLi">
                    <a href="#"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>日志管理</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/loginfo/user/list" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>登录日志管理</a></li>
                                <li><a href="${pageContext.request.contextPath}/admin/user/operation" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>操作日志管理</a></li>
                    </ul>
                </li>
                <li class="childUlLi">
                    <a href="#"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>系统管理</a>
                    <ul>
                        <li><a href="password/modifypasswordfirst.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>修改密码</a></li>
                        <li><a href="${pageContext.request.contextPath}/login/logout"><i class="glyph-icon icon-chevron-right"></i>退出登录</a></li>

                    </ul>
                </li>
            </ul>
        </div>
        <!--菜单-->
        <div id="layout_right_content" class="layout_right_content" align="center">

            <div class="route_bg">
                <a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i>
                <a href="#">管理</a>
            </div>
            <div class="mian_content">
                <div id="page_content">
                    <iframe id="menuFrame" name="menuFrame" src="${pageContext.request.contextPath}/admin/welcome.jsp" style="overflow:visible;"
                            scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
                </div>
            </div>
        </div>
        <div class="layout_footer">
            <p>Copyright ©电气与信息学院计算机16</p>
        </div>
    </body>
</html>
