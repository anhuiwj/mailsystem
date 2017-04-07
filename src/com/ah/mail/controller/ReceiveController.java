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

import com.ah.company.pojo.InMaterial;
import com.ah.mail.service.ReceiveService;
import com.ah.mail.service.TongXunluService;
import com.ah.mail.service.Impl.ReceiveServiceImpl;
import com.ah.mail.vo.MailInFoVo;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.util.CommonUtil;
import com.ah.manager.util.UserUtils;
import com.google.gson.Gson;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

/**
 * 收件箱
 * @author jiejie
 *
 */
@Controller
@RequestMapping("/receive")
public class ReceiveController {
	
	@Autowired
	private ReceiveService receiveService;
	
	@Autowired
	private TongXunluService tongXunluService;

	/**
	 * 收件箱
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "mail/receiveList";
	}
	
	/**
	 * 新增邮件
	 */
	@RequestMapping("/add")
	public String add(Model model){
		model.addAttribute("emails",tongXunluService.findByUser(UserUtils.getCurrentUser().getId()));
		return "mail/addMail";
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
            receiveService.findAll(pager);
        }
        response.setData(pager);
        return response;
    }
    
    /**
     * 邮件保存
     * @param inMaterial
     * @return
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResponseEntity save(HttpServletRequest request, HttpServletResponse response1,MailInFoVo mailInFoVo,@RequestParam(value="files",required = false)MultipartFile[] files){
        JsonResponseEntity response = new JsonResponseEntity();
        try {
        	receiveService.save(mailInFoVo,files);
            response.setMsg(CommonUtil.ADD_SUCCESS);
            response.setCode(CommonUtil.SUCCESS_CODE);
        }catch (Exception e){
            e.printStackTrace();
            response.setMsg(CommonUtil.ADD_ERROR);
        }
        return response;
    }
    
    /**
     * 收件箱删除0     彻底删除1
     * @param inMaterial
     * @return
     */
    @RequestMapping(value = "/del")
    @ResponseBody
    public JsonResponseEntity del(String id,String type){
    	  JsonResponseEntity response = new JsonResponseEntity();
          try {
        	  
        	  receiveService.del(id,type);
              response.setMsg(CommonUtil.DEL_SUCCESS);
              response.setCode(CommonUtil.SUCCESS_CODE);
          }catch (Exception e){
              e.printStackTrace();
              response.setMsg(CommonUtil.DEL_ERROR);
          }
          return response;
    }
    
    @RequestMapping("/read")
    public String read(String id,Model model){
    	model.addAttribute("mailInfo", receiveService.detail(id));
    	return "mail/detailMail";
    }
    
    
    @RequestMapping("/sendMail")
    @ResponseBody
    public JsonResponseEntity sendMail(String id){
    	  JsonResponseEntity response = new JsonResponseEntity();
          try {
        	  
        	  receiveService.UpadateMail(id);
              response.setMsg(CommonUtil.ADD_SUCCESS);
              response.setCode(CommonUtil.SUCCESS_CODE);
          }catch (Exception e){
              e.printStackTrace();
              response.setMsg(CommonUtil.ADD_ERROR);
          }
          return response;
    }
    

}
