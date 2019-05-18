package com.pojo;


/**
 * Comment博客评论表
 */
public class Comment {
    public static final int PAGE_SIZE = 5;
    /**
     * 主键
     */
    private Integer commentId;

    /**
     * 评论的内容 id  content  dateTime blogId
     */
    private String content;
    /**
     * 评论的时间
     */
    private String dateTime;

    private String blogId;

    private Blog blog;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public Comment() {
    }

    public Comment(Integer commentId, String content, String dateTime, String blogId) {
        this.commentId = commentId;
        this.content = content;
        this.dateTime = dateTime;
        this.blogId = blogId;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", content='" + content + '\'' +
                ", dateTime='" + dateTime + '\'' +
                ", blogId='" + blogId + '\'' +
                ", blog=" + blog +
                '}';
    }
}
