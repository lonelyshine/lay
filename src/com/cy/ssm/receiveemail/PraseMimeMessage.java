package com.cy.ssm.receiveemail;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
 
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
 
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
 
import javax.annotation.Resource;
import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
 
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cy.ssm.controller.EmailTool;
import com.cy.ssm.service.EmailService;
import com.cy.ssm.util.PagedResult;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.pop3.POP3Folder;

@Controller 
public class PraseMimeMessage{
//private  EmailTool emailtool = new EmailTool();
//	@Resource
	//private EmailService emailServiceImpl;

 private Logger log = Logger.getLogger(this.getClass());
 private static MimeMessage mimeMessage=null;
 private String saveAttachPath="";//附件下载后的存放目录
 private  StringBuffer bodytext=new StringBuffer();
 //存放邮件内容的StringBuffer对象
 private String dateformat="yy-MM-dd　HH:mm";//默认的日前显示格式
  /**
 　*　构造函数,初始化一个MimeMessage对象
 　*/
 public PraseMimeMessage() { 
 }
 public PraseMimeMessage(MimeMessage mimeMessage) {
  this.mimeMessage=mimeMessage;
 }
 public void setMimeMessage(MimeMessage mimeMessage){
  this.mimeMessage=mimeMessage;  
 }
 /**
 　*　获得发件人的地址和姓名
 　*/
 public String getFrom1()throws Exception{
  InternetAddress address[]=(InternetAddress[])mimeMessage.getFrom();
  String from=address[0].getAddress();
  if(from==null){
   from="";
  }
  String personal=address[0].getPersonal();
  if(personal==null){
   personal="";
  }
  String fromaddr=personal+"<"+from+">";
  return fromaddr;
 }
 /**
 　*　获得邮件的收件人，抄送，和密送的地址和姓名，根据所传递的参数的不同
 　*　"to"----收件人　"cc"---抄送人地址　"bcc"---密送人地址 　
  * @throws Exception */
 public String getMailAddress(String type){
  String mailaddr="";
  try {   
   String addtype=type.toUpperCase();
   InternetAddress []address=null;
   if(addtype.equals("TO")||addtype.equals("CC")||addtype.equals("BBC")){
    if(addtype.equals("TO")){
     address=(InternetAddress[])mimeMessage.getRecipients(Message.RecipientType.TO);
    }
    else if(addtype.equals("CC")){
     address=(InternetAddress[])mimeMessage.getRecipients(Message.RecipientType.CC);
    }
    else{
     address=(InternetAddress[])mimeMessage.getRecipients(Message.RecipientType.BCC);
    }
    if(address!=null){
     for (int i = 0; i < address.length; i++) {
      String email=address[i].getAddress();
      if(email==null)email="";
      else{
       email=MimeUtility.decodeText(email);
      }
      String personal=address[i].getPersonal();
      if(personal==null)personal="";
      else{
       personal=MimeUtility.decodeText(personal);
      }
      String compositeto=personal+"<"+email+">";
      mailaddr+=","+compositeto;
     }
     mailaddr=mailaddr.substring(1);
    }
   }
   else{
   }
  } catch (Exception e) {
   // TODO: handle exception
  }  
  return mailaddr;
 }
 /**
 　　*　获得邮件主题 　　
  */
 public String getSubject()
 {
  String subject="";
  try {
   subject=MimeUtility.decodeText(mimeMessage.getSubject());
   if(subject==null)subject="";
  } catch (Exception e) {
   // TODO: handle exception
  }
  return subject;
 }
 /**
 　　*　获得邮件发送日期
 　　*/
 public String getSendDate()throws Exception{
  Date senddate=mimeMessage.getSentDate();
  SimpleDateFormat format=new SimpleDateFormat(dateformat);
  return format.format(senddate);
 }
 /**
 　　*　解析邮件，把得到的邮件内容保存到一个StringBuffer对象中，解析邮件
 　　*　主要是根据MimeType类型的不同执行不同的操作，一步一步的解析
 　　*/
 public void getMailContent(Part part)throws Exception{
  String contenttype=part.getContentType();
  int nameindex=contenttype.indexOf("name");
  boolean conname=false;
  if(nameindex!=-1)conname=true;
  if(part.isMimeType("text/plain")&&!conname){
   bodytext.append((String)part.getContent());   
  }else if(part.isMimeType("text/html")&&!conname){
   bodytext.append((String)part.getContent());   
  }
  else if(part.isMimeType("multipart/*")){
   Multipart multipart=(Multipart)part.getContent();
   int counts=multipart.getCount();
   for(int i=0;i<counts;i++){
    getMailContent(multipart.getBodyPart(i));
   }
  }else if(part.isMimeType("message/rfc822")){
   getMailContent((Part)part.getContent());
  }
  else{}
 }
 /**
 　*　获得邮件正文内容
 　　*/
 public String getBodyText(){  
  return bodytext.toString();
 }
 /**
 　　*　判断此邮件是否需要回执，如果需要回执返回"true",否则返回"false"
 　　
  * @throws MessagingException */
 public boolean getReplySign() throws MessagingException{
  boolean replysign=false;
  String needreply[]=mimeMessage.getHeader("Disposition-Notification-To");
  if(needreply!=null){
   replysign=true;
  }
  return replysign;
 }
 /**
 　*　获得此邮件的Message-ID 　　
  * @throws MessagingException */
 public String getMessageId() throws MessagingException{
  return mimeMessage.getMessageID();
 } 
  
