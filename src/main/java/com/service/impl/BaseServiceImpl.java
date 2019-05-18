package com.service.impl;

import com.mapper.UserMapper;
import com.pojo.User;
import com.service.BaseService;
import com.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class BaseServiceImpl implements BaseService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean updatepassword(String password, String password1, HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter o = response.getWriter();
            User user=(User)request.getSession().getAttribute("user");
            if (Utils.getMD5(password).equals(user.getPassWord())){
                String userId = user.getUserId();
                User u =new User();
                u.setUserId(userId);
                u.setPassWord(Utils.getMD5(password1));
                int i=userMapper.updatePassWord(u);
                if (i>0){
                    return true;
                }
            }else {
                request.setAttribute("msg","原密码错误");
            }
        }catch(Exception e){}
        return false;
    }

    public boolean updateOpt(String optStr, HttpServletRequest request){
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date ="("+ sdf.format(new Date())+")";
        User user=(User)request.getSession().getAttribute("user");
        System.out.println(user);
        User u=userMapper.selectUserOptByUserId(user.getUserId());
        String uOpt = u.getOpt();
        optStr=uOpt+"--"+optStr+date;
        user.setOpt(optStr);
        int i=userMapper.updateUserOptByUser(user);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean updateImg(String userId, MultipartFile file, HttpServletRequest request) {
        System.out.println(userId);
        try {
            InputStream is = file.getInputStream();
            String uuid= UUID.randomUUID().toString().replaceAll("-","");
            String fileEndName = file.getOriginalFilename();
            String[] sp = fileEndName.split("\\.");
            String fileName=uuid+"."+sp[1];
            String realPath=request.getSession().getServletContext().getRealPath("/")+"static/upload/"+fileName;
            System.out.println("realPath:"+realPath);
            File f =new File(realPath);
            file.transferTo(f);
            User user=new User();
            user.setUserId(userId);
            user.setImgUrl(fileName);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
