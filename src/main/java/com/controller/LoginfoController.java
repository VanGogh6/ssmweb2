package com.controller;

import com.pojo.LogInfo;
import com.service.LoginfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("loginfo/user/*")
public class LoginfoController {
    @Autowired
    private LoginfoService loginfoServiceImpl;
    @RequestMapping("loginfo/user/list")
    public String loginfo(HttpServletRequest request){

        List<LogInfo> list=loginfoServiceImpl.selectInfoList();
        request.setAttribute("list",list);
        return "forward:/admin/loginfo/list.jsp";
    }
}
