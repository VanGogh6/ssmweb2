package com.service.impl;

import com.mapper.LogInfoMapper;
import com.mapper.LoginMapper;
import com.pojo.LogInfo;
import com.service.LoginfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginfoServiceImpl implements LoginfoService {
    @Autowired
    private LogInfoMapper logInfoMapper;
    @Override
    public List<LogInfo> selectInfoList() {
        return logInfoMapper.selectInfoList();
    }

    @Override
    public int insertLoginfo(LogInfo logInfo) {
        return logInfoMapper.insertLoginfo(logInfo);
    }
}
