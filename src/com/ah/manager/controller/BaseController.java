package com.ah.manager.controller;

import com.ah.manager.pojo.TUser;
import com.ah.manager.service.UserService;
import com.ah.manager.util.DateUtils;
import com.ah.manager.util.SpringContextHolder;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.util.Date;

/**
 * Created by xuguobing on 2016/10/26 0026.
 */
public class BaseController {

    /**
     * 获取登录用户信息
     *
     * @return
     */
    public static TUser getSessionUser() {
        try {
            Subject subject = SecurityUtils.getSubject();
            String username = (String) subject.getPrincipal();
            UserService userService = SpringContextHolder.getBean(UserService.class);
            TUser user = userService.findByUserCode(username);
            return user;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 初始化数据绑定
     * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
     * 2. 将字段中Date类型转换为String类型
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
        binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
            }

            @Override
            public String getAsText() {
                Object value = getValue();
                return value != null ? value.toString() : "";
            }
        });
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(DateUtils.parseDate(text));
            }
//			@Override
//			public String getAsText() {
//				Object value = getValue();
//				return value != null ? DateUtils.formatDateTime((Date)value) : "";
//			}
        });

//        binder.setValidator(new LocalValidatorFactoryBean());
    }
}
