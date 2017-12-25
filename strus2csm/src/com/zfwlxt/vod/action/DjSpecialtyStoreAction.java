/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */

package com.zfwlxt.vod.action;

import java.util.Hashtable;

import javacommon.base.BaseStruts2Action;
import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.zfwlxt.util.Flash;
import com.zfwlxt.vod.model.DjSpecialtyStore;
import com.zfwlxt.vod.service.DjSpecialtyStoreManager;
import com.zfwlxt.vod.vo.query.DjSpecialtyStoreQuery;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0
 */


public class DjSpecialtyStoreAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/admin/DjSpecialtyStore/query.jsp";
	protected static final String LIST_JSP= "/admin/DjSpecialtyStore/list.jsp";
	protected static final String CREATE_JSP = "/admin/DjSpecialtyStore/create.jsp";
	protected static final String EDIT_JSP = "/admin/DjSpecialtyStore/edit.jsp";
	protected static final String SHOW_JSP = "/admin/DjSpecialtyStore/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/admin/DjSpecialtyStore/list.do";
	
	private DjSpecialtyStoreManager djSpecialtyStoreManager;
	
	private DjSpecialtyStore djSpecialtyStore;
	java.lang.Long id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			djSpecialtyStore = new DjSpecialtyStore();
		} else {
			djSpecialtyStore = (DjSpecialtyStore)djSpecialtyStoreManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setDjSpecialtyStoreManager(DjSpecialtyStoreManager manager) {
		this.djSpecialtyStoreManager = manager;
	}	
	
	public Object getModel() {
		return djSpecialtyStore;
	}
	
	public void setStoreId(java.lang.Long val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		DjSpecialtyStoreQuery query = newQuery(DjSpecialtyStoreQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = djSpecialtyStoreManager.findPage(query);
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
		djSpecialtyStoreManager.save(djSpecialtyStore);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		djSpecialtyStoreManager.update(this.djSpecialtyStore);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.Long id = new java.lang.Long((String)params.get("storeId"));
			djSpecialtyStoreManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

}
