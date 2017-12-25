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
 * @since 1.0,2017/12/25 08:07:08
 */


@Entity
@Table(name = "dj_specialty")
public class DjSpecialty extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialty";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_SPE_NAME_PREFIX = "名称前缀";
	public static final String ALIAS_SPE_NAME = "名称";
	public static final String ALIAS_SPE_NAME_SUFFIX = "名称后缀";
	public static final String ALIAS_SPE_LESSON = "课时";
	public static final String ALIAS_SPE_PRICE = "价格";
	public static final String ALIAS_SPE_SYNOPSIS = "简介";
	public static final String ALIAS_SPE_CONTENT = "内容";
	public static final String ALIAS_SPE_IMG = "图片";
	public static final String ALIAS_SPE_STATUS = "状态：前台是否需要展示，默认0不需要1展示";
	public static final String ALIAS_SPE_ORDER = "排序";
	public static final String ALIAS_SPE_ADDTIME = "添加时间";
	public static final String ALIAS_SPE_PRE_TITLE = "序言标题";
	public static final String ALIAS_SPE_PRE_CONTENT = "序言内容";
	public static final String ALIAS_SPE_CONTENTS = "课程目录";
	public static final String ALIAS_SPE_POSC_TITLE = "后记标题";
	public static final String ALIAS_SPE_POSC_CONTENT = "后记内容";
	public static final String ALIAS_SPE_BROWSE_COUNT = "speBrowseCount";
	public static final String ALIAS_SPE_COLLECTION_COUNT = "speCollectionCount";
	public static final String ALIAS_SPE_CREATE_NAME = "speCreateName";
	public static final String ALIAS_SPE_FIRST_SPELL = "speFirstSpell";
	public static final String ALIAS_SPE_FULL_SPELL = "speFullSpell";
	public static final String ALIAS_SPE_HISTORY_CLASS_SCHOOL_ID = "speHistoryClassSchoolId";
	public static final String ALIAS_SPE_HISTORY_CLASS_SCHOOL_INFO = "speHistoryClassSchoolInfo";
	public static final String ALIAS_SPE_IMG_HEIGHT = "speImgHeight";
	public static final String ALIAS_SPE_IMG_WIDTH = "speImgWidth";
	public static final String ALIAS_SPE_PLAN_LENGTH = "spePlanLength";
	public static final String ALIAS_SPE_SIGNUP_COUNT = "speSignupCount";
	public static final String ALIAS_SPE_STAR = "speStar";
	public static final String ALIAS_SPE_SYNOPSIS_INFO = "专业摘要";
	public static final String ALIAS_SPE_TEACHERS_ID = "speTeachersId";
	public static final String ALIAS_SPE_TEACHERS_INFO = "speTeachersInfo";
	public static final String ALIAS_SPE_TYPE = "speType";
	public static final String ALIAS_SPE_TYPE_INFO = "speTypeInfo";
	public static final String ALIAS_SPE_CAT_ID = "专业课分类id，关联dj_specialty_cat的主键";
	public static final String ALIAS_SPE_DOMAIN = "0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务";
	public static final String ALIAS_SPE_COMMENTS_NUM = "评论次数";
	public static final String ALIAS_SPE_LOVE_NUM = "点赞数";
	public static final String ALIAS_SPE_TJ_ORDER = "推荐专业课 >0表示推荐该专业课";
	public static final String ALIAS_SPE_DISPLAY = "状态  0：隐藏  1：展示";
	
	//date formats
	public static final String FORMAT_SPE_ADDTIME = DATE_TIME_FORMAT;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long id; 	// id 
	@Length(max=100)
	private java.lang.String speNamePrefix; 	// 名称前缀 
	@Length(max=200)
	private java.lang.String speName; 	// 名称 
	@Length(max=100)
	private java.lang.String speNameSuffix; 	// 名称后缀 
	
	private java.lang.Float speLesson; 	// 课时 
	
	private java.lang.Float spePrice; 	// 价格 
	@Length(max=65535)
	private java.lang.String speSynopsis; 	// 简介 
	@Length(max=65535)
	private java.lang.String speContent; 	// 内容 
	@Length(max=200)
	private java.lang.String speImg; 	// 图片 
	
	private java.lang.Integer speStatus; 	// 状态：前台是否需要展示，默认0不需要1展示 
	
	private java.lang.Integer speOrder; 	// 排序 
	
	private java.util.Date speAddtime; 	// 添加时间 
	@Length(max=255)
	private java.lang.String spePreTitle; 	// 序言标题 
	@Length(max=255)
	private java.lang.String spePreContent; 	// 序言内容 
	@Length(max=255)
	private java.lang.String speContents; 	// 课程目录 
	@Length(max=255)
	private java.lang.String spePoscTitle; 	// 后记标题 
	@Length(max=255)
	private java.lang.String spePoscContent; 	// 后记内容 
	
	private java.lang.Integer speBrowseCount; 	// speBrowseCount 
	
	private java.lang.Integer speCollectionCount; 	// speCollectionCount 
	@Length(max=50)
	private java.lang.String speCreateName; 	// speCreateName 
	@Length(max=50)
	private java.lang.String speFirstSpell; 	// speFirstSpell 
	@Length(max=200)
	private java.lang.String speFullSpell; 	// speFullSpell 
	@Length(max=255)
	private java.lang.String speHistoryClassSchoolId; 	// speHistoryClassSchoolId 
	@Length(max=255)
	private java.lang.String speHistoryClassSchoolInfo; 	// speHistoryClassSchoolInfo 
	
	private java.lang.Integer speImgHeight; 	// speImgHeight 
	
	private java.lang.Integer speImgWidth; 	// speImgWidth 
	
	private java.lang.Integer spePlanLength; 	// spePlanLength 
	
	private java.lang.Integer speSignupCount; 	// speSignupCount 
	
	private java.lang.Integer speStar; 	// speStar 
	@Length(max=65535)
	private java.lang.String speSynopsisInfo; 	// 专业摘要 
	@Length(max=200)
	private java.lang.String speTeachersId; 	// speTeachersId 
	@Length(max=255)
	private java.lang.String speTeachersInfo; 	// speTeachersInfo 
	
	private java.lang.Long speType; 	// speType 
	@Length(max=255)
	private java.lang.String speTypeInfo; 	// speTypeInfo 
	
	private java.lang.Long speCatId; 	// 专业课分类id，关联dj_specialty_cat的主键 
	
	private java.lang.Integer speDomain; 	// 0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务 
	
	private java.lang.Long speCommentsNum; 	// 评论次数 
	
	private java.lang.Long speLoveNum; 	// 点赞数 
	
	private java.lang.Integer speTjOrder; 	// 推荐专业课 >0表示推荐该专业课 
	
	private java.lang.Integer speDisplay; 	// 状态  0：隐藏  1：展示 
	//columns END


	public DjSpecialty(){
	}

	public DjSpecialty(
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
	
	@Column(name = "spe_name_prefix", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getSpeNamePrefix() {
		return this.speNamePrefix;
	}
	
	public void setSpeNamePrefix(java.lang.String value) {
		this.speNamePrefix = value;
	}
	
	@Column(name = "spe_name", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getSpeName() {
		return this.speName;
	}
	
	public void setSpeName(java.lang.String value) {
		this.speName = value;
	}
	
	@Column(name = "spe_name_suffix", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getSpeNameSuffix() {
		return this.speNameSuffix;
	}
	
	public void setSpeNameSuffix(java.lang.String value) {
		this.speNameSuffix = value;
	}
	
	@Column(name = "spe_lesson", unique = false, nullable = true, insertable = true, updatable = true, length = 12)
	public java.lang.Float getSpeLesson() {
		return this.speLesson;
	}
	
	public void setSpeLesson(java.lang.Float value) {
		this.speLesson = value;
	}
	
	@Column(name = "spe_price", unique = false, nullable = true, insertable = true, updatable = true, length = 12)
	public java.lang.Float getSpePrice() {
		return this.spePrice;
	}
	
	public void setSpePrice(java.lang.Float value) {
		this.spePrice = value;
	}
	
	@Column(name = "spe_synopsis", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getSpeSynopsis() {
		return this.speSynopsis;
	}
	
	public void setSpeSynopsis(java.lang.String value) {
		this.speSynopsis = value;
	}
	
	@Column(name = "spe_content", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getSpeContent() {
		return this.speContent;
	}
	
	public void setSpeContent(java.lang.String value) {
		this.speContent = value;
	}
	
	@Column(name = "spe_img", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getSpeImg() {
		return this.speImg;
	}
	
	public void setSpeImg(java.lang.String value) {
		this.speImg = value;
	}
	
	@Column(name = "spe_status", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeStatus() {
		return this.speStatus;
	}
	
	public void setSpeStatus(java.lang.Integer value) {
		this.speStatus = value;
	}
	
	@Column(name = "spe_order", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeOrder() {
		return this.speOrder;
	}
	
	public void setSpeOrder(java.lang.Integer value) {
		this.speOrder = value;
	}
	
	@Transient
	public String getSpeAddtimeString() {
		return DateConvertUtils.format(getSpeAddtime(), FORMAT_SPE_ADDTIME);
	}
	public void setSpeAddtimeString(String value) {
		setSpeAddtime(DateConvertUtils.parse(value, FORMAT_SPE_ADDTIME,java.util.Date.class));
	}
	
	@Column(name = "spe_addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getSpeAddtime() {
		return this.speAddtime;
	}
	
	public void setSpeAddtime(java.util.Date value) {
		this.speAddtime = value;
	}
	
	@Column(name = "spe_pre_title", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpePreTitle() {
		return this.spePreTitle;
	}
	
	public void setSpePreTitle(java.lang.String value) {
		this.spePreTitle = value;
	}
	
	@Column(name = "spe_pre_content", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpePreContent() {
		return this.spePreContent;
	}
	
	public void setSpePreContent(java.lang.String value) {
		this.spePreContent = value;
	}
	
	@Column(name = "spe_contents", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpeContents() {
		return this.speContents;
	}
	
	public void setSpeContents(java.lang.String value) {
		this.speContents = value;
	}
	
	@Column(name = "spe_posc_title", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpePoscTitle() {
		return this.spePoscTitle;
	}
	
	public void setSpePoscTitle(java.lang.String value) {
		this.spePoscTitle = value;
	}
	
	@Column(name = "spe_posc_content", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpePoscContent() {
		return this.spePoscContent;
	}
	
	public void setSpePoscContent(java.lang.String value) {
		this.spePoscContent = value;
	}
	
	@Column(name = "spe_browseCount", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeBrowseCount() {
		return this.speBrowseCount;
	}
	
	public void setSpeBrowseCount(java.lang.Integer value) {
		this.speBrowseCount = value;
	}
	
	@Column(name = "spe_collectionCount", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeCollectionCount() {
		return this.speCollectionCount;
	}
	
	public void setSpeCollectionCount(java.lang.Integer value) {
		this.speCollectionCount = value;
	}
	
	@Column(name = "spe_createName", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getSpeCreateName() {
		return this.speCreateName;
	}
	
	public void setSpeCreateName(java.lang.String value) {
		this.speCreateName = value;
	}
	
	@Column(name = "spe_firstSpell", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getSpeFirstSpell() {
		return this.speFirstSpell;
	}
	
	public void setSpeFirstSpell(java.lang.String value) {
		this.speFirstSpell = value;
	}
	
	@Column(name = "spe_fullSpell", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getSpeFullSpell() {
		return this.speFullSpell;
	}
	
	public void setSpeFullSpell(java.lang.String value) {
		this.speFullSpell = value;
	}
	
	@Column(name = "spe_historyClassSchoolId", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpeHistoryClassSchoolId() {
		return this.speHistoryClassSchoolId;
	}
	
	public void setSpeHistoryClassSchoolId(java.lang.String value) {
		this.speHistoryClassSchoolId = value;
	}
	
	@Column(name = "spe_historyClassSchoolInfo", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpeHistoryClassSchoolInfo() {
		return this.speHistoryClassSchoolInfo;
	}
	
	public void setSpeHistoryClassSchoolInfo(java.lang.String value) {
		this.speHistoryClassSchoolInfo = value;
	}
	
	@Column(name = "spe_img_height", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeImgHeight() {
		return this.speImgHeight;
	}
	
	public void setSpeImgHeight(java.lang.Integer value) {
		this.speImgHeight = value;
	}
	
	@Column(name = "spe_img_width", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeImgWidth() {
		return this.speImgWidth;
	}
	
	public void setSpeImgWidth(java.lang.Integer value) {
		this.speImgWidth = value;
	}
	
	@Column(name = "spe_planLength", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpePlanLength() {
		return this.spePlanLength;
	}
	
	public void setSpePlanLength(java.lang.Integer value) {
		this.spePlanLength = value;
	}
	
	@Column(name = "spe_signupCount", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeSignupCount() {
		return this.speSignupCount;
	}
	
	public void setSpeSignupCount(java.lang.Integer value) {
		this.speSignupCount = value;
	}
	
	@Column(name = "spe_star", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeStar() {
		return this.speStar;
	}
	
	public void setSpeStar(java.lang.Integer value) {
		this.speStar = value;
	}
	
	@Column(name = "spe_synopsisInfo", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getSpeSynopsisInfo() {
		return this.speSynopsisInfo;
	}
	
	public void setSpeSynopsisInfo(java.lang.String value) {
		this.speSynopsisInfo = value;
	}
	
	@Column(name = "spe_teachersId", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getSpeTeachersId() {
		return this.speTeachersId;
	}
	
	public void setSpeTeachersId(java.lang.String value) {
		this.speTeachersId = value;
	}
	
	@Column(name = "spe_teachersInfo", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpeTeachersInfo() {
		return this.speTeachersInfo;
	}
	
	public void setSpeTeachersInfo(java.lang.String value) {
		this.speTeachersInfo = value;
	}
	
	@Column(name = "spe_type", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpeType() {
		return this.speType;
	}
	
	public void setSpeType(java.lang.Long value) {
		this.speType = value;
	}
	
	@Column(name = "spe_typeInfo", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getSpeTypeInfo() {
		return this.speTypeInfo;
	}
	
	public void setSpeTypeInfo(java.lang.String value) {
		this.speTypeInfo = value;
	}
	
	@Column(name = "spe_cat_id", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpeCatId() {
		return this.speCatId;
	}
	
	public void setSpeCatId(java.lang.Long value) {
		this.speCatId = value;
	}
	
	@Column(name = "spe_domain", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeDomain() {
		return this.speDomain;
	}
	
	public void setSpeDomain(java.lang.Integer value) {
		this.speDomain = value;
	}
	
	@Column(name = "spe_comments_num", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpeCommentsNum() {
		return this.speCommentsNum;
	}
	
	public void setSpeCommentsNum(java.lang.Long value) {
		this.speCommentsNum = value;
	}
	
	@Column(name = "spe_love_num", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpeLoveNum() {
		return this.speLoveNum;
	}
	
	public void setSpeLoveNum(java.lang.Long value) {
		this.speLoveNum = value;
	}
	
	@Column(name = "spe_tj_order", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeTjOrder() {
		return this.speTjOrder;
	}
	
	public void setSpeTjOrder(java.lang.Integer value) {
		this.speTjOrder = value;
	}
	
	@Column(name = "spe_display", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSpeDisplay() {
		return this.speDisplay;
	}
	
	public void setSpeDisplay(java.lang.Integer value) {
		this.speDisplay = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("SpeNamePrefix",getSpeNamePrefix())
			.append("SpeName",getSpeName())
			.append("SpeNameSuffix",getSpeNameSuffix())
			.append("SpeLesson",getSpeLesson())
			.append("SpePrice",getSpePrice())
			.append("SpeSynopsis",getSpeSynopsis())
			.append("SpeContent",getSpeContent())
			.append("SpeImg",getSpeImg())
			.append("SpeStatus",getSpeStatus())
			.append("SpeOrder",getSpeOrder())
			.append("SpeAddtime",getSpeAddtime())
			.append("SpePreTitle",getSpePreTitle())
			.append("SpePreContent",getSpePreContent())
			.append("SpeContents",getSpeContents())
			.append("SpePoscTitle",getSpePoscTitle())
			.append("SpePoscContent",getSpePoscContent())
			.append("SpeBrowseCount",getSpeBrowseCount())
			.append("SpeCollectionCount",getSpeCollectionCount())
			.append("SpeCreateName",getSpeCreateName())
			.append("SpeFirstSpell",getSpeFirstSpell())
			.append("SpeFullSpell",getSpeFullSpell())
			.append("SpeHistoryClassSchoolId",getSpeHistoryClassSchoolId())
			.append("SpeHistoryClassSchoolInfo",getSpeHistoryClassSchoolInfo())
			.append("SpeImgHeight",getSpeImgHeight())
			.append("SpeImgWidth",getSpeImgWidth())
			.append("SpePlanLength",getSpePlanLength())
			.append("SpeSignupCount",getSpeSignupCount())
			.append("SpeStar",getSpeStar())
			.append("SpeSynopsisInfo",getSpeSynopsisInfo())
			.append("SpeTeachersId",getSpeTeachersId())
			.append("SpeTeachersInfo",getSpeTeachersInfo())
			.append("SpeType",getSpeType())
			.append("SpeTypeInfo",getSpeTypeInfo())
			.append("SpeCatId",getSpeCatId())
			.append("SpeDomain",getSpeDomain())
			.append("SpeCommentsNum",getSpeCommentsNum())
			.append("SpeLoveNum",getSpeLoveNum())
			.append("SpeTjOrder",getSpeTjOrder())
			.append("SpeDisplay",getSpeDisplay())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialty == false) return false;
		if(this == obj) return true;
		DjSpecialty other = (DjSpecialty)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

