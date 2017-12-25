/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.zfwlxt.vod.model;

import java.util.HashSet;
import java.util.Set;

import javacommon.base.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "dj_specialty_group")
public class DjSpecialtyGroup extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DjSpecialtyGroup";
	public static final String ALIAS_ID = "主键";
	public static final String ALIAS_GROUP_NAME = "分组名称";
	public static final String ALIAS_GROUP_ORDER = "排序字段";
	public static final String ALIAS_SPECIALTY_ID = "分组所属专业";
	
	//date formats
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Long id;
	@NotBlank @Length(max=50)
	private java.lang.String groupName;
	@NotNull 
	private java.lang.Float groupOrder; 	// 排序字段 
	@NotNull 
	private java.lang.Long specialtyId; 	// 分组所属专业 
	//columns END


	public DjSpecialtyGroup(){
	}

	public DjSpecialtyGroup(
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
	
	@Column(name = "group_name", unique = false, nullable = false, insertable = true, updatable = true, length = 50)
	public java.lang.String getGroupName() {
		return this.groupName;
	}
	
	public void setGroupName(java.lang.String value) {
		this.groupName = value;
	}
	
	@Column(name = "group_order", unique = false, nullable = false, insertable = true, updatable = true, length = 10)
	public java.lang.Float getGroupOrder() {
		return this.groupOrder;
	}
	
	public void setGroupOrder(java.lang.Float value) {
		this.groupOrder = value;
	}
	
	@Column(name = "specialty_id", unique = false, nullable = false, insertable = true, updatable = true, length = 19)
	public java.lang.Long getSpecialtyId() {
		return this.specialtyId;
	}
	
	public void setSpecialtyId(java.lang.Long value) {
		this.specialtyId = value;
	}
	
	
	private Set djSpecialtyStores = new HashSet(0);
	public void setDjSpecialtyStores(Set<DjSpecialtyStore> djSpecialtyStore){
		this.djSpecialtyStores = djSpecialtyStore;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "djSpecialtyGroup")
	public Set<DjSpecialtyStore> getDjSpecialtyStores() {
		return djSpecialtyStores;
	}
	
	private DjSpecialty djSpecialty;
	public void setDjSpecialty(DjSpecialty djSpecialty){
		this.djSpecialty = djSpecialty;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "specialty_id",nullable = false, insertable = false, updatable = false) 
	})
	public DjSpecialty getDjSpecialty() {
		return djSpecialty;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("GroupName",getGroupName())
			.append("GroupOrder",getGroupOrder())
			.append("SpecialtyId",getSpecialtyId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DjSpecialtyGroup == false) return false;
		if(this == obj) return true;
		DjSpecialtyGroup other = (DjSpecialtyGroup)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

