package com.filter;

import com.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *不拦截登录请求
 */
@WebFilter({"/admin/*","/user/*"})
public class MyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    /**
     * 登录验证
     * @param req
     * @param resp
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;
        HttpSession session=request.getSession();
        String path=request.getContextPath();
        String servletPath = request.getServletPath();
        User user=(User)session.getAttribute("user");
        if ((user!=null && servletPath.startsWith("/admin")&&user.getUserLevel()==1)||(user!=null && servletPath.startsWith("/user")&&user.getUserLevel()==2)){
            chain.doFilter(req,resp);
        }else{
            response.sendRedirect(path+"/login.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
