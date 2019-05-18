package com.service;
import com.pojo.Blog;
import com.pojo.Comment;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.InputStream;
import java.util.List;

public interface CommentService {

    List<Comment>  listComment(String commentId);

    int insert(Comment comment);

    /**
     * 获取HSSFWorkbook
     * @return
     */
    HSSFWorkbook getHSSFWorkbook();

    /**
     * 从表格批量添加数据
     * @param is
     * @return
     */
    boolean insertFromExcel(InputStream is);

    Comment selectCommentById(String commentId);

    int update(Comment comment);

    int deleteBatchByNos(String[] selectFlags);

    List<Comment> selectCommentListByBlogId(String blogId);

    List<Comment> selectCommentLikeId(Comment comment);
}
