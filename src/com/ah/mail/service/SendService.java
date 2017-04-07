package com.ah.mail.service;

import com.ah.manager.common.page.model.Pager;

public interface SendService {
	void findAll(Pager pager);
	
	void del(String id);
}
