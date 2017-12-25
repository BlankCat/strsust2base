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
 * @version 1.0
 * @since 1.0,2017/12/25 09:47:39
 */


public class DjSpecialtyCartQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 主键ID */
	private java.lang.Long cartId;
	/** 收藏人 account_id */
	private java.lang.Long ownAccout;
	/** 专业课id */
	private java.lang.Long specsId;
	/** 收藏时间 */
	private java.util.Date addTimeBegin;
	private java.util.Date addTimeEnd;

	public java.lang.Long getCartId() {
		return this.cartId;
	}
	
	public void setCartId(java.lang.Long value) {
		this.cartId = value;
	}
	
	public java.lang.Long getOwnAccout() {
		return this.ownAccout;
	}
	
	public void setOwnAccout(java.lang.Long value) {
		this.ownAccout = value;
	}
	
	public java.lang.Long getSpecsId() {
		return this.specsId;
	}
	
	public void setSpecsId(java.lang.Long value) {
		this.specsId = value;
	}
	
	public java.util.Date getAddTimeBegin() {
		return this.addTimeBegin;
	}
	
	public void setAddTimeBegin(java.util.Date value) {
		this.addTimeBegin = value;
	}	
	
	public java.util.Date getAddTimeEnd() {
		return this.addTimeEnd;
	}
	
	public void setAddTimeEnd(java.util.Date value) {
		this.addTimeEnd = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

