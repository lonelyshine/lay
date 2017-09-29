package com.cy.ssm.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import oracle.sql.CLOB;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cy.ssm.beans.EmailBean;
import com.cy.ssm.beans.UserBean;
import com.cy.ssm.receiveemail.PraseMimeMessage;
import com.cy.ssm.sendemail.MailSenderInfo;
import com.cy.ssm.sendemail.SimpleMailSender;
import com.cy.ssm.service.EmailService;
import com.cy.ssm.service.ILoginService;
import com.cy.ssm.util.PagedResult;

@Controller
public class EmailTool extends BaseController {
	List<String> list = new ArrayList<String>();
	private Logger log = Logger.getLogger(this.getClass());
	@Resource
	private EmailService emailServiceImpl;
	@Resource
	private ILoginService loginServiceImpl;
	@RequestMapping("/mailbox")
	public ModelAndView getEmail(HttpServletRequest req){
		log.info("查询邮件");
		ModelAndView mv = new ModelAndView();
		//java.lang.Integer userId = 1;
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		System.out.println("11111111111"+user);
		String userEmail = user.getEmail();
		System.out.println(userEmail);
		/*List<HashMap<String,Object>> email =  emailServiceImpl.query(userId);
		//获取用户的邮箱
		String userEmail = (String) email.get(0).get("EMAIL");
		System.out.println(userEmail);
		//查询用户发送的邮件
		List<HashMap<String,Object>> allSenderEmail =  emailServiceImpl.queryAllEmail(userEmail);
		mv.addObject("allSenderEmail", allSenderEmail);
		System.out.println("fasong"+allSenderEmail);
		//查询用户收到的邮件
		List<HashMap<String,Object>> allRecipientsEmail =  emailServiceImpl.queryAllRecipientsEmail(userEmail);
		mv.addObject("allRecipientsEmail", allRecipientsEmail);
		System.out.println("jiehsou"+allRecipientsEmail);
		//查询用户重要的邮件
		List<HashMap<String,Object>> allImportanceEmail =  emailServiceImpl.queryAllImportanceEmail(userEmail);
		mv.addObject("allImportanceEmail", allImportanceEmail);
		System.out.println("jiehsou"+allImportanceEmail);
		//查询用户草稿的邮件
		List<HashMap<String,Object>> allDraftEmail =  emailServiceImpl.queryAllDraftEmail(userEmail);
		mv.addObject("allDraftEmail", allDraftEmail);
		System.out.println("jiehsou"+allDraftEmail);
		//查询用户删除的邮件
		List<HashMap<String,Object>> allDeleteEmail =  emailServiceImpl.queryAllDeleteEmail(userEmail);
		mv.addObject("allDeleteEmail", allDeleteEmail);
		System.out.println("jiehsou"+allDeleteEmail);
		
		//分页查询邮件
		PagedResult<HashMap<String,Object>>  pagedResult = emailServiceImpl.queryByPage("1054056499@qq.com",1,10);//null表示查全部
		System.out.println(pagedResult);
		 log.info("查找结果" + pagedResult);  
		mv.addObject("pagedResult", pagedResult);
		System.out.println("jiehsou"+allDeleteEmail);*/
		if(userEmail!=null&&!userEmail.equals("")){
			mv.addObject("userEmail", userEmail);
		}else{
			mv.addObject("userEmail", "该用户不存在邮箱");
		}
		mv.setViewName("mailbox");
		return mv;
	}
	
