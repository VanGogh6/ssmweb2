package com.service;

import com.pojo.LogInfo;

import java.util.List;

public interface LoginfoService {

    List<LogInfo> selectInfoList();

    int insertLoginfo(LogInfo logInfo);
}
