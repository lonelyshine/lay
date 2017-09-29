package com.cy.ssm.service;

import java.util.HashMap;
import java.util.List;

public interface FileService {
	//上传文件信息插入到数据库
    public void insertFileInfo(String fileid,String userid,String fileName,String temppath,String fileCategory,String filetype,String folder,String filetime);
    //查询文件列表信息
    public List<HashMap<String,Object>> queryFileList(String fileCategory,String folder,String filetab);
}