	/** 
     * 跳转到发件箱
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/mail_send")
	public ModelAndView getSendEmail(HttpServletRequest req){
		log.info("查询邮件");
		ModelAndView mv = new ModelAndView();
		//java.lang.Integer userId = 1;
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		System.out.println("11111111111"+user);
		String userEmail = user.getEmail();
		System.out.println(userEmail);
		if(userEmail!=null&&!userEmail.equals("")){
			mv.addObject("userEmail", userEmail);
		}else{
			mv.addObject("userEmail", "该用户不存在邮箱");
		}
		mv.setViewName("mail_send");
		return mv;
	}
	
	/** 
     * 跳转到重要邮箱
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/mail_important")
	public ModelAndView getImportEmail(HttpServletRequest req){
		log.info("查询邮件");
		ModelAndView mv = new ModelAndView();
		//java.lang.Integer userId = 1;
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		System.out.println("11111111111"+user);
		String userEmail = user.getEmail();
		System.out.println(userEmail);
		if(userEmail!=null&&!userEmail.equals("")){
			mv.addObject("userEmail", userEmail);
		}else{
			mv.addObject("userEmail", "该用户不存在邮箱");
		}
		mv.setViewName("mail_important");
		return mv;
	}
	
	/** 
     * 跳转到垃圾邮箱
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/mail_dustbin")
	public ModelAndView getDustbinEmail(HttpServletRequest req){
		log.info("查询邮件");
		ModelAndView mv = new ModelAndView();
		//java.lang.Integer userId = 1;
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		System.out.println("11111111111"+user);
		String userEmail = user.getEmail();
		System.out.println(userEmail);
		if(userEmail!=null&&!userEmail.equals("")){
			mv.addObject("userEmail", userEmail);
		}else{
			mv.addObject("userEmail", "该用户不存在邮箱");
		}
		mv.setViewName("mail_dustbin");
		return mv;
	}
	
	
	/** 
     * 跳转到草稿箱
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/mail_draft")
	public ModelAndView getDraftEmail(HttpServletRequest req){
		log.info("查询邮件");
		ModelAndView mv = new ModelAndView();
		//java.lang.Integer userId = 1;
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		System.out.println("11111111111"+user);
		String userEmail = user.getEmail();
		System.out.println(userEmail);
		if(userEmail!=null&&!userEmail.equals("")){
			mv.addObject("userEmail", userEmail);
		}else{
			mv.addObject("userEmail", "该用户不存在邮箱");
		}
		mv.setViewName("mail_draft");
		return mv;
	}
	
	/** 
     * 查询未读邮件数量 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/EmailNotRead.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String getNotReadEmail(HttpServletRequest req){  
    	UserBean user = (UserBean) req.getSession().getAttribute("user");
		String userEmail = user.getEmail();
		//查询用户收到的邮件
		String notReadEmail =  emailServiceImpl.queryNotReadEmail(userEmail);
        return responseSuccess("{notReadEmail:"+notReadEmail+"}");  
    }
    
	/** 
     * 查询邮件总数量 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/EmailTotal.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String getEmailTotal(HttpServletRequest req){  
    	UserBean user = (UserBean) req.getSession().getAttribute("user");
		String userEmail = user.getEmail();
		//查询用户收到的邮件
		List<HashMap<String,String>> emailTotala =  emailServiceImpl.queryEmailTotal(userEmail);
		
        return responseSuccess(emailTotala.get(0));  
    }
    
	
	/** 
     * 分页查询邮件信息 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/EamilList.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String list(Integer pageNumber,Integer pageSize ,String email) {  
        log.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}"+ pageNumber+"_____"+pageSize);  
        try {  
            PagedResult<HashMap<String,Object>> pageResult = emailServiceImpl.queryByPage(email, pageNumber,pageSize);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    } 
    
    
    /** 
     * 根据邮件类型分页查询邮件信息
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/EamilListByType.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String emailListByType(Integer pageNumber,Integer pageSize ,String email,String type) {  
        log.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}"+ pageNumber+"_____"+pageSize);  
        try {  
            PagedResult<HashMap<String,Object>> pageResult = emailServiceImpl.queryByPagebytype(email, pageNumber,pageSize,type);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    }
    
    
    
    /** 
     * 根据条件分页查询邮件信息 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/EamilListByTerm.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String listByTerm(Integer pageNumber,Integer pageSize ,String email,String term,String sort) {  
        log.info("根据条件分页查询用户信息列表请求入参：pageNumber{},pageSize{}"+ pageNumber+"_____"+pageSize);  
        try {  
            PagedResult<HashMap<String,Object>> pageResult = emailServiceImpl.queryByPageAndTerm(email, pageNumber,pageSize,term,sort);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    } 
    
    
    /** 
     * 根据邮件类型和邮件字段条件分页查询邮件信息 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/EamilListByTermAndType.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String listByTermAndType(Integer pageNumber,Integer pageSize ,String email,String term,String sort,String type) {  
        log.info("根据条件分页查询用户信息列表请求入参：pageNumber{},pageSize{}"+ pageNumber+"_____"+pageSize);  
        try {  
            PagedResult<HashMap<String,Object>> pageResult = emailServiceImpl.queryByPageAndTermAndType(email, pageNumber,pageSize,term,sort,type);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    } 
    
    
    
    /** 
     * 根据邮件标题查询邮件信息 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/EamilListByTitle.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String listByTitle(Integer pageNumber,Integer pageSize ,String email,String title) {  
        log.info("根据条件分页查询用户信息列表请求入参：pageNumber{},pageSize{}"+ pageNumber+"_____"+pageSize);  
        try {  
            PagedResult<HashMap<String,Object>> pageResult = emailServiceImpl.queryByPageAndTitle(email, pageNumber,pageSize,title);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    } 
    
    
    /** 
     * 根据邮件标题和邮件类型查询邮件信息 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/EamilListByTitleAndType.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String listByTitleAndType(Integer pageNumber,Integer pageSize ,String email,String title,String type) {  
        log.info("根据条件分页查询用户信息列表请求入参：pageNumber{},pageSize{}"+ pageNumber+"_____"+pageSize);  
        try {  
            PagedResult<HashMap<String,Object>> pageResult = emailServiceImpl.queryByPageAndTitleAndType(email, pageNumber,pageSize,title,type);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    } 
    
    
    
    /** 
     * 查询邮件详细信息 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws IOException 
     * @throws SQLException 
     */  
    @RequestMapping(value="/EmailContent.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String list(long emailid) throws SQLException, IOException {  
        log.info("查询邮件详细信息 "); 
        System.out.println(emailid);
        EmailBean email = emailServiceImpl.queryEmailContent(emailid); //读取邮件的详细信息并修改邮件的读取状态
       /* HashMap<String,Object> tempmap =  email.get(0);
        HashMap<String,Object> map = new HashMap<>();
        map.put("SENDER",tempmap.get("SENDER") );
        map.put("TITLE",tempmap.get("TITLE") );
        map.put("THETIME",tempmap.get("THETIME") );*/
        HashMap<String,Object> map = new HashMap<>();
        map.put("SENDER",email.getSender());
        map.put("TITLE",email.getTitle());
        map.put("THETIME",email.getThetime());
       //  CLOB clob = (CLOB) getter.getClob();
       // System.out.println(tempmap.get("CONTENT"));
        map.put("COPYRECIPIENTS",email.getCopyRecipients());//抄送人员
        map.put("SECRETRECIPIENTS",email.getSecretRecipients());//密送人员
        map.put("RECIPIENTS",email.getRecipients());//收件人员RECIPIENTS
        map.put("CONTENT",java.net.URLDecoder.decode(email.getContent(),"UTF-8"));
        map.put("UPLOAD",email.getUpload());
        //System.out.println(map.get("CONTENT"));
        return responseSuccess(map);  
    }
    
    
    public String getClob(CLOB clob) throws SQLException{
    	return (clob != null ? clob.getSubString(1, (int) clob.length()) : null);
    }
    //将Clob字段转换成String类型
    public String ClobToString(CLOB clob) throws SQLException, IOException {   
        String reString = "";  
        java.io.Reader is = clob.getCharacterStream();// 得到流   
        BufferedReader br = new BufferedReader(is);   
        String s = br.readLine();   
        StringBuffer sb = new StringBuffer();   
        while (s != null) {// 执行循环将字符串全部取出付值给StringBuffer由StringBuffer转成STRING   
            sb.append(s);   
            s = br.readLine();   
        }   
        reString = sb.toString();   
        return reString;   
    }   
    
    
    @RequestMapping("/mail_compose")
	public ModelAndView sendEmail(HttpServletRequest req){
		log.info("写邮件");
		ModelAndView mv = new ModelAndView();
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		String userEmail = user.getEmail();
		if(userEmail!=null&&!userEmail.equals("")){
			mv.addObject("userEmail", userEmail);
		}else{
			mv.addObject("userEmail", "该用户不存在邮箱");
		}
		mv.setViewName("mail_compose");
		return mv;
	}
    
