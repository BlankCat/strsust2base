/*
 * Powered By [www.zfwx.com]
 * Web Site: http://www.zfwx.com
 * 
 * Since 2008 - 2017
 */

package com.zfwlxt.vod.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.zfwlxt.vod.model.*;
import com.zfwlxt.vod.dao.*;
import com.zfwlxt.vod.service.*;
import com.zfwlxt.vod.vo.query.*;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0,2017/12/25 09:47:42
 */


public class DjSpecialtyStoreQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 主键id */
	private java.lang.Long storeId;
	/** 课程id */
	private java.lang.Long courseId;
	/** 所属专业 */
	private java.lang.Long speId;
	/** 所属分组 */
	private java.lang.Long groupId;
	/** 在分组中的排序 */
	private java.lang.Integer courseOrder;

	public java.lang.Long getStoreId() {
		return this.storeId;
	}
	
	public void setStoreId(java.lang.Long value) {
		this.storeId = value;
	}
	
	public java.lang.Long getCourseId() {
		return this.courseId;
	}
	
	public void setCourseId(java.lang.Long value) {
		this.courseId = value;
	}
	
	public java.lang.Long getSpeId() {
		return this.speId;
	}
	
	public void setSpeId(java.lang.Long value) {
		this.speId = value;
	}
	
	public java.lang.Long getGroupId() {
		return this.groupId;
	}
	
	public void setGroupId(java.lang.Long value) {
		this.groupId = value;
	}
	
	public java.lang.Integer getCourseOrder() {
		return this.courseOrder;
	}
	
	public void setCourseOrder(java.lang.Integer value) {
		this.courseOrder = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

