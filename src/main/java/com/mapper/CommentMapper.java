package com.mapper;

import com.pojo.Comment;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface CommentMapper {

    List<Comment> listComment(@Param("commentId")String commentId);

    int insertComment(Comment comment);

    Comment selectCommentById(String commentId);

    int update(Comment comment);

    int delete(String commentId);

    List<Comment> selectCommentListByBlogId(@Param("blogId") String blogId);

    List<Comment> selectCommentLikeId(Comment comment);
}
