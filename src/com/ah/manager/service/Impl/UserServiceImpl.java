package com.ah.manager.service.Impl;

import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.mapper.TUserMapper;
import com.ah.manager.mapper.TUserRoleMapper;
import com.ah.manager.pojo.TUser;
import com.ah.manager.pojo.TUserRole;
import com.ah.manager.service.RoleService;
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
    
    @Autowired
    private TUserRoleMapper tUserRoleMapper;

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
            TUserRole tUserRole = new TUserRole();
            tUserRole.setId(IdGen.uuid());
            tUserRole.setRoleId("37408db105dd4d43a25e865d9c1d4664");
            tUserRole.setUserId(user.getId());
            tUserRole.setDelFlag("0");
            tUserRoleMapper.save(tUserRole);
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

	@Override
	public boolean hasUser(String userCode) {
		// TODO Auto-generated method stub
		if(!StringUtils.isEmpty(userCode)&&userMapper.findByUserCode(userCode)!=null){
			return true;
		}
		return false;
	}
}
