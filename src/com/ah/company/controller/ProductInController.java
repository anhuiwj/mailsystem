package com.ah.company.controller;

import com.ah.company.pojo.InMaterial;
import com.ah.company.service.ProductInService;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
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
 * Created by wangjie on 2017/3/18.
 * 进货管理
 */
@Controller
@RequestMapping("/productIn")
public class ProductInController {

    @Autowired
    private ProductInService productInService;

    @RequestMapping("/index")
    public String index(){
        return "productIn/list";
    }

    @RequestMapping("add")
    public String add(String id, Model model){
        model.addAttribute("id",id);
        return "productIn/add";
    }

    /**
     * 查询进货数据
     * @param dtGridPager
     * @return
     */
    @RequestMapping("/getData")
    @ResponseBody
    public JsonResponseEntity<Pager> getData(@RequestParam(required = false) String dtGridPager){
        JsonResponseEntity<Pager> response = new JsonResponseEntity<Pager>();
        Pager pager = new Gson().fromJson(dtGridPager, Pager.class);
        if (pager != null) {
            Map<String, Object> searchParam = pager.getParameters(); //查询参数
//            searchParam.put("user",getCurrentUser().getId());
            pager.setParameters(searchParam);
            productInService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity save(InMaterial inMaterial){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            productInService.save(inMaterial);
            response.setMsg(CommonUtil.ADD_SUCCESS);
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.ADD_ERROR);
        }
        return response;
    }

}
