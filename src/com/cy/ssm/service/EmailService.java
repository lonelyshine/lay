package com.cy.ssm.service;

import java.util.HashMap;
import java.util.List;

import com.cy.ssm.beans.EmailBean;
import com.cy.ssm.beans.UserBean;
import com.cy.ssm.util.PagedResult;

public interface EmailService {
	//查询用户是否存在邮箱
	public List<HashMap<String,Object>> query(int userId);
	//查询用户发发送的邮件
	public  List<HashMap<String,Object>> queryAllEmail(String userEmail);
	//查询用户接收的邮件
	public  List<HashMap<String,Object>> queryAllRecipientsEmail(String userEmail);
	//查询用户重要的邮件
	public  List<HashMap<String,Object>> queryAllImportanceEmail(String userEmail);
	//查询用户草稿的邮件
	public  List<HashMap<String,Object>> queryAllDraftEmail(String userEmail);
	//查询用户删除的邮件
	public  List<HashMap<String,Object>> queryAllDeleteEmail(String userEmail);
	//分页查询邮件
	PagedResult<HashMap<String,Object>> queryByPage(String userEmail,Integer pageNo,Integer pageSize);
	//根据条件分页查询邮件
	PagedResult<HashMap<String,Object>> queryByPageAndTerm(String userEmail,Integer pageNo,Integer pageSize,String term,String sort);
	//获取个人邮件的uid编号(监控是否有新邮件)
	public  List<HashMap<String,String>> getEmailUID(String userEmail);
	
	//将查询出的邮件插入到数据库中
	//public   void InsertNewEmail(String emailUID,String title, String thetime, String emailStatus,String priority,String replySign,String isupload,String sender,String recipients,String copyRecipients ,String secretRecipients, String emailType,String emailSize,String upload,String content);
	public void InsertNewEmail(HashMap<String,Object> map);
	
	//查询邮件详细信息
	public EmailBean queryEmailContent(long emailid);
	
	//查询未读邮件数量
  	public String queryNotReadEmail(String userEmail);
  	
  	//查询总邮件数量
  	public List<HashMap<String,String>> queryEmailTotal(String userEmail);
  	
    //通过邮件标题模糊查询邮件信息
  	public PagedResult<HashMap<String,Object>> queryByPageAndTitle(String userEmail,Integer pageNo,Integer pageSize,String title);
  	
    //修改邮件信息的相关状态标识
  	public void updateEmailTab(String emailid,String field,String value);
  	
  	//发送邮件信息
  	public void insertEmail(String tempemail,String getEmailperson,String copyEmailperson,String secretEmailperson,String sub,String content,String temp,String time,String isupload);
  	
    //保存草稿邮件
  	public void insertDraftEmail(String tempemail,String getEmailperson,String copyEmailperson,String secretEmailperson,String sub,String content,String temp,String time,String isupload);
  	
    //查询下一封邮件信息内容
  	public List<HashMap<String,Object>> nextEmail(String emailid,String email);
  	
  //根据邮件类型分页查询邮件
  	public PagedResult<HashMap<String,Object>> queryByPagebytype(String email,Integer pageNumber,Integer pageSize,String type); 
  	
  	
  //根据邮件类型和邮件字段条件分页查询邮件信息
  	PagedResult<HashMap<String,Object>> queryByPageAndTermAndType(String userEmail,Integer pageNo,Integer pageSize,String term,String sort,String type);
  	
  //根据邮件标题和邮件类型查询邮件信息 
  	public PagedResult<HashMap<String,Object>> queryByPageAndTitleAndType(String userEmail,Integer pageNo,Integer pageSize,String title,String type);
}
