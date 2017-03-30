package com.ah.manager.service;

import com.ah.manager.pojo.SysMenu;
import com.ah.manager.response.JsonResponseEntity;

import java.util.List;

/**
 * Created by wangjie on 17/1/5.
 */
public interface SysMenuService {
    List<SysMenu> findMenusByTree();
    List<SysMenu> findAll();
    List<SysMenu> findMenu();
    SysMenu findById(String id);

    JsonResponseEntity delete(String id);

    void save(SysMenu sysMenu);

    List<SysMenu> findUserId(String userId);
}
