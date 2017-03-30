package com.ah.manager.security;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.springframework.stereotype.Service;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Created by wangjie on 16/11/30.
 */
@Service
public class SystemLogoutFilter extends LogoutFilter {
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response)throws Exception{
        //在这执行退出数据
        Subject subject = getSubject(request,response);
        String ridirectUrl = getRedirectUrl(request,response,subject);
        try {
            subject.logout();
        }catch (SessionException e){
            e.printStackTrace();
        }
       issueRedirect(request,response,ridirectUrl);
        return false;
    }
}
