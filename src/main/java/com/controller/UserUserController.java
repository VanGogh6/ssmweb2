package com.controller;

import com.pojo.User;
import com.service.BaseService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user/user/*")
public class UserUserController {
    @Autowired
    private UserService userServiceImpl;
    @Autowired
    private BaseService baseServiceImpl;

    @RequestMapping("updatePre")
    public String updatePre(HttpServletRequest request, Model model){
        User user=(User)request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        return "forward:update.jsp";
    }

    @RequestMapping("update")
    public String update(User user,HttpServletRequest request){
        User u =(User) request.getSession().getAttribute("user");
        user.setUserId(u.getUserId());
        int i=userServiceImpl.update(user);
        String opt="用户"+u.getUserId()+"修改信息";
        baseServiceImpl.updateOpt(opt,request);
        return "forward:updatePre";
    }

    @RequestMapping("updateImg")
    public String updateImg(MultipartFile file, HttpServletRequest request){
        User u =(User) request.getSession().getAttribute("user");
        String userId=u.getUserId();
        boolean b = baseServiceImpl.updateImg(userId, file, request);
        if (b){
            String opt="用户"+userId+"更新头像";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:update.jsp";
    }

    @RequestMapping("updatepassword")
    public String updatepassword(String password,String password1,HttpServletRequest request, HttpServletResponse response){
        boolean b = baseServiceImpl.updatepassword(password, password1, request, response);
        if (b){
            String opt="修改密码成功";
            baseServiceImpl.updateOpt(opt,request);
        }
        return "forward:/user/password/modifypasswordfirst.jsp";
    }
}
