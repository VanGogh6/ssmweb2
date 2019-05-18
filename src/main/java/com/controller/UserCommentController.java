package com.controller;
/**
 * 作者：吴帆
 */
import com.pojo.Comment;
import com.pojo.User;
import com.service.BaseService;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user/comment/*")
public class UserCommentController {

    @Autowired
    private CommentService commentServiceImpl;
    @Autowired
    private BaseService baseServiceImpl;
    @RequestMapping("listByBlogId")
    public String listByBlohId(HttpServletRequest request){
        User user =(User)request.getSession().getAttribute("user");
        String blogId = user.getBlogId();
        List<Comment> list=commentServiceImpl.selectCommentListByBlogId(blogId);
        request.setAttribute("list",list);
        return "forward:list.jsp";
    }

    @RequestMapping("updatePre")
    public String updatePre(String commentId,HttpServletRequest request){
        Comment comment = commentServiceImpl.selectCommentById(commentId);
        request.setAttribute("comment",comment);
        return "forward:update.jsp";
    }

    @RequestMapping("update")
    public String update(Comment comment,HttpServletRequest request){
        int update = commentServiceImpl.update(comment);
        String opt="修改文章"+comment.getCommentId();
        baseServiceImpl.updateOpt(opt,request);
        return "forward:listByBlogId";
    }

    @RequestMapping("insert")
    public String insert(Comment comment ,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        String blogId = user.getBlogId();
        comment.setBlogId(blogId);
        int insert = commentServiceImpl.insert(comment);
        String opt="添加文章"+comment.getCommentId();
        baseServiceImpl.updateOpt(opt,request);
        return "forward:listByBlogId";
    }


    @RequestMapping("selectLike")
    public String selectLike(Comment comment ,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        String blogId = user.getBlogId();
        comment.setBlogId(blogId);
        List<Comment> list=commentServiceImpl.selectCommentLikeId(comment);
        request.setAttribute("list",list);
        return "forward:list.jsp";
    }

    //deleteBatchByNos
    @RequestMapping("deleteBatchByNos")
    public String deleteBatchByNos(HttpServletRequest request){
        String[] values = request.getParameterValues("selectFlag");
        int i = commentServiceImpl.deleteBatchByNos(values);
        if (i>0){
            String opt="删除文章";
            baseServiceImpl.updateOpt(opt,request);
            System.out.println("ok");
        }
        return "forward:listByBlogId";
    }
}