    /** 
     * 请求发送邮件 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/SendEamil.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String sendEmail(HttpServletRequest request,String getEmailperson,String copyEmailperson ,String secretEmailperson,String sub,String contenttext,String contenthtml,String fileName) throws UnsupportedEncodingException {  
        log.info("调用发送邮件方法");
        MailSenderInfo mailInfo = new MailSenderInfo();  
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        int userId = user.getUserId();
        String emial = user.getEmail();
        List<HashMap<String,Object>> emailUserPas = loginServiceImpl.getEmailUserPs(userId);
        if(emailUserPas==null||emailUserPas.equals("")||emailUserPas.size()==0){
        	return responseSuccess("{message:'该用户没有添加邮箱或没有添加邮箱用户名和邮箱密码'}");
        	//return "该用户没有添加邮箱或没有添加邮箱用户名和邮箱密码";
        }else{
        String emailUser = (String) emailUserPas.get(0).get("EMAILUSER");
        String emailPassword = (String) emailUserPas.get(0).get("EMAILPASSWORD");
        if(emial.endsWith("qq.com")){
        	 mailInfo.setMailServerHost("smtp.qq.com");  
             mailInfo.setMailServerPort("465");  
        }else if(emial.endsWith("163.com")){
        	 mailInfo.setMailServerHost("smtp.163.com");  
             mailInfo.setMailServerPort("25");  
        }else if(emial.endsWith("126.com")){
        	 mailInfo.setMailServerHost("smtp.126.com");  
             mailInfo.setMailServerPort("25");  
        }else if(emial.endsWith("gmail.com")){
	       	 mailInfo.setMailServerHost("smtp.gmail.com");  
	         mailInfo.setMailServerPort("587");  
        }else if(emial.endsWith("sina.com")){
	       	 mailInfo.setMailServerHost("smtp.sina.com");  
	         mailInfo.setMailServerPort("25");  
        }
        //mailInfo.setMailServerHost("smtp.163.com");  
        //mailInfo.setMailServerPort("25");  
        mailInfo.setValidate(true);  
        mailInfo.setUserName(emailUser);  
        mailInfo.setPassword(emailPassword);// 您的邮箱密码  
        mailInfo.setFromAddress(emial);  
        //收件人
        if(!getEmailperson.contains(";")){//如果地址中不包含； 则表示只有一个地址
        	String[] to = {getEmailperson};
        	mailInfo.setToAddress(to);  
        }else{
        	String[] to = getEmailperson.split(";");  
        	mailInfo.setToAddress(to);  
        }
        //抄送
        if(copyEmailperson!=null&&!copyEmailperson.equals("")){
        if(!copyEmailperson.contains(";")){//如果地址中不包含； 则表示只有一个地址
        	String[] toCC = {copyEmailperson};
        	mailInfo.setToCarbonCopyAddress(toCC); 
        }else{
        	String[] toCC = copyEmailperson.split(";");  
            mailInfo.setToCarbonCopyAddress(toCC); 
        }
        }
        //密送
        if(secretEmailperson!=null&&!secretEmailperson.equals("")){
        if(!secretEmailperson.contains(";")){
        	String[] toBCC = {secretEmailperson};  
            mailInfo.setToBlindCarbonCopyAddress(toBCC);
        }else{
        String[] toBCC = secretEmailperson.split(";");  
        mailInfo.setToBlindCarbonCopyAddress(toBCC);
        }
        }
        //附件
        String temp="";
        if(fileName!=null&&!fileName.equals("")){
        	 temp = request.getSession().getServletContext().getRealPath("upload");
        	if(!fileName.contains(",")){
        		String[] fileTempName = {temp+"\\"+fileName};
        		mailInfo.setAttachFileNames(fileTempName); 
        	}else{
        		String[] fileTempName = fileName.split(",");
        		for(int i=0;i<fileTempName.length;i++){
        			fileTempName[i] = temp+"\\"+fileTempName[i];
            	}
        		mailInfo.setAttachFileNames(fileTempName);  
        	}
        }
        //主题
        mailInfo.setSubject(sub);  
        
        //邮件内容
        mailInfo.setContent(contenthtml);  
        // 这个类主要来发送邮件  
        // 发送邮件
       // SimpleMailSender sms = new SimpleMailSender();
        // 发送文体格式
       // sms.sendMail(mailInfo);
        // 发送html格式
       boolean flag = SimpleMailSender.sendHtmlMail(mailInfo);
        
        if(flag){
        	System.out.println("邮件发送完毕");
        	SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");//设置日期格式
        	String time = df.format(new Date());// new Date()为获取当前系统时间
        	String isupload="";
        	if(fileName!=null&&!fileName.equals("")){
        		isupload = "true";
        	}else{
        		isupload = "false";
        	}
        	String tempemail = emailUser+"<"+emial+">";
        	String content = java.net.URLEncoder.encode(contenthtml,"UTF-8");
        	
        	String tempPath="";
        	if(fileName!=null&&!fileName.equals("")){
        		String Path = request.getSession().getServletContext().getRealPath("upload");
           	if(!fileName.contains(",")){
           		tempPath = Path+"\\"+fileName;
           	}else{
           		String[] fileTempName = fileName.split(",");
           		tempPath = Path+"\\"+fileTempName[0];
           		for(int i=1;i<fileTempName.length;i++){
           			tempPath =tempPath+","+Path+"\\"+fileTempName[i];
               	}
           	}
           }
        	
        	
        	//将发送的邮件信息存储到表中
        	emailServiceImpl.insertEmail(tempemail,getEmailperson,copyEmailperson,secretEmailperson,sub,content,tempPath,time,isupload);
        	return responseSuccess("{message:'邮件发送成功'}");
        	//return "邮件发送成功";
        }else{
        	return responseSuccess("{message:'邮件发送失败'}");
        	//return "邮件发送失败";
        }
        }
    }
    
    
    
    /** 
     * 请求将邮件保存到草稿箱 
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/SaveDraft.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String saveDraft(HttpServletRequest request,String getEmailperson,String copyEmailperson ,String secretEmailperson,String sub,String contenttext,String contenthtml,String fileName) throws UnsupportedEncodingException {  
        log.info("调用邮件保存成草稿");
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        int userId = user.getUserId();     
        String emial = user.getEmail();
        List<HashMap<String,Object>> emailUserPas = loginServiceImpl.getEmailUserPs(userId);
        if(emailUserPas==null||emailUserPas.equals("")||emailUserPas.size()==0){
        	return responseSuccess("{message:'该用户没有添加邮箱或没有添加邮箱用户名和邮箱密码'}");
        	//return "该用户没有添加邮箱或没有添加邮箱用户名和邮箱密码";
        }else{
        String emailUser = (String) emailUserPas.get(0).get("EMAILUSER");
        //附件
        String tempPath="";
    	if(fileName!=null&&!fileName.equals("")){
    		String Path = request.getSession().getServletContext().getRealPath("upload");
       	if(!fileName.contains(",")){
       		tempPath = Path+"\\"+fileName;
       	}else{
       		String[] fileTempName = fileName.split(",");
       		tempPath = Path+"\\"+fileTempName[0];
       		for(int i=1;i<fileTempName.length;i++){
       			tempPath =tempPath+","+Path+"\\"+fileTempName[i];
           	}
       	}
       }
        	SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");//设置日期格式
        	String time = df.format(new Date());// new Date()为获取当前系统时间
        	String isupload="";
        	if(fileName!=null&&!fileName.equals("")){
        		isupload = "true";
        	}else{
        		isupload = "false";
        	}
        	String tempemail = emailUser+"<"+emial+">";
        	String content = java.net.URLEncoder.encode(contenthtml,"UTF-8");
        	//将发送的邮件信息存储到表中
        	emailServiceImpl.insertDraftEmail(tempemail,getEmailperson,copyEmailperson,secretEmailperson,sub,content,tempPath,time,isupload);
        	return responseSuccess("{message:'保存草稿成功'}");
        	//return "保存草稿成功";
        }
    }
    
    
    
    
    /** 
     * 上传附件
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     */  
    @RequestMapping(value = "upload", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody 
    public String upload(HttpServletRequest request, @RequestParam("file") MultipartFile file, ModelMap model) {
        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        // String fileName = new Date().getTime()+".jpg";
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }

        // 保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        HashMap<String ,Object> map = new HashMap<String ,Object>();
        map.put("fileUrl", fileName);
      //  FileTool icon = new FileTool();
       // map.put("icon", icon.getSmallIcon(new File(request.getContextPath() + "/upload/" + fileName)));
        return responseSuccess(map);
    }
    
