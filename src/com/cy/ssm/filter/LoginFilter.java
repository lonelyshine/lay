package com.cy.ssm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse res = (HttpServletResponse) arg1;
		//从SESSION获取对象
		Object obj = req.getSession().getAttribute("user");
		String servletPath = req.getServletPath();
		//System.out.println(obj+"0");
		if(obj != null){
			//System.out.println(obj+"3");
			arg2.doFilter(arg0, arg1);//请求：我自己定义请求，例外就是页面JS,JSP,HTML
		}else{
			String path = req.getContextPath();
			String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
			
			if(servletPath.contains(".")){
				int index = servletPath.lastIndexOf(".");
				String suffix = servletPath.substring(index);
				//System.out.println("suffix:"+suffix);
				if(".js.html.css.jpg.png".contains(suffix)||"/index_login.jsp".equals(servletPath)){
					arg2.doFilter(arg0, arg1);
				}else{//重定向
					System.out.println("重定向");
					res.sendRedirect(basePath);
				}
			}else{//这里是处理我们自己定义请求
				String loginStatus = (String) req.getSession().getAttribute("loginStatus");
				if(loginStatus!=null&&!loginStatus.equals("")&&loginStatus.equals("loginout")){//如果是登出后 刷新原有的页面则需要进行重定向到登录页面
					req.getSession().invalidate();//清除session
					res.sendRedirect(basePath);
				}else{
				//System.out.println(servletPath+"1");
				if(servletPath.contains("login")||servletPath.contains("regist")){
					//System.out.println(req.getServletPath()+"::::::::"+res.getLocale());
					arg2.doFilter(arg0, arg1);
				}else if(servletPath.contains("ficationCode")||servletPath.contains("regist")){
					arg2.doFilter(arg0, arg1);
				}else if(servletPath.contains("repassword")||servletPath.contains("regist")){
					arg2.doFilter(arg0, arg1);
				}else{//重定向
					System.out.println(basePath+"2");
					res.sendRedirect(basePath);
				}
			    }
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
