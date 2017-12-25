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
 * @since 1.0,2017/12/25 09:47:41
 */


@Entity
@Table(name = "dj_specialty_love")
public class DjSpecialtyLove extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialtyLove";
	public static final String ALIAS_ID = "主键id";
	public static final String ALIAS_STATE = "状态 ： -1 取消点赞  1 点赞";
	public static final String ALIAS_SPECS_TYPE = "专业课类型，扩充字段";
	public static final String ALIAS_OWN_ACCOUT = "点赞人账号id";
	public static final String ALIAS_SPECS_ID = "专业课id";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_TIME_FORMAT;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long id; 	// 主键id 
	
	private java.lang.Integer state; 	// 状态 ： -1 取消点赞  1 点赞 
	
	private java.lang.Integer specsType; 	// 专业课类型，扩充字段 
	
	private java.lang.Long ownAccout; 	// 点赞人账号id 
	
	private java.lang.Long specsId; 	// 专业课id 
	
	private java.util.Date createTime; 	// 创建时间 
	//columns END


	public DjSpecialtyLove(){
	}

	public DjSpecialtyLove(
		java.lang.Long id
	){
		this.id = id;
	}

	

	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getId() {
		return this.id;
	}
	
	@Column(name = "state", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getState() {
		return this.state;
	}
	
	public void setState(java.lang.Integer value) {
		this.state = value;
	}
	
	@Column(name = "specs_type", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpecsType() {
		return this.specsType;
	}
	
	public void setSpecsType(java.lang.Integer value) {
		this.specsType = value;
	}
	
	@Column(name = "own_accout", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getOwnAccout() {
		return this.ownAccout;
	}
	
	public void setOwnAccout(java.lang.Long value) {
		this.ownAccout = value;
	}
	
	@Column(name = "specs_id", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpecsId() {
		return this.specsId;
	}
	
	public void setSpecsId(java.lang.Long value) {
		this.specsId = value;
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
			.append("Id",getId())
			.append("State",getState())
			.append("SpecsType",getSpecsType())
			.append("OwnAccout",getOwnAccout())
			.append("SpecsId",getSpecsId())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialtyLove == false) return false;
		if(this == obj) return true;
		DjSpecialtyLove other = (DjSpecialtyLove)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

