package com.mapper;

import com.pojo.User;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserMapper {

    @Select("select opt from user where userId=#{userId}")
    User selectUserOptByUserId(String userId);

    User selectUser(User user);

    List<User> selectUserAll();

    int insertUser(User user);

    int delete(String userId);

    @Update("update user set userLevel=2 where userId=#{userId}")
    int updateadmin2user(String userId);

    @Update("update user set userLevel=1 where userId=#{userId}")
    int updateuser2admin(String userId);

    int updatePassWord(User user);

    @Select("select userId,opt from user")
     List<User> selectUserList();

    @Update("update user set opt=#{opt} where userId=#{userId}")
    int updateUserOptByUser(User user);

    @Update("update user set userName=#{userName},opt=#{opt} where userId=#{userId}")
    int update(User user);
}
