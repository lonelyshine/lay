package com.cy.ssm.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cy.ssm.beans.JsrunBean;
import com.cy.ssm.beans.UserBean;
import com.cy.ssm.service.JsRunService;
import com.cy.ssm.util.PagedResult;

@Controller
public class JsRunController extends BaseController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private JsRunService jsRunServiceImpl;
	
	/** 
     * 跳转到jsRun编辑器界面
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/jsrun")
	public ModelAndView jsrun(HttpServletRequest req){
		log.info("跳转到jsRun编辑界面");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsrun/jsrun");
		return mv;
	}
	
	/** 
     * 保存jsrun内容
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping(value="/insertjsrun.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
	public String saveJsrun(HttpServletRequest req,JsrunBean jsrun) throws UnsupportedEncodingException{
		log.info("保存jsrun内容");
		//获取表中的id的最大值
		List<JsrunBean> temp =  jsRunServiceImpl.getMaxId();
		int Id;
		if(temp==null){
			Id =1;
			//jsrun.setId(Id);
		}else{
			if(temp.size()<=0){
				Id =1;
			}else{
				Id = temp.get(0).getId()+1;
			}
			//jsrun.setId(Id);
		}
		//获取用户的id
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		int userId = user.getUserId();
		//jsrun.setUserId(userId);
		//保存jsrun内容
		jsRunServiceImpl.insertjsrun(Id+"",userId+"",jsrun.getWorksBrief(),java.net.URLEncoder.encode(jsrun.getWorksHtml(),"UTF-8"),java.net.URLEncoder.encode(jsrun.getWorksCss(),"UTF-8"),java.net.URLEncoder.encode(jsrun.getWorksJs(),"UTF-8"));
       if(jsRunServiceImpl.getMaxId().get(0).getId()==Id){
    	   return responseSuccess("{message:'保存成功'}");
       }else{
    	   return responseSuccess("{message:'保存失败'}");
       }
	}
	
	/** 
     * 跳转到jsRunlist编辑器界面
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping("/jsrunlist")
	public ModelAndView jsrunlist(HttpServletRequest req){
		log.info("跳转到jsRun编辑界面");
		ModelAndView mv = new ModelAndView();
		//获取用户自己的jsrun列表数量
		//获取用户的id
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		int userId = user.getUserId();
		/*List<HashMap<String,Object>> number = jsRunServiceImpl.getjsrunNumber(userId);
		if(number!=null&&number.size()>0){
			
		}*/
		
		/*try {  
            PagedResult<HashMap<String,Object>> pageResult = jsRunServiceImpl.getjsrunNumber(userId,1,8); 
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  */
		
		mv.setViewName("jsrun/jsrunlist/jsrunlist");
		return mv;
	}
	
	/** 
     * 获取个人的jsrun内容
     * @author 秦学刚
     * @since  2016年10月23日  
     * @param page 
     * @return 
     * produces作用：使得返回的数据编码正常
     * @throws UnsupportedEncodingException 
     */  
	@RequestMapping(value="/getjsrunlist.do", method= RequestMethod.POST , produces = "text/html;charset=UTF-8")  
    @ResponseBody  
	public String getJsrun(HttpServletRequest req){
		log.info("获取个人的jsrun内容");
		//获取个人的jsrun内容
		List<JsrunBean> temp =  jsRunServiceImpl.getMaxId();
		return "";
	}
	
}
