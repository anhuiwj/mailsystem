package com.ah.manager.security;

import com.ah.manager.controller.BaseController;
import com.ah.manager.pojo.SysMenu;
import com.ah.manager.pojo.TUser;
import com.ah.manager.service.AuthService;
import com.ah.manager.service.UserService;
import com.ah.manager.util.MD5Util;
import com.ah.manager.util.SpringContextHolder;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wangjie on 16/11/29.
 */
@Service
public class SystemAuthorizingRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;


    /**
     * 权限验证
     * @param principalCollection
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) throws AuthenticationException{
        TUser user  = BaseController.getSessionUser();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        AuthService authService = SpringContextHolder.getBean(AuthService.class);
        List<SysMenu> menus = authService.findByUserId(user.getId());
        if (menus != null) {
            for (SysMenu m : menus) {
                if (m != null && StringUtils.isNotBlank(m.getPermission())) {
                    info.addStringPermission(m.getPermission());
                }
            }
        }
        return info;
    }

    /**
     * 登录验证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;
        //查出是否有此用户
        TUser user=userService.findByUserCode(token.getUsername());
        if(user!=null){
            //若存在，将此用户存放到登录认证info中
            return new SimpleAuthenticationInfo(user.getUserCode(), user.getPassword(), getName());
        }
        return null;
    }
}
