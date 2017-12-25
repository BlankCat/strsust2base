/*
 * Powered By [点睛政法网络学堂]
 * Web Site: http://www.zfwlxt.com
 * Author: Lining Qinguochao
 * Since 2008 - 2010
 */

package com.zfwlxt.vod.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;

import cn.org.rapid_framework.util.DateConvertUtils;

import com.zfwlxt.util.ToolKit;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0
 */

@Entity
@Table(name = "dj_course")
public class DjCourse extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	private static final String SEPARATOR = "|";
	private static final String REGEX = "\\|";
	

	// alias
	public static final String TABLE_ALIAS = "课程";
	public static final String ALIAS_COURSE_ID = "课程编号";
	public static final String ALIAS_CATEGORY_ID = "课程分类";
	public static final String ALIAS_CS_NAME = "课程名称";
	public static final String ALIAS_CS_TEACHER = "授课教师";
	public static final String ALIAS_CS_ISDISPLAY = "是否显示";
	public static final String ALIAS_CS_TYPE = "教程类型";
	public static final String ALIAS_CS_ISPACK = "是否打包";
	public static final String ALIAS_CS_FREEURL = "试听地址";
	public static final String ALIAS_CS_ISAUDITION = "允许试听";
	public static final String ALIAS_CS_RECOMMEND = "推荐课程";
	public static final String ALIAS_CS_CLICKTIMES = "点击次数";
	public static final String ALIAS_CS_LIKETIMES = "喜欢次数";
	public static final String ALIAS_CS_HOUR = "课程总时长";
	public static final String ALIAS_CS_ADDTIME = "添加时间";
	public static final String ALIAS_CS_INFO = "目录";
	public static final String ALIAS_CS_SUMMARY = "简介";
	public static final String ALIAS_CS_PRICE = "课程价格";
	public static final String ALIAS_CS_SPECIALTY = "专业课程";
	public static final String ALIAS_TRANSCRIBE_TIME = "录制时间";
	public static final String ALIAS_CS_LIVE_TIME="直播开始时间";
	public static final String ALIAS_CS_LIVE_STATUS="直播状态";
	public static final String ALIAS_LIVE_ROOMID="直播房间号";
	public static final String ALIAS_CLASSIC_WORD="文章金句";

	// date formats transcribe _time
	public static final String FORMAT_CS_ADDTIME = DATE_FORMAT;
	public static final String FORMAT_TRANSCRIBE_TIME = DATE_TIME_FORMAT;

	// 可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	// columns START

	private java.lang.Long courseId;

	private java.lang.Long categoryId;
	@Length(max = 100)
	private java.lang.String csName;
	@Length(max = 255)
	private java.lang.String csImg;
	@Length(max = 255)
	private java.lang.String csImgSquare;
	@Length(max = 255)
	private java.lang.String csImgRectangle;
	//课程类型：   默认类型为  0  视频课程 ；    1为播报课程
	@NotNull
	@Max(127)
	private Integer csType=0;
	//该课程中教师的姓名拼字符串 用"|"分割
	private java.lang.String tchNames;
	private java.lang.Integer csSpecialty; 	// csSpecialty 
	private java.lang.Integer csOrder; 	// csOrder 
	private java.lang.Integer domain; 	// 主行业
	private java.lang.String  domains; 	// 所属行业串
	private Integer payType=0; 	// 支付方式：0点币，1现金红包 
	
	private java.lang.Integer isFirmCourse; 	// 是否是机构课程:0否，1是 
	private java.lang.String csBelongOrg; 	// 课程所属组织Id控制课程是否在学院显示，所属多个组织需要加上||分开 
	//教师与课程多对多关联关系
	private Set<DjTeacher> csTeachers = new HashSet<DjTeacher>();
	//用来返回教师名称的数组
	private List<String> tchNameList;
	//用来返回教师名称的字符串 不带"|"
	private java.lang.String tchNamesWare;
	
	private boolean userHasRight = false ;
	
	@Transient
	public String getTranscribeTimeString() {
		return DateConvertUtils.format(getTranscribeTime(), FORMAT_TRANSCRIBE_TIME);
	}
	public void setTranscribeTimeString(String value) {
		setTranscribeTime(DateConvertUtils.parse(value, FORMAT_TRANSCRIBE_TIME,java.util.Date.class));
	}

	@NotNull
	@Max(127)
	private Integer csIsdisplay;

	@NotNull
	@Max(127)
	private Integer csIspack;
	@Length(max = 50)
	private java.lang.String csPackname;
	@Length(max = 65535)
	private java.lang.String csFreeurl;
	@NotNull
	@Max(127)
	private Integer csIsaudition;
	@Max(127)
	private Integer csRecommend;
	private java.lang.Integer csClicktimes;
	private java.lang.Integer liketimes = 0 ;
	private java.lang.Integer studynum = 0 ;
	private java.lang.Integer studyweeknum = 0 ;
	private java.lang.Integer commentnum = 0 ;
	@NotNull
	private java.lang.Long csAddtime;

	@Length(max = 65535)
	private java.lang.String csInfo;
	@Length(max = 65535)
	private java.lang.String csSummary;
	private java.lang.Float csHour = new Float(0L);
	
	private java.lang.Double csPrice = new Double(0);
	private Double csOriginalprice = new Double(0.0D);
	private Double csDiscountprice = new Double(0.0D);
	  
	private java.lang.Double csKs = new Double(0L);
	private Date transcribeTime;
	private java.lang.Integer csTjOrder=0;
	private java.lang.Long pcourseId;
    private Integer csLiveStatus;
    //private Date csLiveTime;
    private String liveRoomId;//直播房间号

    private String goodsTag; //关联合同 标签  apeng 2016-07-25
    
	@NotNull
	@Max(127)
	private Integer csReckonkind;
	
	/**用户上传文章相关*/
	private java.lang.Integer isUpload;
	private java.lang.Integer isFirst;
	private java.lang.Integer lisreaStatus;
	private java.lang.String  username;
	private java.lang.Long csUpdatetime;
	
	private java.lang.String csAdvertising;
	
	private java.lang.String classicWord;
	
	private java.lang.Long csAudittime;
	
	private java.lang.String auditUsername;
	
	@Column(name = "cs_audittime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.lang.Long getCsAudittime() {
		return csAudittime;
	}
	@Column(name = "cs_audittime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public void setCsAudittime(java.lang.Long csAudittime) {
		this.csAudittime = csAudittime;
	}
	
	@Column(name = "audit_username", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getAuditUsername() {
		return auditUsername;
	}
	@Column(name = "audit_username", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public void setAuditUsername(java.lang.String auditUsername) {
		this.auditUsername = auditUsername;
	}
	
	@Column(name = "classic_word", unique = false, nullable = true, insertable = true, updatable = true, length = 3500)
	public java.lang.String getClassicWord() {
		return classicWord;
	}
	
	@Column(name = "classic_word", unique = false, nullable = true, insertable = true, updatable = true, length = 3500)
	public void setClassicWord(java.lang.String classicWord) {
		this.classicWord = classicWord;
	}
	
	@Column(name = "cs_advertising", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getCsAdvertising() {
		return csAdvertising;
	}
	
	@Column(name = "cs_advertising", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public void setCsAdvertising(java.lang.String csAdvertising) {
		this.csAdvertising = csAdvertising;
	}
	
	@Column(name = "cs_updatetime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.lang.Long getCsUpdatetime() {
		return csUpdatetime;
	}
	
	@Column(name = "cs_updatetime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public void setCsUpdatetime(java.lang.Long csUpdatetime) {
		this.csUpdatetime = csUpdatetime;
	}
	
	@Column(name = "cs_img_square", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getCsImgSquare() {
		return csImgSquare;
	}
	
	public void setCsImgSquare(java.lang.String csImgSquare) {
		this.csImgSquare = csImgSquare;
	}
	
	@Column(name = "cs_img_rectangle", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getCsImgRectangle() {
		return csImgRectangle;
	}
	
	public void setCsImgRectangle(java.lang.String csImgRectangle) {
		this.csImgRectangle = csImgRectangle;
	}
	
	@Column(name = "username", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getUsername() {
		return username;
	}
	
	@Column(name = "username", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public void setUsername(java.lang.String username) {
		this.username = username;
	}
	
	@Column(name = "lisrea_status", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getLisreaStatus() {
		return lisreaStatus;
	}
	
	@Column(name = "lisrea_status", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public void setLisreaStatus(java.lang.Integer lisreaStatus) {
		this.lisreaStatus = lisreaStatus;
	}
	
	@Column(name = "is_upload", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getIsUpload() {
		return isUpload;
	}

	public void setIsUpload(java.lang.Integer isUpload) {
		this.isUpload = isUpload;
	}

	@Column(name = "is_first", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getIsFirst() {
		return isFirst;
	}

	public void setIsFirst(java.lang.Integer isFirst) {
		this.isFirst = isFirst;
	}
	
	@Column(name = "cs_specialty", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getCsSpecialty() {
		return this.csSpecialty;
	}
	
	public void setCsSpecialty(java.lang.Integer value) {
		this.csSpecialty = value;
	}

	@NotNull
	@Max(127)
	private Integer courseAuthority;

	@Column(name = "course_authority", unique = false, nullable = false, insertable = true, updatable = true, length = 127)
	public Integer getCourseAuthority() {
		return courseAuthority;
	}

	public void setCourseAuthority(Integer courseAuthority) {
		this.courseAuthority = courseAuthority;
	}
	
	@Column(name = "cs_tj_order", unique = false, nullable = true, insertable = true, updatable = true, length = 127)
	public Integer getCsTjOrder() {
		return csTjOrder;
	}
	
	public void setcsTjOrder(Integer csTjOrder) {
		this.csTjOrder = csTjOrder;
	}

	public DjCourse() {
	}

	public DjCourse(java.lang.Long courseId) {
		this.courseId = courseId;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof DjCourse == false)
			return false;
		if (this == obj)
			return true;
		DjCourse other = (DjCourse) obj;
		return new EqualsBuilder().append(getCourseId(), other.getCourseId())
				.isEquals();
	}

	@Column(name = "category_id", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCategoryId() {
		return this.categoryId;
	}

	// columns END

	@Id
	@GeneratedValue(generator = "custom-id")
	@GenericGenerator(name = "custom-id", strategy = "native")
	@Column(name = "course_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCourseId() {
		return this.courseId;
	}

	@Column(name = "cs_addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.lang.Long getCsAddtime() {
		return this.csAddtime;
	}
	@Column(name = "goods_tag", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public String getGoodsTag() {
		return goodsTag;
	}
	@Transient
	public String getCsAddtimeString() {
		return String.valueOf(getCsAddtime());
	}

	@Column(name = "cs_clicktimes", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getCsClicktimes() {
		return this.csClicktimes;
	}
	@Column(name = "cs_order", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getCsOrder() {
		return this.csOrder;
	}
	
	public void setCsOrder(java.lang.Integer value) {
		this.csOrder = value;
	}
	@Column(name = "domain", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getDomain() {
		return this.domain;
	}
	
	public void setDomain(java.lang.Integer value) {
		this.domain = value;
	}
	
	@Column(name = "domains", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.String getDomains() {
		return this.domains;
	}
	
	public void setDomains(java.lang.String value) {
		this.domains = value;
	}
	@Column(name = "cs_like", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getLiketimes() {
		return liketimes;
	}
	@Column(name = "cs_studynum", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getStudynum() {
		return studynum;
	}
	@Column(name = "cs_studyweeknum", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getStudyweeknum() {
		return studyweeknum;
	}
	@Column(name = "cs_commentnum", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getCommentnum() {
		return commentnum;
	}
	
	@Column(name = "cs_freeurl", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getCsFreeurl() {
		return this.csFreeurl;
	}

	@Column(name = "cs_hour", unique = false, nullable = true, insertable = true, updatable = true, length = 12)
	public java.lang.Float getCsHour() {
		return this.csHour;
	}

	@Column(name = "cs_info", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getCsInfo() {
		return this.csInfo;
	}
	@Column(name = "cs_summary", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getCsSummary() {
		return csSummary;
	}
	
	@Column(name = "cs_isaudition", unique = false, nullable = false, insertable = true, updatable = true, length = 3)
	public Integer getCsIsaudition() {
		return this.csIsaudition;
	}

	@Column(name = "cs_isdisplay", unique = false, nullable = false, insertable = true, updatable = true, length = 3)
	public Integer getCsIsdisplay() {
		return this.csIsdisplay;
	}

	@Column(name = "cs_ispack", unique = false, nullable = false, insertable = true, updatable = true, length = 3)
	public Integer getCsIspack() {
		return this.csIspack;
	}

	@Column(name = "cs_name", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getCsName() {
		return this.csName;
	}
	
	@Column(name = "cs_type", unique = false, nullable = false, insertable = true, updatable = true, length = 3)
	public java.lang.Integer getCsType() {
		return csType;
	}
	public void setCsType(java.lang.Integer csType) {
		this.csType = csType;
	}
	
	@Column(name = "cs_img", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getCsImg() {
		return this.csImg;
	}

	@Column(name = "cs_packname", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getCsPackname() {
		return csPackname;
	}

	@Column(name = "cs_price", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.Double getCsPrice() {
		return csPrice;
	}
	
	@Column(name="cs_originalprice", unique=false, nullable=true, insertable=true, updatable=true, length=65535)
	public Double getCsOriginalprice() {
	    return this.csOriginalprice;
	}

	@Column(name="cs_discountprice", unique=false, nullable=true, insertable=true, updatable=true, length=65535)
	public Double getCsDiscountprice() {
	    return this.csDiscountprice;
	}
	

	@Column(name = "cs_reckonkind", unique = false, nullable = false, insertable = true, updatable = true, length = 3)
	public Integer getCsReckonkind() {
		return csReckonkind;
	}

	@Column(name = "cs_recommend", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getCsRecommend() {
		return this.csRecommend;
	}
	
	//2013/5/28 zhuqiang
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "dj_tchcourse",joinColumns={@JoinColumn(name="course_id")},inverseJoinColumns={@JoinColumn(name="teacher_id")})
	public Set<DjTeacher> getCsTeachers() {
		return csTeachers;
	}
	//2013/5/28 zhuqiang
	@Column(name = "tch_names", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getTchNames() {
		return tchNames;
	}
	
	@Column(name = "transcribe_time", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public Date getTranscribeTime() {
		return transcribeTime;
	}
     
	@Column(name = "cs_live_status", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public Integer getCsLiveStatus() {
		return csLiveStatus;
	}
	public void setCsLiveStatus(Integer csLiveStatus) {
		this.csLiveStatus = csLiveStatus;
	}
	/*@Column(name = "cs_live_time", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public Date getCsLiveTime() {
		return csLiveTime;
	}
	public void setCsLiveTime(Date csLiveTime) {
		this.csLiveTime = csLiveTime;
	}*/
	@Column(name = "live_room_id", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public String getLiveRoomId() {
		return liveRoomId;
	}
	public void setLiveRoomId(String liveRoomId) {
		this.liveRoomId = liveRoomId;
	}
	public void setTranscribeTime(Date transcribeTime) {
		this.transcribeTime = transcribeTime;
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(getCourseId()).toHashCode();
	}
	
	
	
	public void setCategoryId(java.lang.Long value) {
		this.categoryId = value;
	}

	public void setCourseId(java.lang.Long value) {
		this.courseId = value;
	}
	@Column(name = "cs_ks", nullable = false, length = 19)
	public java.lang.Double getCsKs() {
		return csKs;
	}
	
	@Transient
	public java.lang.Double getDiscountCsKs(){
		if(!getDiscount()){
			return csKs;
		}
		BigDecimal dianbi = new BigDecimal(csPrice+"");
		Double discountedKs = dianbi.divide(new BigDecimal("150"),2,BigDecimal.ROUND_UP).doubleValue();
		return discountedKs;
	}
	
	public void setCsKs(java.lang.Double csKs) {
		this.csKs = csKs;
	}
	@Column(name = "pay_type", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getPayType() {
		return this.payType;
	}
	
	public void setPayType(Integer value) {
		this.payType = value;
	}
	public void setCsAddtime(java.lang.Long value) {
		this.csAddtime = value;
	}

	public void setCsAddtimeString(String value) {
		setCsAddtime(Long.valueOf(value));
	}

	public void setCsClicktimes(java.lang.Integer value) {
		this.csClicktimes = value;
	}

	public void setCsFreeurl(java.lang.String value) {
		this.csFreeurl = value;
	}

	public void setCsHour(java.lang.Float value) {
		this.csHour = value;
	}

	public void setCsInfo(java.lang.String value) {
		this.csInfo = ToolKit.replaceBR(value);
	}
	
	public void setCsSummary(java.lang.String csSummary) {
		this.csSummary = csSummary;
	}

	public void setCsIsaudition(Integer value) {
		this.csIsaudition = value;
	}

	public void setCsIsdisplay(Integer value) {
		this.csIsdisplay = value;
	}

	public void setCsIspack(Integer value) {
		this.csIspack = value;
	}

	public void setCsName(java.lang.String value) {
		this.csName = value;
	}
	public void setCsImg(java.lang.String value) {
		this.csImg = value;
	}

	public void setCsPackname(java.lang.String csPackname) {
		this.csPackname = csPackname;
	}

	public void setCsPrice(java.lang.Double csPrice) {
		this.csPrice = csPrice;
	}
	
	public void setCsOriginalprice(Double csOriginalprice) {
	    this.csOriginalprice = csOriginalprice;
	}

	public void setCsDiscountprice(Double csDiscountprice) {
	    this.csDiscountprice = csDiscountprice;
	}

	public void setCsReckonkind(Integer csReckonkind) {
		this.csReckonkind = csReckonkind;
	}

	public void setCsRecommend(Integer value) {
		this.csRecommend = value;
	}

	public void setCsTeachers(Set<DjTeacher> csTeachers) {
//		this.createTchNames(csTeachers);
		this.csTeachers = csTeachers;
	}
	
	public void setLiketimes(java.lang.Integer liketimes) {
		this.liketimes = liketimes;
	}
	
	public void setStudynum(java.lang.Integer studynum) {
		this.studynum = studynum;
	}
	
	public void setStudyweeknum(java.lang.Integer studyweeknum) {
		this.studyweeknum = studyweeknum;
	}
	public void setCommentnum(java.lang.Integer commentnum) {
		this.commentnum = commentnum;
	}
	
	public void setTchNames(java.lang.String tchNames) {
		this.tchNames = tchNames;
	}
	
	public void setTchNameList(List<String> tchNameList) {
		this.tchNameList = tchNameList;
	}
	
	@Column(name = "p_course_id", unique = false, nullable = true, insertable = true, updatable = true, length = 20)	
	public java.lang.Long getPcourseId() {
		return pcourseId;
	}
	public void setPcourseId(java.lang.Long pcourseId) {
		this.pcourseId = pcourseId;
	}
	public void setGoodsTag(String goodsTag) {
		this.goodsTag = goodsTag;
	}
	@Transient
	public List<String> getTchNameList() {
		String str = getTchNames();
		List<String> splitNames = this.splitNames(str);
		this.setTchNameList(splitNames);
		return tchNameList;
	}
	@Transient
	public java.lang.String getTchNamesWare() {
		String str = getTchNames();
		this.setTchNamesWare(str.replace(SEPARATOR, " "));
		return tchNamesWare;
	}
	public void setTchNamesWare(java.lang.String tchNamesWare) {
		this.tchNamesWare = tchNamesWare;
	}
	@Column(name = "is_firm_course", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getIsFirmCourse() {
		return this.isFirmCourse;
	}
	
	public void setIsFirmCourse(java.lang.Integer value) {
		this.isFirmCourse = value;
	}	
	@Column(name = "cs_belong_org", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getCsBelongOrg() {
		return this.csBelongOrg;
	}
	
	public void setCsBelongOrg(java.lang.String value) {
		this.csBelongOrg = value;
	}	
	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("CourseId", getCourseId())
				.append("CategoryId", getCategoryId())
				.append("CsName", getCsName())
				.append("CsIsdisplay", getCsIsdisplay())
				.append("CsIspack", getCsIspack())
				.append("CsFreeurl", getCsFreeurl())
				.append("CsIsaudition", getCsIsaudition())
				.append("CsRecommend", getCsRecommend())
				.append("CsClicktimes", getCsClicktimes())
				.append("CsAddtime", getCsAddtime())
				.append("CsInfo", getCsInfo())
				.append("csSummary", getCsSummary())
				.append("CsPrice", getCsPrice())
				.append("TranscribeTime", getTranscribeTime()).toString();
	}
	
	/**
	 * 生成教师名称串
	 * @author zhuqiang
	 * 2013-5-28
	 * @param set
	 */
	public void createTchNames(Set<DjTeacher> set){
		if(set!=null&&!set.isEmpty()){
			StringBuilder sb = new StringBuilder();
			for(DjTeacher tch:set){
				sb.append(SEPARATOR);
				String tchName = tch.getTchName();
				sb.append(tchName);
			}
			if(sb.length()!=0){
				sb.append(SEPARATOR);
			}
			String tchNames = sb.toString();
			this.setTchNames(tchNames);
		}
	}
	
	@Transient
	public boolean getUserHasRight() {
		return userHasRight;
	}
	public void setUserHasRight(DjUser djUser) {
//		boolean userHasRight = djUser.hasRight(courseAuthority);
		this.userHasRight = userHasRight;
	}
	/**
	 * 用"|"分割字符串
	 * @author zhuqiang
	 * 2013-5-28
	 * @param str	要分割的字符串
	 */
	public List<String> splitNames(String str) {
		List<String> names = splitNames(str,REGEX);
		return names;
	}
	
	/**
	 * 指定分隔符分割字符串
	 * @author zhuqiang
	 * 2013-5-28
	 * @param str	要分割的字符串
	 * @param sep	分隔符
	 */
	public List<String> splitNames(String str, String sep) {
		if(!StringUtils.isBlank(str)){
			String[] split = str.split(sep);
			List<String> names = new ArrayList<String>();
			for(String name:split){
				if(!StringUtils.isBlank(name)){
					names.add(name);
				}
			}
			return names;
		}
		return null;
	}

	/**
	 * 作为前台页面显示用
	 * @author zhuqiang
	 * 2014-1-9
	 * @return
	 */
	@Transient
	public String getShowCsKs(){
		if(!getDiscount()){
			return csKs+"";
		}
		return csKs+" [扣"+getDiscountCsKs()+"]"; 
	}
	
	@Transient
	public String getShowPrice(){
		if(!getDiscount()){
			return csPrice+"";
		}
		BigDecimal showPrice = new BigDecimal(csKs+"").multiply(new BigDecimal("150"));
		return showPrice.doubleValue()+"";
	}
	
	/**
	 * 判断该课程是否是折扣课程
	 * @author zhuqiang
	 * 2014-1-9
	 * @return
	 */
	@Transient
	public boolean getDiscount(){
		int i = this.courseAuthority&64 ;
		if(i==0){
			return  false;
		}
		return true;
	}
}
