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
 * @since 1.0,2017/12/25 09:47:40
 */


public class DjSpecialtyCommentsQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** commentId */
	private java.lang.Long commentId;
	/** 评论类型 （扩充字段） */
	private java.lang.Integer type;
	/** 专业课id */
	private java.lang.Long specsId;
	/** 评论者账号ID */
	private java.lang.Long ownAccount;
	/** 回复某条评论id */
	private java.lang.Long replyId;
	/** 评论的标题 */
	private java.lang.String commentTitle;
	/** 评论的内容 */
	private java.lang.String commentContent;
	/** 评论时间 */
	private java.util.Date commentTimeBegin;
	private java.util.Date commentTimeEnd;
	/** ip地址 */
	private java.lang.String commentIp;
	/** 审核状态- 0：未审核  1：审核通过  2 审核未通过 */
	private java.lang.Integer checkState;

	public java.lang.Long getCommentId() {
		return this.commentId;
	}
	
	public void setCommentId(java.lang.Long value) {
		this.commentId = value;
	}
	
	public java.lang.Integer getType() {
		return this.type;
	}
	
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	public java.lang.Long getSpecsId() {
		return this.specsId;
	}
	
	public void setSpecsId(java.lang.Long value) {
		this.specsId = value;
	}
	
	public java.lang.Long getOwnAccount() {
		return this.ownAccount;
	}
	
	public void setOwnAccount(java.lang.Long value) {
		this.ownAccount = value;
	}
	
	public java.lang.Long getReplyId() {
		return this.replyId;
	}
	
	public void setReplyId(java.lang.Long value) {
		this.replyId = value;
	}
	
	public java.lang.String getCommentTitle() {
		return this.commentTitle;
	}
	
	public void setCommentTitle(java.lang.String value) {
		this.commentTitle = value;
	}
	
	public java.lang.String getCommentContent() {
		return this.commentContent;
	}
	
	public void setCommentContent(java.lang.String value) {
		this.commentContent = value;
	}
	
	public java.util.Date getCommentTimeBegin() {
		return this.commentTimeBegin;
	}
	
	public void setCommentTimeBegin(java.util.Date value) {
		this.commentTimeBegin = value;
	}	
	
	public java.util.Date getCommentTimeEnd() {
		return this.commentTimeEnd;
	}
	
	public void setCommentTimeEnd(java.util.Date value) {
		this.commentTimeEnd = value;
	}
	
	public java.lang.String getCommentIp() {
		return this.commentIp;
	}
	
	public void setCommentIp(java.lang.String value) {
		this.commentIp = value;
	}
	
	public java.lang.Integer getCheckState() {
		return this.checkState;
	}
	
	public void setCheckState(java.lang.Integer value) {
		this.checkState = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

