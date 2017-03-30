package com.ah.company.controller;

import com.ah.company.pojo.Formula;
import com.ah.company.pojo.InMaterial;
import com.ah.company.pojo.RawMaterial;
import com.ah.company.service.ProductFormulaService;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wangjie on 2017/3/18.
 * 配比公式管理
 */
@Controller
@RequestMapping("/productFormula")
public class ProductFormulaController {

    @Autowired
    private ProductFormulaService productFormulaService;

    @RequestMapping("/index")
    public String index(){
        return "productFormula/list";
    }

    @RequestMapping("add")
    public String add(String id, Model model){
        if(!StringUtils.isEmpty(id)){
            model.addAttribute("id",id);
        }
        return "productFormula/add";
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
            productFormulaService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }

    /**
     * 查询进货数据
     * @param dtGridPager
     * @return
     */
    @RequestMapping("/getData2")
    @ResponseBody
    public JsonResponseEntity<Pager> getData2(@RequestParam(required = false) String dtGridPager){
        JsonResponseEntity<Pager> response = new JsonResponseEntity<Pager>();
        Pager pager = new Gson().fromJson(dtGridPager, Pager.class);
        if (pager != null) {
            Map<String, Object> searchParam = pager.getParameters(); //查询参数
//            searchParam.put("user",getCurrentUser().getId());
            pager.setParameters(searchParam);
            productFormulaService.findAll2(pager);
        }
        response.setData(pager);
        return response;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity save(Formula formula){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            productFormulaService.save(formula);
            response.setMsg("保存成功");
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg("保存失败");
        }
        return response;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public JsonResponseEntity delete(String id){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
            productFormulaService.delete(id);
            response.setMsg("移除成功");
            response.setCode(200);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg("移除失败");
        }
        return response;
    }


}
