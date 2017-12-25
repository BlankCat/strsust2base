// JavaScript Document


lastScrollY = 0;

function heartBeat(){

var diffY;

if (document.documentElement && document.documentElement.scrollTop)

diffY = document.documentElement.scrollTop;

else if (document.body)

diffY = document.body.scrollTop

else

{/*Netscape stuff*/}

//alert(diffY);

percent=.1*(diffY-lastScrollY);

if(percent>0)percent=Math.ceil(percent);

else percent=Math.floor(percent);

document.getElementById("leftDiv").style.top = parseInt(document.getElementById("leftDiv").style.top)+percent+"px";

document.getElementById("rightDiv").style.top = parseInt(document.getElementById("rightDiv").style.top)+percent+"px";

lastScrollY=lastScrollY+percent;

//alert(lastScrollY);

}

//下面这段删除后，对联将不跟随屏幕而移动。

window.setInterval("heartBeat()",1);

//-->

//关闭按钮



function close_left2(){

    leftDiv.style.display='none';

}



function close_right2(){

    rightDiv.style.display='none';

}

//显示样式

document.writeln("<style type=\"text\/css\">");

document.writeln("#leftDiv,#rightDiv{width:100px;height:318px;background-color:#fff;position:absolute;}");

document.writeln(".itemFloat{width:100px;height:auto;line-height:5px}");

document.writeln("<\/style>");

//以下为主要内容

document.writeln("<div id=\"leftDiv\" style=\"top:20px;left:5px;z-index:999;\">");

//------左侧各块开始

//---L2

document.writeln("<div id=\"left2\" class=\"itemFloat\">");

document.writeln("<a target=_blank href=http://wq.zfwlxt.com/hdShow.aspx?hdID=377><img border=0 src=styles/images/left0.gif></a>");

document.writeln("<br><a href=\"javascript:close_left2();\" title=\"关闭上面的广告\" style=\"background-color:#f0f0f0;border:1px solid #bdbdbd;width:50px;height:20px;float:right;text-align:center;line-height:22px; color:#000;font-size:14px;text-decoration:none;\">关闭×<\/a>");

document.writeln("<\/div>");

//------左侧各块结束

document.writeln("<\/div>");

document.writeln("<div id=\"rightDiv\" style=\"top:20px;right:5px;z-index:999;\">");

//------右侧各块结束



//---R2

document.writeln("<div id=\"right2\" class=\"itemFloat\">");

document.writeln("<a target=_blank href=http://wq.zfwlxt.com/hdShow.aspx?hdID=377><img border=0 src=styles/images/right00.gif></a>");

document.writeln("<br><a href=\"javascript:close_right2();\" title=\"关闭上面的广告\" style=\"background-color:#f0f0f0;border:1px solid #bdbdbd;width:50px;height:20px;float:right;text-align:center;line-height:22px; color:#000;font-size:14px;text-decoration:none;\">关闭×<\/a>");

document.writeln("<\/div>");

//------右侧各块结束

document.writeln("<\/div>");



<!--对联广告结束-->
