package com.service.impl;

import com.mapper.UserMapper;
import com.pojo.User;
import com.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User selectUser(User user) {
        return userMapper.selectUser(user);
    }

    @Override
    public List<User> selectUserAll() {
        return userMapper.selectUserAll();
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public boolean deleteBatch(String[] userIds) {
        int count=0;
        for (int i = 0; i <userIds.length ; i++) {
            String userId= userIds[i];
            int j=userMapper.delete(userId);
            count=count+j;
        }
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public HSSFWorkbook getHSSFWorkbook() {
        List<User> userList= userMapper.selectUserAll();
        HSSFWorkbook wb = new HSSFWorkbook();
        String[] title = {"序号","账号" ,"姓名", "用户类型", "博客名称"};
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
        for (int i = 0; i < userList.size(); i++) {
            row = stuSheet.createRow(i + 1);
            row.createCell(0).setCellValue(i + 1);
            row.createCell(1).setCellValue(userList.get(i).getUserId());
            row.createCell(2).setCellValue(userList.get(i).getUserName());
            row.createCell(3).setCellValue(userList.get(i).getUserLevel()==1?"管理员":"普通用户");
            row.createCell(4).setCellValue(userList.get(i).getBlog().getBlogName());
            for (int j = 0; j < title.length; j++) {
                stuSheet.autoSizeColumn(j, true);
                stuSheet.setColumnWidth(j, stuSheet.getColumnWidth(j) * 15 / 10);
            }
        }
        return wb;
    }



    @Override
    public int updateadmin2user(String userId) {
        return userMapper.updateadmin2user(userId);
    }

    @Override
    public int updateuser2admin(String userId) {
        return userMapper.updateuser2admin(userId);
    }

    @Override
    public int updatePassWord(User u) {
        return userMapper.updatePassWord(u);
    }

    @Override
    public List<User> selectUserList() {
        return userMapper.selectUserList();
    }

    @Override
    public int update(User user) {
        return userMapper.update(user);
    }
}
