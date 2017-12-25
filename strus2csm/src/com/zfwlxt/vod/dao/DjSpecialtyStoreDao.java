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
 * @since 1.0,2017/12/25 09:47:42
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class DjSpecialtyStoreDao extends BaseHibernateDao<DjSpecialtyStore,java.lang.Long>{

	public Class getEntityClass() {
		return DjSpecialtyStore.class;
	}
	
	public Page findPage(DjSpecialtyStoreQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from DjSpecialtyStore t where 1=1 "
			  	+ "/~ and t.courseId = {courseId} ~/"
			  	+ "/~ and t.speId = {speId} ~/"
			  	+ "/~ and t.groupId = {groupId} ~/"
			  	+ "/~ and t.courseOrder = {courseOrder} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from DjSpecialtyStore t where 1=1 ");
        if(isNotEmpty(query.getStoreId())) {
            sql2.append(" and  t.storeId = :storeId ");
        }
        if(isNotEmpty(query.getCourseId())) {
            sql2.append(" and  t.courseId = :courseId ");
        }
        if(isNotEmpty(query.getSpeId())) {
            sql2.append(" and  t.speId = :speId ");
        }
        if(isNotEmpty(query.getGroupId())) {
            sql2.append(" and  t.groupId = :groupId ");
        }
        if(isNotEmpty(query.getCourseOrder())) {
            sql2.append(" and  t.courseOrder = :courseOrder ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
