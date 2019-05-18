package com.service.impl;

import com.mapper.CommentMapper;
import com.pojo.Comment;
import com.service.CommentService;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;


    @Override
    public List<Comment> listComment(String commentId) {
        //查询出全部数据
        List<Comment> comments = commentMapper.listComment(commentId);
        return comments;
    }

    @Override
    public int insert(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    /**
     * 导出数据为excel
     * @return
     */
    @Override
    public HSSFWorkbook getHSSFWorkbook() {
        List<Comment> comments = commentMapper.listComment("");
        HSSFWorkbook wb = new HSSFWorkbook();
        String[] title = {"序号" ,"评论编号", "评论内容", "评论时间", "博客名称"};
        String sheetName = "信息一览";
        Sheet stuSheet = wb.createSheet(sheetName);
        Row titleRow = stuSheet.createRow(0);
        CellStyle style = wb.createCellStyle();
        Cell cell = null;
        for (int i = 0; i < title.length; i++) {
            cell = titleRow.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }
        Row row = null;
        for (int i = 0; i < comments.size(); i++) {
            row = stuSheet.createRow(i + 1);
            row.createCell(0).setCellValue(i + 1);
            row.createCell(1).setCellValue(comments.get(i).getCommentId());
            row.createCell(2).setCellValue(comments.get(i).getContent());
            row.createCell(3).setCellValue(comments.get(i).getDateTime());
            row.createCell(4).setCellValue(comments.get(i).getBlog().getBlogName());
            for (int j = 0; j < title.length; j++) {
                stuSheet.autoSizeColumn(j, true);
                stuSheet.setColumnWidth(j, stuSheet.getColumnWidth(j) * 15 / 10);
            }
        }
        return wb;
    }



    /**
     * 从表格批量添加数据
     * @param is
     * @return
     */
    @Override
    public boolean insertFromExcel(InputStream is) {
        boolean flag = true;
        int count=0;
        try {
            HSSFWorkbook wb = new HSSFWorkbook(is);
            HSSFSheet studentSheet = wb.getSheetAt(0);
            for (Row row : studentSheet) {
                if (row.getRowNum() < 1) {
                    continue;
                }
                int no = (int)row.getCell(0).getNumericCellValue();
                String content = row.getCell(1).toString().trim();
                String dateTime = row.getCell(2).toString().trim();
                String blogId = row.getCell(3).toString().trim();
                Comment comment = new Comment(no, content, dateTime, blogId);
                int j = commentMapper.insertComment(comment);
                count=count+j;
            }
            if(count>0){
                flag=true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Comment selectCommentById(String commentId) {
        return commentMapper.selectCommentById(commentId);
    }

    @Override
    public int update(Comment comment) {
        return commentMapper.update(comment);
    }

    @Override
    public int deleteBatchByNos(String[] selectFlags) {
        int count=0;
        for (int i = 0; i <selectFlags.length ; i++) {
            String commentId=selectFlags[i];
            int index=commentMapper.delete(commentId);
            count=count+index;
        }
        return count;
    }

    @Override
    public List<Comment> selectCommentListByBlogId(String blogId) {
        return commentMapper.selectCommentListByBlogId(blogId);
    }

    @Override
    public List<Comment> selectCommentLikeId(Comment comment) {
        return commentMapper.selectCommentLikeId(comment);
    }
}
