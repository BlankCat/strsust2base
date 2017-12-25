/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.zfwlxt.vod.model;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;

/**
 * @author zhangjianfeng
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "dj_specialty_store")
public class DjSpecialtyStore extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialtyStore";
	public static final String ALIAS_STORE_ID = "主键id";
	public static final String ALIAS_COURSE_ID = "课程id";
	public static final String ALIAS_SPE_ID = "所属专业";
	public static final String ALIAS_GROUP_ID = "所属分组";
	public static final String ALIAS_COURSE_ORDER = "在分组中的排序";
	
	//date formats
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long storeId; 	// 主键id 
	@NotNull 
	private java.lang.Long courseId; 	// 课程id 
	@NotNull 
	private java.lang.Long speId; 	// 所属专业 
	@NotNull 
	private java.lang.Long groupId; 	// 所属分组 
	
	private java.lang.Integer courseOrder=50; 	// 在分组中的排序 
	//columns END


	public DjSpecialtyStore(){
	}

	public DjSpecialtyStore(
		java.lang.Long storeId
	){
		this.storeId = storeId;
	}

	

	public void setStoreId(java.lang.Long value) {
		this.storeId = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "store_id", unique = true, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getStoreId() {
		return this.storeId;
	}
	
	@Column(name = "course_id", unique = false, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getCourseId() {
		return this.courseId;
	}
	
	public void setCourseId(java.lang.Long value) {
		this.courseId = value;
	}
	
	@Column(name = "spe_id", unique = false, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpeId() {
		return this.speId;
	}
	
	public void setSpeId(java.lang.Long value) {
		this.speId = value;
	}
	
	@Column(name = "group_id", unique = false, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getGroupId() {
		return this.groupId;
	}
	
	public void setGroupId(java.lang.Long value) {
		this.groupId = value;
	}
	
	@Column(name = "course_order", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getCourseOrder() {
		return this.courseOrder;
	}
	
	public void setCourseOrder(java.lang.Integer value) {
		this.courseOrder = value;
	}
	
	
	private DjCourse djCourse;
	public void setDjCourse(DjCourse djCourse){
		this.djCourse = djCourse;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "course_id",nullable = false, insertable = false, updatable = false) 
	})
	public DjCourse getDjCourse() {
		return djCourse;
	}
	
	private DjSpecialtyGroup djSpecialtyGroup;
	public void setDjSpecialtyGroup(DjSpecialtyGroup djSpecialtyGroup){
		this.djSpecialtyGroup = djSpecialtyGroup;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "group_id",nullable = false, insertable = false, updatable = false) 
	})
	public DjSpecialtyGroup getDjSpecialtyGroup() {
		return djSpecialtyGroup;
	}
	
	private DjSpecialty djSpecialty;
	public void setDjSpecialty(DjSpecialty djSpecialty){
		this.djSpecialty = djSpecialty;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "spe_id",nullable = false, insertable = false, updatable = false) 
	})
	public DjSpecialty getDjSpecialty() {
		return djSpecialty;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("StoreId",getStoreId())
			.append("CourseId",getCourseId())
			.append("SpeId",getSpeId())
			.append("GroupId",getGroupId())
			.append("CourseOrder",getCourseOrder())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getStoreId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialtyStore == false) return false;
		if(this == obj) return true;
		DjSpecialtyStore other = (DjSpecialtyStore)obj;
		return new EqualsBuilder()
			.append(getStoreId(),other.getStoreId())
			.isEquals();
	}
}

