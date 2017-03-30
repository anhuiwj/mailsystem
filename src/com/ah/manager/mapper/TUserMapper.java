package com.ah.manager.mapper;

import com.ah.manager.pojo.TUser;

import java.util.List;
import java.util.Map;

public interface TUserMapper {

    List<TUser> findAll(Map<String,Object> map);

    int save(TUser user);

    TUser findByUserCode(String userCode);

    TUser findById(String id);

    int update(TUser user);

    int delete(String id);

    List<TUser> findUsers();
}