package com.cy.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cy.ssm.beans.JsrunBean;
import com.cy.ssm.mapper.JsrunMapper;
import com.cy.ssm.service.JsRunService;
@Service
public class JsRunServiceImpl implements JsRunService {
	@Resource
	private JsrunMapper jsrun;
	//获取表中的id的最大值
    public List<JsrunBean> getMaxId(){
    	return jsrun.getMaxId();
    }
    
  //保存jsrun内容
  	public void insertjsrun(String Id,String userId,String worksBrief,String worksHtml,String worksCss,String worksJs){
			jsrun.insertjsrun(Id,userId,worksBrief,worksHtml,worksCss,worksJs);
  	}
  	
  	 //获取用户自己的jsrun列表数量
    public List<HashMap<String,Object>> getjsrunNumber(int usreId){
    	return jsrun.getjsrunNumber(usreId);
    }
}
