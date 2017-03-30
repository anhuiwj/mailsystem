package com.ah.manager.controller;

import com.ah.manager.pojo.SysMenu;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.service.SysMenuService;
import com.ah.manager.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wangjie on 17/1/9.
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController{

    @Autowired
    private SysMenuService sysMenuService;

    @RequestMapping("/index")
    public String index(Model model){
        model.addAttribute(sysMenuService.findMenusByTree());
        return "sys/menuList";
    }

    @RequestMapping("/form")
    public String form(String pid,String id,Model model){
        List<SysMenu> list = sysMenuService.findMenusByTree();
        model.addAttribute("list",list);
        model.addAttribute("showRoot",true);
        if (StringUtils.isNotBlank(id)) {
            model.addAttribute(sysMenuService.findById(id));
        } else if (StringUtils.isNotBlank(pid)) {
            SysMenu menu = new SysMenu();
            menu.setPid(pid);
            model.addAttribute(menu);
        }

        return "sys/menuForm";
    }
    @RequestMapping("/save")
    @ResponseBody
    public JsonResponseEntity save(SysMenu sysMenu){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            sysMenuService.save(sysMenu);
            response.setCode(200);
            response.setMsg(CommonUtil.ADD_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.ADD_ERROR);
        }
        return response;
    }
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResponseEntity delete(String  id){
        return sysMenuService.delete(id);
    }
}
