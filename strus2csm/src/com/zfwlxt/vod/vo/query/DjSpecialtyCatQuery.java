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
 * @since 1.0,2017/12/25 09:47:38
 */


public class DjSpecialtyCatQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 专业课分类id */
	private java.lang.Long catId;
	/** 类型id（做扩展用） */
	private java.lang.Long typeId;
	/** 父id */
	private java.lang.Long pid;
	/** 分类名称 */
	private java.lang.String catName;
	/** 分类图片路径 */
	private java.lang.String catIcon;
	/** 分类介绍 */
	private java.lang.String catIntro;
	/** '0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务', */
	private java.lang.Integer domain;
	/** 专业课数量 */
	private java.lang.Long specsCount;
	/** 专业课总价格 */
	private Long specsPrice;
	/** 专业课分类排序 */
	private java.lang.Long specsSort;
	/** 状态  0：隐藏  1：展示 */
	private java.lang.Integer isDisplay;
	/** 是否是默认创建0：默认 1:自定义 */
	private java.lang.Integer isDefault;
	/** 创建账号 */
	private java.lang.Long createAccount;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public java.lang.Long getCatId() {
		return this.catId;
	}
	
	public void setCatId(java.lang.Long value) {
		this.catId = value;
	}
	
	public java.lang.Long getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(java.lang.Long value) {
		this.typeId = value;
	}
	
	public java.lang.Long getPid() {
		return this.pid;
	}
	
	public void setPid(java.lang.Long value) {
		this.pid = value;
	}
	
	public java.lang.String getCatName() {
		return this.catName;
	}
	
	public void setCatName(java.lang.String value) {
		this.catName = value;
	}
	
	public java.lang.String getCatIcon() {
		return this.catIcon;
	}
	
	public void setCatIcon(java.lang.String value) {
		this.catIcon = value;
	}
	
	public java.lang.String getCatIntro() {
		return this.catIntro;
	}
	
	public void setCatIntro(java.lang.String value) {
		this.catIntro = value;
	}
	
	public java.lang.Integer getDomain() {
		return this.domain;
	}
	
	public void setDomain(java.lang.Integer value) {
		this.domain = value;
	}
	
	public java.lang.Long getSpecsCount() {
		return this.specsCount;
	}
	
	public void setSpecsCount(java.lang.Long value) {
		this.specsCount = value;
	}
	
	public Long getSpecsPrice() {
		return this.specsPrice;
	}
	
	public void setSpecsPrice(Long value) {
		this.specsPrice = value;
	}
	
	public java.lang.Long getSpecsSort() {
		return this.specsSort;
	}
	
	public void setSpecsSort(java.lang.Long value) {
		this.specsSort = value;
	}
	
	public java.lang.Integer getIsDisplay() {
		return this.isDisplay;
	}
	
	public void setIsDisplay(java.lang.Integer value) {
		this.isDisplay = value;
	}
	
	public java.lang.Integer getIsDefault() {
		return this.isDefault;
	}
	
	public void setIsDefault(java.lang.Integer value) {
		this.isDefault = value;
	}
	
	public java.lang.Long getCreateAccount() {
		return this.createAccount;
	}
	
	public void setCreateAccount(java.lang.Long value) {
		this.createAccount = value;
	}
	
	public java.util.Date getCreateTimeBegin() {
		return this.createTimeBegin;
	}
	
	public void setCreateTimeBegin(java.util.Date value) {
		this.createTimeBegin = value;
	}	
	
	public java.util.Date getCreateTimeEnd() {
		return this.createTimeEnd;
	}
	
	public void setCreateTimeEnd(java.util.Date value) {
		this.createTimeEnd = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

