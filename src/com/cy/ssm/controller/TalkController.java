package com.cy.ssm.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cy.ssm.beans.UserBean;
import com.cy.ssm.mapper.TalkMapper;
import com.cy.ssm.service.TalkService;
import com.cy.ssm.service.impl.TalkServiceImpl;

@Controller
public class TalkController extends BaseController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource
	private  TalkService talkServiceImpl;
	
	/** 
     * 获取个人的相关信息
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping(value = "getMYTalkInfo.do", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody 
	public String getTolkInfo(HttpServletRequest req){
		log.info("获取个人相关信息");
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		List<HashMap<String,Object>> mine =  talkServiceImpl.getTolkInfo(user.getUserId());
		List<HashMap<String,Object>> friend =  talkServiceImpl.getTolkFriendInfo(user.getUserId());
		List<HashMap<String,Object>> group =  talkServiceImpl.getTolkGroupInfo(user.getUserId());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mine", mine);
		map.put("friend", friend);
		map.put("group", group);
		return responseSuccess(map);
	}
	
	
	/** 
     * 获取群组成员信息
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
	 * @throws IOException 
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping(value = "getMembers", method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
	@ResponseBody 
	public String  getMembers(HttpServletRequest request,HttpServletResponse response) throws IOException{
		log.info("获取群组成员信息");
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		int id = Integer.parseInt(request.getParameter("id"));
		List<HashMap<String,Object>> members =  talkServiceImpl.getMembers(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(members!=null&&members.size()>0){
			HashMap<String, Object> mdata = new HashMap<String, Object>();
			map.put("code", 0);
			map.put("msg", "");
			HashMap<String, Object> owner = new HashMap<String, Object>();
			//HashMap<String, Object> tempmap = new HashMap<String, Object>();
			//String owner="";
			int member = members.size();
			List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
			for(int i=0;i<members.size();i++){
				
				if(((BigDecimal)members.get(i).get("USERID")).intValue()==user.getUserId()){
					//owner = owner +"'username':'"+members.get(i).get("NICKNAME")+"','id':'"+members.get(i).get("USERID")+"','avatar':'"+members.get(i).get("AVATAR")+"','sign':'"+members.get(i).get("REMARK")+"'";
					owner.put("username", members.get(i).get("NICKNAME"));
					owner.put("id", members.get(i).get("USERID"));
					owner.put("avatar", members.get(i).get("AVATAR"));
					owner.put("sign", members.get(i).get("REMARK"));
					HashMap<String, Object> tempmap = new HashMap<String, Object>();
					tempmap.put("username", members.get(i).get("NICKNAME"));
					tempmap.put("id", members.get(i).get("USERID"));
					tempmap.put("avatar", members.get(i).get("AVATAR"));
					tempmap.put("sign", members.get(i).get("REMARK"));
					//list.add("'username':'"+members.get(i).get("NICKNAME")+"','id':'"+members.get(i).get("USERID")+"','avatar':'"+members.get(i).get("AVATAR")+"','sign':'"+members.get(i).get("REMARK")+"'");
				    list.add(tempmap);
				}else{
					HashMap<String, Object> tempmap = new HashMap<String, Object>();
					tempmap.put("username", members.get(i).get("NICKNAME"));
					tempmap.put("id", members.get(i).get("USERID"));
					tempmap.put("avatar", members.get(i).get("AVATAR"));
					tempmap.put("sign", members.get(i).get("REMARK"));
					//list.add("'username':'"+members.get(i).get("NICKNAME")+"','id':'"+members.get(i).get("USERID")+"','avatar':'"+members.get(i).get("AVATAR")+"','sign':'"+members.get(i).get("REMARK")+"'");
				    list.add(tempmap);
				}
			}
			mdata.put("owner", owner);
			mdata.put("members", member);
			mdata.put("list", list);
			map.put("data", mdata);
		}
		//String hh = "{'code': 0	,'msg': '','data': {'owner': {'username': '贤心','id': '100001','avatar': 'http://tp1.sinaimg.cn/1571889140/180/40030060651/1','sign': '这些都是测试数据，实际使用请严格按照该格式返回'},'members': 12,'list': [{'username': '贤心','id': '100001','avatar': 'http://tp1.sinaimg.cn/1571889140/180/40030060651/1','sign': '这些都是测试数据，实际使用请严格按照该格式返回'},{ 'username': 'Z_子晴','id': '108101','avatar': 'http://tva3.sinaimg.cn/crop.0.0.512.512.180/8693225ajw8f2rt20ptykj20e80e8weu.jpg','sign': '微电商达人'},{'username': 'Lemon_CC','id': '102101','avatar': 'http://tp2.sinaimg.cn/1833062053/180/5643591594/0','sign': ''},{'username': '马小云','id': '168168','avatar': 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1','sign': '让天下没有难写的代码' },{'username': '徐小峥','id': '666666','avatar': 'http://tp2.sinaimg.cn/1783286485/180/5677568891/1','sign': '代码在囧途，也要写到底'},{'username': '罗玉凤' ,'id': '121286','avatar': 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0','sign': '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱'},{'username': '长泽梓Azusa','id': '100001222','avatar': 'http://tva1.sinaimg.cn/crop.0.0.180.180.180/86b15b6cjw1e8qgp5bmzyj2050050aa8.jpg','sign': '我是日本女艺人长泽あずさ'},{'username': '大鱼_MsYuyu','id': '12123454','avatar': 'http://tp1.sinaimg.cn/5286730964/50/5745125631/0','sign': '我瘋了！這也太準了吧  超級笑點低'},{'username': '谢楠','id': '10034001','avatar': 'http://tp4.sinaimg.cn/1665074831/180/5617130952/0','sign': ''},{'username': '柏雪近在它香','id': '3435343','avatar': 'http://tp2.sinaimg.cn/2518326245/180/5636099025/0','sign': ''},{'username': '林心如','id': '76543','avatar': 'http://tp3.sinaimg.cn/1223762662/180/5741707953/0','sign': '我爱贤心'},{'username': '佟丽娅','id': '4803920','avatar': 'http://tp4.sinaimg.cn/1345566427/180/5730976522/0','sign': '我也爱贤心吖吖啊'}]}}";
		
		//System.out.println(responseMemberSuccess(map));
		 return responseMemberSuccess(map);
	}
	
	
	
	/** 
     * 根据群组信息回去群成员id
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */ 
	@RequestMapping(value = "getTolkGroupList.do", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody 
	public String getTolkGroupList(HttpServletRequest req,int id){
		log.info("根据群组信息回去群成员id");
		List<HashMap<String,Object>> list = talkServiceImpl.getTolkGroupList(id);
		return responseArraySuccess(list);
	}
	
	
	/** 
     * 监控个性签名修改
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */ 
	@RequestMapping(value = "modifySign.do", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody 
	public void modifySign(HttpServletRequest request,String sign){
		log.info("监控个性签名修改");
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		int id = user.getUserId();
		talkServiceImpl.modifySign(sign,id);
		//return responseArraySuccess(list);
	}
	
	/** 
     * 监控在线状态修改
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */ 
	@RequestMapping(value = "modifyonline.do", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody 
	public void modifyonline(HttpServletRequest request,String online){
		log.info("监控个性签名修改");
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		int id = user.getUserId();
		talkServiceImpl.modifyonline(online,id);
		//return responseArraySuccess(list);
	}
	
}
