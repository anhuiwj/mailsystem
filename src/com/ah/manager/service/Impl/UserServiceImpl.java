package com.ah.manager.service.Impl;

import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.mapper.TUserMapper;
import com.ah.manager.pojo.TUser;
import com.ah.manager.service.UserService;
import com.ah.manager.util.IdGen;
import com.ah.manager.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by wangjie on 16/11/29.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private TUserMapper userMapper;

    @Override
    public void findAll(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(userMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    public void save(TUser user) {
        if(StringUtils.isEmpty(user.getId())){
            user.setId(IdGen.uuid());
            user.setPassword(MD5Util.MD5(user.getPassword()));
            userMapper.save(user);
        }else {
            user.setPassword(MD5Util.MD5(user.getPassword()));
            userMapper.update(user);
        }
    }

    @Override
    public TUser findByUserCode(String userCode) {
        return userMapper.findByUserCode(userCode);
    }

    @Override
    public TUser findById(String id) {
        if(StringUtils.isEmpty(id)){
            return new TUser();
        }
        return userMapper.findById(id);
    }

    @Override
    public void delete(String id) {
        userMapper.delete(id);
    }

    @Override
    public List<TUser> findUsers() {
        return userMapper.findUsers();
    }
}
