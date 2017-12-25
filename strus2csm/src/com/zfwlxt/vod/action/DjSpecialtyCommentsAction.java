/*
 * Powered By [www.zfwx.com]
 * Web Site: http://www.zfwx.com
 * 
 * Since 2008 - 2017
 */

package com.zfwlxt.vod.action;

import java.io.UnsupportedEncodingException;
import java.util.Hashtable;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.zfwlxt.util.Flash;
import com.zfwlxt.vod.model.DjSpecialty;
import com.zfwlxt.vod.model.DjSpecialtyComments;
import com.zfwlxt.vod.service.DjSpecialtyCommentsManager;
import com.zfwlxt.vod.service.DjSpecialtyManager;
import com.zfwlxt.vod.vo.query.DjSpecialtyCommentsQuery;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.util.HttpUtils;
import javacommon.base.BaseStruts2Action;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0,2017/12/13 15:10:12
 */


public class DjSpecialtyCommentsAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/admin/DjSpecialtyComments/query.jsp";
	protected static final String LIST_JSP= "/admin/DjSpecialtyComments/list.jsp";
	protected static final String CREATE_JSP = "/admin/DjSpecialtyComments/create.jsp";
	protected static final String EDIT_JSP = "/admin/DjSpecialtyComments/edit.jsp";
	protected static final String SHOW_JSP = "/admin/DjSpecialtyComments/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/admin/DjSpecialtyComments/list.do";
	
	private DjSpecialtyCommentsManager djSpecialtyCommentsManager;
	
	private DjSpecialtyComments djSpecialtyComments;
	java.lang.Long id = null;
	private String[] items;

	private DjSpecialtyManager djSpecialtyManager;
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
    public void setDjSpecialtyManager(DjSpecialtyManager manager) {
        this.djSpecialtyManager = manager;
    }
    public DjSpecialtyManager getDjSpecialtyManager() {
      return djSpecialtyManager;
    }

    /** 批量上线审批 */
    public String plupapprov() {
        for (int i = 0; i < this.items.length; ++i) {
            Hashtable params = HttpUtils.parseQueryString(this.items[i]);
            Long id = new Long((String) params.get("commentId"));
            this.djSpecialtyComments = ((DjSpecialtyComments) this.djSpecialtyCommentsManager.getById(id));
            if(djSpecialtyComments.getCheckState()!=1){//不是上线状态-->上线==》 评论数+1
                DjSpecialty djSpecialty = (DjSpecialty) this.djSpecialtyManager
                  .getById(this.djSpecialtyComments.getSpecsId());
                int commentnum = djSpecialty.getSpeCommentsNum().intValue() + 1;
                djSpecialty.setSpeCommentsNum(Long.valueOf(commentnum));
                this.djSpecialtyManager.update(djSpecialty); 
            }
            this.djSpecialtyComments.setCheckState(Integer.valueOf(1));
            this.djSpecialtyCommentsManager.update(this.djSpecialtyComments);
        }
        Flash.current().success(APPROVE_SUCCESS);
        return LIST_ACTION;
    }
    
    /** 批量下线审批 */
    public String pldownapprov() {
        for (int i = 0; i < this.items.length; ++i) {
            Hashtable params = HttpUtils.parseQueryString(this.items[i]);
            Long id = new Long((String) params.get("commentId"));
            this.djSpecialtyComments = ((DjSpecialtyComments) this.djSpecialtyCommentsManager.getById(id));
            if(djSpecialtyComments.getCheckState()==1){//上线状态-->下线==》 评论数-1
                DjSpecialty djSpecialty = (DjSpecialty) this.djSpecialtyManager
                  .getById(this.djSpecialtyComments.getSpecsId());
                int commentnum = djSpecialty.getSpeCommentsNum().intValue() - 1;
                djSpecialty.setSpeCommentsNum(Long.valueOf(commentnum));
                this.djSpecialtyManager.update(djSpecialty); 
            }
            this.djSpecialtyComments.setCheckState(Integer.valueOf(2));
            this.djSpecialtyCommentsManager.update(this.djSpecialtyComments);
        }
        Flash.current().success(APPROVE_SUCCESS);
        return LIST_ACTION;
    }
    
    /** 保存更新对象 
     * @throws UnsupportedEncodingException */
    public String update() throws UnsupportedEncodingException {
      DjSpecialtyCommentsQuery query = newQuery(DjSpecialtyCommentsQuery.class,DEFAULT_SORT_COLUMNS);
      int commentnum;
      DjSpecialtyComments olddjComment = (DjSpecialtyComments)
          this.djSpecialtyCommentsManager.getById(this.djSpecialtyComments.getCommentId());
      
      DjSpecialty djCourse =null;
       if ((this.djSpecialtyComments.getCheckState().intValue() == 1)
                    && (olddjComment.getCheckState().intValue() != 1)) {
                djCourse = (DjSpecialty) this.djSpecialtyManager.getById(this.djSpecialtyComments
                        .getSpecsId());
                commentnum = djCourse.getSpeCommentsNum().intValue() + 1;
                djCourse.setSpeCommentsNum(Long.valueOf(commentnum));
                this.djSpecialtyManager.update(djCourse);
         }
    
        if ((this.djSpecialtyComments.getCheckState().intValue() == 2)
                    && (olddjComment.getCheckState().intValue() == 1)) {
                djCourse = (DjSpecialty) this.djSpecialtyManager.getById(this.djSpecialtyComments
                        .getSpecsId());
                commentnum = djCourse.getSpeCommentsNum().intValue() - 1;
                djCourse.setSpeCommentsNum(Long.valueOf(commentnum));
                this.djSpecialtyManager.update(djCourse);
         }

        djSpecialtyCommentsManager.update(this.djSpecialtyComments);
        Flash.current().success(UPDATE_SUCCESS);
        query.setPageSize(30);
        query.setCheckState(null);
        return LIST_JSP;
    }


    
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			djSpecialtyComments = new DjSpecialtyComments();
		} else {
			djSpecialtyComments = (DjSpecialtyComments)djSpecialtyCommentsManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setDjSpecialtyCommentsManager(DjSpecialtyCommentsManager manager) {
		this.djSpecialtyCommentsManager = manager;
	}	
	
	public Object getModel() {
		return djSpecialtyComments;
	}
	
	public void setCommentId(java.lang.Long val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		DjSpecialtyCommentsQuery query = newQuery(DjSpecialtyCommentsQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = djSpecialtyCommentsManager.findPage(query);
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
		djSpecialtyCommentsManager.save(djSpecialtyComments);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
//	/**保存更新对象*/
//	public String update() {
//		djSpecialtyCommentsManager.update(this.djSpecialtyComments);
//		Flash.current().success(UPDATE_SUCCESS);
//		return LIST_ACTION;
//	}
//	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.Long id = new java.lang.Long((String)params.get("commentId"));
			djSpecialtyCommentsManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
	

	

}
