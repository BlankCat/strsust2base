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
 * @since 1.0,2017/12/25 09:47:39
 */


@Entity
@Table(name = "dj_specialty_cart")
public class DjSpecialtyCart extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialtyCart";
	public static final String ALIAS_CART_ID = "主键ID";
	public static final String ALIAS_OWN_ACCOUT = "收藏人 account_id";
	public static final String ALIAS_SPECS_ID = "专业课id";
	public static final String ALIAS_ADD_TIME = "收藏时间";
	
	//date formats
	public static final String FORMAT_ADD_TIME = DATE_TIME_FORMAT;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long cartId; 	// 主键ID 
	
	private java.lang.Long ownAccout; 	// 收藏人 account_id 
	
	private java.lang.Long specsId; 	// 专业课id 
	
	private java.util.Date addTime; 	// 收藏时间 
	//columns END


	public DjSpecialtyCart(){
	}

	public DjSpecialtyCart(
		java.lang.Long cartId
	){
		this.cartId = cartId;
	}

	

	public void setCartId(java.lang.Long value) {
		this.cartId = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "cart_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCartId() {
		return this.cartId;
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
	public String getAddTimeString() {
		return DateConvertUtils.format(getAddTime(), FORMAT_ADD_TIME);
	}
	public void setAddTimeString(String value) {
		setAddTime(DateConvertUtils.parse(value, FORMAT_ADD_TIME,java.util.Date.class));
	}
	
	@Column(name = "add_time", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getAddTime() {
		return this.addTime;
	}
	
	public void setAddTime(java.util.Date value) {
		this.addTime = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CartId",getCartId())
			.append("OwnAccout",getOwnAccout())
			.append("SpecsId",getSpecsId())
			.append("AddTime",getAddTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCartId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialtyCart == false) return false;
		if(this == obj) return true;
		DjSpecialtyCart other = (DjSpecialtyCart)obj;
		return new EqualsBuilder()
			.append(getCartId(),other.getCartId())
			.isEquals();
	}
}

