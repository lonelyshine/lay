package com.cy.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cy.ssm.mapper.FileMapper;
import com.cy.ssm.service.FileService;
@Service
public class FileServiceImpl implements FileService {
	@Resource
	private FileMapper file;
	
	//上传文件信息插入到数据库
    public void insertFileInfo(String fileid,String userid,String fileName,String temppath,String fileCategory ,String filetype,String folder,String filetime){
    	file.insertFileInfo(fileid,userid,fileName,temppath,fileCategory,filetype,folder,filetime);
    }
    //查询文件列表信息
    public List<HashMap<String,Object>> queryFileList(String fileCategory,String folder,String filetab){
    	return file.queryFileList(fileCategory,folder,filetab);
    }
}
