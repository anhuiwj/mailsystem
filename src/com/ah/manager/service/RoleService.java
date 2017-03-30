package com.ah.manager.service;

import com.ah.manager.common.page.model.Pager;
import com.ah.manager.pojo.TRole;
import com.ah.manager.pojo.TUser;
import com.ah.manager.pojo.TUserRole;

/**
 * Created by wangjie on 16/11/30.
 */
public interface RoleService {
    void findAll(Pager pager);
    void findAll2(Pager pager);
    int save(TRole role);
    TRole findOne(String id);

    int saveUserRole(TUserRole user);

    int deleteUser(String id);
}
