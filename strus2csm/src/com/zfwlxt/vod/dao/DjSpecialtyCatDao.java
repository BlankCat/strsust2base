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
 * @since 1.0,2017/12/25 09:47:38
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class DjSpecialtyCatDao extends BaseHibernateDao<DjSpecialtyCat,java.lang.Long>{

	public Class getEntityClass() {
		return DjSpecialtyCat.class;
	}
	
	public Page findPage(DjSpecialtyCatQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from DjSpecialtyCat t where 1=1 "
			  	+ "/~ and t.typeId = {typeId} ~/"
			  	+ "/~ and t.pid = {pid} ~/"
			  	+ "/~ and t.catName = {catName} ~/"
			  	+ "/~ and t.catIcon = {catIcon} ~/"
			  	+ "/~ and t.catIntro = {catIntro} ~/"
			  	+ "/~ and t.domain = {domain} ~/"
			  	+ "/~ and t.specsCount = {specsCount} ~/"
			  	+ "/~ and t.specsPrice = {specsPrice} ~/"
			  	+ "/~ and t.specsSort = {specsSort} ~/"
			  	+ "/~ and t.isDisplay = {isDisplay} ~/"
			  	+ "/~ and t.isDefault = {isDefault} ~/"
			  	+ "/~ and t.createAccount = {createAccount} ~/"
				+ "/~ and t.createTime >= {createTimeBegin} ~/"
				+ "/~ and t.createTime <= {createTimeEnd} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from DjSpecialtyCat t where 1=1 ");
        if(isNotEmpty(query.getCatId())) {
            sql2.append(" and  t.catId = :catId ");
        }
        if(isNotEmpty(query.getTypeId())) {
            sql2.append(" and  t.typeId = :typeId ");
        }
        if(isNotEmpty(query.getPid())) {
            sql2.append(" and  t.pid = :pid ");
        }
        if(isNotEmpty(query.getCatName())) {
            sql2.append(" and  t.catName = :catName ");
        }
        if(isNotEmpty(query.getCatIcon())) {
            sql2.append(" and  t.catIcon = :catIcon ");
        }
        if(isNotEmpty(query.getCatIntro())) {
            sql2.append(" and  t.catIntro = :catIntro ");
        }
        if(isNotEmpty(query.getDomain())) {
            sql2.append(" and  t.domain = :domain ");
        }
        if(isNotEmpty(query.getSpecsCount())) {
            sql2.append(" and  t.specsCount = :specsCount ");
        }
        if(isNotEmpty(query.getSpecsPrice())) {
            sql2.append(" and  t.specsPrice = :specsPrice ");
        }
        if(isNotEmpty(query.getSpecsSort())) {
            sql2.append(" and  t.specsSort = :specsSort ");
        }
        if(isNotEmpty(query.getIsDisplay())) {
            sql2.append(" and  t.isDisplay = :isDisplay ");
        }
        if(isNotEmpty(query.getIsDefault())) {
            sql2.append(" and  t.isDefault = :isDefault ");
        }
        if(isNotEmpty(query.getCreateAccount())) {
            sql2.append(" and  t.createAccount = :createAccount ");
        }
        if(isNotEmpty(query.getCreateTimeBegin())) {
            sql2.append(" and  t.createTime >= :createTimeBegin ");
        }
        if(isNotEmpty(query.getCreateTimeEnd())) {
            sql2.append(" and  t.createTime <= :createTimeEnd ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
