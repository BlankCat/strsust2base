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
 * @since 1.0,2017/12/25 09:47:41
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class DjSpecialtyLoveDao extends BaseHibernateDao<DjSpecialtyLove,java.lang.Long>{

	public Class getEntityClass() {
		return DjSpecialtyLove.class;
	}
	
	public Page findPage(DjSpecialtyLoveQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from DjSpecialtyLove t where 1=1 "
			  	+ "/~ and t.state = {state} ~/"
			  	+ "/~ and t.specsType = {specsType} ~/"
			  	+ "/~ and t.ownAccout = {ownAccout} ~/"
			  	+ "/~ and t.specsId = {specsId} ~/"
				+ "/~ and t.createTime >= {createTimeBegin} ~/"
				+ "/~ and t.createTime <= {createTimeEnd} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from DjSpecialtyLove t where 1=1 ");
        if(isNotEmpty(query.getId())) {
            sql2.append(" and  t.id = :id ");
        }
        if(isNotEmpty(query.getState())) {
            sql2.append(" and  t.state = :state ");
        }
        if(isNotEmpty(query.getSpecsType())) {
            sql2.append(" and  t.specsType = :specsType ");
        }
        if(isNotEmpty(query.getOwnAccout())) {
            sql2.append(" and  t.ownAccout = :ownAccout ");
        }
        if(isNotEmpty(query.getSpecsId())) {
            sql2.append(" and  t.specsId = :specsId ");
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
