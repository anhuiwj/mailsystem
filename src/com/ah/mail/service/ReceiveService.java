package com.ah.mail.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ah.mail.vo.MailInFoVo;
import com.ah.manager.common.page.model.Pager;

public interface ReceiveService {
	void findAll(Pager pager);
	
	void save(MailInFoVo mailInFoVo,MultipartFile[] files);

	void del(String id, String type);
	
	MailInFoVo detail(String id);
	
	void UpadateMail(String id);
	
	List<MailInFoVo> findAll();
}
