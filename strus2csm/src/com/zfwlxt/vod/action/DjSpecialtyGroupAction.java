/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */

package com.zfwlxt.vod.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.org.rapid_framework.beanutils.BeanUtils;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.ModelDriven;

import java.io.IOException;
import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.zfwlxt.util.Flash;
import com.zfwlxt.vod.model.*;
import com.zfwlxt.vod.dao.*;
import com.zfwlxt.vod.service.*;
import com.zfwlxt.vod.vo.query.*;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @since 
 * @version 1.0
 * @since 1.0
 */


public class DjSpecialtyGroupAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/admin/DjSpecialtyGroup/query.jsp";
	protected static final String LIST_JSP= "/admin/DjSpecialtyGroup/list.jsp";
	protected static final String CREATE_JSP = "/admin/DjSpecialtyGroup/create.jsp";
	protected static final String EDIT_JSP = "/admin/DjSpecialtyGroup/edit.jsp";
	protected static final String SHOW_JSP = "/admin/DjSpecialtyGroup/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/admin/DjSpecialtyGroup/list.do";
	
	private DjSpecialtyGroupManager djSpecialtyGroupManager;
	
	private DjSpecialtyGroup djSpecialtyGroup;
	java.lang.Long id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			djSpecialtyGroup = new DjSpecialtyGroup();
		} else {
			djSpecialtyGroup = (DjSpecialtyGroup)djSpecialtyGroupManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setDjSpecialtyGroupManager(DjSpecialtyGroupManager manager) {
		this.djSpecialtyGroupManager = manager;
	}	
	
	public Object getModel() {
		return djSpecialtyGroup;
	}
	
	public void setId(java.lang.Long val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		DjSpecialtyGroupQuery query = newQuery(DjSpecialtyGroupQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = djSpecialtyGroupManager.findPage(query);
		savePage(page,query);
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}
	
	/** 进入新增页面*/
	public String create() {
		return CREATE_JSP;
	}
	
	/** 保存新增对象 */
	public String save() {
		djSpecialtyGroupManager.save(djSpecialtyGroup);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		djSpecialtyGroupManager.update(this.djSpecialtyGroup);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	public String findBySpec(){
		String spe=getRequest().getParameter("specId");
		List<DjSpecialtyGroup> speciGroup=null;
//			speciGroup=djSpecialtyGroupManager.findBySpec(spe);
		String option="<option value='0'>请选择</option>";
		if(speciGroup!=null && speciGroup.size()!=0 ){
			for (DjSpecialtyGroup djSpecialtyGroup : speciGroup) {
				option+="<option value='"+djSpecialtyGroup.getId()+"' >"+djSpecialtyGroup.getGroupName()+"</option>";
			}
		}
		try {
			getResponse().getWriter().write(option);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.Long id = new java.lang.Long((String)params.get("id"));
			djSpecialtyGroupManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

}
