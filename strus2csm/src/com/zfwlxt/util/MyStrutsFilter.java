package com.zfwlxt.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;


/** 
 * 自定义文件过滤器，去除附件上传限制。
 * 
 * @author  trz
 * @see  DjSecurityMetadataSource
 * @see  DjAccessDecisionManager
 * */
public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter{ 	
	private FilterInvocationSecurityMetadataSource securityMetadataSource;


	public void doFilter(ServletRequest req, ServletResponse res,
								FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;  
		String url = request.getRequestURI(); 
		try{  
			if(url.length()>31&&"fileUp.jsp;jsessionid=undefined".equals(url.substring(url.length()-31))) {  
				chain.doFilter(req, res);  
			}else if(url.length()>11&&"imageUp.jsp".equals(url.substring(url.length()-11))) {  
		        chain.doFilter(req, res);  
			}else if(url.contains("/widgets/ueditor1_4_3_3/jsp")) {  
				chain.doFilter(req, res);  
			}else if(url.contains("/widgets/ueditor1_4_3/jsp")) {  
				chain.doFilter(req, res);  
		    } else{  
		            super.doFilter(req, res, chain);  
			}  
		}catch(Exception e){  
		      System.out.println("Exception in MyStrutsFilter");  
			  e.printStackTrace();  
		}  
		
	}
	
}