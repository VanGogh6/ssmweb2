package com.controller;

import com.pojo.LogInfo;
import com.pojo.User;
import com.service.BaseService;
import com.service.LoginService;
import com.service.LoginfoService;
import com.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 登录相关的操作控制器
 */
@Controller
@RequestMapping("login/*")
public class LoginController {
    @Resource
    private LoginService loginServiceImpl;
    @Autowired
    private LoginfoService loginfoServiceImpl;
    @Autowired
    private BaseService baseServiceImpl;

    /**
     * 验证码
     * @param request
     * @param response
     */
    @RequestMapping("/login/image")
    public void loginImg(HttpServletRequest request, HttpServletResponse response){
        BufferedImage bi=new BufferedImage(78, 30,BufferedImage.TYPE_INT_RGB);//创建图像缓冲区
        Graphics g=bi.getGraphics(); //通过缓冲区创建一个画布
        Color c=new Color(192,192,192); //创建颜色
        /*根据背景画了一个矩形框
         */
        g.setColor(c);//为画布创建背景颜色
        g.fillRect(0, 0, 78,30); //fillRect:填充指定的矩形
        g.setFont(new Font("Times New Roman",Font.PLAIN,22));
        char[] ch="ABCDEFGHJKMNPQRSTUVWXYZ23456789".toCharArray();//转化为字符型的数组
        Random r=new Random();
        int len=ch.length;
        int index; //index用于存放随机数字
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<4;i++)
        {
            index=r.nextInt(len);//产生随机数字
            g.setColor(new Color(r.nextInt(88),r.nextInt(188),r.nextInt(255)));  //设置颜色
            g.drawString(ch[index]+"",(i*15)+10, 22);//画数字以及数字的位置
            sb.append(ch[index]);
        }
        request.getSession().setAttribute("code",sb.toString()); //将数字保留在session中，便于后续的使用
        try {
            ImageIO.write(bi, "JPG", response.getOutputStream());
        }catch (Exception e){
            e.getMessage();
        }
    }



    /**
     * 登录验证
     * @param req
     * @param model 记录session，标志登录状态
     * @return 根据登录信息的权限返回不同的用户页面
     */
    @RequestMapping("/login/login")
    public String userLogin(HttpServletRequest req, Model model,User user){
        try {
            String password= Utils.getMD5(user.getPassWord());
            user.setPassWord(password);
        }catch (Exception e){
            e.getMessage();
        }
        User u=loginServiceImpl.login(user);
        String code = (String)req.getSession().getAttribute("code");
        String verifyCode = req.getParameter("verifyCode");
        //&&code.equalsIgnoreCase(verifyCode)
        if(u!=null){
            LogInfo logInfo=new LogInfo();
            logInfo.setUserId(user.getUserId());
            SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            logInfo.setLogintime(sdf.format(new Date()));
            int i=loginfoServiceImpl.insertLoginfo(logInfo);
            req.getSession().setAttribute("user",u);
            String opt="在ip地址"+req.getRemoteAddr()+"登录";
            boolean b = baseServiceImpl.updateOpt(opt, req);
            int level=u.getUserLevel();
            if (level==User.IS_ADMIN){
                return "redirect:/admin/index.jsp";
            }else if(level==User.IS_USER){
                return "redirect:/user/index.jsp";
            }
        }
        model.addAttribute("msg","密码错误或验证码错误！");
        return "redirect:/login.jsp";
    }


    /**
     * Ajax查看用户是否存在，密码是否正确
     * @param req
     * @return 返回用户的json数据
     */
    @RequestMapping("/login/check")
    @ResponseBody
    public String isUser(HttpServletRequest req){
        try {
            req.setCharacterEncoding("utf-8");
        }catch (Exception e){
            e.getMessage();
        }
        User u=new User();
        String userId=req.getParameter("userId");
        u.setUserId(userId);
        User user=loginServiceImpl.login(u);
        return user.toString();
    }


    /**
     * 退出登录使用
     * @param req 请求对象
     * @return 回到登录页面
     */
    @RequestMapping("/login/logout")
    public String loginout(HttpServletRequest req){
        String opt="退出登录";
        baseServiceImpl.updateOpt(opt,req);
        req.getSession().invalidate();
        return "redirect:/login.jsp";
    }


}
