<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ taglib prefix="FCK" uri="/FCKeditor.tld" %>
<link href="<c:url value="/styles/css/jyz.css"/>" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/styles/widget/jQuery/jquery-1.9.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/styles/js/ajaxfileupload.js"/>"></script>
<script type="text/javascript" src="<c:url value='/styles/widget/bootstrap/addyosmani-jquery-ui-bootstrap-v0.5pre-1-g57bfc05/addyosmani-jquery-ui-bootstrap-57bfc05/js/jquery-ui-1.9.2.custom.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/styles/widget/bootstrap/addyosmani-jquery-ui-bootstrap-v0.5pre-1-g57bfc05/addyosmani-jquery-ui-bootstrap-57bfc05/css/custom-theme/jquery.ui.1.10.0.ie.css'/>" type="text/css" />
<link rel="stylesheet" href="<c:url value='/styles/widget/bootstrap/addyosmani-jquery-ui-bootstrap-v0.5pre-1-g57bfc05/addyosmani-jquery-ui-bootstrap-57bfc05/css/custom-theme/jquery-ui-1.10.0.custom.css'/>" type="text/css" />
<style>
		.ui-corner-all{width:28em;}
		
		.ui-autocomplete {
		  max-height: 100px;
		  overflow-y: auto;
		  /* prevent horizontal scrollbar */
		  overflow-x: hidden;
		}
		/* IE 6 doesn't support max-height
		 * we use height instead, but this forces the menu to always be this tall
		 */
		* html .ui-autocomplete {
		  height: 100px;
		}
