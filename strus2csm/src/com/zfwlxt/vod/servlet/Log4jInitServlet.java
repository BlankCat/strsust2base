package com.zfwlxt.vod.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.PropertyConfigurator;

public class Log4jInitServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ip = request.getRemoteAddr();
		request.getSession().setAttribute("lastIP", ip);
	}

	public void init(ServletConfig config) throws ServletException {

		// 在初始化方法中告诉web容器如何查找日志记录器文件
		// 获取当前web应用部署之后的绝对物理路径
		String realpath = config.getServletContext().getRealPath("/");
		System.out.println("realpath:" + realpath);
		// 获取资源文件的相对路径
		String path = config.getInitParameter("log4j");
		// 读取日志记录器配置文件
		PropertyConfigurator.configure(realpath + path);
	}

}
