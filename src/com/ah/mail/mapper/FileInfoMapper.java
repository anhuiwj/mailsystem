package com.ah.mail.mapper;

import com.ah.mail.pojo.FileInfo;

public interface FileInfoMapper {
	int save(FileInfo fileInfo);
	
	FileInfo selectOne(String id);
}
