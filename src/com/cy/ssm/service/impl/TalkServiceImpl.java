package com.cy.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cy.ssm.mapper.TalkMapper;
import com.cy.ssm.mapper.UserMapper;
import com.cy.ssm.service.ILoginService;
import com.cy.ssm.service.TalkService;

@Service
public class TalkServiceImpl implements TalkService{
	@Resource
	private TalkMapper talk;
	
	//获取用户的相关信息
    public List<HashMap<String,Object>>  getTolkInfo(int userId){
    	return talk.getTolkInfo(userId);
    }
	
  //获取好友的相关信息
    public List<HashMap<String,Object>>  getTolkFriendInfo(int userId){
    	return talk.getTolkFriendInfo(userId);
    }
    
    
  //获取群组的相关信息
    public List<HashMap<String,Object>>  getTolkGroupInfo(int userId){
    	return talk.getTolkGroupInfo(userId);
    }
  //获取群组成员的相关信息
    public List<HashMap<String,Object>>  getMembers(int id){
    	return talk.getMembers(id);
    }
	
   //根据群组编号查询成员的id
    public List<HashMap<String,Object>>  getTolkGroupList(int id){
    	
    	return talk.getTolkGroupList(id);
    }
    
  //监控个性签名修改
    public void  modifySign(String sign,int id){
    	
        talk.modifySign(sign,id);	
    }
    
  //监控在线状态修改
    public void  modifyonline(String online,int id){
    	
    	talk.modifyonline(online,id);	
    }
  
    
    
}
