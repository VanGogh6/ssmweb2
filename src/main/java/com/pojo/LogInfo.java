package com.pojo;

public class LogInfo {

    private int id;

    private String userId;

    private String logintime;

    private String opt;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLogintime() {
        return logintime;
    }

    public void setLogintime(String logintime) {
        this.logintime = logintime;
    }

    @Override
    public String toString() {
        return "LogInfo{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", logintime='" + logintime + '\'' +
                ", user=" + user +
                '}';
    }
}