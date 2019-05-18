package com.service;

import com.pojo.User;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

public interface UserService {
    //查询单个用户
    User selectUser(User user);

    //查询所有用户
    List<User> selectUserAll();
    //插入数据
    int insertUser(User user);
    //批量删除
    boolean deleteBatch(String[] userIds);
    //获取工作簿
    HSSFWorkbook getHSSFWorkbook();

    //取消管理员权限
    int updateadmin2user(String userId);
    //设置为管理员权限
    int updateuser2admin(String userId);

    int updatePassWord(User u);

    List<User> selectUserList();

    int update(User user);
}
