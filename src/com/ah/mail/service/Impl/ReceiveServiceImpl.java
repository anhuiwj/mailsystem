package com.ah.mail.service.Impl;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ah.mail.mapper.FileInfoMapper;
import com.ah.mail.mapper.MailInfoMapper;
import com.ah.mail.pojo.FileInfo;
import com.ah.mail.pojo.Mail;
import com.ah.mail.pojo.MailInfo;
import com.ah.mail.service.ReceiveService;
import com.ah.mail.utils.EnCryptUtils;
import com.ah.mail.utils.FileUtils;
import com.ah.mail.vo.MailInFoVo;
import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.util.CommonUtil;
import com.ah.manager.util.IdGen;
import com.ah.manager.util.UserUtils;

@Service
public class ReceiveServiceImpl implements ReceiveService{
	
	@Autowired
	private MailInfoMapper mailInfoMapper;
	
	@Autowired
	private FileInfoMapper fileInfoMapper;

	public void findAll(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        param.put("receiveUser", UserUtils.getCurrentUser().getUserCode());
        param.put("status", "1");
        pager.setExhibitDatas(mailInfoMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

	@Override
	public void save(MailInFoVo mailInFoVo,MultipartFile[] files) {
		// TODO Auto-generated method stub
		MailInfo mailinfo = new MailInfo();
		Mail mail = new Mail();
		mailinfo.setId(IdGen.uuid());
		mailinfo.setDelFlag("0");
		mailinfo.setIsRead("0");
		mailinfo.setTitle(mailInFoVo.getTitle());
		mailinfo.setMailContent(StringUtils.isNotEmpty(mailInFoVo.getMailContent())? EnCryptUtils.encode(mailInFoVo.getMailContent()):"");
		mailinfo.setCreateDate(new Date());
		mailinfo.setFileId(saveFile(files));
		mailInfoMapper.saveMailInfo(mailinfo);
		mail.setId(IdGen.uuid());
		mail.setMailId(mailinfo.getId());
		if("1".equals(mailInFoVo.getType())){
			mail.setStatus("1");// 0 未发送 1已发送 2草稿 3删除
		}else{
			mail.setStatus("2");// 0 未发送 1已发送 2草稿 3删除
		}
		
		mail.setSendUser(UserUtils.getCurrentUser().getUserCode());
		mail.setReceiveUser(mailInFoVo.getReceiveUser());
		mailInfoMapper.saveMail(mail);
		
	}
	
	/**
	 * 保存文件
	 * @param files
	 * @return
	 */
	public String saveFile(MultipartFile[] files){
		FileInfo fileinfo = new FileInfo();
		for(MultipartFile file:files){
			fileinfo.setId(IdGen.uuid());
			fileinfo.setFileName(file.getOriginalFilename());
			fileinfo.setDelFlag("0");
			FileUtils.uploadFile(file, file.getOriginalFilename());
			fileInfoMapper.save(fileinfo);
		}
		
		return fileinfo.getId();
	}

	/**
	 * 删除或彻底删除
	 */
	@Override
	public void del(String id, String type) {
		// TODO Auto-generated method stub
		if("0".equals(type)){
			Map map = new HashMap();
			map.put("id", id);
			map.put("status", "3");//0 未发送 1已发送 2草稿 3删除
			mailInfoMapper.updateStatus(map);
		}else if("1".equals(type)){
			mailInfoMapper.delMailIfo(id);
		}
	}

	/**
	 * 邮件详细
	 */
	@Override
	public MailInFoVo detail(String id) {
		// TODO Auto-generated method stub
		MailInFoVo m = mailInfoMapper.detail(id);
		mailInfoMapper.updateRead(id);
		if(m!=null&&StringUtils.isNotEmpty(m.getMailContent())){
			m.setMailContent(EnCryptUtils.decode(m.getMailContent()));
		}
		return m;
	}

	/**
	 * 发送邮件
	 */
	@Override
	@Transactional(readOnly = false)
	public void UpadateMail(String id) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		map.put("status", "1");//0 未发送 1已发送 2草稿 3删除
		mailInfoMapper.updateStatus(map);
	}

	@Override
	public List<MailInFoVo> findAll() {
		// TODO Auto-generated method stub
		Map param = new HashMap();
		param.put("receiveUser", UserUtils.getCurrentUser().getUserCode());
        param.put("status", "1");
		return mailInfoMapper.findAll(param);
	}
}
