package com.cy.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Param;

import com.cy.ssm.beans.EmailBean;


public interface EmailMapper{
	//查询用户是否存在邮箱
	public List<HashMap<String,Object>> queryEmail(@Param(value="userId") int userId);
	//查询用户发送的邮件
	public List<HashMap<String,Object>> queryAllSenderEmail(@Param(value="userEmail") String userEmail);
	//查询用户接收的邮件
	public List<HashMap<String,Object>> queryAllRecipientsEmail(@Param(value="userEmail") String userEmail);
	//查询用户重要的的邮件
	public List<HashMap<String,Object>> queryAllImportanceEmail(@Param(value="userEmail") String userEmail);
	//查询用户草稿的邮件
	public List<HashMap<String,Object>> queryAllDraftEmail(@Param(value="userEmail") String userEmail);
	//查询用户删除的邮件
	public List<HashMap<String,Object>> queryAllDeleteEmail(@Param(value="userEmail") String userEmail);
	//分页查询用户邮件
	public List<HashMap<String,Object>> queryEmailByUser(@Param(value="userEmail") String userEmail);
	//根据条件分页查询用户邮件
	public List<HashMap<String,Object>> queryEmailByTerm(@Param(value="userEmail") String userEmail,@Param(value="term") String term,@Param(value="sort") String sort);
	//获取个人邮件的uid编号(监控是否有新邮件)
    public  List<HashMap<String,String>> getEmailUID(@Param(value="userEmail") String userEmail);
    //将查询出的邮件插入到数据库中
  	public void InsertNewEmail(@Param(value="emailUID") String emailUID,@Param(value="title") String title, @Param(value="thetime") String thetime, @Param(value="emailStatus") String emailStatus,@Param(value="priority") String priority,@Param(value="replySign") String replySign,@Param(value="isupload") String isupload,@Param(value="sender") String sender,@Param(value="recipients") String recipients,@Param(value="copyRecipients") String copyRecipients ,@Param(value="secretRecipients") String secretRecipients,@Param(value="emailType") String emailType,@Param(value="emailSize") String emailSize,@Param(value="upload") String upload,@Param(value="content")String content);
   // public  void InsertNewEmail(@Param(value="map") HashMap<String,Object> map);
  	
   //查询邮件详情
  	public EmailBean queryEmailContent(@Param(value="emailid") long emailid);
  	
   //修改邮件读取状态
  	public void updateEmailStatus(@Param(value="emailid") long emailid);
  	
   //查询未读邮件数量
  	public String queryNotReadEmail(@Param(value="userEmail") String userEmail);
  	
   //查询总邮件数量
  	public List<HashMap<String,String>> queryEmailTotal(@Param(value="userEmail") String userEmail);
  	
  	
  //根据邮件标题模糊查询
  	public List<HashMap<String,Object>> queryEmailByTitle(@Param(value="userEmail") String userEmail,@Param(value="title") String title);

  //修改邮件信息的相关状态标识
  	public void updateEmailTab(@Param(value="emailid") String emailid,@Param(value="field") String field,@Param(value="value") String value);
  	
   //发送邮件信息
  	public void insertEmail(@Param(value="sender") String tempemail,@Param(value="recipients") String getEmailperson,@Param(value="copyRecipients") String copyEmailperson,@Param(value="secretRecipients") String secretEmailperson,@Param(value="title") String sub,@Param(value="content") String content,@Param(value="upload") String temp,@Param(value="thetime") String time,@Param(value="isupload") String isupload);
  
   //发送邮件信息
  	public void insertDraftEmail(@Param(value="sender") String tempemail,@Param(value="recipients") String getEmailperson,@Param(value="copyRecipients") String copyEmailperson,@Param(value="secretRecipients") String secretEmailperson,@Param(value="title") String sub,@Param(value="content") String content,@Param(value="upload") String temp,@Param(value="thetime") String time,@Param(value="isupload") String isupload);
 
   //查询下一封邮件信息内容
  	public List<HashMap<String,Object>> nextEmail(@Param(value="emailid") String emailid, @Param(value="userEmail") String userEmail);
   //根据邮件类型分页查询邮件
  	public List<HashMap<String,Object>> queryEmailByType(@Param(value="userEmail") String userEmail,@Param(value="type") String type);
  	
  	
  //根据邮件类型和邮件字段条件分页查询邮件信息 
  	public List<HashMap<String,Object>> queryEmailByTermAndType(@Param(value="userEmail") String userEmail,@Param(value="term") String term,@Param(value="sort") String sort,@Param(value="type") String type);
  	
    //根据邮件标题和邮件类型查询邮件信息 
  	public List<HashMap<String,Object>> queryEmailByTitleAndType(@Param(value="userEmail") String userEmail,@Param(value="title") String title,@Param(value="type") String type);
}