    /** 
     * 删除邮件附件
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     */  
    @RequestMapping(value="/deleteFile.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String deleteFile(HttpServletRequest request,String path) {  
        log.info("删除邮件附件");
        boolean flag = false;
        String temp = request.getSession().getServletContext().getRealPath("upload");
        File file = new File(temp+"\\"+path);
        if(file.isFile()&&file.exists()){
        	file.delete();
        	flag = file.delete();
        }else{
        	flag = false;
        }
       HashMap<String,Boolean> map = new HashMap<String,Boolean>();
        map.put("status", flag);
        return responseSuccess(map);
    }
    //获取个人邮件的uid编号(监控是否有新邮件)
    @RequestMapping(value="/newEmail.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")
    @ResponseBody  
    public String getUID(HttpServletRequest request,int number) throws Exception{
    	log.info("查询是否有新邮件");
    	PraseMimeMessage prasemimemessage = new PraseMimeMessage();
    	UserBean user = (UserBean) request.getSession().getAttribute("user");
    	String email = user.getEmail();
    	if(number==1){
    		List<HashMap<String,String>> emailUID = emailServiceImpl.getEmailUID(email);//获取到用户邮箱的uid
    		if(emailUID!=null&&emailUID.size()>0){
    			for(int i=0;i<emailUID.size();i++){
    				list.add(emailUID.get(i).get("EMAILUID"));
    			}
    		}
    	}
        int userId = user.getUserId();
        List<HashMap<String,Object>> tempEmailUserPas = loginServiceImpl.getEmailUserPs(userId);
        if(tempEmailUserPas==null||tempEmailUserPas.equals("")||tempEmailUserPas.size()==0){
        	return "该用户没有添加邮箱或没有添加邮箱用户名和邮箱密码";
        }else{
        String emailUser = (String) tempEmailUserPas.get(0).get("EMAILUSER");
        String emailPassword = (String) tempEmailUserPas.get(0).get("EMAILPASSWORD");
        String host="";
        String storeName = "pop3";
        if(email.endsWith("qq.com")){
	        	host = "pop3.qq.com";
	       }else if(email.endsWith("163.com")){
	    	    host="pop3.163.com";
	       }else if(email.endsWith("126.com")){
	    	    host="pop3.126.com";
	       }else if(email.endsWith("gmail.com")){
	    	    host="pop3.gmail.com";
	       }else if(email.endsWith("sina.com")){
	    	   host="pop3.sina.com";
	       }
       HashMap<String, Object> map  = prasemimemessage.getNewEmail(list,host,emailUser,emailPassword,storeName,emailServiceImpl);
       System.out.println("asdghas-----"+map);
       list = (List<String>) map.get("list"); 
       int newEmailNum = (int) map.get("number"); //获取新邮件个数
        
    	return responseSuccess("{'emailnum':'"+newEmailNum+"'}");
    }
   }
    
