package com.ah.manager.service.Impl;

import com.ah.manager.mapper.SysMenuMapper;
import com.ah.manager.pojo.SysMenu;
import com.ah.manager.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wangjie on 17/1/9.
 */
@Service
public class AuthServiceImpl implements AuthService{

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public List<SysMenu> findByUserId(String id) {
        return sysMenuMapper.findByUserId(id);
    }
}
