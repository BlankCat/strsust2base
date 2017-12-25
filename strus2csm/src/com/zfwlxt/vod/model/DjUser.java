/*
 * Powered By [点睛政法网络学堂]
 * Web Site: http://www.zfwlxt.com
 * Author: Lining Qinguochao
 * Since 2008 - 2010
 */

package com.zfwlxt.vod.model;

import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import cn.org.rapid_framework.util.DateConvertUtils;
import javacommon.base.BaseEntity;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0
 */

@Entity
@Table(name = "dj_user")
public class DjUser extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias

	public static final String TABLE_ALIAS = "用户表";
	public static final String ALIAS_USER_ID = "用户编号";
	public static final String ALIAS_ORGID = "组织编号";
	public static final String ALIAS_USERNAME = "用户名";
	public static final String ALIAS_PASSWORD = "密码";
	public static final String ALIAS_QUESTION = "密码问题";
	public static final String ALIAS_ANSWER = "密码答案";
	public static final String ALIAS_TYPE = "用户类型";
	public static final String ALIAS_STATUS = "用户状态";
	public static final String ALIAS_EMAIL = "用户Email";
	public static final String ALIAS_LASTLOGIN = "上次登录时间";
	public static final String ALIAS_LASTLOGOUT = "上次注销时间";
	public static final String ALIAS_LASTLOGINIP = "上次登录IP";
	public static final String ALIAS_LOGINTIMES = "用户登录次数";
	public static final String ALIAS_USERAMONT = "用户余额";
	public static final String ALIAS_VIP_PRICE = "会员价格";
	// date formats

	public static final String FORMAT_LASTLOGIN = DATE_FORMAT;
	public static final String FORMAT_LASTLOGOUT = DATE_FORMAT;

	// 可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	// columns START

	private java.lang.Long userId;

	private java.lang.Long orgid;
	@Length(max = 50)
	private java.lang.String username;
	@Length(max = 50)
	private java.lang.String password;

	@Length(max = 250)
	private java.lang.String question;
	@Length(max = 250)
	private java.lang.String answer;
	@Email
	@Length(max = 50)
	private java.lang.String email;
	private java.util.Date lastlogin;

	private java.util.Date lastlogout;
	@Length(max = 50)
	private java.lang.String lastloginip;

	private java.lang.Integer logintimes = 0;
	@NotNull
	private java.lang.Double userAmont;

	private java.lang.Double userAmontTemp;
	
	private java.lang.Integer type;

	private java.lang.Integer status;
	// columns END
	private java.lang.Integer isNewUser;
	private java.lang.Integer ispopup = 0;

	private String result;
	@NotNull
