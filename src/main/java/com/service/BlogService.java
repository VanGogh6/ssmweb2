package com.service;

import com.pojo.Blog;
import com.pojo.User;

import java.util.List;

public interface BlogService {
    /**
     * 查询全部blog的信息
     * @return
     */
    List<Blog> list();

    int insertBlog(Blog blog);

    Blog selectBlogById(Integer id);

    int updateBlog(Blog blog);

    int deleteBlogById(Integer id);

}
