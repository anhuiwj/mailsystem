package com.ah.manager.mapper;

import com.ah.manager.pojo.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysMenuMapper {
    /**
     * 插入
     * @param record
     * @return
     */
    int insert(SysMenu record);

    /**
     * 更新
     * @param record
     * @return
     */
    int update(SysMenu record);

    /**
     * 删除(逻辑删除)
     * @param id
     * @return
     */
    int delete(String id);

    List<SysMenu> findAll();
    List<SysMenu> findByUserId(String id);
    List<SysMenu> findMenu();

    SysMenu findById(String id);

    /**
     * 查询是否有下级菜单
     */
    List<SysMenu> findChildren(String pid);

    List<SysMenu> selectRoleMenu(String roleId);
}