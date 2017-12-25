<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title>视频播放页面</title>
    <link href="<c:url value="/videoplay/css/reset.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/videoplay/css/video.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/videoplay/css/exam.css"/>" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="<c:url value='/videoplay/widget/jQuery/jquery-1.10.2.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/videoplay/js/base64.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/videoplay/js/jquery.tinyscrollbar.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/videoplay/js/zfwxvideo.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/videoplay/js/j.min.js'/>"></script>
</head>
<body>
<%-- <s:bean name="com.zfwlxt.vod.service.DjOnlineuserManager" var="mm"></s:bean>   --%>
<s:bean name="com.zfwlxt.util.Util" var="util"></s:bean>
    <input type="hidden" value="${url}" id="videourl">
    <input id="stucwid" type="hidden" name="stucwid" value="${stucwId}">
    <input id="coursewareId" type="hidden" name="coursewareId" value="${cwId }">
    <input id="accountId" type="hidden" name="accountId" value="${accountId }">
    <input id="courseGroupId" type="hidden" name="courseGroupId" value="${courseGroupId }">
    <input id="csid" type="hidden" name="csid" value="${csId}">
    <input id="renewalPrice" type="hidden" name="renewalPrice" value="${renewalPrice}">
    <input id="userName" type="hidden" name="userName" value="${userName }">
    <input id="userAmount" type="hidden" name="userAmount" value="${userAmount}">
    <input id="csHour" type="hidden" name="csHour" value="${csHour}">
    <input id="cwHour" type="hidden" name="cwHour" value="${cwHour}">
    <div class="header">
    <a href="${requestpath}/member/index.jsp#${ctx}/member/DjStucourse/mycslist.do?isShow=0&listen=1" class="back-list fL">返回课程列表</a>
    <div class="course-title fL">${courseName}</div>
    <a href="javascript:void(0);" class="phone fR">手机版<code class="phone-p"></code><code class="phone-erwm"></code></a>
    <div class="bshare-custom" style="float:right;margin-top: 14px">
        <a id="bshare-more-icon" class="bshare-more"  href="http://www.bshare.cn/share" style="background:url(/videoplay/images/video/icon_06.png) no-repeat center left;padding-top:10px; position:relative; width:40px;line-height: 14px; color:#9fabb3; float:left; text-decoration: none;font-size:12px;">分享</a>
    </div>
    <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#uuid=b7db8bd5-b2e3-4df6-9bdd-b4b78b613618&tyle=-1&ssc=false"></script>
    <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC2.js"></script>
    <script type="text/javascript">
        bShare.addEntry({
            title: "${courseName}",
            url: "http://www.zfwx.com/schoolLessonDetail.do?courseId=${csId}",
            summary: "${courseName}"
        });
    </script>
<!--     <div class="online-users fR">在线<span><s:property value="%{#mm.getOnlineUserCount()}"/></span>人</div> -->
    <ul class="class-room fR">
        <li>班主任：${bzr}</li>
        <li>班长：${bz}</li>
        <li>同学：${courseGroupSize}人</li>
    </ul>
