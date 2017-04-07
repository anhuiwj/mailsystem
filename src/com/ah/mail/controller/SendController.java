package com.ah.mail.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ah.mail.service.SendService;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.util.CommonUtil;
import com.google.gson.Gson;

@Controller
@RequestMapping("/send")
public class SendController {
	
	@Autowired
	private SendService sendService;
	
	/**
	 * 发件箱
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "mail/sendList";
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
            sendService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }
    
    /**
     * 发件箱删除
     * @param inMaterial
     * @return
     */
    @RequestMapping(value = "/del")
    @ResponseBody
    public JsonResponseEntity del(String id){
    	  JsonResponseEntity response = new JsonResponseEntity();
          try {
        	  sendService.del(id);
              response.setMsg(CommonUtil.DEL_SUCCESS);
              response.setCode(CommonUtil.SUCCESS_CODE);
          }catch (Exception e){
              e.printStackTrace();
              response.setMsg(CommonUtil.DEL_ERROR);
          }
          return response;
    }
}
