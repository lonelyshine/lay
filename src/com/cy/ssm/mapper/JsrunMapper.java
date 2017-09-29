package com.cy.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cy.ssm.beans.JsrunBean;

public interface JsrunMapper {
	//获取表中的id的最大值
    public List<JsrunBean> getMaxId();
    
   //保存jsrun内容
  	public void insertjsrun(@Param(value="Id") String Id,@Param(value="userId") String userId,@Param(value="worksBrief") String worksBrief,@Param(value="worksHtml") String worksHtml,@Param(value="worksCss") String worksCss,@Param(value="worksJs") String worksJs);
  	
  //获取用户自己的jsrun列表数量
    public List<HashMap<String,Object>> getjsrunNumber(@Param(value="usreId") int usreId);
}
