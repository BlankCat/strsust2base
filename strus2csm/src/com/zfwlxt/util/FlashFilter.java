package com.zfwlxt.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;
//FlashFilter和Flash移植未作改动，只为调试方便
public class FlashFilter  extends OncePerRequestFilter implements Filter{

	@Override
	protected void doFilterInternal(HttpServletRequest request,HttpServletResponse response, FilterChain chain)throws ServletException, IOException {
		try {
//			System.out.println("test: " + request.getSession().getAttribute("__flash__"));

			Flash.setCurrent(Flash.restore(request));
			request.setAttribute("flash",Flash.current().getData());
			chain.doFilter(request, response);
		}finally {
			Flash flash = Flash.current();
			Flash.setCurrent(null);
			if(flash != null){
				flash.save(request, response);

//				System.out.println("test: " + request.getSession().getAttribute("__flash__"));
			}
		}
	}

}
