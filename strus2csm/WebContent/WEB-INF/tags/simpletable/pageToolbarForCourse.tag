<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" required="true" type="cn.org.rapid_framework.page.Page" description="Page.java" %>
<%@ attribute name="pageSizeSelectList" type="java.lang.Number[]" required="false"  %>
<%@ attribute name="isShowPageSizeList" type="java.lang.Boolean" required="false"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// set default values
	Integer[] defaultPageSizes = new Integer[]{10,50,100};
	if(jspContext.getAttribute("pageSizeSelectList") == null) {
		jspContext.setAttribute("pageSizeSelectList",defaultPageSizes); 
	}
	
	/*
	if(jspContext.getAttribute("isShowPageSizeList") == null) {
		jspContext.setAttribute("isShowPageSizeList",true); 
	} 
	*/
	jspContext.setAttribute("isShowPageSizeList", false); 
%>

<style>
.page{clear:both;display:block;width:100%;height:20px;margin:10px auto;text-align:center}.page span{width:20px;height:18px;overflow:hidden;text-align:center;line-height:16px;display:inline-block;vertical-align:top}.page a{width:18px;height:16px;line-height:16px;border:1px solid #57a0f1;background:#fff;color:#333;text-decoration:none;display: inline-block;text-align:center;vertical-align:top;cursor:pointer}.page a:hover,.page span{color:#fff;background:#5ba0e7;border-color:#0c3cbc;cursor:pointer}.page span{background:#4084ca}.page span.one,.page span.end,.page span.oone,.page span.eend{width:58px;height:18px;background:url(<c:url value="/styles/images/user_bg.png"></c:url>) -770px -184px no-repeat;color:#9a9a9a;text-align:left;text-indent:14px;line-height:18px;}.page span.oone,.page span.eend{width:34px;background-position:-736px -184px;text-align:center;text-indent:0}.page span.end{background-position:-828px -184px;text-indent:8px}.page a.one,.page a.end,.page a.oone,.page a.eend {background:url(<c:url value="/styles/images/user_bg.png"></c:url>) -770px -166px no-repeat;height:18px;color:#333;text-decoration:none;border:0;width:58px;text-align:left;line-height:18px;text-indent:14px}.page a.oone,.page a.eend{width:34px;background-position:-736px -166px;text-align:center;text-indent:0}.page a.end{background-position:-828px -166px;text-indent:8px}.page select{width:48px;vertical-align:top;padding: 0;margin: 0;height:18px}</style>

			
			<div class="page">
				<c:choose>
				<c:when test="${page.hasPreviousPage}"><a href="javascript:void(0)" page="${page.previousPageNumber}" class="one">上一页</a></c:when>
				<c:otherwise><span class="one">上一页</span></c:otherwise>
				</c:choose>
				
				<c:forEach var="item" items="${page.linkPageNumbers}">
				<c:choose>
				<c:when test="${item == page.thisPageNumber}"><span>${item}</span></c:when>
				<c:otherwise><a href="javascript:void(0)" page='${item}' class="num">${item}</a></c:otherwise>
				</c:choose>
				</c:forEach>
				
				<c:choose>
				<c:when test="${page.hasNextPage}"><a href="javascript:void(0)" page='${page.nextPageNumber}' class="end">下一页</a></c:when>
				<c:otherwise><span class="end">下一页</span></c:otherwise>
				</c:choose>
				
  			    <c:choose>
				<c:when test="${page.firstPage}"><span class="oone">首页</span></c:when>
				<c:otherwise><a href="javascript:void(0)" page='1' class="oone">首页</a></c:otherwise>
				</c:choose>

			<c:choose>
				<c:when test="${page.lastPage}"><span class="eend">尾页</span></c:when>
				<c:otherwise><a href="javascript:void(0)" page='${page.lastPageNumber}' class="eend">尾页</a></c:otherwise>
			</c:choose>


			<c:if test="${isShowPageSizeList}">
				<select onChange="simpleTable.togglePageSize(this.value)">
					<c:forEach var="item" items="${pageSizeSelectList}">
						<option value="${item}" ${page.pageSize == item ? 'selected' : '' }>${item}</option>
					</c:forEach> 
				</select>
			</c:if>
			</ul>
			</div>