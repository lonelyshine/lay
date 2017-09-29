package com.cy.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TalkMapper {
	//获取个人信息
    public List<HashMap<String,Object>> getTolkInfo(@Param(value="userId") int userId);
    
  //获取好友信息
    public List<HashMap<String,Object>> getTolkFriendInfo(@Param(value="userId") int userId);
    
  //获取群组信息
    public List<HashMap<String,Object>> getTolkGroupInfo(@Param(value="userId") int userId);
    
    
  //获取群组成员信息
    public List<HashMap<String,Object>> getMembers(@Param(value="id") int id);
    
    //根据群组编号查询成员的id
    public List<HashMap<String,Object>> getTolkGroupList(@Param(value="id") int id);

  //监控个性签名修改
    public void  modifySign(@Param(value="sign") String sign,@Param(value="id") int id);

    //监控个性签名修改
    public void  modifyonline(@Param(value="online") String online,@Param(value="id") int id);
}