</div>
<div class="content clearfix">
    <div class="content-cL">
        <div class="L-videoFrame">
            <div class="tab-listl">
                <ul>
                    <li><a href="javascript:void(0);" class="zuoy-icon" title="建设中..."></a> </li>
                    <li><a href="javascript:void(0);" class="tik-icon" title="建设中..."></a> </li>
                    <li><a href="javascript:void(0);" class="fak-icon" title="建设中..."></a> </li>
                    <li><a href="javascript:void(0);" class="cank-icon" title="建设中..."></a> </li>
                </ul>
            </div>
            <div class="tab-list">
                <ul>
                    <li><a href="javascript:void(0);" class="ml-icon"></a> </li>
                    <li><a href="javascript:void(0);" class="tl-icon"></a> </li>
                    <li><a href="javascript:void(0);" class="bj-icon"></a> </li>
                    <li><a href="javascript:void(0);" class="xx-icon"></a> </li>
                    <li><a href="javascript:void(0);" class="sz-icon"></a> </li>
                </ul>
            </div>
            <div id="playerContent"></div>
        </div>
        <div class="classroom-participants">
            <div class="classroom-participants-c">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>

            </div>
        </div>
    </div>
    <div class="content-cR">
        <div class="R-content">
            <div class="ml-con">
                <div class="scrollbar"><div class="track"><div class="thumb"></div></div></div>
                <div class="viewport">
                    <div class="overview">
                        <div class="overview-mulu">
                        <c:forEach items="${cws}" var="item" varStatus="status">
                            <dl class="muludl">
                                <dt class="clearfix">
                                <a href="javascript:void(0);" id="${item.stucwId}" begindate="${item.beginDate}" class="mulutitle" title="${item.cwName}">
                                    <code class="icon-round"></code>${fn:substring(item.cwName, 0, 16) }
                                </a>
                                <span class="mulutime"><fmt:formatNumber value="${item.cwHour}" pattern="0"/>分钟</span>
                                </dt>
                                <dd>${item.cwInfo}</dd>
                               
                            </dl>
                         </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tl-con">
                <div class="scrollbar"><div class="track"><div class="thumb"></div></div></div>
                <div class="viewport">
                <div class="overview">
                    <div class="overview-con">
                        <ul class="tl-ul">
                        <c:forEach items="${messageList}" var="message" varStatus="status">
                        <c:if test="${message.account_id!=accountId}">
                            <li class="clearfix">
                                <div class="tl-portraitimg fL">
                                 <c:if test="${message.icon.equals(\"\")}">
                               		 <img src="<c:url value='/videoplay/images/video/photo1.jpg'/>" width="30" height="30" alt="">
                                </c:if>
                        		<c:if test="${!message.icon.equals(\"\")}">
                               		 <img src="${casPath}/photo/${message.icon}" alt=""  width="30" height="30">
                                </c:if>
                                <code class="icon-triangle01"></code> </div>
                                <div class="tl-content fL ml10">
                                    <div class="clearfix">
                                        <span class="tl-title fL">${message.name}</span>
                                        <span class="tl-time fR">${util.mDatetoString(message.createtime,"HH:mm:ss yyyyMMdd")}</span>
                                    </div>
                                    <div class="tl-neir">${message.content}</div>
                                </div>
                            </li>
						</c:if>
                        <c:if test="${message.account_id==accountId}">
                            <li class="clearfix">
                                <div class="tl-portraitimg fR">
                                <c:if test="${message.icon.equals(\"\")}">
                               		 <img src="<c:url value='/videoplay/images/video/photo1.jpg'/>" alt="" width="30" height="30">
                                </c:if>
                        		<c:if test="${!message.icon.equals(\"\")}">
                               		 <img src="${casPath}/photo/${message.icon}" alt=""  width="30" height="30">
                                </c:if>
                                <code class="icon-triangle02"></code> </div>
                                <div class="tl-content fR mr10">
                                    <div class="clearfix">
                                        <span class="tl-time fR">${util.mDatetoString(message.createtime,"HH:mm:ss yyyyMMdd")}</span>
                                    </div>
                                    <div class="tl-neir tl-neirB">${message.content}</div>
                                </div>
                            </li>
                         </c:if>
                         </c:forEach>
                        </ul>
                    </div>
                </div>
                </div>
                <div class="createtopic createtopic1">
                    <div class="expansion_box">
                        <div class="txtwrap">
                            <textarea class="input_text" name="des_txt" id="des_txt">有疑问，和大家讨论下？</textarea>
                            <span id="send_ok_one" name="send_ok_one"><em>发布成功</em></span> <span class="fail" id="send_err_one" name="send_err_one">错误提示</span>
                            <div class="backgroundColor"></div>
                        </div>
                        <p class="expansion_btn">
                            <input type="button" class="btn_faqitaolun" value="发表" id="btn_faqitaolun"/>
                        </p>
                        <!--<input type="hidden" name="atuid" id="atuid" value=""/>-->
                    </div>
                </div>
            </div>
            <div class="bj-con" style="border-top: none;">
                <ul class="bi-tab clearfix">
                    <li class="tabli" id="mybiji" sortColumns="my">我的笔记</li>
                    <li class="tabli tablihover" id="uptodatebiji" sortColumns="nbCreattime">最新笔记</li>
                    <li class="tabli" id="hottestmybiji" sortColumns="browseCount">最热笔记</li></ul>
                <div class="scrollbar"><div class="track"><div class="thumb"></div></div></div>
                <div class="viewport" style="border-top:1px solid #1e2124;">
                <div class="overview">
                    <div class="overview-biji" biji="1">
                    <c:forEach items="${notebookList}" var="notebook" varStatus="status">
                        <dl class="bijidl">
                            <dt class="clearfix"><span class="bijitime"><code class="icon-round"></code>${notebook.nbTotaltimefmt}</span><a href="javascript:void(0);" class="bijititle">${notebook.realName}</a></dt>
                            <dd class="notebookid" notebookid="${notebook.notebookId}">${notebook.title}</dd>
                            <dd class="clearfix"><span class="bijidate"><fmt:formatDate value="${notebook.nbCreattime}" type="both"/></span><a href="javascript:void(0)" class="bijipraise" id="${notebook.notebookId}" onClick="bijipraise(${notebook.notebookId});"><em>（${notebook.browseCount}）</em></a> </dd>
                        </dl>
                        <div class="biji-line"></div>
                     </c:forEach>
                     </div>
                 </div>
                 </div>
                <div class="bijiform">
                    <div class="bijiformpos" id="bijiformpos">
                        <textarea id="biji_box" class="c_textarea" name="content"></textarea>
                        <textarea id="biji_boxhidden"></textarea>
						<input id="send_btn" class="btn_biji" type="button" value="保 存" />
                    </div>
                </div>
            </div>
            <div class="xx-con">
                <div class="scrollbar"><div class="track"><div class="thumb"></div></div></div>
                <div class="viewport">
                <div class="overview">
                    <div class="overview-con">
                        <ul class="xx-ul">
                   		<c:forEach items="${activityList}" var="activity" varStatus="status">
                            <li><a target="_nblank" href="${requestpath}/DjActivity/getActivityInfo.do?activityId=${activity.activityId}"  title="${activity.activityName}">${activity.activityName}</a></li>
                     	</c:forEach>
                        </ul>
                    </div>
                </div>
                </div>
            </div>
            <div class="sz-con">
                <div class="scrollbar"><div class="track"><div class="thumb"></div></div></div>
                <div class="viewport">
                    <div class="overview">
                        <div class="overview-con">
                            <div class="clearfix">
                                <div class="psimg fL"><img src="<c:url value='${teaImg }'/>" alt=""></div>
                                <div class="pswz fL">
                                    <p class="pswzp01">${map.teacherName }</p>
                                    <input type="hidden" value="${map.tchSpedesc }" id="szpost">
                                    <p class="pswzp02" id="szposts"></p>
                                </div>

                            </div>
                            <div class="sz-nr">${map.tchNote }</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="R-foot">

            <div class="foot-precautions">
                <p>客服：010-62210155 / 62276953</p>
                <ul>
                    <c:forEach items="${topiclist}" var="topic" varStatus="status">
                    <li><a target="_nblank" href="http://bbs.zfwx.com${topic.url}" title="${topic.title}">${topic.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="full"></div>
<div class="bb">
    <div id="ex"></div>
    <div class="back"><a class="but" href="javascript:void(0);">继续听课</a></div>
</div>
<div class="yq-xq">
    <div class="xqall">
        <div class="xqclose"></div>
        <div class="xqtitle">继续听课继续听课继续听课继续听课继续听课</div>
        <div class="xq-useramount">${userAmount}点币</div>
        <div class="xq-price">${renewalPrice}点币</div>
        <a href="javascript:void(0);" class="yq-btn"></a>
    </div>
</div>
<div class="wq-xq">
    <div class="xqall">
        <div class="xqclose"></div>
        <div class="xqtitle">继续听课继续听课继续听课继续听课继续听课</div>
         <div class="xq-price">${renewalPrice}元</div>
         <a href="javascript:void(0);" class="wq-btn-alipay"></a>
         <a href="javascript:void(0);" class="wq-btn-kuaiqian"></a>
    </div>
</div>
