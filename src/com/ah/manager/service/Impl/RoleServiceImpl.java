package com.ah.manager.service.Impl;

import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.mapper.SysMenuMapper;
import com.ah.manager.mapper.TRoleMapper;
import com.ah.manager.mapper.TRoleMenuMapper;
import com.ah.manager.mapper.TUserRoleMapper;
import com.ah.manager.pojo.*;
import com.ah.manager.service.RoleService;
import com.ah.manager.util.IdGen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangjie on 16/11/30.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private TRoleMapper tRoleMapper;

    @Autowired
    private TRoleMenuMapper tRoleMenuMapper;

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private TUserRoleMapper tUserRoleMapper;

    public void findAll(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(tRoleMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    public void findAll2(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(tRoleMapper.findAll2(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    public int save(TRole role) {
        TRoleMenu tRoleMenu = null;
        if(!StringUtils.isEmpty(role.getId())){
            tRoleMapper.update(role);
        }else {
            role.setId(IdGen.uuid());
            tRoleMapper.insert(role);
        }

        tRoleMenuMapper.delete(role.getId());
        for(String menuId:role.getMenus()){
            tRoleMenu = new TRoleMenu();
            tRoleMenu.setRoleId(role.getId());
            tRoleMenu.setMenuId(menuId);
            tRoleMenu.setDelFlag("0");
            tRoleMenuMapper.save(tRoleMenu);
        }
        return 0;
    }

    @Override
    public TRole findOne(String id) {
        TRole tRole = new TRole();
        if(!StringUtils.isEmpty(id)){
            tRole = tRoleMapper.findOne(id);
            tRole.setSysMenus(sysMenuMapper.selectRoleMenu(id));
            List<String> menus = new ArrayList<String>();
            for(SysMenu sysMenu:tRole.getSysMenus()){
                menus.add(sysMenu.getId());
            }
            tRole.setMenus(menus);

        }
        return tRole;
    }

    @Override
    public int saveUserRole(TUserRole user) {
        user.setId(IdGen.uuid());
        return tUserRoleMapper.save(user);
    }

    @Override
    public int deleteUser(String id) {
        return tUserRoleMapper.delete(id);
    }
}
