package com.pojo;

/**
 * 博客表
 */
public class Blog {
    /**
     * 主键自增
     */
    private Integer id;
    /**
     * 博客账号
     */
    private String blogId;
    /**
     * 博客名称
     */
    private String blogName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId;
    }

    public String getBlogName() {
        return blogName;
    }

    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", blogId='" + blogId + '\'' +
                ", blogName='" + blogName + '\'' +
                '}';
    }
}
