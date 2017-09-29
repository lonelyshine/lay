package com.cy.ssm.controller;


import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cy.ssm.beans.UserBean;
import com.cy.ssm.sendemail.MailSenderInfo;
import com.cy.ssm.sendemail.SimpleMailSender;
import com.cy.ssm.service.EmailService;
import com.cy.ssm.service.ILoginService;



@Controller
public class LoginController extends BaseController {
	private Logger log = Logger.getLogger(this.getClass());
	
	private final int COUNT = 4; // 验证码的字符个数
    char codeCharacters[] = { //
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
    'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', };
	
	@Resource
	private EmailService emailServiceImpl;
	
	@Resource
	private ILoginService loginServiceImpl;
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req,UserBean user){
		log.info(user);
		
		ModelAndView mv = new ModelAndView();
		UserBean u=loginServiceImpl.Login(user.getUserCode(), user.getUserPassword());
	    System.out.println(req.getServletPath()+"1213");
	    System.out.println(u);
		if(u != null){
					
			req.getSession().setAttribute("user", u);
			req.getSession().setAttribute("loginStatus", "login");
			System.out.println(u.getUserPassword());
			mv.setViewName("index");
			return mv;
			
		}else{
			mv.addObject("tempuser", "用户名和密码错误");
			mv.setViewName("index_login");
			return mv;
		}
	}
	
	/** 
     * 用户登出
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */ 
	@RequestMapping("/loginout")
	public ModelAndView loginout(HttpServletRequest req,UserBean user){
		log.info("用户登出");
		ModelAndView mv = new ModelAndView();
		req.getSession().getAttribute("user");
		if(req.getSession().getAttribute("user").equals("")||req.getSession().getAttribute("user")==null){//当session中的user不存在时直接跳转到登录界面
			req.getSession().setAttribute("loginStatus", "loginout");
			mv.setViewName("index_login");
			return mv;
		}else{//当session中的user存在时 清除session
			req.getSession().invalidate();//清除session
			req.getSession().setAttribute("loginStatus", "loginout");
			mv.setViewName("index_login");
			return mv;
		}
	}
	
	
	
	/** 
     * 用户注册
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */ 
	
	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest req,String userCode,String userName ,String email,String userPassword){
		log.info("用户注册");
		ModelAndView mv = new ModelAndView();
		         //获取用户最大id
		         int id=0;
		         List<HashMap<String,Object>> userid = loginServiceImpl.getUserId();
		         if(userid!=null&&!userid.equals("")&&userid.size()>0){//用户id不为空时
		        	id = ((BigDecimal)userid.get(0).get("USERID")).intValue()+1;
		         }else{
		        	id=1;
		         }
		         
				 //用户注册
				 loginServiceImpl.register(id+"",userCode,userName,userPassword,email);
				 //获取用户的相关信息
				 UserBean u=loginServiceImpl.Login(userCode, userPassword);
				 if(u != null){
					 req.getSession().setAttribute("user", u);
					 req.getSession().setAttribute("loginStatus", "login");
					 System.out.println(u.getUserPassword());
					// return responseSuccess("{message:'密码修改成功'}");
					 mv.setViewName("index");
					 return mv;
				 }else{
					 //return responseSuccess("{message:'密码修改失败'}");
					 mv.addObject("usermessage", "用户名和密码错误");
					 mv.setViewName("index_login");
					 return mv;
				 }
	}
	
	
	/** 
     * 修改用户密码
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */ 
	
	@RequestMapping("/repassword")
	public ModelAndView repassword(HttpServletRequest req,String userPassword,String userCode,String verificationCode){
		log.info("修改密码");
		ModelAndView mv = new ModelAndView();
		List<HashMap<String,Object>> verifiycode = loginServiceImpl.getNameCode(userCode);
		 if(verifiycode!=null&&!verifiycode.equals("")&&verifiycode.size()>0){
			 if(verificationCode.equalsIgnoreCase((String) verifiycode.get(0).get("VERFIYCODE"))){//验证码正确
				 //修改密码
				 loginServiceImpl.updatePassword(userCode,userPassword);
				 //获取用户的相关信息
				 UserBean u=loginServiceImpl.Login(userCode, userPassword);
				 if(u != null){
					 req.getSession().setAttribute("user", u);
					 req.getSession().setAttribute("loginStatus", "login");
					 System.out.println(u.getUserPassword());
					// return responseSuccess("{message:'密码修改成功'}");
					 mv.setViewName("index");
					 return mv;
				 }else{
					 //return responseSuccess("{message:'密码修改失败'}");
					 mv.addObject("usermessage", "用户名和密码错误");
					 mv.setViewName("index_login");
					 return mv;
				 }
			 }else{//验证码错误
				 mv.addObject("usermessage", "验证码错误");
				 mv.setViewName("index_login");
				 return mv;
			 }
	        }else{
	        	 mv.addObject("usermessage", "您的用户名错误");
				 mv.setViewName("index_login");
				 return mv;
	        }
	}
    
    /** 
     * 获取邮件验证码
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/ficationCode", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
    public String sendEmail(HttpServletRequest request,String nameCode,String getEmailperson,String copyEmailperson ,String secretEmailperson,String sub,String contenttext,String contenthtml,String fileName) throws UnsupportedEncodingException {  
        log.info("获取邮件验证码");
        MailSenderInfo mailInfo = new MailSenderInfo();
        String email = "";
        List<HashMap<String,Object>> emaillist = loginServiceImpl.getNameCode(nameCode);
        if(emaillist!=null&&!emaillist.equals("")&&emaillist.size()>0){
           email = (String) emaillist.get(0).get("EMAIL");
        }else{
        	return responseSuccess("{message:'您的用户名错误'}");
        }
        
        if(!email.equals(getEmailperson)){
        	return responseSuccess("{message:'您的用户名错误或邮箱不是您预留的邮箱'}");
        }else{
        mailInfo.setMailServerHost("smtp.163.com");  
        mailInfo.setMailServerPort("25");  
        mailInfo.setValidate(true);  
        mailInfo.setUserName("lonelypickuplight");  
        mailInfo.setPassword("qin190530246");// 您的邮箱密码  
        mailInfo.setFromAddress("lonelypickuplight@163.com");  
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
        
       //生成随机字串 
                Random random = new Random();
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < COUNT; ++i) {
                    String str = String.valueOf(codeCharacters[random.nextInt(codeCharacters.length)]);
                    sb.append(str);    //将产生的四个随机数组合在一起
                }
        
        contenthtml= "<div><p style='margin:0pt; orphans:0; text-align:justify; widows:0'><span style='font-family:宋体; font-size:10.5pt'>尊敬的用户：</span><br /><span style='font-family:宋体; font-size:10.5pt'>您好！您使用</span><span style='font-family:宋体; font-size:10.5pt'>了</span><span style='font-family:宋体; font-size:10.5pt'>开发者联盟</span><span style='font-family:宋体; font-size:10.5pt'>平台密码找回功能，下面是生成的验证码：</span><br /><span style='font-family:'lucida Grande'; font-size:10.5pt'>"+sb.toString()+"</span><br /><span style='font-family:宋体; font-size:10.5pt'>请使用验证码找回您的密码。</span><br /><span style='font-family:'lucida Grande'; font-size:10.5pt'>-----------------------------------------</span><br /><span style='font-family:宋体; font-size:10.5pt'>此邮箱为系统邮箱，不接收邮件，请勿回复。</span></p></div>";
        
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
        	String tempemail = "lonelypickuplight"+"<lonelypickuplight@163.com>";
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
        	//将验证码存储到用户信息中
        	loginServiceImpl.insertCode(getEmailperson,sb.toString());
        	return responseSuccess("{message:'邮件发送成功'}");
        	//return "邮件发送成功";
        }else{
        	return responseSuccess("{message:'邮件发送失败'}");
        	//return "邮件发送失败";
        }
        }
        }
	
	/*@RequestMapping("/mailbox")
	public ModelAndView getEmail(HttpServletRequest req,UserBean user){
		log.info(user);
		
		ModelAndView mv = new ModelAndView();
		UserBean u=loginServiceImpl.Login(user.getUserCode(), user.getUserPassword());
	    System.out.println(req.getServletPath()+"1213");
		if(u != null){
					
			req.getSession().setAttribute("user", u);
			System.out.println(u.getUserPassword());
		}
		mv.setViewName("mailbox");
		return mv;
	}*/
	
	
}
