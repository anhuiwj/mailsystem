package com.ah.manager.service;

import com.ah.manager.pojo.SysMenu;

import java.util.List;

/**
 * Created by wangjie on 17/1/9.
 */
public interface AuthService {
    List<SysMenu> findByUserId(String id);
}
