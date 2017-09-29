package com.cy.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cy.ssm.mapper.UserMapper;
import com.cy.ssm.beans.UserBean;
import com.cy.ssm.service.ILoginService;
@Service
public class LoginServiceImpl implements ILoginService{
	
	@Resource
	private UserMapper um;
     
    public UserBean Login(String userCode, String userPassword) {
		return um.login(userCode, userPassword);
	}
    //实现获取用户邮箱名和密码；
    public List<HashMap<String,Object>> getEmailUserPs(int userId){
    	System.out.println(userId);
       return um.getEmailUserPs(userId);    	
    }
  //将生成的验证码存储到用户表中
  	public void insertCode(String getEmailperson,String code){
  		um.insertCode(getEmailperson,code);
  	}
  	
  //通过用户名查询邮箱
  	public List<HashMap<String,Object>> getNameCode(String nameCode){
  		return um.getNameCode(nameCode);
  	}
  	
  //修改密码
  	public void updatePassword(String userCode,String userPassword){
  		um.updatePassword(userCode,userPassword);
  	}
  	
  //用户注册
  	public void register(String id,String userCode,String userName,String userPassword,String email){
  		um.register(id,userCode,userName,userPassword,email);
  	}
  	
  //获取用户表中的用户最大的id
  	public List<HashMap<String,Object>> getUserId(){
  		return um.getUserId();
  	}
  
  //将头像图片插入到用户表中
    public void updateAvatar(String userid,String avatar){
    	um.updateAvatar(userid,avatar);
    }
    
  //将用户信息保存到用户表中
    public void updateUserInfo(int userId,String userName,String userAge,String userSex,String userBirthday,String userTel,String userQq,String userEmail,String userAddress,String userBrief){
    	um.updateUserInfo( userId, userName, userAge, userSex,userBirthday, userTel, userQq, userEmail, userAddress, userBrief);
    }
     
    
}