//	@Max(127)
//	private Integer courseAuthority;
	private Double schoolHour = 0d;//vip所享有的选课课时数
	private Double chooseSchoolHour = 0d;//学员已选课时的课时数
	private Double remainSchoolHour = 0d;//学员剩余课时数
	private java.util.Date vipStarttime;//vip开始日期
	private java.util.Date vipEndtime;//vip截止日期
	private Integer vipRank =0;//vip等级
	private Integer vipType =0;//vip类型
	private Double vipPrice;
	private Integer isGroupMembers = 0;//是否为团体会员的标记
	private Integer GroupVipAuthority ;
	private java.util.Date groupStarttime;
	private java.util.Date groupEndtime;

	/*@Column(name = "course_authority", unique = false, nullable = false, insertable = true, updatable = true, length = 127)
	public Integer getCourseAuthority() {
		return courseAuthority;
	}

	public void setCourseAuthority(Integer courseAuthority) {
		this.courseAuthority = courseAuthority;
	}*/
	public DjUser() {
	}

	public DjUser(java.lang.Long userId) {
		this.userId = userId;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof DjUser == false)
			return false;
		if (this == obj)
			return true;
		DjUser other = (DjUser) obj;
		return new EqualsBuilder().append(getUserId(), other.getUserId())
				.isEquals();
	}




	@Column(name = "answer", unique = false, nullable = true, insertable = true, updatable = true, length = 250)
	public java.lang.String getAnswer() {
		return this.answer;
	}

	// columns END

	@Column(name = "email", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getEmail() {
		return this.email;
	}

	@Column(name = "isnewuser", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getIsNewUser() {
		return this.isNewUser;
	}

	@Column(name = "ispopup", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.lang.Integer getIspopup() {
		return ispopup;
	}

	@Column(name = "lastlogin", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getLastlogin() {
		return this.lastlogin;
	}

	@Column(name = "lastloginip", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getLastloginip() {
		return this.lastloginip;
	}

	@Transient
	public String getLastloginString() {
		return DateConvertUtils.format(getLastlogin(), FORMAT_LASTLOGIN);
	}

	@Column(name = "lastlogout", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getLastlogout() {
		return this.lastlogout;
	}

	@Transient
	public String getLastlogoutString() {
		return DateConvertUtils.format(getLastlogout(), FORMAT_LASTLOGOUT);
	}

	@Column(name = "logintimes", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getLogintimes() {
		return this.logintimes;
	}

	@Column(name = "orgid", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.lang.Long getOrgid() {
		return this.orgid;
	}

	@Column(name = "password", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getPassword() {
		return this.password;
	}

	@Column(name = "question", unique = false, nullable = true, insertable = true, updatable = true, length = 250)
	public java.lang.String getQuestion() {
		return this.question;
	}

	public String getResult() {
		return result;
	}

	@Column(name = "status", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getStatus() {
		return this.status;
	}

	@Column(name = "type", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getType() {
		return this.type;
	}

	@Column(name = "user_amont", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.Double getUserAmont() {
		return userAmont;
	}

	@Column(name = "user_amont_temp", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.Double getUserAmontTemp() {
		return userAmontTemp;
	}

	public void setUserAmontTemp(java.lang.Double userAmontTemp) {
		this.userAmontTemp = userAmontTemp;
	}

	@Id
	@GeneratedValue(generator = "custom-id")
	@GenericGenerator(name = "custom-id", strategy = "native")
	@Column(name = "user_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getUserId() {
		return this.userId;
	}

	@Column(name = "username", unique = false, insertable = true, updatable = true, length = 50)
	public java.lang.String getUsername() {
		return this.username;
	}
	
	@Column(name = "school_hour", length = 20)
	public Double getSchoolHour() {
		return schoolHour;
	}
	
	@Column(name = "choose_school_hour", length = 20)
	public Double getChooseSchoolHour() {
		return chooseSchoolHour;
	}
	
	@Column(name = "remain_school_hour", length = 20)
	public Double getRemainSchoolHour() {
		return remainSchoolHour;
	}

	@Column(name = "vip_starttime", length = 20)
	public java.util.Date getVipStarttime() {
		return vipStarttime;
	}
	
	@Column(name = "vip_endtime", length = 20)
	public java.util.Date getVipEndtime() {
		return vipEndtime;
	}
	
	@Transient
	public String getVipEndtimeString(){
		if(vipEndtime!=null){
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			return format.format(vipEndtime); 
		}
		return "";
	}
	
	@Column(name = "vip_rank", length = 20)
	public Integer getVipRank() {
		return vipRank;
	}
	
	@Column(name = "vip_type", length = 20)
	public Integer getVipType() {
		return vipType;
	}
	
	@Column(name = "is_group_members", length = 20)
	public Integer getIsGroupMembers() {
		return isGroupMembers;
	}

	@Column(name = "vip_price", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	public Double getVipPrice() {
		return this.vipPrice;
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(getUserId()).toHashCode();
	}
	public void setVipPrice(Double value) {
		this.vipPrice = value;
	}

	public void setAnswer(java.lang.String value) {
		this.answer = value;
	}

	public void setEmail(java.lang.String value) {
		this.email = value;
	}

	public void setIsNewUser(java.lang.Integer isNewUser) {
		this.isNewUser = isNewUser;
	}

	public void setIspopup(java.lang.Integer ispopup) {
		this.ispopup = ispopup;
	}

	public void setLastlogin(java.util.Date value) {
		this.lastlogin = value;
	}

	public void setLastloginip(java.lang.String value) {
		this.lastloginip = value;
	}

	public void setLastloginString(String value) {
		setLastlogin(DateConvertUtils.parse(value, FORMAT_LASTLOGIN,
				java.util.Date.class));
	}

	public void setLastlogout(java.util.Date value) {
		this.lastlogout = value;
	}

	public void setLastlogoutString(String value) {
		setLastlogout(DateConvertUtils.parse(value, FORMAT_LASTLOGOUT,
				java.util.Date.class));
	}

	public void setLogintimes(java.lang.Integer value) {
		this.logintimes = value;
	}

	public void setOrgid(java.lang.Long value) {
		this.orgid = value;
	}

	public void setPassword(java.lang.String value) {
		this.password = value;
	}

	public void setQuestion(java.lang.String value) {
		this.question = value;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setStatus(java.lang.Integer value) {
		this.status = value;
	}

	public void setType(java.lang.Integer value) {
		this.type = value;
	}

	public void setUserAmont(java.lang.Double userAmont) {
		this.userAmont = userAmont;
	}

	public void setUserId(java.lang.Long value) {
		this.userId = value;
	}

	public void setUsername(java.lang.String value) {
		this.username = value;
	}

	public void setSchoolHour(Double schoolHour) {
		this.schoolHour = schoolHour;
	}

	public void setChooseSchoolHour(Double chooseSchoolHour) {
		this.chooseSchoolHour = chooseSchoolHour;
	}

	public void setRemainSchoolHour(Double remainSchoolHour) {
		this.remainSchoolHour = remainSchoolHour;
	}

	public void setVipStarttime(java.util.Date vipStarttime) {
		this.vipStarttime = vipStarttime;
	}

	public void setVipEndtime(java.util.Date vipEndtime) {
		this.vipEndtime = vipEndtime;
	}

	public void setVipRank(Integer vipRank) {
		this.vipRank = vipRank;
	}

	public void setVipType(Integer vipType) {
		this.vipType = vipType;
	}

	public void setIsGroupMembers(Integer isGroupMembers) {
		this.isGroupMembers = isGroupMembers;
	}
	public void setGroupVipAuthority(Integer groupVipAuthority) {
		GroupVipAuthority = groupVipAuthority;
	}
	
	@Transient
	public String getGroupStarttimeString() {
		return DateConvertUtils.format(getGroupStarttime(), DATE_FORMAT);
	}
	public void setGroupStarttimeString(String value) {
		setGroupStarttime(DateConvertUtils.parse(value, DATE_FORMAT,java.util.Date.class));
	}
	
	@Column(name = "group_starttime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getGroupStarttime() {
		return this.groupStarttime;
	}
	
	public void setGroupStarttime(java.util.Date value) {
		this.groupStarttime = value;
	}
	
	@Transient
	public String getGroupEndtimeString() {
		return DateConvertUtils.format(getGroupEndtime(), DATE_FORMAT);
	}
	public void setGroupEndtimeString(String value) {
		setGroupEndtime(DateConvertUtils.parse(value, DATE_FORMAT,java.util.Date.class));
	}
	
	@Column(name = "group_endtime", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getGroupEndtime() {
		return this.groupEndtime;
	}
	
	public void setGroupEndtime(java.util.Date value) {
		this.groupEndtime = value;
	}
	
	
	
	
	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("UserId", getUserId()).append("Orgid", getOrgid())
				.append("Username", getUsername()).append("Password",
						getPassword()).append("Lastlogin", getLastlogin())
				.append("Lastlogout", getLastlogout()).append("Lastloginip",
						getLastloginip()).append("Logintimes", getLogintimes())
				.append("Email", getEmail()).append("Question", getQuestion())
				.append("Answer", getAnswer()).append("Type", getType())
				.append("Status", getStatus()).toString();
	}


	
	
}
