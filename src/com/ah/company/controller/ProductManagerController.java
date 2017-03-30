package com.ah.company.controller;

import com.ah.company.pojo.MakeProductNum;
import com.ah.company.service.ProductService;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.util.CommonUtil;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wangjie on 2017/3/16.
 * 配比产品
 */
@Controller
@RequestMapping("/product")
public class ProductManagerController{
    @Autowired
    private ProductService productService;

    @RequestMapping("/index")
    public String index(){
        return "productManager/productIndex";
    }

    @RequestMapping("add")
    public String add(){
        return "productManager/productMake";
    }

    /**
     * 查询生产产品历史数据
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
            productService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity save(MakeProductNum makeProductMaterial){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            response = productService.save(makeProductMaterial);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.ADD_ERROR);
        }
        return response;
    }

}
