package com.controller;

import com.pojo.Blog;
import com.service.BaseService;
import com.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("admin/blog/*")
public class BlogController {

    @Autowired
    private BlogService blogServiceImpl;
    @Autowired
    private BaseService baseServiceImpl;
    /**
     * 查询博客全部信息
     * @param req
     * @return
     */
    @RequestMapping("admin/blog/list")
    public String list(HttpServletRequest req){
        List<Blog> list = blogServiceImpl.list();
        req.setAttribute("list",list);
        return "admin/blog/list";
    }

    /**
     * 添加一个博客信息
     * @param blog
     * @return
     */
    @RequestMapping("admin/blog/insert")
    public String insertBlog(Blog blog,HttpServletRequest request){
        int i = blogServiceImpl.insertBlog(blog);
        String opt="添加博客";
        baseServiceImpl.updateOpt(opt,request);
        return "redirect:/admin/blog/list";
    }

    /**
     * 根据id查出要更新的数据，并返回更新页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("admin/blog/updatePre")
    public String updatePreBlog(@RequestParam("id") Integer id, Model model){
        Blog blog = blogServiceImpl.selectBlogById(id);
        model.addAttribute("blog",blog);
        System.out.println("获取更新的数据");
        return "forward:/admin/blog/update.jsp";
    }

    /**
     * 执行更新是调用
     * @param blog
     * @return
     */
    @RequestMapping("admin/blog/update")
    public String updateBlog(Blog blog,Model model,HttpServletRequest request){
        int updateBlog = blogServiceImpl.updateBlog(blog);
        if (updateBlog>0){
            model.addAttribute("msg","更新成功");
            String opt="修改博客"+blog.getBlogId()+"内容成功";
            baseServiceImpl.updateOpt(opt,request);
        }else{
            model.addAttribute("msg","更新失败");
            String opt="修改博客内容失败";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "redirect:/admin/blog/list";
    }

    /**
     * 删除单个数据
     * @param id
     * @return
     */
    @RequestMapping("admin/blog/delete")
    public String deleteBlog(@RequestParam("id") Integer id,Model model,HttpServletRequest request){
        int i=blogServiceImpl.deleteBlogById(id);
        if (i>0){
            model.addAttribute("msg","删除成功");
            String opt="删除成功博客"+id;
            baseServiceImpl.updateOpt(opt,request);
        }else {
            model.addAttribute("msg","删除失败");
        }
        return "redirect:/admin/blog/list";
    }
}
