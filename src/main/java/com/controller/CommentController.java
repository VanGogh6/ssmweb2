package com.controller;

import com.pojo.Blog;
import com.pojo.Comment;
import com.service.BaseService;
import com.service.BlogService;
import com.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

@Controller
@RequestMapping("admin/comment/*")
public class CommentController {
    @Autowired
    private CommentService commentServiceImpl;
    @Autowired
    private BlogService blogServiceImpl;
    @Autowired
    private BaseService baseServiceImpl;
    /**
     * 从excel导入数据
     * @return
     */
    @RequestMapping("admin/comment/uploadAndImport")
    public String uploadAndImport(HttpServletRequest request, HttpServletResponse response,@RequestParam("file") CommonsMultipartFile file){
        try {
            InputStream is = file.getInputStream();
            boolean b=commentServiceImpl.insertFromExcel(is);
            String opt="导入文章";
            baseServiceImpl.updateOpt(opt,request);
        }catch (Exception e){
            e.getMessage();
        }
        return "forward:/admin/comment/listByPage";
    }

    @RequestMapping("admin/comment/exportExcel")
    public String exportExcel(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=" + "data.xls");
        try {
            ServletOutputStream out1 = response.getOutputStream();
            HSSFWorkbook wb=commentServiceImpl.getHSSFWorkbook();
            wb.write(out1);
            out1.close();
            String opt="导出文章信息";
            baseServiceImpl.updateOpt(opt,request);
        } catch (Exception e) {
             e.getMessage();
        }
        return "forward:/admin/comment/listByPage";
    }

    /**
     * 添加前级联查询
     * @param request
     * @return
     */
    @RequestMapping("admin/comment/insertPre")
    public String insertPre(HttpServletRequest request){
        List<Blog> blogs = blogServiceImpl.list();
        request.setAttribute("blogs",blogs);
        return "forward:/admin/comment/insert.jsp";
    }

    /***
     * 添加数据
     * @param comment
     * @return
     */
    @RequestMapping("admin/comment/insert")
    public String insert(Comment comment,HttpServletRequest request){
        int i=commentServiceImpl.insert(comment);
        String opt="添加文章";
        baseServiceImpl.updateOpt(opt,request);
        return "forward:/admin/comment/listByPage";
    }

    @RequestMapping("admin/comment/updatePre")
    public String updatePre(@Param("commentId")  String commentId,HttpServletRequest request){
        Comment comment=commentServiceImpl.selectCommentById(commentId);
        List<Blog> blogs = blogServiceImpl.list();
        request.setAttribute("blogs",blogs);
        request.setAttribute("comment",comment);
        return "forward:/admin/comment/update.jsp";
    }


    /**
     * 更新
     * @param comment
     * @return
     */
    @RequestMapping("admin/comment/update")
    public String update(Comment comment,HttpServletRequest request){
        int i=commentServiceImpl.update(comment);
        if (i>0){
            String opt="更新文章"+comment.getContent();
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:/admin/comment/listByPage";
    }


    /**
     * 通过编号批量删除
     * @param request
     * @return
     */
    @RequestMapping("admin/comment/deleteBatchByNos")
    public String deleteBatchByNos(HttpServletRequest request){
        //获取编号的集合
        String[] selectFlags = request.getParameterValues("selectFlag");
        //删除
        int i=commentServiceImpl.deleteBatchByNos(selectFlags);
        if (i>0){
            System.out.println("删除成功");
            String opt="删除文章";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:/admin/comment/listByPage";
    }




    /**
     * 分页查询，带模糊查询
     * @param request
     * @param currentPage
     * @param commentId
     * @return
     */
    @RequestMapping("admin/comment/listByPage")
    public String listByPage(HttpServletRequest request, @Param("currentPage") Integer currentPage ,@Param("commentId")  String commentId){
        if (commentId==null){
            commentId="";
        }
        List<Comment> comments = commentServiceImpl.listComment(commentId);
        int len = comments.size();//数据总条数
        int pageSize=5;//每页长度
        int totalSize=len/pageSize+1;//总页数
        request.setAttribute("totalSize",totalSize);
        request.setAttribute("pageSize",pageSize);
        if (currentPage==null){
            currentPage=1;
        }
        request.setAttribute("currentPage",currentPage);
        int start=pageSize*(currentPage-1);
        List<Comment> list;
        int end=0;
        if (len>pageSize*currentPage){
            end=pageSize*currentPage;
            list= comments.subList(start, end);
        }else {
            list= comments.subList(start,len);
        }
        request.setAttribute("list",list);
        request.setAttribute("commentId",commentId);
        return "forward:/admin/comment/listByPage.jsp";
    }

}
