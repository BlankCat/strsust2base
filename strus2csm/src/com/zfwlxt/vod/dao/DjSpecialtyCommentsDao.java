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
 * @since 1.0,2017/12/25 09:47:40
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class DjSpecialtyCommentsDao extends BaseHibernateDao<DjSpecialtyComments,java.lang.Long>{

	public Class getEntityClass() {
		return DjSpecialtyComments.class;
	}
	
	public Page findPage(DjSpecialtyCommentsQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from DjSpecialtyComments t where 1=1 "
			  	+ "/~ and t.type = {type} ~/"
			  	+ "/~ and t.specsId = {specsId} ~/"
			  	+ "/~ and t.ownAccount = {ownAccount} ~/"
			  	+ "/~ and t.replyId = {replyId} ~/"
			  	+ "/~ and t.commentTitle = {commentTitle} ~/"
			  	+ "/~ and t.commentContent = {commentContent} ~/"
				+ "/~ and t.commentTime >= {commentTimeBegin} ~/"
				+ "/~ and t.commentTime <= {commentTimeEnd} ~/"
			  	+ "/~ and t.commentIp = {commentIp} ~/"
			  	+ "/~ and t.checkState = {checkState} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from DjSpecialtyComments t where 1=1 ");
        if(isNotEmpty(query.getCommentId())) {
            sql2.append(" and  t.commentId = :commentId ");
        }
        if(isNotEmpty(query.getType())) {
            sql2.append(" and  t.type = :type ");
        }
        if(isNotEmpty(query.getSpecsId())) {
            sql2.append(" and  t.specsId = :specsId ");
        }
        if(isNotEmpty(query.getOwnAccount())) {
            sql2.append(" and  t.ownAccount = :ownAccount ");
        }
        if(isNotEmpty(query.getReplyId())) {
            sql2.append(" and  t.replyId = :replyId ");
        }
        if(isNotEmpty(query.getCommentTitle())) {
            sql2.append(" and  t.commentTitle = :commentTitle ");
        }
        if(isNotEmpty(query.getCommentContent())) {
            sql2.append(" and  t.commentContent = :commentContent ");
        }
        if(isNotEmpty(query.getCommentTimeBegin())) {
            sql2.append(" and  t.commentTime >= :commentTimeBegin ");
        }
        if(isNotEmpty(query.getCommentTimeEnd())) {
            sql2.append(" and  t.commentTime <= :commentTimeEnd ");
        }
        if(isNotEmpty(query.getCommentIp())) {
            sql2.append(" and  t.commentIp = :commentIp ");
        }
        if(isNotEmpty(query.getCheckState())) {
            sql2.append(" and  t.checkState = :checkState ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
