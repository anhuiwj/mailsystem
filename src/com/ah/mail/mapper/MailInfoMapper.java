package com.ah.mail.mapper;

import java.util.List;
import java.util.Map;

import com.ah.mail.pojo.Mail;
import com.ah.mail.pojo.MailInfo;
import com.ah.mail.vo.MailInFoVo;

public interface MailInfoMapper {
	List<MailInFoVo> findAll(Map search);
	
	int saveMailInfo(MailInfo mailInfo);
	
	int saveMail(Mail mail);
	
	int delMailIfo(String id);
	
	int updateStatus(Map map);
	
	MailInFoVo detail(String id);
	
	int updateRead(String id);
}
