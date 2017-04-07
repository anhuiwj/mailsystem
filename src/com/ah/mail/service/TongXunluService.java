package com.ah.mail.service;

import java.util.List;

import com.ah.mail.pojo.UserOwner;
import com.ah.manager.common.page.model.Pager;

public interface TongXunluService {
	void findAll(Pager pager);
	
	void save(UserOwner userOwner);
	
	UserOwner get(String id);

	void delete(String id);
	
	String findByUser(String userId);
	
}
