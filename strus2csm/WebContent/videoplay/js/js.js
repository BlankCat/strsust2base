
    
<!--
// Internet Explorer 的挂钩
if (navigator.appName && navigator.appName.indexOf("Microsoft") != -1 && navigator.userAgent.indexOf("Windows") != -1 && navigator.userAgent.indexOf("Windows 3.1") == -1) {
	document.write('<script language=\"VBScript\"\>\n');
	document.write('On Error Resume Next\n');
	document.write('Sub load_FSCommand(ByVal command, ByVal args)\n');
	document.write('	Call load_DoFSCommand(command, args)\n');
	document.write('End Sub\n');
	document.write('</script\>\n');
}
//-->


<!--
// FS SCORM - 用于 ADL SCORM 1.2 和 Flash MX 2004 Learning 交互操作的 fscommand 适配器
// 版本 1.0    08/19/03
// 由 Macromedia 的 Andrew Chemey 修改
// 基于 FS SCORM 适配器 1.2.4 版：
// 		片段 Copyright 2002 Pathlore Software Corporation 保留所有权利
// 		片段 Copyright 2002 Macromedia Inc. 保留所有权利。
// 		片段 Copyright 2003 Click2learn, Inc. 保留所有权利。
// 		由 Macromedia 的 Tom King 开发
// 		             由Pathlore  的 Leonard Greenberg 
// 		             和 由 Click2learn, Inc. 的 Claude Ostyn, Click2learn
// 		包括由 Macromedia 的 Jeff Burton 和 Andrew Chemey 开发的代码 (01/09/02)
// -----------------------------------------------------------------
// 更改这些预设的值，以符合您的兴趣和需要。
var g_bShowApiErrors = false; 	// 更改为“true”以显示错误信息
var g_bInitializeOnLoad = true; // 更改为“false”，在加载 HTML 页时不初始化 LMS
// 如果 g_bShowApiErrors 是“true”，则转换这些字符串
// 并且您需要对该应用程序进行本地化
var g_strAPINotFound = "Management system interface not found.";
var g_strAPITooDeep = "Cannot find API - too deeply nested.";
var g_strAPIInitFailed = "Found API but LMSInitialize failed.";
var g_strAPISetError = "Trying to set value but API not available.";
var g_strFSAPIError = 'LMS API adapter returned error code: "%1"\nWhen FScommand called API.%2\nwith "%3"';
var g_strDisableErrorMsgs = "Select cancel to disable future warnings.";
// 如果要在调用 LMSFinish 时使状态自动设置为完成，
// 那么可将 g_bSetCompletedAutomatically 更改为“true”。
// 通常情况下，如果通过发送 FSCommand 将状态设置为“已完成”、
// “已通过”或“失败”（这两种状态都表示“已完成”）， Flash 影片自己将状态设置为“已完成”，
// 那么此标志将保留为“false”
var g_bSetCompletedAutomatically = true;
// 该值通常是由 LMS 指定的，但在某些情况下却不是，
// 而是用于确定已通过/失败状态的默认值。
// 如果 Flash 动作脚本使用自己的方法确定
// 已通过/失败状态，那么将该值设置为“null”，否则将值设置为从 0 到 1（两者都包括）
// 的值（可以是浮点值，如“0.75”）。
var g_SCO_MasteryScore = null; // 允许的值有：0.0..1.0，或 null
//==================================================================
// 警告！！！
// 除非您很清楚您将要做什么，否则请不要修改
// 此行下面的任何内容！
// 您不能更改这两个值，因为 Flash 模板的
// 预设值以它们为基础。
var g_nSCO_ScoreMin = 0; 		// 必须是数字
var g_nSCO_ScoreMax = 100; 		// 必须大于 nSCO_Score_Min 的数字
// 根据 SCORM 规范，LMS 提供的掌握分数
// （如果有）将覆盖 SCO 解释，无论该分数
// 在通过/未通过状态确定之后是否应该得到解释。
// 模板将尝试获取掌握分数，如果它
// 可用，会相应地将状态设置为已通过或未通过
// （当 SCO 发送分数时）。LMS 无法做出实际的
// 决定，除非 SCO 已终止。
// 此标记的默认值为“true”。如果不想预测 LMS 将如何
// 根据掌握分数设置通过/未通过状态（无论如何 LMS 都将
// 最终获胜），可将此标记设置为“false”。
var g_bInterpretMasteryScore = true;
// 此脚本实现 SCO 多方面的
// 一般逻辑行为。
/////////// API 接口初始化和 CATCHER 函数////////
var g_nFindAPITries = 0;
var g_objAPI = null;
var g_bInitDone = false;
var g_bFinishDone = false;
var	g_bSCOBrowse = false;
var g_dtmInitialized = new Date(); // 将在初始化后进行调整
var g_bMasteryScoreInitialized = false;
function AlertUserOfAPIError(strText) {
	if (g_bShowApiErrors) {
		var s = strText + "\n\n" + g_strDisableErrorMsgs;
		if (!confirm(s)){
			g_bShowApiErrors = false
		}
	}
}
function ExpandString(s){
	var re = new RegExp("%","g")
	for (i = arguments.length-1; i > 0; i--){
		s2 = "%" + i;
		if (s.indexOf(s2) > -1){
			re.compile(s2,"g")
			s = s.replace(re, arguments[i]);
		}
	}
	return s
}
function FindAPI(win) {
	while ((win.API == null) && (win.parent != null) && (win.parent != win)) {
		g_nFindAPITries ++;
		if (g_nFindAPITries > 500) {
			AlertUserOfAPIError(g_strAPITooDeep);
			return null;
		}
		win = win.parent;
	}
	return win.API;
}
function APIOK() {
	return ((typeof(g_objAPI)!= "undefined") && (g_objAPI != null))
}
function SCOInitialize() {
	var err = true;
	if (!g_bInitDone) {
		if ((window.parent) && (window.parent != window)){
			g_objAPI = FindAPI(window.parent)
		}
		if ((g_objAPI == null) && (window.opener != null))	{
			g_objAPI = FindAPI(window.opener)
		}
		if (!APIOK()) {
			AlertUserOfAPIError(g_strAPINotFound);
			err = false
		} else {
			err = g_objAPI.LMSInitialize("");
			if (err == "true") {
				g_bSCOBrowse = (g_objAPI.LMSGetValue("cmi.core.lesson_mode") == "browse");						if (!g_bSCOBrowse) {
					if (g_objAPI.LMSGetValue("cmi.core.lesson_status") == "not attempted") {
						err = g_objAPI.LMSSetValue("cmi.core.lesson_status","incomplete")
					}
				}
			} else {
				AlertUserOfAPIError(g_strAPIInitFailed)
			}
		}
		if (typeof(SCOInitData) != "undefined") {
			// SCOInitData 函数可以在 SCO 的其他脚本中定义
			SCOInitData()
		}
		g_dtmInitialized = new Date();
	}
	g_bInitDone = true;
	return (err + "") // 强制类型为字符串
}
function SCOFinish() {
	if ((APIOK()) && (g_bFinishDone == false)) {
		SCOReportSessionTime()
		if (g_bSetCompletedAutomatically){
			SCOSetStatusCompleted();
		}
		if (typeof(SCOSaveData) != "undefined"){
			// SCOSaveData 函数可以在 SCO 的其他脚本中定义
			SCOSaveData();
		}
		g_bFinishDone = (g_objAPI.LMSFinish("") == "true");
	}
	return (g_bFinishDone + "" ) // 强制类型为字符串
}
// 请调用这些 catcher 函数，而不是尝试直接调用 API 适配器
function SCOGetValue(nam)			{return ((APIOK())?g_objAPI.LMSGetValue(nam.toString()):"")}
function SCOCommit()					{return ((APIOK())?g_objAPI.LMSCommit(""):"false")}
function SCOGetLastError()		{return ((APIOK())?g_objAPI.LMSGetLastError():"-1")}
function SCOGetErrorString(n)	{return ((APIOK())?g_objAPI.LMSGetErrorString(n):"No API")}
function SCOGetDiagnostic(p)	{return ((APIOK())?g_objAPI.LMSGetDiagnostic(p):"No API")}
//用下面更复杂的数据管理逻辑
//实现 LMSSetValue
var g_bMinScoreAcquired = false;
var g_bMaxScoreAcquired = false;
// 特殊逻辑从此处开始
function SCOSetValue(nam,val){
	var err = "";
	if (!APIOK()){
			AlertUserOfAPIError(g_strAPISetError + "\n" + nam + "\n" + val);
			err = "false"
	} else if (nam == "cmi.core.score.raw") err = privReportRawScore(val)
	if (err == ""){
			err = g_objAPI.LMSSetValue(nam,val.toString() + "");
			if (err != "true") return err
	}
	if (nam == "cmi.core.score.min"){
		g_bMinScoreAcquired = true;
		g_nSCO_ScoreMin = val
	}
	else if (nam == "cmi.core.score.max"){
		g_bMaxScoreAcquired = true;
		g_nSCO_ScoreMax = val
	}
	return err
}
function privReportRawScore(nRaw) { // 只由 SCOSetValue 调用
	if (isNaN(nRaw)) return "false";
	if (!g_bMinScoreAcquired){
		if (g_objAPI.LMSSetValue("cmi.core.score.min",g_nSCO_ScoreMin+"")!= "true") return "false"
	}
	if (!g_bMaxScoreAcquired){
		if (g_objAPI.LMSSetValue("cmi.core.score.max",g_nSCO_ScoreMax+"")!= "true") return "false"
	}
	if (g_objAPI.LMSSetValue("cmi.core.score.raw", nRaw)!= "true") return "false";
	g_bMinScoreAcquired = false;
	g_bMaxScoreAcquired = false;
	if (!g_bMasteryScoreInitialized){
		var nMasteryScore = parseInt(SCOGetValue("cmi.student_data.mastery_score"),10);
		if (!isNaN(nMasteryScore)) g_SCO_MasteryScore = nMasteryScore
	}
  	if ((g_bInterpretMasteryScore)&&(!isNaN(g_SCO_MasteryScore))){
    	var stat = (nRaw >= g_SCO_MasteryScore? "passed" : "failed");
    	if (SCOSetValue("cmi.core.lesson_status",stat) != "true") return "false";
  	}
  	return "true"
}
function MillisecondsToCMIDuration(n) {
//将持续时间从毫秒转换为 0000:00:00.00 格式
	var hms = "";
	var dtm = new Date();	dtm.setTime(n);
	var h = "000" + Math.floor(n / 3600000);
	var m = "0" + dtm.getMinutes();
	var s = "0" + dtm.getSeconds();
	var cs = "0" + Math.round(dtm.getMilliseconds() / 10);
	hms = h.substr(h.length-4)+":"+m.substr(m.length-2)+":";
	hms += s.substr(s.length-2)+"."+cs.substr(cs.length-2);
	return hms
}
// 此脚本将自动调用 SCOReportSessionTime，
// 但是您也可以随时从 SCO 调用它
function SCOReportSessionTime() {
	var dtm = new Date();
	var n = dtm.getTime() - g_dtmInitialized.getTime();
	return SCOSetValue("cmi.core.session_time",MillisecondsToCMIDuration(n))
}
// 因为只有 SCO 的设计者知道已完成状态意味着什么，
// 所以，SCO 的另一个脚本可调用此函数来设置已完成状态。
// 该函数将检查以确认 SCO 不在浏览模式中，并且
// 避免设置为“已通过”或“失败”状态，因为它们表示“已完成”。
function SCOSetStatusCompleted(){
	var stat = SCOGetValue("cmi.core.lesson_status");
	if (SCOGetValue("cmi.core.lesson_mode") != "browse"){
		if ((stat!="completed") && (stat != "passed") && (stat != "failed")){
			return SCOSetValue("cmi.core.lesson_status","completed")
		}
	} else return "false"
}
// 目标管理逻辑
function SCOSetObjectiveData(id, elem, v) {
	var result = "false";
	var i = SCOGetObjectiveIndex(id);
	if (isNaN(i)) {
		i = parseInt(SCOGetValue("cmi.objectives._count"));
		if (isNaN(i)) i = 0;
		if (SCOSetValue("cmi.objectives." + i + ".id", id) == "true"){
			result = SCOSetValue("cmi.objectives." + i + "." + elem, v)
		}
	} else {
		result = SCOSetValue("cmi.objectives." + i + "." + elem, v);
		if (result != "true") {
			// 此 LMS 可能只接受日志条目
			i = parseInt(SCOGetValue("cmi.objectives._count"));
			if (!isNaN(i)) {
				if (SCOSetValue("cmi.objectives." + i + ".id", id) == "true"){
					result = SCOSetValue("cmi.objectives." + i + "." + elem, v)
				}
			}
		}
	}
	return result
}
function SCOGetObjectiveData(id, elem) {
	var i = SCOGetObjectiveIndex(id);
	if (!isNaN(i)) {
		return SCOGetValue("cmi.objectives." + i + "."+elem)
	}
	return ""
}
function SCOGetObjectiveIndex(id){
	var i = -1;
	var nCount = parseInt(SCOGetValue("cmi.objectives._count"));
	if (!isNaN(nCount)) {
		for (i = nCount-1; i >= 0; i--){ //如果 LMS 记录日志则后退
			if (SCOGetValue("cmi.objectives." + i + ".id") == id) {
				return i
			}
		}
	}
	return NaN
}
// 用于将 AICC 兼容的标记或缩写转换为 SCORM 标记的函数
function AICCTokenToSCORMToken(strList,strTest){
	var a = strList.split(",");
	var c = strTest.substr(0,1).toLowerCase();
	for (i=0;i<a.length;i++){
			if (c == a[i].substr(0,1)) return a[i]
	}
	return strTest
}
function normalizeStatus(status){
	return AICCTokenToSCORMToken("completed,incomplete,not attempted,failed,passed", status)
}
function normalizeInteractionType(theType){
	return AICCTokenToSCORMToken("true-false,choice,fill-in,matching,performance,sequencing,likert,numeric", theType)
}
function normalizeInteractionResult(result){
	return AICCTokenToSCORMToken("correct,wrong,unanticipated,neutral", result)
}
// 检测 Internet Explorer
var g_bIsInternetExplorer = navigator.appName.indexOf("Microsoft") != -1;
// 处理来自 Flash 影片的 fscommand 信息，
// 如果需要，将任何 AICC Flash 模板命令重映射到 SCORM
function load_DoFSCommand(command, args){
	var loadObj = g_bIsInternetExplorer ? load : document.load;
	// 如果没有可用的 SCORM API，则为空操作
	var myArgs = new String(args);
	var cmd = new String(command);
	var v = "";
	var err = "true";
	var arg1, arg2, n, s, i;
	var sep = myArgs.indexOf(",");
	if (sep > -1){
		arg1 = myArgs.substr(0, sep); // 要从 API 获取的数据元素的名称
		arg2 = myArgs.substr(sep+1) 	// 要设置的 Flash 影片变量的名称
	} else {
		arg1 = myArgs
	}
	if (!APIOK()) return;
	if (cmd.substring(0,3) == "LMS"){
		// 处理“LMSxxx”Fscommand（与 fsSCORM html 模板兼容）
		if ( cmd == "LMSInitialize" ){
			err = (APIOK() + "")
			// 实际的 LMSInitialize 由该模板自动调用
		}	else if ( cmd == "LMSSetValue" ){
			err = SCOSetValue(arg1,arg2)
		} else if ( cmd == "LMSFinish" ){
			err = SCOFinish()
			// 由该模板自动处理，但是
			// 影片可在早些时候调用它。
		}	else if ( cmd == "LMSCommit" ){
			err = SCOCommit()
		}	else if ( cmd == "LMSFlush" ){
			// 无操作
			// LMSFlush 不是在 SCORM 中定义的，调用它会导致测试套件出错
		}	else if ((arg2) && (arg2.length > 0)){
			if ( cmd == "LMSGetValue") {
				loadObj.SetVariable(arg2, SCOGetValue(arg1));
			}	else if ( cmd == "LMSGetLastError") {
				loadObj.SetVariable(arg2, SCOGetLastError(arg1));
			}	else if ( cmd == "LMSGetErrorString") {
				loadObj.SetVariable(arg2, SCOGetLastError(arg1));
			}	else if ( cmd == "LMSGetDiagnostic") {
				loadObj.SetVariable(arg2, SCOGetDiagnostic(arg1));
			}	else {
				// 对于未知的 LMSGetxxxx 扩展
				v = eval('g_objAPI.' + cmd + '(\"' + arg1 + '\")');
				loadObj.SetVariable(arg2,v);
			}
		} else if (cmd.substring(0,3) == "LMSGet") {
			err = "-2: No Flash variable specified"
		}
		// 处理 "LMSxxx" 命令结束
	} else if ((cmd.substring(0,6) == "MM_cmi")||(cmd.substring(0,6) == "CMISet")) {
		// 处理 Macromedia 学习组件 Fscommand。
		// 这些是使用 AICC HACP 数据模型的惯例，
		// 因此可根据需要将数据从 AICC 重映射到 SCORM。
		var F_intData = myArgs.split(";");
		if (cmd == "MM_cmiSendInteractionInfo") {
			n = SCOGetValue("cmi.interactions._count");
			s = "cmi.interactions." + n + ".";
			// 捕获严重错误，以避免 SCORM 兼容性测试失败
			// 如果没有为此互操作提供 ID，那么我们就无法记录它
			v = F_intData[2]
			if ((v == null) || (v == "")) err = 201; // 如果没有 ID，记录就没有意义
			if (err =="true"){
				err = SCOSetValue(s + "id", v)
			}
			if (err =="true"){
				var re = new RegExp("[{}]","g")
				for (i=1; (i<9) && (err=="true"); i++){
					v = F_intData[i];
					if ((v == null) || (v == "")) continue
					if (i == 1){
						err = SCOSetValue(s + "time", v)
					} else if (i == 3){
						err = SCOSetValue(s + "objectives.0.id", v)
					} else if (i == 4){
						err = SCOSetValue(s + "type", normalizeInteractionType(v))
					} else if (i == 5){
						// strip out "{" and "}" from response
						v = v.replace(re, "");
						err = SCOSetValue(s + "correct_responses.0.pattern", v)
					} else if (i == 6){
						// strip out "{" and "}" from response
						v = v.replace(re, "");
						err = SCOSetValue(s + "student_response", v)
					} else if (i == 7){
						err = SCOSetValue(s + "result", normalizeInteractionResult(v))
					} else if (i == 8){
						err = SCOSetValue(s + "weighting", v)
					} else if (i == 9){
						err = SCOSetValue(s + "latency", v)
					}
				}
			}
		} else if (cmd == "MM_cmiSendObjectiveInfo"){
			err = SCOSetObjectiveData(F_intData[1], ".score.raw", F_intData[2])
			if (err=="true"){
				SCOSetObjectiveData(F_intData[1], ".status", normalizeStatus(F_intData[3]))
			}
		} else if ((cmd=="CMISetScore") ||(cmd=="MM_cmiSendScore")){
			err = SCOSetValue("cmi.core.score.raw", F_intData[0]);
		} else if ((cmd=="CMISetStatus") || (cmd=="MM_cmiSetLessonStatus")){
			err = SCOSetValue("cmi.core.lesson_status", normalizeStatus(F_intData[0]))
		} else if (cmd=="CMISetTime"){
			err = SCOSetValue("cmi.core.session_time", F_intData[0])
		} else if (cmd=="CMISetCompleted"){
			err = SCOSetStatusCompleted()
		} else if (cmd=="CMISetStarted"){
			err = SCOSetValue("cmi.core.lesson_status", "incomplete")
		} else if (cmd=="CMISetPassed"){
			err = SCOSetValue("cmi.core.lesson_status", "passed")
		} else if (cmd=="CMISetFailed"){
			err = SCOSetValue("cmi.core.lesson_status", "failed")
		} else if (cmd=="CMISetData"){
			err = SCOSetValue("cmi.suspend_data", F_intData[0])
		} else if (cmd=="CMISetLocation"){
			err = SCOSetValue("cmi.core.lesson_location", F_intData[0])
		} else if (cmd=="CMISetTimedOut"){
			err = SCOSetValue("cmi.core.exit", "time-out")
		} // 在此上下文中，其他学习组件 FScommand 没有操作
	} else {
		if (cmd=="CMIFinish" || cmd=="CMIExitAU"){
			err = SCOFinish()
		} else if (cmd=="CMIInitialize" || cmd=="MM_StartSession"){
			err = SCOInitialize()
		} else {
			// 未知命令；可能调用 API 扩展
			// 如果命令有第二个参数，那么假设需要一个值
			// 否则假定它只是一个命令
			if (eval('g_objAPI.' + cmd)) {
				v = eval('g_objAPI.' + cmd + '(\"' + arg1 + '\")');
				if ((arg2) && (arg2.length > 0)){
					loadObj.SetVariable(arg2,v)
				} else {
					err = v
				}
			} else {
				err = "false"
			}
		}
	}
	// 命令转换和处理结束
	// 处理检测到的错误，如返回的 LMS 错误
	if ((g_bShowApiErrors) && (err != "true")) {
		AlertUserOfAPIError(ExpandString(g_strFSAPIError, err, cmd, args))
	}
	return err
}
//-->
<!--
// 确定是否在加载影片之前尝试初始化 API，
// 以防某些动作脚本在剩余的 HTML 页
// 加载完成之前启动。
// 可通过在此文件的开始处设置全局布尔值 (g_bInitializeOnLoad)
// 来进行配置。默认值是 TRUE。

if (g_bInitializeOnLoad) {
	SCOInitialize()
}
//-->


<!--
function nocontextmenu() 
{ 
    event.cancelBubble = true 
	event.returnValue = false; 
	return false; 
} 

function norightclick(e) 
{ 
	if (window.Event) { 
		if (e.which == 2 || e.which == 3) 
		return false; 
	} 
	else {
        if (event.button == 2 || event.button == 3) { 
		    event.cancelBubble = true 
		    event.returnValue = false; 
		    return false; 
        }
	} 

} 

//document.oncontextmenu = nocontextmenu; // for IE5+
//document.onmousedown = norightclick; // for all others
//-->
