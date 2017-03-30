package com.ah.manager.service;

import com.ah.manager.pojo.SysXDict;

import java.util.List;

/**
 * Created by wangjie on 17/1/6.
 */
public interface SysXDictService {
    List<SysXDict> findById(String id);
    SysXDict findByCode(String id,String code);
}
