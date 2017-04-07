package com.ah.mail.service.Impl;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ah.mail.mapper.UserOwnerMapper;
import com.ah.mail.pojo.UserOwner;
import com.ah.mail.service.TongXunluService;
import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.util.IdGen;
import com.ah.manager.util.UserUtils;

@Service
public class TongXunluServiceImpl implements TongXunluService{

	@Autowired
	private UserOwnerMapper userOwnerMapper;
	
	/**
	 * 通讯录列表
	 */
	@Override
	public void findAll(Pager pager) {
		// TODO Auto-generated method stub
		  PageQueryMap param = new PageQueryMap(pager);
	        if (pager.getParameters() != null) {
	            param.putAll(pager.getParameters());
	        }
	        param.put("owner", UserUtils.getCurrentUser().getId());
	        pager.setExhibitDatas(userOwnerMapper.findAll(param));
	        pager.setIsSuccess(true);           //成功
	        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
	}

	/**
	 * 通讯录联系人保存
	 */
	@Override
	public void save(UserOwner userOwner) {
		// TODO Auto-generated method stub
		userOwner.setId(IdGen.uuid());
		userOwner.setOwner(UserUtils.getCurrentUser().getId());
		userOwner.setDelFlag("0");
		userOwnerMapper.save(userOwner);
	}

	@Override
	public UserOwner get(String id) {
		// TODO Auto-generated method stub
		return userOwnerMapper.get(id);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		userOwnerMapper.delete(id);
	}

	@Override
	public String findByUser(String userId) {
		// TODO Auto-generated method stub
		List<String> datas =  userOwnerMapper.findByUser(userId);
		 JSONArray json = new JSONArray();
         for(String a : datas){
             json.put(a);
         }  
		return json.toString();
	}
}