 /**
 　*　【判断此邮件是否已读，如果未读返回返回false,反之返回true】 　　
  * @throws MessagingException */
 public boolean isNew() throws MessagingException{
  boolean isnew =false;
  Flags flags=((Message)mimeMessage).getFlags();
  Flags.Flag[]flag=flags.getSystemFlags();
  for (int i = 0; i < flag.length; i++) {
   if(flag[i]==Flags.Flag.SEEN){
    isnew=true;
    break;
   }
  }
  return isnew;
 }
 /**
 　*　判断此邮件是否包含附件 　
  * @throws MessagingException */
 public boolean isContainAttach(Part part) throws Exception{
  boolean attachflag=false;
  String contentType=part.getContentType();
  if(part.isMimeType("multipart/*")){
   Multipart mp=(Multipart)part.getContent();
   //获取附件名称可能包含多个附件
   for(int j=0;j<mp.getCount();j++){
    BodyPart mpart=mp.getBodyPart(j);
    String disposition=mpart.getDescription();
    if((disposition!=null)&&((disposition.equals(Part.ATTACHMENT))||(disposition.equals(Part.INLINE)))){
     attachflag=true;
    }else if(mpart.isMimeType("multipart/*")){
     attachflag=isContainAttach((Part)mpart);
    }else{
     String contype=mpart.getContentType();
     if(contype.toLowerCase().indexOf("application")!=-1) attachflag=true;
     if(contype.toLowerCase().indexOf("name")!=-1) attachflag=true;
    }
   }
  }else if(part.isMimeType("message/rfc822")){
   attachflag=isContainAttach((Part)part.getContent());
  }
  return attachflag;
 }
 /**
 　*　【保存附件】 　
  * @throws Exception
  * @throws IOException
  * @throws MessagingException
  * @throws Exception */
 public List<String> saveAttachMent(Part part) throws Exception {
  List<String> list = new ArrayList<>();
  String fileName="";
  if(part.isMimeType("multipart/*")){
   Multipart mp=(Multipart)part.getContent();
   for(int j=0;j<mp.getCount();j++){
    BodyPart mpart=mp.getBodyPart(j);
    String disposition=mpart.getDescription();
    if((disposition!=null)&&((disposition.equals(Part.ATTACHMENT))||(disposition.equals(Part.INLINE)))){
     fileName=mpart.getFileName();
     if(fileName.toLowerCase().indexOf("GBK")!=-1){
      fileName=MimeUtility.decodeText(fileName);
     }
     saveFile(fileName,mpart.getInputStream());
     list.add(fileName);
    }
    else if(mpart.isMimeType("multipart/*")){
     fileName=mpart.getFileName();    
    }
    else{
     fileName=mpart.getFileName();
     if((fileName!=null)){
      fileName=MimeUtility.decodeText(fileName);
      saveFile(fileName,mpart.getInputStream());
      list.add(fileName);
     }
    }
   }
  }
  else if(part.isMimeType("message/rfc822")){
   saveAttachMent((Part)part.getContent());
  }
  return list;
 }
 /**
 　*　【设置附件存放路径】
 　*/
 public void setAttachPath(String attachpath){
  this.saveAttachPath=attachpath;
 }
  
