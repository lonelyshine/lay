package com.cy.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.cy.ssm.beans.EmailBean;
import com.cy.ssm.mapper.EmailMapper;
import com.cy.ssm.service.EmailService;
import com.cy.ssm.util.BeanUtil;
import com.cy.ssm.util.PagedResult;
import com.github.pagehelper.PageHelper;
@Service
public class EmailServiceImpl implements EmailService{
	@Resource
	private EmailMapper email;
	//查询用户是否存在邮箱
	public List<HashMap<String,Object>> query(int userId){
		System.out.println("-----------------------------------------"+userId);
		return email.queryEmail(userId);
	}
	//查询用户发发送的邮件
	public List<HashMap<String,Object>> queryAllEmail(String userEmail){
		System.out.println("-----------------------------------------"+userEmail);
		return email.queryAllSenderEmail(userEmail);
	}
	//查询用户接收的邮件
    public List<HashMap<String,Object>> queryAllRecipientsEmail(String userEmail){
			System.out.println("-----------------------------------------"+userEmail);
			return email.queryAllRecipientsEmail(userEmail);
	}
   //查询用户重要的邮件
    public List<HashMap<String,Object>> queryAllImportanceEmail(String userEmail){
			System.out.println("-----------------------------------------"+userEmail);
			return email.queryAllImportanceEmail(userEmail);
    }
  //查询用户草稿的邮件
    public List<HashMap<String,Object>> queryAllDraftEmail(String userEmail){
			System.out.println("-----------------------------------------"+userEmail);
			return email.queryAllDraftEmail(userEmail);
	}
   //查询用户删除的邮件
    public List<HashMap<String,Object>> queryAllDeleteEmail(String userEmail){
			System.out.println("-----------------------------------------"+userEmail);
			return email.queryAllDeleteEmail(userEmail);
    }
    //分页查询实现类
    public PagedResult<HashMap<String,Object>> queryByPage(String userEmail,Integer pageNo,Integer pageSize ) {  
        pageNo = pageNo == null?1:pageNo;  
        pageSize = pageSize == null?10:pageSize;  
        PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
        return BeanUtil.toPagedResult(email.queryEmailByUser(userEmail));  
    }
    
    //根据条件分页查询邮件
  	public PagedResult<HashMap<String,Object>> queryByPageAndTerm(String userEmail,Integer pageNo,Integer pageSize,String term,String sort){
  		 pageNo = pageNo == null?1:pageNo;  
         pageSize = pageSize == null?10:pageSize;  
         PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
         return BeanUtil.toPagedResult(email.queryEmailByTerm(userEmail,term,sort));  
  	}
    
    //获取个人邮件的uid编号(监控是否有新邮件)
    public  List<HashMap<String,String>> getEmailUID(String userEmail){
    	return email.getEmailUID(userEmail);
    }
  //将查询出的邮件插入到数据库中
  	/*public  void InsertNewEmail(String emailUID,String title, String thetime, String emailStatus,String priority,String replySign,String isupload,String sender,String recipients,String copyRecipients ,String secretRecipients, String emailType,String emailSize,String upload,String content){
  		 //System.out.println(map);
  		System.out.println("ajshgdhjagsdjhagsdjhg");
        // email.InsertNewEmail( emailUID, title,  thetime,  emailStatus, priority, replySign, isupload, sender, recipients, copyRecipients , secretRecipients,  emailType, emailSize, upload, content);
  	}*/
    public  void InsertNewEmail(HashMap<String,Object>map){
 		 //System.out.println(map);
 		//System.out.println("ajshgdhjagsdjhagsdjhg");
        //email.InsertNewEmail(map);
    	System.out.println((String)map.get("emailUID")+(String)map.get("title") + (String)map.get("thetime") +(String)map.get("emailStatus") +(String)map.get("priority") +(String)map.get("replySign") +(String)map.get("isupload") +(String)map.get("sender") +(String)map.get("recipients") +(String)map.get("copyRecipients")  + (String)map.get("secretRecipients")+ (String)map.get("emailType") +(String)map.get("emailSize")  +(String)map.get("upload")+(String)map.get("content"));
    	//String content = "aaaaa";
    	email.InsertNewEmail((String)map.get("emailUID"),(String)map.get("title") , (String)map.get("thetime") , (String)map.get("emailStatus") ,(String)map.get("priority") ,(String)map.get("replySign") ,(String)map.get("isupload") ,(String)map.get("sender") ,(String)map.get("recipients") ,(String)map.get("copyRecipients")  , (String)map.get("secretRecipients"), (String)map.get("emailType") ,(String)map.get("emailSize") , (String)map.get("upload"),(String)map.get("content"));
 	}
    
