package com.service.impl;

import com.mapper.LoginMapper;
import com.mapper.UserMapper;
import com.pojo.User;
import com.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class LoginServiceImpl  implements LoginService {

    @Resource
    private LoginMapper loginMapper;

    @Override
    public User login(User user) {
        return loginMapper.login(user);
    }
}
