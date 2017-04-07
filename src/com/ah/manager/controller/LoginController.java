package com.ah.manager.controller;

import com.ah.company.service.ProductInService;
import com.ah.mail.service.ReceiveService;
import com.ah.manager.common.miniui.AjaxResult;
import com.ah.manager.pojo.TUser;
import com.ah.manager.service.SysMenuService;
import com.ah.manager.util.MD5Util;
import com.ah.manager.util.RSAEncryptUtils;
import com.ah.manager.util.UserUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.KeyPair;
import java.util.Enumeration;
import java.util.Map;

/**
 * Created by wangjie on 16/11/29.
 */
@Controller
public class LoginController {

    @Autowired
    private SysMenuService sysMenuService;
    
    @Autowired
    private ProductInService productInService;
    
    @Autowired
    private ReceiveService receiveService;

    @RequestMapping(value = "/login",method= RequestMethod.GET)
    public String loginForm(HttpServletRequest request, HttpServletResponse response){
        boolean isAjax = false;
        Enumeration<String> values = request.getHeaders("X-Requested-With");
        while(values.hasMoreElements()) {
            String value = values.nextElement();
            if("XMLHttpRequest".equalsIgnoreCase(value)) {
                isAjax = true;
                break;
            }
        }
        if(isAjax) {
            response.setHeader("Session-Status", "timeout");
        }
        return "login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@Validated TUser user, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        try{
            if(bindingResult.hasErrors()){
                return "";
            }
            SecurityUtils.getSubject().login(new UsernamePasswordToken(user.getUserCode(), MD5Util.MD5(user.getPassword())));
            return "redirect:/index";
        }catch (AuthenticationException e){
            redirectAttributes.addFlashAttribute("message","用户名或密码错误");
            return "redirect:/login";
        }
    }

    @RequestMapping(value="/logout",method=RequestMethod.GET)
    public String logout(RedirectAttributes redirectAttributes ){
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/login";
    }

    /**
     * 获取RSA的秘钥对
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/publickey")
    public AjaxResult publicKey(HttpServletRequest request) {
        HttpSession session = request.getSession();

        KeyPair keyPair = null;
        Map<String, String> publicKeyMap = null;

        if (session.getAttribute("keyPair") == null) {
            keyPair = RSAEncryptUtils.generateKeyPair();
            publicKeyMap = RSAEncryptUtils.getPublicKeyMap(keyPair);
            session.setAttribute("keyPair", keyPair);
        } else {
            keyPair = (KeyPair) session.getAttribute("keyPair");
            publicKeyMap = RSAEncryptUtils.getPublicKeyMap(keyPair);
        }
        return new AjaxResult(true, "", publicKeyMap);
    }


    @RequestMapping(value = "/index")
    public String index(Model model){
        model.addAttribute(sysMenuService.findUserId(UserUtils.getCurrentUser().getId()));
        model.addAttribute("list", receiveService.findAll());
        return "index";
    }

}
