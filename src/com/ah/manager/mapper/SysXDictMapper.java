package com.ah.manager.mapper;

import com.ah.manager.pojo.SysXDict;
import com.ah.manager.pojo.SysXDictKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysXDictMapper {

    List<SysXDict> findById(String id);
    SysXDict findByCode(SysXDict sysXDict);
}