 /**
 　*　【设置日期显示格式】
 　*/
 public void setDateFormat(String format){
  this.dateformat=format;
 }
 
 /**
 　*　【获得附件存放路径】
 　*/
  
 public String getAttachPath()
 {
  return saveAttachPath;
 }
 /**
 　*　【真正的保存附件到指定目录里】
 　*/
 private void saveFile(String fileName,InputStream in)throws Exception{
  String osName=System.getProperty("os.name");
  String storedir=getAttachPath();
  String separator="";
  if(osName==null)osName="";
  if(osName.toLowerCase().indexOf("win")!=-1){
   //如果是window 操作系统
   separator="/";
   if(storedir==null||storedir.equals(""))storedir="D:\\Users\\qinxg\\Desktop";
  }
  else{
   //如果是其他的系统
   separator="/";
   storedir="/tmp";
  }
  File strorefile=new File(storedir+separator+fileName);
  BufferedOutputStream bos=null;
  BufferedInputStream bis=null;
  try {
   bos=new BufferedOutputStream(new FileOutputStream(strorefile));
   bis=new BufferedInputStream(in);
   int c;
   while((c=bis.read())!=-1){
    bos.write(c);
    bos.flush();
   }
  } catch (Exception e) {
   // TODO: handle exception
  }finally{
   bos.close();
   bis.close();
  }
 }
 /** 
  * 获得邮件的优先级 
  * @param mimeMessage 邮件内容 
  * @return 1(High):紧急  3:普通(Normal)  5:低(Low) 
  * @throws MessagingException  
  */  
 public static String getPriority() throws MessagingException {  
     String priority = "普通";  
     String[] headers = mimeMessage.getHeader("X-Priority");  
     if (headers != null) {  
         String headerPriority = headers[0];  
         if (headerPriority.indexOf("1") != -1 || headerPriority.indexOf("High") != -1)  
             priority = "紧急";  
         else if (headerPriority.indexOf("5") != -1 || headerPriority.indexOf("Low") != -1)  
             priority = "低";  
         else  
             priority = "普通";  
     }  
     return priority;  
 } 
 /** 
  * 获得邮件的大小
  * @param mimeMessage 邮件内容 
  * @return 邮件的大小 
  * @throws MessagingException  
  */  
 public static String getSize() throws MessagingException{  
     return mimeMessage.getSize() * 1024 + "kb";
 } 
 
 
 
 
 
 
 public HashMap<String, Object> getNewEmail(List<String> list,String host,String username,String password,String storeName,EmailService emailServiceImpl) throws Exception{
	  //String host="pop3.163.com";
	  //String username="lonelypickuplight";
	 // String password="qin190530246";
	 HashMap<String,Object> map = new HashMap<String,Object>();
	 int number = 0;
	  Properties props=new Properties();
	  Session session=Session.getDefaultInstance(props,null);
	  Store store=session.getStore(storeName);
	  store.connect(host,username,password);
	  Folder folder=store.getFolder("INBOX");
	  folder.open(Folder.READ_ONLY);
	  try { 
		  if (folder instanceof POP3Folder) { 
		  POP3Folder inbox = (POP3Folder) folder; 
		  PraseMimeMessage pmm=null;
		  Message[] messages = inbox.getMessages(); 
		  for (int i = 0; i < messages.length; i++) { 
		  MimeMessage mimeMessage = (MimeMessage) messages[i]; 
		  String uid = inbox.getUID(mimeMessage);
		  if(list!=null){
		  if (!list.contains(uid)) { 
			   receive(emailServiceImpl,mimeMessage, uid); //接收邮件
			   list.add(uid);
			   number = number+1;
		  } 
		  }else{
			  receive(emailServiceImpl,mimeMessage, uid); //接收邮件
		  } 
		  }
		  } else if (folder instanceof IMAPFolder) { 
		  IMAPFolder inbox = (IMAPFolder) folder; 
		  Message[] messages = inbox.getMessages(); 
		  for (int i = 0; i < messages.length; i++) { 
		  MimeMessage mimeMessage = (MimeMessage) messages[i]; 
		  String uid = Long.toString(inbox.getUID(mimeMessage)); 
		  if(list!=null){
		  if (!list.contains(uid)) { 
			  receive(emailServiceImpl,mimeMessage, uid);//接收邮件
			  list.add(uid);	 
			  number = number+1;
		  }
		  }else{
			  receive(emailServiceImpl,mimeMessage, uid); //接收邮件
		  } 
		  }
		  } else { 
		  log.error("no have this folder{}:"+folder); 
		  } 
		  //emailAccountBean.setTime(System.currentTimeMillis()); 
		  } finally { 
		  folder.close(false); 
		  store.close(); 
		  } 
	  map.put("list", list);
	  map.put("number", number);
	  return map;
 }
 /**
　*　接收新邮件并将新邮件信息存储到数据库中
　
 * @throws Exception */
 public void receive(EmailService emailServiceImpl,MimeMessage mimeMessage, String uid) throws Exception{
	   PraseMimeMessage pmm=null;
	   pmm=new PraseMimeMessage(mimeMessage);
	   pmm.setDateFormat("yy年MM月dd日 HH:mm");//设置时间格式 
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   //String emailUID = uid;
	   //String title = pmm.getSubject();
	   //String thetime = pmm.getSendDate();
	   map.put("emailUID", uid);//uid
	   map.put("title",pmm.getSubject());//标题
	   map.put("thetime", pmm.getSendDate());//发送发送时间
	   //String emailStatus ="";
	   if(!pmm.isNew()){//表示未读
		   map.put("emailStatus","0");//是否已读
		   // emailStatus = "0";
	   }else{//表示已读
		   map.put("emailStatus","1");//是否已读
		   // emailStatus = "1";
	   }
	  // String priority = pmm.getPriority();
	  // boolean replySign = pmm.getReplySign();
	  // boolean isupload = pmm.isContainAttach((Part)mimeMessage);
	  // String sender = pmm.getFrom1();
	  // String recipients = pmm.getMailAddress("TO");
	  // String copyRecipients = pmm.getMailAddress("CC");
	  // String secretRecipients =pmm.getMailAddress("BCC");
	   
	   //if(copyRecipients.equals("")){
	//	   copyRecipients=null;
	  // }
	  // if(secretRecipients.equals("")){
		//   secretRecipients=null;
	 //  }
	   map.put("priority", pmm.getPriority());//邮件优先级
	   if(pmm.getReplySign()){
		   map.put("replySign", "true");//是否回执
	   }else{
		   map.put("replySign", "false");//是否回执
	   }
	   if(pmm.isContainAttach((Part)mimeMessage)){
		   map.put("isupload", "true");//是否包含附件
	   }else{
		   map.put("isupload", "false");//是否包含附件
	   }
	   //map.put("isupload", pmm.isContainAttach((Part)mimeMessage)); //是否包含附件
	   map.put("sender", pmm.getFrom1());//发件人
	   map.put("recipients", pmm.getMailAddress("TO"));//收件人
	   map.put("copyRecipients", pmm.getMailAddress("CC"));//抄送人
	   map.put("secretRecipients", pmm.getMailAddress("BCC"));//密送人
	  // String emailType = "1";
	   //String emailSize =pmm.getSize();
	   
	   
	   map.put("emailType", "1");//设置邮件类型为“收件”
	   map.put("emailSize", pmm.getSize());//邮件大小
	   
	   //String rootPath = getClass().getResource("/").getFile().toString();
	   
	   String path = "D:\\Users\\qinxg\\Workspaces\\.metadata\\.me_tcat\\webapps\\hAmin\\emailfile";
	   File file =new File(path);    
		 //如果文件夹不存在则创建    
		 if  (!file .exists()  && !file .isDirectory()){       
		     //System.out.println("//不存在");  
		     file .mkdir();    
		 } else {  
		     System.out.println("//目录存在");  
		 }  
	   
	   
	   pmm.getMailContent((Part)mimeMessage);  //根据内容的不同解析邮件
	   pmm.setAttachPath(path);  //设置邮件附件的保存路径
	   List<String> list = pmm.saveAttachMent((Part)mimeMessage); //保存附件
	  // String upload = "";
	   if(list!=null&&list.size()>0){
		   String filePath =path+list.get(0);
		   for(int i=1;i<list.size();i++){
			   filePath = filePath+","+path+filePath+list.get(i);
		   }
		    //upload = filePath;
		   map.put("upload", filePath);//邮件路径
	   }else{
		   // upload = null;
		   map.put("upload", null);//邮件路径
	   }
	   
	   //String content = pmm.getBodyText();
	   map.put("content", java.net.URLEncoder.encode(pmm.getBodyText(),"UTF-8"));//邮件内容
	   //System.out.println(emailtool);
	   //emailtool.insertEmail();
	   
	   //emailServiceImpl.InsertNewEmail( emailUID,title,thetime,emailStatus,priority,replySign,isupload,sender,recipients,copyRecipients,secretRecipients,emailType,emailSize,upload,content);
	  // emailServiceImpl.InsertNewEmail(emailUID, title, thetime, emailStatus, priority, replySign, isupload, sender, recipients, copyRecipients, secretRecipients, emailType, emailSize, upload, content);
	   //emailServiceImpl.InsertNewEmail("1","1","1","1","1","0","1","1","1","1","1","1","1","1","1");
	   System.out.println(emailServiceImpl);
	   System.out.println(map.get("emailUID"));
	   emailServiceImpl.InsertNewEmail(map);
	  // emailtool.insertEmail(map);
	   
	   /*System.out.println("主题 :"+pmm.getSubject());
	   System.out.println("发送时间 :"+pmm.getSendDate());
	   System.out.println("是否已读：" + pmm.isNew());
	   System.out.println("邮件优先级：" + pmm.getPriority());
	   System.out.println("是否回执 :"+pmm.getReplySign());
	   System.out.println("是否包含附件 :"+pmm.isContainAttach((Part)mimeMessage));
	   
	   
	   System.out.println("发件人 :"+pmm.getFrom1());
	   System.out.println("收件人 :"+pmm.getMailAddress("TO"));
	   System.out.println("抄送地址 :"+pmm.getMailAddress("CC"));
	   System.out.println("密送地址 :"+pmm.getMailAddress("BCC"));     
	   System.out.println("邮件ID :"+pmm.getMessageId());
	   System.out.println("邮件的大小 :"+pmm.getSize());
	   pmm.getMailContent((Part)mimeMessage);  //根据内容的不同解析邮件
	   pmm.setAttachPath("D:\\Users\\qinxg\\Desktop");  //设置邮件附件的保存路径
	   pmm.saveAttachMent((Part)mimeMessage); //保存附件
	   System.out.println("邮件正文 :"+pmm.getBodyText());
	   System.out.println("*********************************第"+(1)+"封邮件结束*************************************");*/
 }
 
