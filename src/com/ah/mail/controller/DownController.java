package com.ah.mail.controller;

import java.io.File;
import java.io.IOException;

import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ah.mail.mapper.FileInfoMapper;
import com.ah.mail.pojo.FileInfo;
import com.ah.manager.util.LoadPropertiesDataUtils;

@Controller
public class DownController {
	@Autowired
	private FileInfoMapper fileInfoMapper;
	
	@RequestMapping("/download")
    public ResponseEntity<byte[]> download(@RequestParam(required = true) String id) throws IOException {
    	FileInfo fileinfo = fileInfoMapper.selectOne(id);
        String attachFile = fileinfo.getFileName();

        String rootPath = "/upload";
        String filePath;
        if (!rootPath.endsWith("/")) {
            filePath = rootPath + "/" + attachFile;
        }else{
            filePath = rootPath + attachFile;
        }

        File file = new File(filePath);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", new String(attachFile.getBytes("utf-8"), "iso8859-1"));
        return new ResponseEntity(FileUtil.readAsByteArray(file),headers, HttpStatus.CREATED);
    }

	
}