    /** 
     * 修改邮件信息的相关状态标识
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     */  
    @RequestMapping(value="/Emailtab.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String list(String emailid,String field ,String value) {  
        log.info("修改邮件信息的相关状态标识");
        if(emailid.contains(",")){
        	emailid = emailid.substring(0,emailid.length()-1);
        }
        emailServiceImpl.updateEmailTab(emailid,field,value);
        return responseSuccess("{'status':'邮件标记已读成功'}");
    }
    
    /** 
     * 查询下一封邮件信息内容
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/nextEmail.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String nextEmail(HttpServletRequest request,String emailid) throws UnsupportedEncodingException {  
        log.info("查询下一封邮件信息内容");
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        String emial = user.getEmail();
        int number =0;
        boolean flag = false;
        List<HashMap<String,Object>> nextemailid= emailServiceImpl.nextEmail(emailid,emial);
        for(int i=0;i<nextemailid.size();i++){
        	int a =((BigDecimal)nextemailid.get(i).get("EMAILID")).intValue();
        	int  b = Integer.parseInt(emailid); ;
        	if(a==b){
        		if(((String)nextemailid.get(i).get("EMAILTYPE")).equals("2")){//草稿中的时候
        			for(int j=i+1;j<nextemailid.size();j++){
        				if(((String)nextemailid.get(j).get("SENDER")).contains(emial)){
        					flag = true;
                			number = j;
                			break;
        				}
        			}
        		}else if(((String)nextemailid.get(i).get("EMAILTYPE")).equals("3")){//发件箱中的时候
        			for(int j=i+1;j<nextemailid.size();j++){
        				if(((String)nextemailid.get(j).get("SENDER")).contains(emial)){
        					flag = true;
                			number = j;
                			break;
        				}
    			} 
        		}else {//发件箱中的时候
        			if(i+1<nextemailid.size()){
        				flag = true;
        				number = i+1;
        				break;
        			}
    			}
        	}
        }
        if(flag){                                                 
	    	EmailBean email = emailServiceImpl.queryEmailContent(((BigDecimal)nextemailid.get(number).get("EMAILID")).intValue()); //读取邮件的详细信息并修改邮件的读取状态
	    	HashMap<String,Object> map = new HashMap<>();
	    	map.put("SENDER",email.getSender());
	    	map.put("TITLE",email.getTitle());
	    	map.put("THETIME",email.getThetime());
	    	map.put("CONTENT",java.net.URLDecoder.decode(email.getContent(),"UTF-8"));
	    	map.put("UPLOAD",email.getUpload());
	    	map.put("EMAILID",((BigDecimal)nextemailid.get(number).get("EMAILID")).intValue());
	    	map.put("STATUS","SUCCESS");
	    	return responseSuccess(map);  
	    }else{
	    	HashMap<String,Object> map = new HashMap<>();
	    	map.put("STATUS","FAIL");
	    	return responseSuccess(map);
	    }
    }
    
}
