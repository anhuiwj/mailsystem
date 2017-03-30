package com.ah.manager.mapper;

import com.ah.manager.pojo.TUserRole;

public interface TUserRoleMapper {
    int save(TUserRole tUserRole);

    int delete(String userId);

}