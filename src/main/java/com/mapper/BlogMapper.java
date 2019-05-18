package com.mapper;

import com.pojo.Blog;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BlogMapper {

    List<Blog> list();

    int insertBlog(Blog blog);

    Blog selectBlogById(Integer id);

    int updateBlog(Blog blog);

    int deleteBlogById(Integer id);

}
