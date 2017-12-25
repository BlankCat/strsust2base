<%@page import="com.zfwlxt.vod.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
	<s:hidden id="id" name="id" />
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_NAME_PREFIX}" key="speNamePrefix" value="%{speNamePrefix}" cssClass="" required="false" style="width:99%"/>
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_NAME}" key="speName" value="%{speName}" cssClass="" required="false"  style="width:99%"/>
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_NAME_SUFFIX}" key="speNameSuffix" value="%{speNameSuffix}" cssClass="" required="false" style="width:99%"/>
	
	
	<s:textarea label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_SYNOPSIS_INFO}" key="speSynopsisInfo" value="%{speSynopsisInfo}" cssClass="" required="false" style="width:99%" rows="5"/>
	<tr><td colspan="11">
已上传专业图片缩略图
	</td></tr>
	<tr><td colspan="11">
	<s:if test="speImg!=null"><img src="${ctx}${speImg}" width="200" height="100"/></s:if>
	</td></tr>
	<tr><td colspan="11">
上传专业图片
	</td></tr>
	<tr><td colspan="11">
<div id="drop-target" style="width:80%;height:100px;min-height:10px;min-width:20px;background:#eee;cursor:pointer;">拖动图片文件到这里...</div> 
	</td></tr>
	<tr><td colspan="11">
<div><h4>上传专业图片缩略图：</h4></div> 
	</td></tr>
	<tr><td colspan="11">
<div id="preview" style="background:#f4f4f4;width:80%;height:200px;min-height:100px;min-width:200px;"> 
<canvas id="myCanvas"></canvas> 
</div> 
	</td></tr>
	
	<div >
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_LESSON}" key="speLesson" value="%{speLesson}" cssClass="validate-number " required="false" />
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_PRICE}(元)" key="spePrice" value="%{spePrice}" cssClass="validate-number " required="false" />
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_PLAN_LENGTH}(天)" key="spePlanLength" value="%{spePlanLength}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	<div>
<tr>
	<td class="tdLabel" align="right"><%=DjSpecialty.ALIAS_SPE_SYNOPSIS %></td>
	<td>
		<span id="lblLaw"> 
			<script type="text/plain" id="content" name="content" style="width:99%;">
				${speSynopsis }
		  	</script>
			<script type="text/javascript">
				setTimeout(content,200);	
				var ue;				
				function content(){
				   ue = new UE.ui.Editor( {
				
				   } );
				   ue.render( 'content' );
				}
		   </script>
		   
		 </span>
	 </td>
</tr>
	
	
<!-- 	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_CONTENT}" key="speContent" value="%{speContent}" cssClass="" required="false" /> -->
	
<!-- 	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_IMG}" key="speImg" value="%{speImg}" cssClass="" required="false" /> -->
	

<!-- 	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_IMG_WIDTH}" key="speImgWidth" value="%{speImgWidth}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
	
	
<!-- 	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_IMG_HEIGHT}" key="speImgHeight" value="%{speImgHeight}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
	
	
	<s:select label="所属类型"  name="speType" list="#{'-1':'--选择所属类型--'}"   >
	<s:optgroup list="zyspecialtyType" listKey="id" listValue="name" label="专业教室"></s:optgroup>
	<s:optgroup list="zjspecialtyType" listKey="id" listValue="name" label="专家教室"></s:optgroup>
	</s:select>
	
	
	<s:textfield label="星级" key="speStar" value="%{speStar}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
<!-- 	<s:textfield label="浏览数" key="speBrowseCount" value="%{speBrowseCount}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
<!-- 	<s:textfield label="收藏数" key="speCollectionCount" value="%{speCollectionCount}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
<!-- 	<s:textfield label="报名数" key="speSignupCount" value="%{speSignupCount}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
	
	
<!-- 	<s:textfield label="状态"  key="speStatus" value="%{speStatus}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
	
<!-- 	<s:textfield label="排序" key="speOrder" value="%{speOrder}" cssClass="validate-integer max-value-2147483647" required="false" /> -->
	
	<tr>	
		<td class="tdLabel">
			<%=DjSpecialty.ALIAS_SPE_ADDTIME%>:
		</td>	
		<td>
		<input value="${speAddtime}" onclick="WdatePicker({dateFmt:'<%=DjSpecialty.FORMAT_SPE_ADDTIME%>'})" id="speAddtime" name="speAddtime"  maxlength="0" class="" />
		</td>
	</tr>
	<s:checkboxlist list="teachers"  value="teList" name="speTeachersId"  label="教师列表"></s:checkboxlist>
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_PRE_TITLE}" key="spePreTitle" value="%{spePreTitle}" cssClass="" required="false" style="width:99%"/>
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_PRE_CONTENT}" key="spePreContent" value="%{spePreContent}" cssClass="" required="false" style="width:99%"/>
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_CONTENTS}" key="speContents" value="%{speContents}" cssClass="" required="false" style="width:99%"/>
	
	
	<s:textfield label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_POSC_TITLE}" key="spePoscTitle" value="%{spePoscTitle}" cssClass="" required="false" style="width:99%"/>
	
	
	<s:textarea label="%{@com.zfwlxt.vod.model.DjSpecialty@ALIAS_SPE_POSC_CONTENT}" key="spePoscContent" value="%{spePoscContent}" cssClass="" required="false" style="width:99%" rows="4"/>
	