 /**
 　*　PraseMimeMessage类测试
 　
  * @throws Exception */
 /*public static void main(String[] args) throws Exception {
  String host="pop3.163.com";
  String username="lonelypickuplight";
  String password="qin190530246";
  Properties props=new Properties();
  Session session=Session.getDefaultInstance(props,null);
  Store store=session.getStore("pop3");
  store.connect(host,username,password);
  Folder folder=store.getFolder("INBOX");
  folder.open(Folder.READ_ONLY);
  
  try { 
	  if (folder instanceof POP3Folder) { 
	  POP3Folder inbox = (POP3Folder) folder; 
	  PraseMimeMessage pmm=null;
	  Message[] messages = inbox.getMessages(); 
	  for (int i = 0; i < messages.length; i++) { 
	  MimeMessage mimeMessage = (MimeMessage) messages[i]; 
	  String uid = inbox.getUID(mimeMessage); 
	  if (!emailUidDB.get(userSession.getUserId(), uid)) { 
	  receive(mimeMessage, uid); 
	  } 
	  } 
	  } else if (folder instanceof IMAPFolder) { 
	  IMAPFolder inbox = (IMAPFolder) folder; 
	  Message[] messages = inbox.getMessages(); 
	  for (int i = 0; i < messages.length; i++) { 
	  MimeMessage mimeMessage = (MimeMessage) messages[i]; 
	  String uid = Long.toString(inbox.getUID(mimeMessage)); 
	  if (!emailUidDB.get(userSession.getUserId(), uid)) { 
	  receive(mimeMessage, uid); 
	  } 
	  } 
	  } else { 
	 // logger.error("no have this folder {}", folder); 
	  } 
	 // emailAccountBean.setTime(System.currentTimeMillis()); 
	  } finally { 
	  folder.close(false); 
	  store.close(); 
	  } 
  
  
  
  
  
  
  Message message[]=folder.getMessages();
  PraseMimeMessage pmm=null;
  for (int i = 0; i < message.length; i++) {
   System.out.println("****************************************第"+(i+1)+"封邮件**********************************");
   pmm=new PraseMimeMessage((MimeMessage)message[i]);
   System.out.println("主题 :"+pmm.getSubject());
   pmm.setDateFormat("yy年MM月dd日 HH:mm"); 
   System.out.println("发送时间 :"+pmm.getSendDate());
   System.out.println("是否已读：" + pmm.isNew());
   System.out.println("邮件优先级：" + pmm.getPriority());
   System.out.println("是否回执 :"+pmm.getReplySign());
   System.out.println("是否包含附件 :"+pmm.isContainAttach((Part)message[i]));
   System.out.println("发件人 :"+pmm.getFrom1());
   System.out.println("收件人 :"+pmm.getMailAddress("TO"));
   System.out.println("抄送地址 :"+pmm.getMailAddress("CC"));
   System.out.println("密送地址 :"+pmm.getMailAddress("BCC"));     
   System.out.println("邮件ID :"+i+":"+pmm.getMessageId());
   System.out.println("邮件的大小 :"+pmm.getSize());
   pmm.getMailContent((Part)message[i]);  //根据内容的不同解析邮件
   pmm.setAttachPath("D:\\Users\\qinxg\\Desktop");  //设置邮件附件的保存路径
   pmm.saveAttachMent((Part)message[i]); //保存附件
   System.out.println("邮件正文 :"+pmm.getBodyText());
   System.out.println("*********************************第"+(i+1)+"封邮件结束*************************************");
  }
 } */
}
