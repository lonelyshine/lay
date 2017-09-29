package com.cy.ssm.service;


import java.util.HashMap;
import java.util.List;

import com.cy.ssm.beans.UserBean;

public interface ILoginService {
    //登录校验
	public UserBean Login(String userCode,String userPassword);
	//通过userId获取用户的邮箱用户名和密码
	public List<HashMap<String,Object>> getEmailUserPs(int userId);
	//将生成的验证码存储到用户表中
	public void insertCode(String getEmailperson,String code);
	
	//通过用户名查询邮箱
	public List<HashMap<String,Object>> getNameCode(String nameCode);
	
	 //修改密码
	public void updatePassword(String userCode,String userPassword);
	
	//用户注册
	public void register(String id,String userCode,String userName,String userPassword,String email);
	
	//获取用户表中的用户最大的id
	public List<HashMap<String,Object>> getUserId();
	
	//将头像图片插入到用户表中
    public void updateAvatar(String userid,String avatar);
    
  //将用户信息保存到用户表中
    public void updateUserInfo(int userId,String userName,String userAge,String userSex,String userBirthday,String userTel,String userQq,String userEmail,String userAddress,String userBrief);
    
}
