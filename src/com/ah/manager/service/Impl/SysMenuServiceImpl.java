package com.ah.manager.service.Impl;

import com.ah.manager.mapper.SysMenuMapper;
import com.ah.manager.pojo.SysMenu;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.service.SysMenuService;
import com.ah.manager.util.CommonUtil;
import com.ah.manager.util.IdGen;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/**
 * Created by wangjie on 17/1/5.
 */
@Service
@Transactional
public class SysMenuServiceImpl implements SysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public List<SysMenu> findMenusByTree() {
        List<SysMenu> menus =  sysMenuMapper.findAll();
        List<SysMenu> tree = convertTree(menus);
        List<SysMenu> rs = Lists.newArrayList();
        for (SysMenu m : tree) {
            convertList(rs, m);
        }
        return rs;
    }

    @Override
    public List<SysMenu> findAll() {
        List<SysMenu> menus =  sysMenuMapper.findAll();
        List<SysMenu> tree = convertTree(menus);
        return tree;
    }

    @Override
    public List<SysMenu> findMenu() {
        List<SysMenu> menus =  sysMenuMapper.findMenu();
        List<SysMenu> tree = convertTree(menus);
        return tree;
    }

    @Override
    public SysMenu findById(String id) {
        return sysMenuMapper.findById(id);
    }

    @Override
    public JsonResponseEntity delete(String id) {
        JsonResponseEntity response = new JsonResponseEntity();
        List<SysMenu> sysMenus = sysMenuMapper.findChildren(id);
        try {
            if(sysMenus.size()>0){
                response.setCode(110);
                response.setMsg(CommonUtil.ADD_MENU_ERROS);
            }else {
                sysMenuMapper.delete(id);
                response.setCode(200);
                response.setMsg(CommonUtil.DEL_SUCCESS);
            }
        }catch (Exception e){
            response.setCode(-1);
            response.setMsg(CommonUtil.DEL_ERROR);
        }

        return response;
    }

    @Override
    public void save(SysMenu sysMenu) {
        if(StringUtils.isEmpty(sysMenu.getId())){
            sysMenu.setId(IdGen.uuid());
            sysMenuMapper.insert(sysMenu);
        }else {
            sysMenuMapper.update(sysMenu);
        }
    }

    @Override
    public List<SysMenu> findUserId(String userId) {
        List<SysMenu> menus = sysMenuMapper.findByUserId(userId);
        List<SysMenu> tree = convertTree(menus);
        return tree;
    }

    //根据查询结果区分上下级关系
    private List<SysMenu> convertTree(List<SysMenu> list) {
        Map<String, SysMenu> map = Maps.newHashMap();
        for (SysMenu m : list) {
            map.put(m.getId(), m);
        }
        List<SysMenu> tree = Lists.newArrayList();
        for (SysMenu m : list) {
            if (StringUtils.isBlank(m.getPid()) || "0".equals(m.getPid())) {
                tree.add(m);
            } else {
                SysMenu pMenu = map.get(m.getPid());
                if (pMenu == null) {
                    tree.add(m);
                } else {
                    List<SysMenu> children = pMenu.getChildren();
                    if (children == null) {
                        children = Lists.newArrayList();
                        pMenu.setChildren(children);
                    }
                    children.add(m);
                    Collections.sort(children, new Comparator<SysMenu>() {
                        @Override
                        public int compare(SysMenu o1, SysMenu o2) {
                            int s1 = o1.getSort();
                            int s2 = o2.getSort();
                            return s1 - s2;
                        }
                    });
                }
            }
        }
        Collections.sort(tree, new Comparator<SysMenu>() {
            @Override
            public int compare(SysMenu o1, SysMenu o2) {
                int s1 = o1.getSort();
                int s2 = o2.getSort();
                return s1 - s2;
            }
        });
        return tree;
    }

    /**
     * 递归菜单
     * @param list
     * @param m
     */
    private void convertList(List<SysMenu> list, SysMenu m) {
        list.add(m);
        if (m.getChildren() != null && m.getChildren().size() > 0) {
            for (SysMenu tmp : m.getChildren()) {
                convertList(list, tmp);
            }
        }
    }
}