</style>
<style>
	body{padding:10px 20px 200px;}
	h1{color:#85B6E2;text-align:center;padding-top:20px;}
	input.validation-failed, textarea.validation-failed {
		border: 3px solid #FF0000;
	}
	.blk{width:500px;position:relative;}
	.blk .head, .blk .head-right, .blk .foot, .blk .foot-right{background:url(${ctx}/styles/images/pop_up_bg.png);overflow:hidden;height:4px;}
	.blk .head{padding-left:4px;}
	.blk .head-right{background-position:right top;}
	.blk .foot{padding-left:4px;background-position:left bottom;_height:3px;}
	.blk .foot-right{background-position:right bottom;}
	.blk .main{border-left:2px solid #85B6E2;border-right:2px solid #85B6E2;position:relative;background:#fff;}
	.blk .main h2{font:bold 16px "Microsoft YaHei";padding:10px 20px 2px;color:#85B6E2;}
	.blk .main ul{padding:20px;zoom:1;overflow:hidden;font-size:12px;}
	.blk .main ul li{float:left;width:100px;text-align:center;line-height:30px;margin-bottom:10px;}
	.blk .main ul li a{color:#333;display:block;}
	.blk .main ul li a:hover{background:#85B6E2;color:#fff;font-weight:bold;font-size:14px;}
	body, ul, li, div, h1, h2{padding:0;margin:0;}
	ul{list-style:none;}
	a{text-decoration:none;}
	.close{float:right;margin-right:20px}
	.tj{float:center;margin-left:200px}
	.authority{width: 25%;float:left;}
	.clearFloat{clear: both;}
</style>
<script type="text/javascript">
			
</script>
	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="专业名称前缀" key="speNamePrefix" value="%{model.speNamePrefix}" cssClass="" required="false" />
	
	
	<s:textfield label="专业名称" key="speName" value="%{model.speName}" cssClass="" required="false" />
	
	
	<s:textfield label="专业名称后缀" key="speNameSuffix" value="%{model.speNameSuffix}" cssClass="" required="false" />
	
	
	<s:textfield label="专业总课时" key="speLesson" value="%{model.speLesson}" cssClass="validate-number " required="false" />
	
	
	<s:textfield label="专业总价格" key="spePrice" value="%{model.spePrice}" cssClass="validate-number " required="false" />
	
	
	<tr> 
    <td class="tdLabel">专业简介:</td> 
    <td>    	
	 <FCK:editor id="speSynopsis" basePath="${ctx}/widgets/FCKeditor/" toolbarSet="Basic" width="600" height="300" >  
          <s:property value="%{model.speSynopsis}" escape="false"/> 
	</FCK:editor> 
    </td> 
	</tr>
	
	<tr> 
    <td class="tdLabel">专业内容:</td> 
    <td>    	
	 <FCK:editor id="speContent" basePath="${ctx}/widgets/FCKeditor/" toolbarSet="Basic" width="600" height="300" >  
          <s:property value="%{model.speContent}" escape="false"/> 
	</FCK:editor> 
    </td> 
	</tr>
	
	<%-- <tr> 
    <td class="tdLabel"><label for="teacherName" class="label" >专业图片<span class="required">*</span>:</label></td> 
    <td>
    <c:if test="${model.speImg!=null}">
    	<input type="hidden" name="olderImg" value="${model.speImg }"/>
    	<img id="img" src=" <c:url value='${img}'/> " />
    </c:if>
    	<input type="file" id="uploadImage" name="file" onchange="ajaxFileUpload();"/>
    	<input type="hidden" id="speImg" name="speImg" />
    	<img id="img" src=" <c:url value='${img}'/>" style="display:none;"/>
    </td> 
	</tr>
	 --%>
	<%-- <tr>
	<td class="tdLabel" nowrap>
	专业图片路径:
	</td>
	<td>
	<s:textfield label="专业图片路径" key="speImg" value="%{model.speImg}" theme="simple" size="50"  required="false" id="speImg" cssClass="validate-file-jpeg-bmp-jpg-gif-png" />
	<input type="button" value=" 上传 "  class="stdButton"  onclick="openWindow(event,'wxImageFj')" target="_blank"/>
	</td>
	</tr> --%>
	
	<s:textfield label="专业图片" key="speImg" value="%{model.speImg}" cssClass="" required="false" size="70"/>
	
	
<%-- 	<s:textfield label="前台展示状态【0:隐藏/1:展示】" key="speStatus" value="%{model.speStatus}" cssClass="validate-integer max-value-2147483647" required="false" />
	 --%>
	
	<s:textfield label="专业排序" key="speOrder" value="%{model.speOrder}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			录制时间:
		</td>	
		<td>
		<input value="${model.speAddtimeString}" 
		onclick="WdatePicker({dateFmt:'<%=DjSpecialty.FORMAT_SPE_ADDTIME%>'})" 
		id="speAddtimeString" name="speAddtimeString"  maxlength="0" class="" />
		</td>
	</tr> 
	
	
	<%-- <s:textfield label="序言标题" key="spePreTitle" value="%{model.spePreTitle}" cssClass="" required="false" />
	
	
	<s:textfield label="序言内容" key="spePreContent" value="%{model.spePreContent}" cssClass="" required="false" />
	
	
	<s:textfield label="课程目录" key="speContents" value="%{model.speContents}" cssClass="" required="false" />
	
	
	<s:textfield label="后记标题" key="spePoscTitle" value="%{model.spePoscTitle}" cssClass="" required="false" />
	
	
	<s:textfield label="后记内容" key="spePoscContent" value="%{model.spePoscContent}" cssClass="" required="false" />
	
	
	<s:textfield label="浏览数" key="speBrowseCount" value="%{model.speBrowseCount}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="收藏数" key="speCollectionCount" value="%{model.speCollectionCount}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="管理人" key="speCreateName" value="%{model.speCreateName}" cssClass="" required="false" />
	
	
	<s:textfield label="专业名称首字母拼音缩写" key="speFirstSpell" value="%{model.speFirstSpell}" cssClass="" required="false" />
	
	
	<s:textfield label="名称拼音" key="speFullSpell" value="%{model.speFullSpell}" cssClass="" required="false" />
	
	
	<s:textfield label="历史开班id" key="speHistoryClassSchoolId" value="%{model.speHistoryClassSchoolId}" cssClass="" required="false" />
	
	
	<s:textfield label="历史开班情况描述详情" key="speHistoryClassSchoolInfo" value="%{model.speHistoryClassSchoolInfo}" cssClass="" required="false" />
	
	
	<s:textfield label="图片高度" key="speImgHeight" value="%{model.speImgHeight}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="图片宽" key="speImgWidth" value="%{model.speImgWidth}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="计划时长或学期(天)学期，总时间（分钟）" key="spePlanLength" value="%{model.spePlanLength}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	 --%>
	
	<s:textfield label="学过人数/报名数" key="speSignupCount" value="%{model.speSignupCount}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
<%-- 	<s:textfield label="星级" key="speStar" value="%{model.speStar}" cssClass="validate-integer max-value-2147483647" required="false" />
	 --%>
	
	<tr> 
    <td class="tdLabel">专业摘要:</td> 
    <td>    	
		<FCK:editor id="speSynopsisInfo" basePath="${ctx}/widgets/FCKeditor/" toolbarSet="Basic" width="600" height="300" >  
          <s:property value="%{model.speSynopsisInfo}" escape="false"/> 
		</FCK:editor> 
    </td> 
	</tr>
	
	<tr>
		<td class="tdLabel">
			师资id集合信息【多个id有逗号,隔开,注：（逗号,英文半角逗号）】:
		</td>
		<td>
			<textarea id="speTeachersId" name="speTeachersId" cols="40" rows="3">${model.speTeachersId}</textarea>用  "," 分开   例: 9,10
		</td>
	</tr>
	<tr>
		<td class="tdLabel">
			师资队伍信息【老师名称集合，格式： |老师姓名1|老师姓名2| 】:
		</td>
		<td>
			<textarea id="speTeachersInfo" name="speTeachersInfo" cols="40" rows="3">${model.speTeachersInfo}</textarea>注意老师姓名和老师id一一对应，用  "|" 分开   例: |张三|李四|
		</td>
	</tr>
	
	<%-- 
	<s:textfield label="专业所属类型id" key="speType" value="%{model.speType}" cssClass="validate-integer " required="false" />
	 --%>
	<%-- 
	<s:textfield label="所属类型专业所属类型名称" key="speTypeInfo" value="%{model.speTypeInfo}" cssClass="" required="false" />
	 --%>
<%-- 	<s:textfield label="专业课分类id" key="speCatId" value="%{model.speCatId}" cssClass="validate-integer " required="false" />
	 --%>
	
	<c:if test="${model.id!=null}">
		<s:select label="专业课分类"  list="#{'1':'刑事辩护', '2':'政府顾问', '3':'轨道交通', '4':'房屋地产', '5':'知识产权', '6':'证券律师', '7':'劳动社保', '8':'私募股权', '9':'并购重组', '10':'企业风险', '11':'婚姻家事', '12':'金融律师', '13':'律所管理', '14':'职业道德', '15':'民法总则'}" key="speCatId" value="%{model.speCatId}" name="speCatId" id = "speCatId"  ></s:select>
	</c:if> 
	
	<c:if test="${model.id!=null}">
		<s:select label="所属行业"  list="#{'0':'律师学院','1':'司法鉴定','2':'金融学院','3':'公证学院','4':'企业学院','5':'高等院校','6':'司法考试','7':'事业社团','8':'政府法务','9':'公检法纪','10':'居民法务','11':'村民法务','12':'申请执业','13':'仲裁学院','14':'基层法工','15':'青少年'}" key="speDomain" value="%{model.speDomain}" name="speDomain" id = "speDomain"  ></s:select>
	</c:if> 
	
	<s:textfield label="评论数" key="speCommentsNum" value="%{model.speCommentsNum}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="点赞数" key="speLoveNum" value="%{model.speLoveNum}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="推荐专业课 >0表示推荐该专业课" key="speTjOrder" value="%{model.speTjOrder}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
<%-- 	<s:textfield label="状态  0：隐藏  1：展示" key="speDisplay" value="%{model.speDisplay}" cssClass="validate-integer max-value-2147483647" required="false" />
	 --%>
	<s:radio label="显示状态" 
		list="#{0:'隐藏  ',1:'展示'}"
		key="speDisplay" value="%{model.speDisplay}" required="true">
	</s:radio>
