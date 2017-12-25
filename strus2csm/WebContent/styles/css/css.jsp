<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
//String imgurl="/wangxiao/images/bg.png";
String imgurl=request.getParameter("imgurl");
request.setAttribute("imgurl",imgurl);
response.setContentType("text/css");
%>
<style type="text/css">
*{font-size: 12px;}
body { text-align:center; font-family:\5B8B\4F53, Arial Narrow, arial, serif; background:#fff; font-size:12px; color:#333; position:relative }
body, div, dl, dt, dd, ul, li, h1, h2, h3, h4, h5, h6, form, input, p { padding:0; margin:0 }
table, td, tr, th { font-size:12px }
li, ul { list-style-type:none }
table { margin:0 auto; border-collapse:collapse }
img { vertical-align:top; border:0 }
ul { list-style:none }
a:active, a:focus { outline:none }
h1, h2, h3, h4, h5, h6 { font-size:12px; font-weight:normal }
.no_p { display:none }
.ok_p { display:block }
.clear { }
.clear:after { clear:both; height:0; overflow:hidden; display:block; visibility:hidden; content:"." }
a { color:#15646b; text-decoration:none }
a:hover { color:#15646b; text-decoration:underline }
a:active { color:#15646b }
a:visited { color:#15646b; text-decoration:none }
.fl_l { float:left }
.fl_r { float:right }
.blank, .blank10 { height:1px; overflow:hidden; font-size:1px; clear:both }
.blank10 { height:10px}
.cwhite, .cwhite a:link, .cwhite a:visited, .cwhite a:hover, .cwhite a:active { color:#fff }
.head { width:950px; margin:0 auto; height:100px; overflow:hidden; background:url(<c:url value="${imgurl}"/>) no-repeat; text-align:left }
.head h1 { width:390px; margin-left:35px; height:100px; overflow:hidden; float:left; }
.head h1 a { clear:both; display:block; line-height:999; height:100px }
.banner { width:950px; margin:0 auto; height:auto; border:5px solid #6d96aa; border-width:5px 0; background:url(<c:url value="${imgurl}"/>) 0 191px no-repeat; }
.banner span { height:7px; clear:both; display:block; width:950px; background:url(<c:url value="${imgurl}"/>) no-repeat 0 -102px; overflow:hidden }
.back { width:390px; margin:80px 15px 0 0px; height:100px; overflow:hidden; float:right; text-align:right; }
.underling { width:950px; margin:0 auto; padding:12px 0 5px 40px; text-align:left; color:#7d7d7d; }
.underling a { color:#7d7d7d; padding-right:8px; }
.paomad { width:950px; margin:0 auto; padding:12px 0 5px 0; text-align:left; color:#7d7d7d; position:relative }
.paomad a { color:#000; padding-right:8px; }
.paomad a.not{color:#999}
.paomad .more{width:59px; height:22px; position:absolute; right:0; top:5px}
.com { clear:both; margin:0 auto; display:block; border:2px solid #e9e9e9; width:946px; text-align:left }
.con_txt { width:373px; float:left }
.con_star { width:283px; float:left; }
.con_txt h3, .con_star h3 { border-bottom:2px solid #e9e9e9; height:30px; line-height:35px; padding-top:5px; background:url(<c:url value="${imgurl}"/>) no-repeat -925px -128px; padding-left:30px; font-size:14px; color:#15646b; overflow:hidden }
.con_txt .col_tit { height:35px; position:relative; padding:0; border:0; border-bottom:2px solid #e9e9e9; color:#666; font-size:14px; text-align:center;}
.con_txt .col_tit b { float:left; width:91px; height:31px; line-height:35px; margin-top:6px; font-weight:normal; cursor:pointer ;_margin:0px 0px;_height:30px;}
.con_txt .col_tit b.hover { background:url(<c:url value="${imgurl}"/>) no-repeat 0 -139px; font-weight:bold; color:#0e676d;_overflow:hidden;_margin-top:pp;}
.con_txt div, .con_star div {_clear:both; border-right:2px solid #e9e9e9; clear:both; display:block; padding-bottom:8px; height:160px;}
.con_txt ul { width:330px; margin-left:5px; }
.con_star ul { width:260px; margin-left:5px; }
.con_txt ul li { height:25px; line-height:25px; border-bottom:1px dashed #e9e9e9; background:url(<c:url value="${imgurl}"/>) no-repeat -936px -174px; text-indent:20px; width:360px; overflow:hidden; position:relative }
.con_star ul li { height:25px; line-height:25px; border-bottom:1px dashed #e9e9e9; background:url(<c:url value="${imgurl}"/>) no-repeat -936px -174px; text-indent:20px; width:265px; overflow:hidden; position:relative }
.con_star ul li span { position:absolute; width:100px; left:165px; color:#666; text-align:right; }
.con_inp { width:290px; float:right; position:relative }
.con_inp h3 { border-bottom:2px solid #e9e9e9; height:30px; line-height:35px; padding-top:5px; background:url(<c:url value="${imgurl}"/>) no-repeat -925px -128px; padding-left:30px; font-size:14px; color:#15646b; overflow:hidden }
.con_inp ul { position:absolute; width:170px; left:58px; top:55px; }
.con_inp label { float:left; width:50px; padding-right:6px; text-align:right; line-height:20px }
.con_inp input.text { width:115px; height:18px; _height:16px; border:1px solid #d4d4d3; color:#666; float:left }
.con_inp input.but { background:url(<c:url value="${imgurl}"/>) no-repeat 0 -117px; width:68px; height:22px; text-align:center; line-height:22px; cursor:pointer; border:0; margin:9px 0 0 45px;_margin:8px 0 0 45px; }
.con_inp li { clear:both; float:left; display:block; width:185px; padding-top:8px; }
.con_inp li.end { padding-left:35px; word-spacing:10px; text-align:left; padding-top:12px; height:25px; }
.con_inp li.end input { vertical-align:bottom; #vertical-align:middle;margin-right:5px!important; margin-right:0; }
.con_inp span { position:absolute; color:#6b6b6b; top:185px; left:150px }
.foot { clear:both; display:block; width:950px; margin:0 auto; text-align:left; color:#6b6b6b; height:60px }
.foot span { height:7px; clear:both; display:block; width:950px; background:url(<c:url value="${imgurl}"/>) no-repeat 0 -109px; overflow:hidden; margin-bottom:8px }
/*更多*/
.more_blank{clear:both; display:block; width:950px; margin:0 auto; height:5px; background:#2a3e94}
.more_cob{clear:both; display:block; width:900px; margin:15px auto; height:autXo; border:1px solid #d7d7d7; text-align:center}
.more_sear{clear:both; display:block; width:880px; border-bottom:1px solid #d7d7d7; margin:0 auto; height:39px; text-align:left; margin-top:17px; margin-bottom:10px}
.more_sear span.ico{width:102px; height:38px; background:url(../images/more_ls.png) no-repeat; float:left; display:inline-block}
.more_sear .but{ width:70px; height:24px; background:url(../images/btn.gif) no-repeat; color:#fff; border:0; cursor:pointer; margin-top:5px}
.more_sear .but1{ width:70px; height:24px; background:url(../images/btn.gif) no-repeat; color:#fff; border:0; cursor:pointer; margin-top:5px}
.more_sear .txt{ border:1px solid #999; width:270px; color:#666; margin-top:5px; margin-left:6px; margin-right:6px; height:21px; line-height:21px; vertical-align:bottom!important; vertical-align:baseline}
.more_list{clear:both; display:block; margin:0 auto; height:auto; width:880px;}
.more_list li{ width:125px; margin-right:26px; height:25px; line-height:25px; overflow:hidden; float:left;text-align:left;}
.more_list li a, .more_list li a:visited{ color:#666}
#tab_tit02,#tab_tit01{line-height:30px;_margin-top:6px;}
.gj{position:absolute; top:155px; right:300px;_top:160px; }
.gj span{color:#f00;}
</style>
