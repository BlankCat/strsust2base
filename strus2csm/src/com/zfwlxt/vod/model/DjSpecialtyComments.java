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
 * @since 1.0,2017/12/25 09:47:40
 */


@Entity
@Table(name = "dj_specialty_comments")
public class DjSpecialtyComments extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialtyComments";
	public static final String ALIAS_COMMENT_ID = "commentId";
	public static final String ALIAS_TYPE = "评论类型 （扩充字段）";
	public static final String ALIAS_SPECS_ID = "专业课id";
	public static final String ALIAS_OWN_ACCOUNT = "评论者账号ID";
	public static final String ALIAS_REPLY_ID = "回复某条评论id";
	public static final String ALIAS_COMMENT_TITLE = "评论的标题";
	public static final String ALIAS_COMMENT_CONTENT = "评论的内容";
	public static final String ALIAS_COMMENT_TIME = "评论时间";
	public static final String ALIAS_COMMENT_IP = "ip地址";
	public static final String ALIAS_CHECK_STATE = "审核状态- 0：未审核  1：审核通过  2 审核未通过";
	
	//date formats
	public static final String FORMAT_COMMENT_TIME = DATE_TIME_FORMAT;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long commentId; 	// commentId 
	
	private java.lang.Integer type; 	// 评论类型 （扩充字段） 
	
	private java.lang.Long specsId; 	// 专业课id 
	
	private java.lang.Long ownAccount; 	// 评论者账号ID 
	
	private java.lang.Long replyId; 	// 回复某条评论id 
	@Length(max=100)
	private java.lang.String commentTitle; 	// 评论的标题 
	@Length(max=200)
	private java.lang.String commentContent; 	// 评论的内容 
	
	private java.util.Date commentTime; 	// 评论时间 
	@Length(max=20)
	private java.lang.String commentIp; 	// ip地址 
	
	private java.lang.Integer checkState; 	// 审核状态- 0：未审核  1：审核通过  2 审核未通过 
	//columns END


	public DjSpecialtyComments(){
	}

	public DjSpecialtyComments(
		java.lang.Long commentId
	){
		this.commentId = commentId;
	}

	

	public void setCommentId(java.lang.Long value) {
		this.commentId = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "comment_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCommentId() {
		return this.commentId;
	}
	
	@Column(name = "type", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getType() {
		return this.type;
	}
	
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	@Column(name = "specs_id", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpecsId() {
		return this.specsId;
	}
	
	public void setSpecsId(java.lang.Long value) {
		this.specsId = value;
	}
	
	@Column(name = "own_account", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getOwnAccount() {
		return this.ownAccount;
	}
	
	public void setOwnAccount(java.lang.Long value) {
		this.ownAccount = value;
	}
	
	@Column(name = "reply_id", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getReplyId() {
		return this.replyId;
	}
	
	public void setReplyId(java.lang.Long value) {
		this.replyId = value;
	}
	
	@Column(name = "comment_title", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getCommentTitle() {
		return this.commentTitle;
	}
	
	public void setCommentTitle(java.lang.String value) {
		this.commentTitle = value;
	}
	
	@Column(name = "comment_content", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getCommentContent() {
		return this.commentContent;
	}
	
	public void setCommentContent(java.lang.String value) {
		this.commentContent = value;
	}
	
	@Transient
	public String getCommentTimeString() {
		return DateConvertUtils.format(getCommentTime(), FORMAT_COMMENT_TIME);
	}
	public void setCommentTimeString(String value) {
		setCommentTime(DateConvertUtils.parse(value, FORMAT_COMMENT_TIME,java.util.Date.class));
	}
	
	@Column(name = "comment_time", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getCommentTime() {
		return this.commentTime;
	}
	
	public void setCommentTime(java.util.Date value) {
		this.commentTime = value;
	}
	
	@Column(name = "comment_ip", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.String getCommentIp() {
		return this.commentIp;
	}
	
	public void setCommentIp(java.lang.String value) {
		this.commentIp = value;
	}
	
	@Column(name = "check_state", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getCheckState() {
		return this.checkState;
	}
	
	public void setCheckState(java.lang.Integer value) {
		this.checkState = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CommentId",getCommentId())
			.append("Type",getType())
			.append("SpecsId",getSpecsId())
			.append("OwnAccount",getOwnAccount())
			.append("ReplyId",getReplyId())
			.append("CommentTitle",getCommentTitle())
			.append("CommentContent",getCommentContent())
			.append("CommentTime",getCommentTime())
			.append("CommentIp",getCommentIp())
			.append("CheckState",getCheckState())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCommentId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialtyComments == false) return false;
		if(this == obj) return true;
		DjSpecialtyComments other = (DjSpecialtyComments)obj;
		return new EqualsBuilder()
			.append(getCommentId(),other.getCommentId())
			.isEquals();
	}
}

