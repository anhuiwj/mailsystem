package com.ah.mail.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ah.mail.mapper.MailInfoMapper;
import com.ah.mail.service.RubishService;
import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.util.UserUtils;

@Service
public class RubishServiceImpl implements RubishService{


	@Autowired
	private MailInfoMapper mailInfoMapper;
	
	@Override
	public void findAll(Pager pager) {
		// TODO Auto-generated method stub
		PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        param.put("sendUser", UserUtils.getCurrentUser().getUserCode());
        param.put("status","2");////0 未发送 1已发送 2草稿
        pager.setExhibitDatas(mailInfoMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
	}

}
