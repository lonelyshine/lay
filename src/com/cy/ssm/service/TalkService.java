package com.cy.ssm.service;

import java.util.HashMap;
import java.util.List;

public interface TalkService {
	   //获取用户的相关信息
       public List<HashMap<String,Object>>  getTolkInfo(int userId);
     //获取好友的相关信息
       public List<HashMap<String,Object>>  getTolkFriendInfo(int userId);
       
     //获取群组的相关信息
       public List<HashMap<String,Object>>  getTolkGroupInfo(int userId);
       
     //获取群组成员信息
       public List<HashMap<String,Object>>  getMembers(int id);
       
     //根据群组编号查询成员的id
       public List<HashMap<String,Object>>  getTolkGroupList(int id);
       
       //监控个性签名修改
       public void  modifySign(String sign,int id);

     //监控在线状态修改
       public void  modifyonline(String online,int id);
       
}

