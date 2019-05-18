package com.pojo;

import com.util.Utils;

/**
 * author wufan
 */
public class User {
    /**
     * 管理员
     */
    public static final int IS_ADMIN=1;
    /**
     * 普通用户
     */
    public static final int IS_USER=2;

    //用户账号
    private String userId;
    //用户密码
    private String passWord;
    //用户姓名
    private String userName;
    //图片地址
    private String imgUrl;
    //用户等级
    private int userLevel;
    private String opt;
    private String blogId;

    private Blog blog;

    public String getOpt() {
        return opt;
    }

    public void setOpt(String opt) {
        this.opt = opt;
    }

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(int userLevel) {
        this.userLevel = userLevel;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public User() {
    }

    public User(String userId, String userName,String blogId) {
        this.userId = userId;
        this.userName = userName;
        this.blogId=blogId;
        try {
            this.passWord = Utils.getMD5("1");
        }catch (Exception e){

        }
        this.imgUrl = "lolo.jpg";//默认头像
        this.userLevel = 2;//普通用户
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", passWord='" + passWord + '\'' +
                ", userName='" + userName + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", userLevel=" + userLevel +
                ", opt='" + opt + '\'' +
                ", blogId='" + blogId + '\'' +
                ", blog=" + blog +
                '}';
    }
}
