package com.service;


import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BaseService {
    boolean updatepassword(String password,String password1,HttpServletRequest request, HttpServletResponse response);
    boolean updateOpt(String optStr, HttpServletRequest request);

    boolean updateImg(String userId, MultipartFile file, HttpServletRequest request);
}