    //查询邮件详细信息
    public  EmailBean queryEmailContent(long emailid){
    	email.updateEmailStatus(emailid);
    	return email.queryEmailContent(emailid);
    }
    
    //查询未读邮件数量
  	public String  queryNotReadEmail(String userEmail){
  		return email.queryNotReadEmail(userEmail);
  	}
  	
    //查询总邮件数量
  	public List<HashMap<String,String>>  queryEmailTotal(String userEmail){
  		return email.queryEmailTotal(userEmail);
  	}
  	
    //通过邮件标题模糊查询邮件信息
  	public PagedResult<HashMap<String,Object>> queryByPageAndTitle(String userEmail,Integer pageNo,Integer pageSize,String title){
  		pageNo = pageNo == null?1:pageNo;  
        pageSize = pageSize == null?10:pageSize;  
        PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
        return BeanUtil.toPagedResult(email.queryEmailByTitle(userEmail,title)); 
  	}
    //修改邮件信息的相关状态标识
  	public void updateEmailTab(String emailid,String field,String value){
  		email.updateEmailTab(emailid,field,value);  		
  	}
  	
    //发送邮件信息
  	public void insertEmail(String tempemail,String getEmailperson,String copyEmailperson,String secretEmailperson,String sub,String content,String temp,String time,String isupload){
  		email.insertEmail(tempemail,getEmailperson,copyEmailperson,secretEmailperson,sub,content,temp,time,isupload);  	
  	}
  	
  //保存草稿邮件
  	public void insertDraftEmail(String tempemail,String getEmailperson,String copyEmailperson,String secretEmailperson,String sub,String content,String temp,String time,String isupload){
  		email.insertDraftEmail(tempemail,getEmailperson,copyEmailperson,secretEmailperson,sub,content,temp,time,isupload);  	
  	}
  	
  //查询下一封邮件信息内容
  	public List<HashMap<String,Object>> nextEmail(String emailid,String useremail){
  		return email.nextEmail(emailid,useremail);  	
  	}
  	
  //根据邮件类型分页查询邮件
  	public PagedResult<HashMap<String,Object>> queryByPagebytype(String userEmail,Integer pageNo,Integer pageSize,String type){
  		pageNo = pageNo == null?1:pageNo;  
        pageSize = pageSize == null?10:pageSize;  
        PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
        return BeanUtil.toPagedResult(email.queryEmailByType(userEmail,type));  
  	} 
  	
  	
  //根据邮件类型和邮件字段条件分页查询邮件信息 
  	public PagedResult<HashMap<String,Object>> queryByPageAndTermAndType(String userEmail,Integer pageNo,Integer pageSize,String term,String sort,String type){
  		 pageNo = pageNo == null?1:pageNo;  
         pageSize = pageSize == null?10:pageSize;  
         PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
         return BeanUtil.toPagedResult(email.queryEmailByTermAndType(userEmail,term,sort,type));  
  	}
  	
  	
  //根据邮件标题和邮件类型查询邮件信息 
  	public PagedResult<HashMap<String,Object>> queryByPageAndTitleAndType(String userEmail,Integer pageNo,Integer pageSize,String title,String type){
  		pageNo = pageNo == null?1:pageNo;  
        pageSize = pageSize == null?10:pageSize;  
        PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
        return BeanUtil.toPagedResult(email.queryEmailByTitleAndType(userEmail,title,type)); 
  	}
  	
}
