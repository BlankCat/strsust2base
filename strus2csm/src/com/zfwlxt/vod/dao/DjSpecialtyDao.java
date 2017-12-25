/*
 * Powered By [www.zfwx.com]
 * Web Site: http://www.zfwx.com
 * 
 * Since 2008 - 2017
 */

package com.zfwlxt.vod.dao;

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
 * @author tangrongzhi
 * @version 1.0
 * @since 1.0,2017/12/25 08:07:08
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class DjSpecialtyDao extends BaseHibernateDao<DjSpecialty,java.lang.Long>{

	public Class getEntityClass() {
		return DjSpecialty.class;
	}
	
	public Page findPage(DjSpecialtyQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from DjSpecialty t where 1=1 "
			  	+ "/~ and t.speNamePrefix = {speNamePrefix} ~/"
			  	+ "/~ and t.speName = {speName} ~/"
			  	+ "/~ and t.speNameSuffix = {speNameSuffix} ~/"
			  	+ "/~ and t.speLesson = {speLesson} ~/"
			  	+ "/~ and t.spePrice = {spePrice} ~/"
			  	+ "/~ and t.speSynopsis = {speSynopsis} ~/"
			  	+ "/~ and t.speContent = {speContent} ~/"
			  	+ "/~ and t.speImg = {speImg} ~/"
			  	+ "/~ and t.speStatus = {speStatus} ~/"
			  	+ "/~ and t.speOrder = {speOrder} ~/"
				+ "/~ and t.speAddtime >= {speAddtimeBegin} ~/"
				+ "/~ and t.speAddtime <= {speAddtimeEnd} ~/"
			  	+ "/~ and t.spePreTitle = {spePreTitle} ~/"
			  	+ "/~ and t.spePreContent = {spePreContent} ~/"
			  	+ "/~ and t.speContents = {speContents} ~/"
			  	+ "/~ and t.spePoscTitle = {spePoscTitle} ~/"
			  	+ "/~ and t.spePoscContent = {spePoscContent} ~/"
			  	+ "/~ and t.speBrowseCount = {speBrowseCount} ~/"
			  	+ "/~ and t.speCollectionCount = {speCollectionCount} ~/"
			  	+ "/~ and t.speCreateName = {speCreateName} ~/"
			  	+ "/~ and t.speFirstSpell = {speFirstSpell} ~/"
			  	+ "/~ and t.speFullSpell = {speFullSpell} ~/"
			  	+ "/~ and t.speHistoryClassSchoolId = {speHistoryClassSchoolId} ~/"
			  	+ "/~ and t.speHistoryClassSchoolInfo = {speHistoryClassSchoolInfo} ~/"
			  	+ "/~ and t.speImgHeight = {speImgHeight} ~/"
			  	+ "/~ and t.speImgWidth = {speImgWidth} ~/"
			  	+ "/~ and t.spePlanLength = {spePlanLength} ~/"
			  	+ "/~ and t.speSignupCount = {speSignupCount} ~/"
			  	+ "/~ and t.speStar = {speStar} ~/"
			  	+ "/~ and t.speSynopsisInfo = {speSynopsisInfo} ~/"
			  	+ "/~ and t.speTeachersId = {speTeachersId} ~/"
			  	+ "/~ and t.speTeachersInfo = {speTeachersInfo} ~/"
			  	+ "/~ and t.speType = {speType} ~/"
			  	+ "/~ and t.speTypeInfo = {speTypeInfo} ~/"
			  	+ "/~ and t.speCatId = {speCatId} ~/"
			  	+ "/~ and t.speDomain = {speDomain} ~/"
			  	+ "/~ and t.speCommentsNum = {speCommentsNum} ~/"
			  	+ "/~ and t.speLoveNum = {speLoveNum} ~/"
			  	+ "/~ and t.speTjOrder = {speTjOrder} ~/"
			  	+ "/~ and t.speDisplay = {speDisplay} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from DjSpecialty t where 1=1 ");
        if(isNotEmpty(query.getId())) {
            sql2.append(" and  t.id = :id ");
        }
        if(isNotEmpty(query.getSpeNamePrefix())) {
            sql2.append(" and  t.speNamePrefix = :speNamePrefix ");
        }
        if(isNotEmpty(query.getSpeName())) {
            sql2.append(" and  t.speName = :speName ");
        }
        if(isNotEmpty(query.getSpeNameSuffix())) {
            sql2.append(" and  t.speNameSuffix = :speNameSuffix ");
        }
        if(isNotEmpty(query.getSpeLesson())) {
            sql2.append(" and  t.speLesson = :speLesson ");
        }
        if(isNotEmpty(query.getSpePrice())) {
            sql2.append(" and  t.spePrice = :spePrice ");
        }
        if(isNotEmpty(query.getSpeSynopsis())) {
            sql2.append(" and  t.speSynopsis = :speSynopsis ");
        }
        if(isNotEmpty(query.getSpeContent())) {
            sql2.append(" and  t.speContent = :speContent ");
        }
        if(isNotEmpty(query.getSpeImg())) {
            sql2.append(" and  t.speImg = :speImg ");
        }
        if(isNotEmpty(query.getSpeStatus())) {
            sql2.append(" and  t.speStatus = :speStatus ");
        }
        if(isNotEmpty(query.getSpeOrder())) {
            sql2.append(" and  t.speOrder = :speOrder ");
        }
        if(isNotEmpty(query.getSpeAddtimeBegin())) {
            sql2.append(" and  t.speAddtime >= :speAddtimeBegin ");
        }
        if(isNotEmpty(query.getSpeAddtimeEnd())) {
            sql2.append(" and  t.speAddtime <= :speAddtimeEnd ");
        }
        if(isNotEmpty(query.getSpePreTitle())) {
            sql2.append(" and  t.spePreTitle = :spePreTitle ");
        }
        if(isNotEmpty(query.getSpePreContent())) {
            sql2.append(" and  t.spePreContent = :spePreContent ");
        }
        if(isNotEmpty(query.getSpeContents())) {
            sql2.append(" and  t.speContents = :speContents ");
        }
        if(isNotEmpty(query.getSpePoscTitle())) {
            sql2.append(" and  t.spePoscTitle = :spePoscTitle ");
        }
        if(isNotEmpty(query.getSpePoscContent())) {
            sql2.append(" and  t.spePoscContent = :spePoscContent ");
        }
        if(isNotEmpty(query.getSpeBrowseCount())) {
            sql2.append(" and  t.speBrowseCount = :speBrowseCount ");
        }
        if(isNotEmpty(query.getSpeCollectionCount())) {
            sql2.append(" and  t.speCollectionCount = :speCollectionCount ");
        }
        if(isNotEmpty(query.getSpeCreateName())) {
            sql2.append(" and  t.speCreateName = :speCreateName ");
        }
        if(isNotEmpty(query.getSpeFirstSpell())) {
            sql2.append(" and  t.speFirstSpell = :speFirstSpell ");
        }
        if(isNotEmpty(query.getSpeFullSpell())) {
            sql2.append(" and  t.speFullSpell = :speFullSpell ");
        }
        if(isNotEmpty(query.getSpeHistoryClassSchoolId())) {
            sql2.append(" and  t.speHistoryClassSchoolId = :speHistoryClassSchoolId ");
        }
        if(isNotEmpty(query.getSpeHistoryClassSchoolInfo())) {
            sql2.append(" and  t.speHistoryClassSchoolInfo = :speHistoryClassSchoolInfo ");
        }
        if(isNotEmpty(query.getSpeImgHeight())) {
            sql2.append(" and  t.speImgHeight = :speImgHeight ");
        }
        if(isNotEmpty(query.getSpeImgWidth())) {
            sql2.append(" and  t.speImgWidth = :speImgWidth ");
        }
        if(isNotEmpty(query.getSpePlanLength())) {
            sql2.append(" and  t.spePlanLength = :spePlanLength ");
        }
        if(isNotEmpty(query.getSpeSignupCount())) {
            sql2.append(" and  t.speSignupCount = :speSignupCount ");
        }
        if(isNotEmpty(query.getSpeStar())) {
            sql2.append(" and  t.speStar = :speStar ");
        }
        if(isNotEmpty(query.getSpeSynopsisInfo())) {
            sql2.append(" and  t.speSynopsisInfo = :speSynopsisInfo ");
        }
        if(isNotEmpty(query.getSpeTeachersId())) {
            sql2.append(" and  t.speTeachersId = :speTeachersId ");
        }
        if(isNotEmpty(query.getSpeTeachersInfo())) {
            sql2.append(" and  t.speTeachersInfo = :speTeachersInfo ");
        }
        if(isNotEmpty(query.getSpeType())) {
            sql2.append(" and  t.speType = :speType ");
        }
        if(isNotEmpty(query.getSpeTypeInfo())) {
            sql2.append(" and  t.speTypeInfo = :speTypeInfo ");
        }
        if(isNotEmpty(query.getSpeCatId())) {
            sql2.append(" and  t.speCatId = :speCatId ");
        }
        if(isNotEmpty(query.getSpeDomain())) {
            sql2.append(" and  t.speDomain = :speDomain ");
        }
        if(isNotEmpty(query.getSpeCommentsNum())) {
            sql2.append(" and  t.speCommentsNum = :speCommentsNum ");
        }
        if(isNotEmpty(query.getSpeLoveNum())) {
            sql2.append(" and  t.speLoveNum = :speLoveNum ");
        }
        if(isNotEmpty(query.getSpeTjOrder())) {
            sql2.append(" and  t.speTjOrder = :speTjOrder ");
        }
        if(isNotEmpty(query.getSpeDisplay())) {
            sql2.append(" and  t.speDisplay = :speDisplay ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
