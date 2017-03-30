package com.ah.manager.service;

import com.ah.manager.common.page.model.Pager;
import com.ah.manager.pojo.TUser;

import java.util.List;

/**
 * Created by wangjie on 16/11/29.
 */
public interface UserService {
    /**
     *查询所有用户
     */
    void findAll(Pager pager);

    void save(TUser user);

    TUser findByUserCode(String userCode);

    TUser findById(String id);

    void delete(String id);

    List<TUser> findUsers();
}
