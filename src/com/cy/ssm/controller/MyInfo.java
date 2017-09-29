package com.cy.ssm.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
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
import com.cy.ssm.service.ILoginService;
import com.cy.ssm.tools.FileTool;

@Controller
public class MyInfo extends BaseController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource
	private FileService fileServiceImpl;
	
	@Resource
	private ILoginService loginServiceImpl;
	/** 
     * 跳转到头像修改界面
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/form_avatar")
	public ModelAndView getSendEmail(HttpServletRequest req){
		log.info("头像修改界面");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form_avatar");
		return mv;
	}
	
	
	/** 
     * 跳转到个人资料界面
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/profile")
	public ModelAndView profile(HttpServletRequest req){
		log.info("个人信息动态界面");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("profile");
		return mv;
	}
	
	
	/** 
     * 上传头像
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
	 * @throws IOException 
     */  
    @RequestMapping(value = "/imageavatar", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody 
    public String upload(HttpServletRequest request, @RequestParam("file") MultipartFile file,@RequestParam("fileid") String fileid,@RequestParam("filetype") String filetype,@RequestParam("filetime") String filetime,@RequestParam("folder") String folder,ModelMap model) throws IOException {
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
        
        
        //复制头像图片
        copyFile(path+"\\"+fileid+"."+temp[temp.length-1],path+"\\"+fileid+"_1."+temp[temp.length-1]);
        
        FileTool iu = new FileTool();  
        
        //设置头像图片大小
        BufferedImage image1 = ImageIO.read(new File(path, fileid+"_1."+temp[temp.length-1]));  
        image1 = iu.resize(image1, 64, 64);  
        ImageIO.write(image1, "png", new FileOutputStream(path+"\\"+fileid+"_1."+temp[temp.length-1]));
        
        
        
        //将头像图片插入到用户表中
        loginServiceImpl.updateAvatar(userid,fileid+"_1."+temp[temp.length-1]);
        
        
        FileTool iu1 = new FileTool();  
        BufferedImage image = ImageIO.read(targetFile);  
        image = iu1.resize(image, 200, 200);  
        ImageIO.write(image, "png", new FileOutputStream(path+"\\"+fileid+"."+temp[temp.length-1]));
        
        
        
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
    
    //复制文件，将头像文件复制一份并修改成相应的固定大小
    public void copyFile(String oldPath,String newPath) 
       {    
           try{    
               int bytesum = 0;    
               int byteread = 0;    
               File oldfile = new File(oldPath);    
               if(oldfile.exists()){      
                   InputStream inStream = new FileInputStream(oldPath);     
                   FileOutputStream fs = new FileOutputStream(newPath);    
                   byte[]buffer = new byte[1444];    
                   while((byteread  = inStream.read(buffer))!= -1){    
                           bytesum += byteread;        
                           System.out.println(bytesum);    
                           fs.write(buffer,0,byteread);    
                   }    
                   inStream.close();    
               }    
           }    
           catch (Exception e){    
               System.out.println("复制头像图片错误");    
               e.printStackTrace();    
           }    
     }
    
    
    /** 
     * 请求将个人信息保存到数据库中
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/updateUserInfo.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public void  updateUserInfo(HttpServletRequest request,String userName,String userAge,String userSex,String userBirthday,String userTel,String userQq,String userEmail,String userAddress,String userBrief) throws ParseException{  
        log.info("调用邮件保存成草稿");
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        int userId = user.getUserId();
      //将用户信息保存到用户表中
        loginServiceImpl.updateUserInfo(userId,userName,userAge,userSex,userBirthday,userTel,userQq,userEmail,userAddress,userBrief);
    }
	
}
