package com.ah.manager.controller;

import com.ah.manager.common.page.model.Pager;
import com.ah.manager.pojo.TRole;
import com.ah.manager.pojo.TUser;
import com.ah.manager.pojo.TUserRole;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.service.RoleService;
import com.ah.manager.service.SysMenuService;
import com.ah.manager.util.CommonUtil;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wangjie on 16/11/30.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private SysMenuService sysMenuService;

    @RequestMapping("/index")
    public String index(Model model){
        return "sys/role";
    }

    @RequestMapping("/getData")
    @ResponseBody
    public JsonResponseEntity<Pager> getData(@RequestParam(required = false) String dtGridPager){
        JsonResponseEntity<Pager> response = new JsonResponseEntity<Pager>();
        Pager pager = new Gson().fromJson(dtGridPager, Pager.class);
        if (pager != null) {
            Map<String, Object> searchParam = pager.getParameters(); //查询参数
//            searchParam.put("user",getCurrentUser().getId());
            pager.setParameters(searchParam);
            roleService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }

    @RequestMapping("/getData2")
    @ResponseBody
    public JsonResponseEntity<Pager> getData2(@RequestParam(required = false) String dtGridPager){
        JsonResponseEntity<Pager> response = new JsonResponseEntity<Pager>();
        Pager pager = new Gson().fromJson(dtGridPager, Pager.class);
        if (pager != null) {
            Map<String, Object> searchParam = pager.getParameters(); //查询参数
//            searchParam.put("user",getCurrentUser().getId());
            pager.setParameters(searchParam);
            roleService.findAll2(pager);
        }
        response.setData(pager);
        return response;
    }

    @RequestMapping("/add")
    public String add(Model model,String id){
        model.addAttribute("list", sysMenuService.findMenusByTree());
        model.addAttribute(roleService.findOne(id));
        return "sys/roleAdd";
    }

    @RequestMapping("/addUser")
    public String addUser(Model model,String roleId){
        model.addAttribute("roleId",roleId);
        return "sys/roleAddUser";
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity save(TRole role){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            roleService.save(role);
            response.setMsg("保存成功");
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg("保存失败");
        }
        return response;
    }

    @RequestMapping(value = "/saveUserRole",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity saveUserRole(TUserRole tUserRole){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            roleService.saveUserRole(tUserRole);
            response.setMsg("保存成功");
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg("保存失败");
        }
        return response;
    }

    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public JsonResponseEntity deleteUser(String id ){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            roleService.deleteUser(id);
            response.setMsg(CommonUtil.DEL_SUCCESS);
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.DEL_ERROR);
        }
        return response;
    }

}
