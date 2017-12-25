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
 * @since 1.0,2017/12/25 08:07:08
 */


public class DjSpecialtyQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.Long id;
	/** 名称前缀 */
	private java.lang.String speNamePrefix;
	/** 名称 */
	private java.lang.String speName;
	/** 名称后缀 */
	private java.lang.String speNameSuffix;
	/** 课时 */
	private java.lang.Float speLesson;
	/** 价格 */
	private java.lang.Float spePrice;
	/** 简介 */
	private java.lang.String speSynopsis;
	/** 内容 */
	private java.lang.String speContent;
	/** 图片 */
	private java.lang.String speImg;
	/** 状态：前台是否需要展示，默认0不需要1展示 */
	private java.lang.Integer speStatus;
	/** 排序 */
	private java.lang.Integer speOrder;
	/** 添加时间 */
	private java.util.Date speAddtimeBegin;
	private java.util.Date speAddtimeEnd;
	/** 序言标题 */
	private java.lang.String spePreTitle;
	/** 序言内容 */
	private java.lang.String spePreContent;
	/** 课程目录 */
	private java.lang.String speContents;
	/** 后记标题 */
	private java.lang.String spePoscTitle;
	/** 后记内容 */
	private java.lang.String spePoscContent;
	/** speBrowseCount */
	private java.lang.Integer speBrowseCount;
	/** speCollectionCount */
	private java.lang.Integer speCollectionCount;
	/** speCreateName */
	private java.lang.String speCreateName;
	/** speFirstSpell */
	private java.lang.String speFirstSpell;
	/** speFullSpell */
	private java.lang.String speFullSpell;
	/** speHistoryClassSchoolId */
	private java.lang.String speHistoryClassSchoolId;
	/** speHistoryClassSchoolInfo */
	private java.lang.String speHistoryClassSchoolInfo;
	/** speImgHeight */
	private java.lang.Integer speImgHeight;
	/** speImgWidth */
	private java.lang.Integer speImgWidth;
	/** spePlanLength */
	private java.lang.Integer spePlanLength;
	/** speSignupCount */
	private java.lang.Integer speSignupCount;
	/** speStar */
	private java.lang.Integer speStar;
	/** 专业摘要 */
	private java.lang.String speSynopsisInfo;
	/** speTeachersId */
	private java.lang.String speTeachersId;
	/** speTeachersInfo */
	private java.lang.String speTeachersInfo;
	/** speType */
	private java.lang.Long speType;
	/** speTypeInfo */
	private java.lang.String speTypeInfo;
	/** 专业课分类id，关联dj_specialty_cat的主键 */
	private java.lang.Long speCatId;
	/** 0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务 */
	private java.lang.Integer speDomain;
	/** 评论次数 */
	private java.lang.Long speCommentsNum;
	/** 点赞数 */
	private java.lang.Long speLoveNum;
	/** 推荐专业课 >0表示推荐该专业课 */
	private java.lang.Integer speTjOrder;
	/** 状态  0：隐藏  1：展示 */
	private java.lang.Integer speDisplay;

	public java.lang.Long getId() {
		return this.id;
	}
	
	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.String getSpeNamePrefix() {
		return this.speNamePrefix;
	}
	
	public void setSpeNamePrefix(java.lang.String value) {
		this.speNamePrefix = value;
	}
	
	public java.lang.String getSpeName() {
		return this.speName;
	}
	
	public void setSpeName(java.lang.String value) {
		this.speName = value;
	}
	
	public java.lang.String getSpeNameSuffix() {
		return this.speNameSuffix;
	}
	
	public void setSpeNameSuffix(java.lang.String value) {
		this.speNameSuffix = value;
	}
	
	public java.lang.Float getSpeLesson() {
		return this.speLesson;
	}
	
	public void setSpeLesson(java.lang.Float value) {
		this.speLesson = value;
	}
	
	public java.lang.Float getSpePrice() {
		return this.spePrice;
	}
	
	public void setSpePrice(java.lang.Float value) {
		this.spePrice = value;
	}
	
	public java.lang.String getSpeSynopsis() {
		return this.speSynopsis;
	}
	
	public void setSpeSynopsis(java.lang.String value) {
		this.speSynopsis = value;
	}
	
	public java.lang.String getSpeContent() {
		return this.speContent;
	}
	
	public void setSpeContent(java.lang.String value) {
		this.speContent = value;
	}
	
	public java.lang.String getSpeImg() {
		return this.speImg;
	}
	
	public void setSpeImg(java.lang.String value) {
		this.speImg = value;
	}
	
	public java.lang.Integer getSpeStatus() {
		return this.speStatus;
	}
	
	public void setSpeStatus(java.lang.Integer value) {
		this.speStatus = value;
	}
	
	public java.lang.Integer getSpeOrder() {
		return this.speOrder;
	}
	
	public void setSpeOrder(java.lang.Integer value) {
		this.speOrder = value;
	}
	
	public java.util.Date getSpeAddtimeBegin() {
		return this.speAddtimeBegin;
	}
	
	public void setSpeAddtimeBegin(java.util.Date value) {
		this.speAddtimeBegin = value;
	}	
	
	public java.util.Date getSpeAddtimeEnd() {
		return this.speAddtimeEnd;
	}
	
	public void setSpeAddtimeEnd(java.util.Date value) {
		this.speAddtimeEnd = value;
	}
	
	public java.lang.String getSpePreTitle() {
		return this.spePreTitle;
	}
	
	public void setSpePreTitle(java.lang.String value) {
		this.spePreTitle = value;
	}
	
	public java.lang.String getSpePreContent() {
		return this.spePreContent;
	}
	
	public void setSpePreContent(java.lang.String value) {
		this.spePreContent = value;
	}
	
	public java.lang.String getSpeContents() {
		return this.speContents;
	}
	
	public void setSpeContents(java.lang.String value) {
		this.speContents = value;
	}
	
	public java.lang.String getSpePoscTitle() {
		return this.spePoscTitle;
	}
	
	public void setSpePoscTitle(java.lang.String value) {
		this.spePoscTitle = value;
	}
	
	public java.lang.String getSpePoscContent() {
		return this.spePoscContent;
	}
	
	public void setSpePoscContent(java.lang.String value) {
		this.spePoscContent = value;
	}
	
	public java.lang.Integer getSpeBrowseCount() {
		return this.speBrowseCount;
	}
	
	public void setSpeBrowseCount(java.lang.Integer value) {
		this.speBrowseCount = value;
	}
	
	public java.lang.Integer getSpeCollectionCount() {
		return this.speCollectionCount;
	}
	
	public void setSpeCollectionCount(java.lang.Integer value) {
		this.speCollectionCount = value;
	}
	
	public java.lang.String getSpeCreateName() {
		return this.speCreateName;
	}
	
	public void setSpeCreateName(java.lang.String value) {
		this.speCreateName = value;
	}
	
	public java.lang.String getSpeFirstSpell() {
		return this.speFirstSpell;
	}
	
	public void setSpeFirstSpell(java.lang.String value) {
		this.speFirstSpell = value;
	}
	
	public java.lang.String getSpeFullSpell() {
		return this.speFullSpell;
	}
	
	public void setSpeFullSpell(java.lang.String value) {
		this.speFullSpell = value;
	}
	
	public java.lang.String getSpeHistoryClassSchoolId() {
		return this.speHistoryClassSchoolId;
	}
	
	public void setSpeHistoryClassSchoolId(java.lang.String value) {
		this.speHistoryClassSchoolId = value;
	}
	
	public java.lang.String getSpeHistoryClassSchoolInfo() {
		return this.speHistoryClassSchoolInfo;
	}
	
	public void setSpeHistoryClassSchoolInfo(java.lang.String value) {
		this.speHistoryClassSchoolInfo = value;
	}
	
	public java.lang.Integer getSpeImgHeight() {
		return this.speImgHeight;
	}
	
	public void setSpeImgHeight(java.lang.Integer value) {
		this.speImgHeight = value;
	}
	
	public java.lang.Integer getSpeImgWidth() {
		return this.speImgWidth;
	}
	
	public void setSpeImgWidth(java.lang.Integer value) {
		this.speImgWidth = value;
	}
	
	public java.lang.Integer getSpePlanLength() {
		return this.spePlanLength;
	}
	
	public void setSpePlanLength(java.lang.Integer value) {
		this.spePlanLength = value;
	}
	
	public java.lang.Integer getSpeSignupCount() {
		return this.speSignupCount;
	}
	
	public void setSpeSignupCount(java.lang.Integer value) {
		this.speSignupCount = value;
	}
	
	public java.lang.Integer getSpeStar() {
		return this.speStar;
	}
	
	public void setSpeStar(java.lang.Integer value) {
		this.speStar = value;
	}
	
	public java.lang.String getSpeSynopsisInfo() {
		return this.speSynopsisInfo;
	}
	
	public void setSpeSynopsisInfo(java.lang.String value) {
		this.speSynopsisInfo = value;
	}
	
	public java.lang.String getSpeTeachersId() {
		return this.speTeachersId;
	}
	
	public void setSpeTeachersId(java.lang.String value) {
		this.speTeachersId = value;
	}
	
	public java.lang.String getSpeTeachersInfo() {
		return this.speTeachersInfo;
	}
	
	public void setSpeTeachersInfo(java.lang.String value) {
		this.speTeachersInfo = value;
	}
	
	public java.lang.Long getSpeType() {
		return this.speType;
	}
	
	public void setSpeType(java.lang.Long value) {
		this.speType = value;
	}
	
	public java.lang.String getSpeTypeInfo() {
		return this.speTypeInfo;
	}
	
	public void setSpeTypeInfo(java.lang.String value) {
		this.speTypeInfo = value;
	}
	
	public java.lang.Long getSpeCatId() {
		return this.speCatId;
	}
	
	public void setSpeCatId(java.lang.Long value) {
		this.speCatId = value;
	}
	
	public java.lang.Integer getSpeDomain() {
		return this.speDomain;
	}
	
	public void setSpeDomain(java.lang.Integer value) {
		this.speDomain = value;
	}
	
	public java.lang.Long getSpeCommentsNum() {
		return this.speCommentsNum;
	}
	
	public void setSpeCommentsNum(java.lang.Long value) {
		this.speCommentsNum = value;
	}
	
	public java.lang.Long getSpeLoveNum() {
		return this.speLoveNum;
	}
	
	public void setSpeLoveNum(java.lang.Long value) {
		this.speLoveNum = value;
	}
	
	public java.lang.Integer getSpeTjOrder() {
		return this.speTjOrder;
	}
	
	public void setSpeTjOrder(java.lang.Integer value) {
		this.speTjOrder = value;
	}
	
	public java.lang.Integer getSpeDisplay() {
		return this.speDisplay;
	}
	
	public void setSpeDisplay(java.lang.Integer value) {
		this.speDisplay = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

