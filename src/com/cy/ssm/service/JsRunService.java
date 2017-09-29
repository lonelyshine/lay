package com.cy.ssm.service;

import java.util.HashMap;
import java.util.List;

import com.cy.ssm.beans.JsrunBean;

public interface JsRunService {
	//获取表中的id的最大值
    public List<JsrunBean> getMaxId();
    
   //保存jsrun内容
  	public void insertjsrun(String Id,String userId,String worksBrief,String worksHtml,String worksCss,String worksJs);
  	
  //获取用户自己的jsrun列表数量
   public List<HashMap<String,Object>> getjsrunNumber(int usreId);
}
