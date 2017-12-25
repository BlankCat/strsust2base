/*
 * Powered By [www.zfwx.com]
 * Web Site: http://www.zfwx.com
 * 
 * Since 2008 - 2017
 */

package com.zfwlxt.vod.model;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.*;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

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


@Entity
@Table(name = "dj_specialty_cat")
public class DjSpecialtyCat extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialtyCat";
	public static final String ALIAS_CAT_ID = "专业课分类id";
	public static final String ALIAS_TYPE_ID = "类型id（做扩展用）";
	public static final String ALIAS_PID = "父id";
	public static final String ALIAS_CAT_NAME = "分类名称";
	public static final String ALIAS_CAT_ICON = "分类图片路径";
	public static final String ALIAS_CAT_INTRO = "分类介绍";
	public static final String ALIAS_DOMAIN = "'0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务',";
	public static final String ALIAS_SPECS_COUNT = "专业课数量";
	public static final String ALIAS_SPECS_PRICE = "专业课总价格";
	public static final String ALIAS_SPECS_SORT = "专业课分类排序";
	public static final String ALIAS_IS_DISPLAY = "状态  0：隐藏  1：展示";
	public static final String ALIAS_IS_DEFAULT = "是否是默认创建0：默认 1:自定义";
	public static final String ALIAS_CREATE_ACCOUNT = "创建账号";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_TIME_FORMAT;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long catId; 	// 专业课分类id 
	
	private java.lang.Long typeId; 	// 类型id（做扩展用） 
	
	private java.lang.Long pid; 	// 父id 
	@Length(max=50)
	private java.lang.String catName; 	// 分类名称 
	@Length(max=200)
	private java.lang.String catIcon; 	// 分类图片路径 
	@Length(max=1000)
	private java.lang.String catIntro; 	// 分类介绍 
	
	private java.lang.Integer domain; 	// '0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务', 
	
	private java.lang.Long specsCount; 	// 专业课数量 
	
	private Long specsPrice; 	// 专业课总价格 
	
	private java.lang.Long specsSort; 	// 专业课分类排序 
	
	private java.lang.Integer isDisplay; 	// 状态  0：隐藏  1：展示 
	
	private java.lang.Integer isDefault; 	// 是否是默认创建0：默认 1:自定义 
	
	private java.lang.Long createAccount; 	// 创建账号 
	
	private java.util.Date createTime; 	// 创建时间 
	//columns END


	public DjSpecialtyCat(){
	}

	public DjSpecialtyCat(
		java.lang.Long catId
	){
		this.catId = catId;
	}

	

	public void setCatId(java.lang.Long value) {
		this.catId = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "cat_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCatId() {
		return this.catId;
	}
	
	@Column(name = "type_id", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(java.lang.Long value) {
		this.typeId = value;
	}
	
	@Column(name = "pid", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getPid() {
		return this.pid;
	}
	
	public void setPid(java.lang.Long value) {
		this.pid = value;
	}
	
	@Column(name = "cat_name", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getCatName() {
		return this.catName;
	}
	
	public void setCatName(java.lang.String value) {
		this.catName = value;
	}
	
	@Column(name = "cat_icon", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getCatIcon() {
		return this.catIcon;
	}
	
	public void setCatIcon(java.lang.String value) {
		this.catIcon = value;
	}
	
	@Column(name = "cat_intro", unique = false, nullable = true, insertable = true, updatable = true, length = 1000)
	public java.lang.String getCatIntro() {
		return this.catIntro;
	}
	
	public void setCatIntro(java.lang.String value) {
		this.catIntro = value;
	}
	
	@Column(name = "domain", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getDomain() {
		return this.domain;
	}
	
	public void setDomain(java.lang.Integer value) {
		this.domain = value;
	}
	
	@Column(name = "specs_count", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpecsCount() {
		return this.specsCount;
	}
	
	public void setSpecsCount(java.lang.Long value) {
		this.specsCount = value;
	}
	
	@Column(name = "specs_price", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public Long getSpecsPrice() {
		return this.specsPrice;
	}
	
	public void setSpecsPrice(Long value) {
		this.specsPrice = value;
	}
	
	@Column(name = "specs_sort", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpecsSort() {
		return this.specsSort;
	}
	
	public void setSpecsSort(java.lang.Long value) {
		this.specsSort = value;
	}
	
	@Column(name = "is_display", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getIsDisplay() {
		return this.isDisplay;
	}
	
	public void setIsDisplay(java.lang.Integer value) {
		this.isDisplay = value;
	}
	
	@Column(name = "is_default", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getIsDefault() {
		return this.isDefault;
	}
	
	public void setIsDefault(java.lang.Integer value) {
		this.isDefault = value;
	}
	
	@Column(name = "create_account", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCreateAccount() {
		return this.createAccount;
	}
	
	public void setCreateAccount(java.lang.Long value) {
		this.createAccount = value;
	}
	
	@Transient
	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,java.util.Date.class));
	}
	
	@Column(name = "create_time", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CatId",getCatId())
			.append("TypeId",getTypeId())
			.append("Pid",getPid())
			.append("CatName",getCatName())
			.append("CatIcon",getCatIcon())
			.append("CatIntro",getCatIntro())
			.append("Domain",getDomain())
			.append("SpecsCount",getSpecsCount())
			.append("SpecsPrice",getSpecsPrice())
			.append("SpecsSort",getSpecsSort())
			.append("IsDisplay",getIsDisplay())
			.append("IsDefault",getIsDefault())
			.append("CreateAccount",getCreateAccount())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCatId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialtyCat == false) return false;
		if(this == obj) return true;
		DjSpecialtyCat other = (DjSpecialtyCat)obj;
		return new EqualsBuilder()
			.append(getCatId(),other.getCatId())
			.isEquals();
	}
}

