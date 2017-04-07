package com.ah.mail.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ah.mail.pojo.UserOwner;
import com.ah.mail.service.TongXunluService;
import com.ah.mail.vo.MailInFoVo;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.util.CommonUtil;
import com.google.gson.Gson;

@Controller
@RequestMapping("/tongxun")
public class TongXunluController {
	
	@Autowired
	private TongXunluService tongXunluService;

	/**
	 * 联系人
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "mail/tongxunList";
	}
	
	/**
	 * 新增
	 */
	@RequestMapping("/add")
	public String add(String id,Model model){
		model.addAttribute("user", tongXunluService.get(id));
		return "mail/addUser";
	}
	
	 /**
     * 查询数据
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
            pager.setParameters(searchParam);
            tongXunluService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }
    
    /**
     * 保存
     * @param inMaterial
     * @return
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity save(HttpServletRequest request, HttpServletResponse response1,UserOwner userOwner){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
        	tongXunluService.save(userOwner);
            response.setMsg(CommonUtil.ADD_SUCCESS);
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.ADD_ERROR);
        }
        return response;
    }
    
    /**
     * 保存
     * @param inMaterial
     * @return
     */
    @RequestMapping(value = "/del")
    @ResponseBody
    public JsonResponseEntity del(HttpServletRequest request, HttpServletResponse response1,String id){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
        	tongXunluService.delete(id);
            response.setMsg(CommonUtil.DEL_SUCCESS);
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.DEL_ERROR);
        }
        return response;
    }
	
}
