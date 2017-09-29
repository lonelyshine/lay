package com.cy.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FileMapper {
	//上传文件信息插入到数据库
    public void insertFileInfo(@Param(value="Id") String fileid,@Param(value="userId") String userid,@Param(value="fileName") String fileName,@Param(value="filePath") String temppath,@Param(value="fileCategory") String fileCategory,@Param(value="fileType") String filetype,@Param(value="folder") String folder,@Param(value="fileTime") String filetime);
   //查询文件列表信息
    public List<HashMap<String,Object>> queryFileList(@Param(value="fileCategory") String fileCategory,@Param(value="folder") String folder,@Param(value="filetab") String filetab);
}
