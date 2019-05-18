package com.controller;

import com.pojo.Blog;
import com.pojo.User;
import com.service.BaseService;
import com.service.BlogService;
import com.service.UserService;
import com.util.Utils;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("admin/user/*")
public class AdminUserController {
    @Autowired
    private UserService userServiceImpl;
    @Autowired
    private BlogService blogServiceImpl;

    @Autowired
    private BaseService baseServiceImpl;

    /**
     *
     * @param request
     * @return
     */
    @RequestMapping("admin/user/operation")
    public String operation(HttpServletRequest request){
        List<User> userList=userServiceImpl.selectUserList();
        request.setAttribute("userList",userList);
        return "forward:/admin/loginfo/operation.jsp";
    }

    @RequestMapping("admin/user/list")
    public String list(HttpServletRequest request){
        List<User> userList= userServiceImpl.selectUserAll();
        request.setAttribute("userList",userList);
        return "forward:/admin/user/list.jsp";
    }



    @RequestMapping("admin/user/deleteBatch")
    public String deleteBath(HttpServletRequest request){
        String[] userIds = request.getParameterValues("selectFlag");
        boolean b=userServiceImpl.deleteBatch(userIds);
        if (b){
            String opt="删除用户";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:/admin/user/list";
    }

    @RequestMapping("admin/user/insertPre")
    public String insertPre(HttpServletRequest request){
        List<Blog> list = blogServiceImpl.list();
        request.setAttribute("list",list);
        return "forward:/admin/user/insert.jsp";
    }

    @RequestMapping("admin/user/insert")
    public String insert(String userId,String userName,String blogId,HttpServletRequest request){
        User user=new User(userId,userName,blogId);
        int i=userServiceImpl.insertUser(user);
        if (i>0){
            String opt="添加用户"+user.getUserId();
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:/admin/user/list";
    }



    @RequestMapping("admin/user/importOutExcel")
    public String importOutExcel(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=" + "data.xls");
        try {
            ServletOutputStream out1 = response.getOutputStream();
            HSSFWorkbook wb=userServiceImpl.getHSSFWorkbook();
            wb.write(out1);
            out1.close();
            String opt="导出用户表为excel";
            baseServiceImpl.updateOpt(opt,request);
        } catch (Exception e) {
            e.getMessage();
        }
        return "forward:/admin/user/list";
    }


    @RequestMapping("admin/user/importImg")
    public String importImg(String userId,HttpServletRequest request){
        request.setAttribute("userId",userId);
        return "forward:/admin/user/import.jsp";
    }


    @RequestMapping("admin/user/updateImg")
    public String updateImg(String userId, MultipartFile file, HttpServletRequest request){
        boolean b = baseServiceImpl.updateImg(userId, file, request);
        if (b){
            String opt="用户更新头像";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:/admin/user/list";
    }


    @RequestMapping("admin/user/admin2user")
    public String admin2user(String userId,HttpServletRequest request){
        int i=userServiceImpl.updateadmin2user(userId);
        //request.getSession().invalidate();
        String opt="取消用户"+userId+"的管理员权限";
        baseServiceImpl.updateOpt(opt,request);
        return "forward:/admin/user/list";
    }


    @RequestMapping("admin/user/user2admin")
    public String user2admin(String userId,HttpServletRequest request){
        int i=userServiceImpl.updateuser2admin(userId);
        String opt="增加用户"+userId+"的管理员权限";
        baseServiceImpl.updateOpt(opt,request);
        return "forward:/admin/user/list";
    }


    @RequestMapping("admin/user/updatepassword")
    public String updatepassword(String password,String password1,HttpServletRequest request, HttpServletResponse response){
        boolean b = baseServiceImpl.updatepassword(password, password1, request, response);
        if (b){
            String opt="修改密码成功";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "/admin/password/modifypasswordfirst";
    }


}
