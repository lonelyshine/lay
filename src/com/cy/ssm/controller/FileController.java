package com.cy.ssm.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cy.ssm.beans.UserBean;
import com.cy.ssm.service.FileService;
import com.cy.ssm.util.PagedResult;


@Controller
public class FileController extends BaseController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource
	private FileService fileServiceImpl;
	
	/** 
     * 跳转到文件管理界面
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/file_manager")
	public ModelAndView getFileManager(HttpServletRequest req){
		log.info("文件管理界面");
		ModelAndView mv = new ModelAndView();
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		mv.setViewName("file_manager");
		return mv;
	}
	
	
	/** 
     * 上传附件
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     */  
    @RequestMapping(value = "fileManager", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody 
    public String upload(HttpServletRequest request, @RequestParam("file") MultipartFile file,@RequestParam("fileid") String fileid,@RequestParam("filetype") String filetype,@RequestParam("filetime") String filetime,@RequestParam("folder") String folder,ModelMap model) {
        System.out.println("开始");
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        String userid = String.valueOf(user.getUserId());
        String path = request.getSession().getServletContext().getRealPath("fileManager");
        String fileName = file.getOriginalFilename();
        String []temp = fileName.split("\\.");
        
        File targetFile = new File(path, fileid+"."+temp[temp.length-1]);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }

        // 保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String fileCategory ="";
        //文件类型
        if(filetype.equals("fa-file-image-o")){
        	fileCategory ="image";
        }else if(filetype.equals("fa-file-sound-o")){
        	fileCategory ="sound";
        }else if(filetype.equals("fa-file-movie-o")){
        	fileCategory ="movie";
        }else{
        	fileCategory ="doc";
        }
        String temppath = path+"\\"+fileid+"."+temp[1];
        //将上传的附件信息保存到数据库表中
        fileServiceImpl.insertFileInfo(fileid,userid,fileName,temppath,fileCategory,filetype,folder,filetime);
        
        HashMap<String,Object> map = new HashMap<String ,Object>();
        map.put("fileUrl", temppath);
      //  FileTool icon = new FileTool();
       // map.put("icon", icon.getSmallIcon(new File(request.getContextPath() + "/upload/" + fileName)));
        return responseSuccess(map);
    }
    
    
    /** 
     * 查询文件列表信息
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 	
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/FileList.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String queryFileList(String fileCategory,String folder,String filetab) {  
        log.info("查询附件信息"); 
        List<HashMap<String,Object>> fileList =  fileServiceImpl.queryFileList(fileCategory,folder,filetab);
        return responseArraySuccess(fileList);
    } 
   
    
    
    /** 
     * 跳转到文件转换器
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/file_converter")
	public ModelAndView getFileConverter(HttpServletRequest req){
		log.info("文件转换器界面");
		ModelAndView mv = new ModelAndView();
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		mv.setViewName("file_converter");
		return mv;
	}
    
	
	/** 
     * 跳转到文件转换器
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value = "waitfileManager", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody 
	public String uploadWaitFile(HttpServletRequest request, @RequestParam("file") MultipartFile file,@RequestParam("fileid") String fileid,@RequestParam("filetime") String filetime,ModelMap model){
		    log.info("上传待转换的文件");
		    UserBean user = (UserBean) request.getSession().getAttribute("user");
	        String userid = String.valueOf(user.getUserId());
	        String path = request.getSession().getServletContext().getRealPath("waitfileManager");
	        String fileName = file.getOriginalFilename();
	        String []temp = fileName.split("\\.");
	        
	        File targetFile = new File(path, fileid+"."+temp[temp.length-1]);
	        if (!targetFile.exists()) {
	            targetFile.mkdirs();
	        }

	        // 保存
	        try {
	            file.transferTo(targetFile);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        String temppath = path+"\\"+fileid+"."+temp[1];
	        //文件转换方法
	        
	        
	        
	        
	        
	        
	        //将上传的附件信息保存到数据库表中
	      //  fileServiceImpl.insertFileInfo(fileid,userid,fileName,temppath,filetime);
	        
	        HashMap<String,Object> map = new HashMap<String ,Object>();
	        map.put("fileUrl", temppath);
	      //  FileTool icon = new FileTool();
	       // map.put("icon", icon.getSmallIcon(new File(request.getContextPath() + "/upload/" + fileName)));
	        return responseSuccess(map);
	}
    
	
	
}
