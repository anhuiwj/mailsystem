package com.ah.manager.service.Impl;

import com.ah.manager.mapper.SysXDictMapper;
import com.ah.manager.pojo.SysXDict;
import com.ah.manager.service.SysXDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;

/**
 * Created by wangjie on 17/1/6.
 */
@Service
public class SysXDictServiceImpl implements SysXDictService {

    @Autowired
    private SysXDictMapper sysXDictMapper;

    @Override
    public List<SysXDict> findById(String id) {
        List<SysXDict> list = Arrays.asList();
        if(!StringUtils.isEmpty(id)){
            list = sysXDictMapper.findById(id);
        }
        return list;
    }

    @Override
    public SysXDict findByCode(String id,String code) {
        SysXDict sysXDict = new SysXDict();
        if(!StringUtils.isEmpty(id)&&!StringUtils.isEmpty(code)){
            sysXDict.setId(id);
            sysXDict.setCode(code);
            sysXDict = sysXDictMapper.findByCode(sysXDict);
        }
        return sysXDict;
    }
}
