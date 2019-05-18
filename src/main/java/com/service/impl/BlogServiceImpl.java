package com.service.impl;

import com.mapper.BlogMapper;
import com.pojo.Blog;
import com.pojo.User;
import com.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;
    @Override
    public List<Blog> list() {
        return blogMapper.list();
    }


    @Override
    public int insertBlog(Blog blog) {
        return blogMapper.insertBlog(blog);
    }

    @Override
    public Blog selectBlogById(Integer id) {
        return blogMapper.selectBlogById(id);
    }

    @Override
    public int updateBlog(Blog blog) {
        return blogMapper.updateBlog(blog);
    }

    @Override
    public int deleteBlogById(Integer id) {
        return blogMapper.deleteBlogById(id);
    }



}
