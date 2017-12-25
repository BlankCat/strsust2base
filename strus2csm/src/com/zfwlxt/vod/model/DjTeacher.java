/*
 * Powered By [点睛政法网络学堂]
 * Web Site: http://www.zfwlxt.com
 * Author: Lining Qinguochao
 * Since 2008 - 2010
 */

package com.zfwlxt.vod.model;

import java.math.BigDecimal;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0
 */

@Entity
@Table(name = "dj_teacher")
public class DjTeacher extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "教师表";
	public static final String ALIAS_TEACHER_ID = "教师编号";
	public static final String ALIAS_TCH_USERNAME = "用户名";
	public static final String ALIAS_TCH_NAME = "姓名";
	public static final String ALIAS_TCH_PHOTO = "照片";
	public static final String ALIAS_TCH_SMALLPHOTO = "专家小图片";
	public static final String ALIAS_TCH_BASE = "提成基数";
	public static final String ALIAS_TCH_TOTAL = "总提成";
	public static final String ALIAS_TCH_CSNUM = "课程数";
	public static final String ALIAS_TCH_NOTE = "简介";
	public static final String ALIAS_TCH_EMAIL = "邮箱";
	public static final String ALIAS_TCH_MAJOR = "专业";
	public static final String ALIAS_TCH_SEX = "性别";
	public static final String ALIAS_TCH_BIRTHDAY = "出生年月";
	public static final String ALIAS_TCH_URL = "个人网站";
	public static final String ALIAS_IS_FAMOUS = "是否出名";
	public static final String ALIAS_TCH_DESC = "备注";
	public static final String ALIAS_TCH_SPEDESC = "专业特长";
	public static final String ALIAS_TCH_AMONT = "教师账户";
	public static final String ALIAS_TCH_PROPORTION = "分成比例";
	public static final String ALIAS_IS_AUTH = "是否认证，0未认证   1认证";
	public static final String ALIAS_TCH_STUDYNUM = "老师的课程 有多少人学";
	public static final String ALIAS_TCH_PLACE = "讲师所属地区，属于多个地区用逗号分开格式如下：成都，濮阳";
	private static final int MAXLENGTH = 33;
	
	// date formats

	// 可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long teacherId; 	// 教师编号 
	@Length(max=50)
	private java.lang.String tchUsername; 	// 用户名 
	@NotBlank @Length(max=50)
	private java.lang.String tchName; 	// 姓名 
	@Length(max=100)
	private java.lang.String tchPhoto; 	// 照片 
	private java.lang.String tchSmallphoto; 	// 专家小图片 
	
	private java.lang.Double tchBase; 	// 提成基数 
	
	private java.lang.Double tchTotal; 	// 总提成 
	
	private java.lang.Integer tchCsnum; 	// 课程数 
	@Length(max=65535)
	private java.lang.String tchNote; 	// 简介 
	@Email @Length(max=50)
	private java.lang.String tchEmail; 	// 邮箱 
	@Length(max=50)
	private java.lang.String tchMajor; 	// 专业 
	private java.lang.String tchShortNote;
	@Length(max=10)
	private java.lang.String tchSex; 	// 性别 
	@Length(max=50)
	private java.lang.String tchBirthday; 	// 出生年月 
	@Length(max=100)
	private java.lang.String tchUrl; 	// 个人网站 
	
	private Integer isFamous; 	// 是否出名 
	@Length(max=65535)

	private java.lang.String tchDesc; 	// 备注 
	@Length(max=255)
	private java.lang.String tchSpedesc; 	// 专业特长 
	
	private Long tchAmont;
	private BigDecimal tchProportion;

	@Max(127L)
	private Integer isAuth = Integer.valueOf(0);
	private Integer tchStudynum;
	@Length(max=500)
	private java.lang.String tchPlace; 	// 讲师所属地区，属于多个地区用逗号分开格式如下：成都，濮阳 
	
	private Integer tjOrder=0;
	
	//columns END

	public DjTeacher() {
	}



	public DjTeacher(
		java.lang.Long teacherId
	){
		this.teacherId = teacherId;
	}

	

	public void setTeacherId(java.lang.Long value) {
		this.teacherId = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "teacher_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getTeacherId() {
		return this.teacherId;
	}
	
	@Column(name = "tch_username", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getTchUsername() {
		return this.tchUsername;
	}
	
	public void setTchUsername(java.lang.String value) {
		this.tchUsername = value;
	}
	
	@Column(name = "tch_name", unique = false, nullable = false, insertable = true, updatable = true, length = 50)
	public java.lang.String getTchName() {
		return this.tchName;
	}
	
	public void setTchName(java.lang.String value) {
		this.tchName = value;
	}
	
	@Column(name = "tch_photo", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getTchPhoto() {
		return this.tchPhoto;
	}
	
	public void setTchPhoto(java.lang.String value) {
		this.tchPhoto = value;
	}
	
	@Column(name = "tch_smallphoto", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getTchSmallphoto() {
		return this.tchSmallphoto;
	}
	
	public void setTchSmallphoto(java.lang.String value) {
		this.tchSmallphoto = value;
	}
	@Column(name = "tch_base", unique = false, nullable = true, insertable = true, updatable = true, length = 12)
	public java.lang.Double getTchBase() {
		return this.tchBase;
	}
	
	public void setTchBase(java.lang.Double value) {
		this.tchBase = value;
	}
	
	@Column(name = "tch_total", unique = false, nullable = true, insertable = true, updatable = true, length = 12)
	public java.lang.Double getTchTotal() {
		return this.tchTotal;
	}
	
	public void setTchTotal(java.lang.Double value) {
		this.tchTotal = value;
	}
	
	@Column(name = "tch_csnum", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getTchCsnum() {
		return this.tchCsnum;
	}
	
	public void setTchCsnum(java.lang.Integer value) {
		this.tchCsnum = value;
	}
	
	@Column(name = "tch_note", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getTchNote() {
		return this.tchNote;
	}
	
	public void setTchNote(java.lang.String value) {
		this.tchNote = value;
	}
	@Transient
	public java.lang.String getTchShortNote() {
		String note = this.getTchNote()!=null?this.getTchNote():"";
		if(note.length()>MAXLENGTH){
			
			note = note.substring(0,MAXLENGTH)+"...";
		}
		note = note.replaceAll("<", "&lt;");
		this.setTchShortNote(note);
		return tchShortNote;
	}

	public void setTchShortNote(java.lang.String tchShortNote) {
		this.tchShortNote = tchShortNote;
	}	
	@Column(name = "tch_email", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getTchEmail() {
		return this.tchEmail;
	}
	
	public void setTchEmail(java.lang.String value) {
		this.tchEmail = value;
	}
	
	@Column(name = "tch_major", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getTchMajor() {
		return this.tchMajor;
	}
	
	public void setTchMajor(java.lang.String value) {
		this.tchMajor = value;
	}
	
	@Column(name = "tch_sex", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.String getTchSex() {
		return this.tchSex;
	}
	
	public void setTchSex(java.lang.String value) {
		this.tchSex = value;
	}
	
	@Column(name = "tch_birthday", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getTchBirthday() {
		return this.tchBirthday;
	}
	
	public void setTchBirthday(java.lang.String value) {
		this.tchBirthday = value;
	}
	
	@Column(name = "tch_url", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getTchUrl() {
		return this.tchUrl;
	}
	
	public void setTchUrl(java.lang.String value) {
		this.tchUrl = value;
	}
	
	@Column(name = "is_famous", unique = false, nullable = false, insertable = true, updatable = true, length = 3)
	public Integer getIsFamous() {
		return this.isFamous;
	}
	
	public void setIsFamous(Integer value) {
		this.isFamous = value;
	}
	
	@Column(name = "tch_desc", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getTchDesc() {
		return this.tchDesc;
	}
	
	public void setTchDesc(java.lang.String value) {
		this.tchDesc = value;
	}
	
	@Column(name = "tch_spedesc", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getTchSpedesc() {
		return this.tchSpedesc;
	}
	
	public void setTchSpedesc(java.lang.String value) {
		this.tchSpedesc = value;
	}
	
	public void setTchAmont(Long value) {
	    this.tchAmont = value;
	  }

	  @Column(name="tch_proportion", unique=false, nullable=true, insertable=true, updatable=true, length=3)
	  public BigDecimal getTchProportion() {
	    return this.tchProportion;
	  }

	  public void setTchProportion(BigDecimal tchProportion) {
	    this.tchProportion = tchProportion;
	  }

	  @Column(name="is_auth", unique=false, nullable=true, insertable=true, updatable=true, length=3)
	  public Integer getIsAuth() {
	    return this.isAuth;
	  }

	  public void setIsAuth(Integer value)
	  {
	    this.isAuth = value;
	  }

	  @Column(name="tch_studynum", unique=false, nullable=true, insertable=true, updatable=true, length=10)
	  public Integer getTchStudynum() {
	    return this.tchStudynum;
	  }

	  public void setTchStudynum(Integer value) {
	    this.tchStudynum = value;
	  }
	
	@Column(name = "tch_place", unique = false, nullable = true, insertable = true, updatable = true, length = 500)
	public java.lang.String getTchPlace() {
		return this.tchPlace;
	}
	
	public void setTchPlace(java.lang.String value) {
		this.tchPlace = value;
	}
	
	  @Column(name="tj_order", unique=false, nullable=true, insertable=true, updatable=true, length=10)
	  public Integer getTjOrder() {
			return tjOrder;
	  }

	  public void setTjOrder(Integer tjOrder) {
			this.tjOrder = tjOrder;
	  }
	  
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("TeacherId",getTeacherId())
			.append("TchUsername",getTchUsername())
			.append("TchName",getTchName())
			.append("TchPhoto",getTchPhoto())
			.append("TchBase",getTchBase())
			.append("TchTotal",getTchTotal())
			.append("TchCsnum",getTchCsnum())
			.append("TchNote",getTchNote())
			.append("TchEmail",getTchEmail())
			.append("TchMajor",getTchMajor())
			.append("TchSex",getTchSex())
			.append("TchBirthday",getTchBirthday())
			.append("TchUrl",getTchUrl())
			.append("IsFamous",getIsFamous())
			.append("TchDesc",getTchDesc())
			.append("TchSpedesc",getTchSpedesc())
			.append("TchPlace",getTchPlace())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getTeacherId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjTeacher == false) return false;
		if(this == obj) return true;
		DjTeacher other = (DjTeacher)obj;
		return new EqualsBuilder()
			.append(getTeacherId(),other.getTeacherId())
			.isEquals();
	}
}

