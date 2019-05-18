package com.mapper;

import com.pojo.LogInfo;

import java.util.List;

public interface LogInfoMapper {

    List<LogInfo> selectInfoList();

    int insertLoginfo(LogInfo logInfo);
}
