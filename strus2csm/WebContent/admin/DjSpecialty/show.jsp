<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>DjSpecialty信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/admin/DjSpecialty/list.do" method="get" theme="simple">
	<table class="formTable">
		<caption>查看专业</caption>
		<tr>
			<td colspan="2" style="text-align: left;">
				<input type="button" value="返回列表" onclick="window.location='${ctx}/admin/DjSpecialty/list.do'"/>
				<input type="button" value="后退" onclick="history.back();"/>
			</td>
		</tr>
		<s:hidden name="id" id="id" value="%{model.id}"/>
			<tr>	
				<td class="tdLabel">名称前缀</td>	
				<td><s:property value="%{model.speNamePrefix}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">名称</td>	
				<td><s:property value="%{model.speName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">名称后缀</td>	
				<td><s:property value="%{model.speNameSuffix}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">课时</td>	
				<td><s:property value="%{model.speLesson}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">价格</td>	
				<td><s:property value="%{model.spePrice}" /></td>
			</tr>
	<%-- 		<tr>	
				<td class="tdLabel">简介</td>	
				<td><s:property value="%{model.speSynopsis}" /></td>
			</tr> --%>
			<tr> 
			    <td class="tdLabel">专业简介:</td> 
			    <td>    	
				<FCK:editor id="speSynopsis" basePath="${ctx}/widgets/FCKeditor/" toolbarSet="Basic" width="600" height="300" >  
			          <s:property value="%{model.speSynopsis}" escape="false"/> 
				</FCK:editor>
			    </td> 
			</tr>
			<%-- <tr>	
				<td class="tdLabel">内容</td>	
				<td><s:property value="%{model.speContent}" /></td>
			</tr> --%>
			<tr> 
		    <td class="tdLabel">专业内容:</td> 
		    <td>    	
			<FCK:editor id="speContent" basePath="${ctx}/widgets/FCKeditor/" toolbarSet="Basic" width="600" height="300" >  
		          <s:property value="%{model.speContent}" escape="false"/> 
			</FCK:editor>
		    </td> 
			</tr>
			<tr>	
				<td class="tdLabel">专业图片</td>	
				<td><s:property value="%{model.speImg}" /></td>
			</tr>
			<%-- <tr>	
				<td class="tdLabel">状态：前台是否需要展示，默认0不需要1展示</td>	
				<td><s:property value="%{model.speStatus}" /></td>
			</tr> --%>
			<tr>	
				<td class="tdLabel">排序</td>	
				<td><s:property value="%{model.speOrder}" /></td>
			</tr>
			
		<%-- 	<tr>	
				<td class="tdLabel">添加时间</td>	
				<td><s:property value="%{model.speAddtimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">序言标题</td>	
				<td><s:property value="%{model.spePreTitle}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">序言内容</td>	
				<td><s:property value="%{model.spePreContent}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">课程目录</td>	
				<td><s:property value="%{model.speContents}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">后记标题</td>	
				<td><s:property value="%{model.spePoscTitle}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">后记内容</td>	
				<td><s:property value="%{model.spePoscContent}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">浏览数</td>	
				<td><s:property value="%{model.speBrowseCount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">收藏数</td>	
				<td><s:property value="%{model.speCollectionCount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">管理人</td>	
				<td><s:property value="%{model.speCreateName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业名称首字母拼音缩写</td>	
				<td><s:property value="%{model.speFirstSpell}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">名称拼音</td>	
				<td><s:property value="%{model.speFullSpell}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">历史开班id</td>	
				<td><s:property value="%{model.speHistoryClassSchoolId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">历史开班情况描述详情</td>	
				<td><s:property value="%{model.speHistoryClassSchoolInfo}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">图片高度</td>	
				<td><s:property value="%{model.speImgHeight}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">图片宽</td>	
				<td><s:property value="%{model.speImgWidth}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">计划时长或学期(天)学期，总时间（分钟）</td>	
				<td><s:property value="%{model.spePlanLength}" /></td>
			</tr> --%>
			
			<tr>	
				<td class="tdLabel">学过人数/报名数</td>	
				<td><s:property value="%{model.speSignupCount}" /></td>
			</tr>
			<%-- <tr>	
				<td class="tdLabel">星级</td>	
				<td><s:property value="%{model.speStar}" /></td>
			</tr> --%>
		<%-- 	<tr>	
				<td class="tdLabel">摘要</td>	
				<td><s:property value="%{model.speSynopsisInfo}" /></td>
			</tr> --%>
			<tr> 
		    <td class="tdLabel">专业摘要:</td> 
		    <td>    	
			<FCK:editor id="speSynopsisInfo" basePath="${ctx}/widgets/FCKeditor/" toolbarSet="Basic" width="600" height="300" >  
		          <s:property value="%{model.speSynopsisInfo}" escape="false"/> 
			</FCK:editor>
		    </td> 
			</tr>
			<tr>	
				<td class="tdLabel">师资id集合信息，多个id有逗号，隔开</td>	
				<td><s:property value="%{model.speTeachersId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">师资队伍信息描述</td>	
				<td><s:property value="%{model.speTeachersInfo}" /></td>
			</tr>
			<%-- <tr>	
				<td class="tdLabel">专业所属类型id</td>	
				<td><s:property value="%{model.speType}" /></td>
			</tr> --%>
			
			
		<%-- 	<tr>	
				<td class="tdLabel">所属类型专业所属类型名称</td>	
				<td><s:property value="%{model.speTypeInfo}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">专业课分类id，关联dj_specialty_cat的主键</td>	
				<td><s:property value="%{model.speCatId}" /></td>
			</tr> --%>
			<tr>
			 <td class="tdLabel">专业课分类</td>	
			<td align="left" >
				<c:if test="${model.speCatId == 1}"> 刑事辩护 </c:if>
				<c:if test="${model.speCatId == 2}"> 政府顾问 </c:if>
				<c:if test="${model.speCatId == 3}"> 轨道交通 </c:if>
				<c:if test="${model.speCatId == 4}"> 房屋地产 </c:if>
				<c:if test="${model.speCatId == 5}"> 知识产权 </c:if>
				<c:if test="${model.speCatId == 6}"> 证券律师 </c:if>
				<c:if test="${model.speCatId == 7}"> 劳动社保 </c:if>
				<c:if test="${model.speCatId == 8}"> 私募股权 </c:if>
				<c:if test="${model.speCatId == 9}"> 并购重组 </c:if>
				<c:if test="${model.speCatId == 10}"> 企业风险 </c:if>
				<c:if test="${model.speCatId == 11}"> 婚姻家事 </c:if>
				<c:if test="${model.speCatId == 12}"> 金融律师 </c:if>
				<c:if test="${model.speCatId == 13}"> 律所管理 </c:if>
				<c:if test="${model.speCatId == 14}"> 职业道德 </c:if>
				<c:if test="${model.speCatId == 15}"> 民法总则 </c:if>
					&nbsp;
				</td>
				</tr>
			
		<%-- 	<s:select label="所属行业"  list="#{'0':'律师学院','1':'司法鉴定','2':'金融学院','3':'公证学院','4':'企业学院','5':'高等院校','6':'司法考试','7':'事业社团','8':'政府法务','9':'公检法纪','10':'居民法务','11':'村民法务','12':'申请执业','13':'仲裁学院','14':'基层法工','15':'青少年'}" key="speDomain" value="%{model.speDomain}" name="speDomain" id = "speDomain"  ></s:select>
			 --%>
			 <tr>
			 <td class="tdLabel">所属行业</td>	
			<td align="left" >
					<c:if test="${model.speDomain == 0}">律师学院</c:if>
					<c:if test="${model.speDomain == 1}">司法鉴定</c:if>
					<c:if test="${model.speDomain == 2}">金融学院</c:if>
					<c:if test="${model.speDomain == 3}">公证学院</c:if>
					<c:if test="${model.speDomain == 4}">企业学院</c:if>
					<c:if test="${model.speDomain == 5}">高等院校</c:if>
					<c:if test="${model.speDomain == 6}">司法考试</c:if>
					<c:if test="${model.speDomain == 7}">事业社团</c:if>
					<c:if test="${model.speDomain == 8}">政府法务</c:if>
					<c:if test="${model.speDomain == 9}">公检法纪</c:if>
					<c:if test="${model.speDomain == 10}">居民法务</c:if>
					<c:if test="${model.speDomain == 11}">村民法务</c:if>
					<c:if test="${model.speDomain == 12}">申请执业</c:if>
					<c:if test="${model.speDomain == 13}">仲裁学院</c:if>
					<c:if test="${model.speDomain == 14}">基层法工</c:if>
					<c:if test="${model.speDomain == 15}">青少年</c:if>
					&nbsp;
				</td>
				</tr>
<%-- 			<tr>	
				<td class="tdLabel">0律师学院,1司法鉴定,2金融学院,3公证学院,4企业学院,5高等院校,6司法考试,7事业社团,8政府法务,9公检法纪,10居民法务,11村民法务</td>	
				<td><s:property value="%{model.speDomain}" /></td>
			</tr> --%>
			<tr>	
				<td class="tdLabel">评论次数</td>	
				<td><s:property value="%{model.speCommentsNum}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">点赞数</td>	
				<td><s:property value="%{model.speLoveNum}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">推荐专业课顺序</td>	
				<td><s:property value="%{model.speTjOrder}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel">前台显示状态 </td>	
				<td>
					<c:if test="${model.speDisplay == 0}">隐藏</c:if>
					<c:if test="${model.speDisplay == 1}">显示</c:if>
				<%-- <s:property value="%{model.speDisplay}" /></td> --%>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>