package com.ah.manager.mapper;

import com.ah.manager.pojo.TRoleMenu;

public interface TRoleMenuMapper {

    int save(TRoleMenu record);

    int updateByExample(TRoleMenu roleMenu);

    int delete(String roleId);
}