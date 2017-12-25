
function DropDownList(dropDownList,url,label,tootip,returnlabel)
{ 
		this.dropDownList = dropDownList; //DropDownList实例名  
    this.url = url;//url
    this.label = label;//业务显示名称
    this.tooltip = tootip;//div块id值(例：<div id="toolTip1"></div>)
    this.returnlabel = returnlabel; 
    //returnlabel: 填充form表单的field(fromorgid,fromorgname)的前缀：
    //<html:hidden property="fromTcID" styleId="fromorgid" value=""></html:hidden>
		//<input type="text" name="fromTcName" id="fromorgname" value="" readonly="true"/>
    this.req;
    
    this.width = 500;
    this.height;
    this.top;
    this.left;
    
    this.returnValueFromList = false;// 是否从下拉列表返回数据
}
    
// 设置浮动框位置 
DropDownList.prototype.setPosition = function(top,left,width,height)
{    
    		var selectorg = document.getElementById("select"+this.returnlabel);
        var oLeft = selectorg.offsetLeft;
				var oTop = selectorg.offsetTop;
				while(selectorg = selectorg.offsetParent)
				{
				   oTop += selectorg.offsetTop;
				   oLeft += selectorg.offsetLeft;
				}
        this.width = width != undefined ? width : 500;
		    this.height = height;
		    this.top = top != undefined ? top : oTop + 21;
		    this.left = left != undefined ? left : oLeft - 137;
} 
    
// 动态添加下拉列表框 name = tooltip+'orgid'; id = tooltip+'orgid'
DropDownList.prototype.addSelectListHtml = function(innerhtml,level)
{
				var returnHtml = "";
				var tmphtml = ""
										+ "<select name='" + this.tooltip + "orgid" + level + "' id='" + this.tooltip + "orgid" + level + "' onchange=\"" + this.dropDownList + ".Change_Select('" + level + "')\">"
										+ "		<option value='-1'>--请选择--</option>"
										+ "</select>";		
				returnHtml = innerhtml + tmphtml;			
				return returnHtml;
}
		
// 在只读文本框显示所选择组织
DropDownList.prototype.setOrgid = function(orgid,orgname)
{		
				if(orgid > -1){
					var oOrgid = document.getElementById(this.returnlabel + 'id');
					var oOrgname = document.getElementById(this.returnlabel + 'name');
					oOrgid.setAttribute('value',orgid);
					oOrgname.setAttribute('value',orgname);
				}
}

// 从文本节点为组织赋值
DropDownList.prototype.setOrgidFromText = function(orgid,orgname)
{		
				this.setOrgid(orgid,orgname);
				this.clsToolTip();
}
// 从下拉列表为组织赋值
DropDownList.prototype.setOrgidFromList = function(orgid,orgname)
{		
				this.setOrgid(orgid,orgname);				
}
		
// 显示ToolTip浮动框
DropDownList.prototype.showToolTip = function()
{
				var selectOrg = document.getElementById(this.tooltip);
				selectOrg.style.display = "block";
}
		
// 关闭ToolTip浮动框,并清空浮动框数据
DropDownList.prototype.clsToolTip = function()
{
				var selectOrg = document.getElementById(this.tooltip);
				selectOrg.style.display = "none";
				
				var selectDirOrg = document.getElementById(this.tooltip + "divdirlist");
				selectDirOrg.innerHTML = "";
				
				var selectFileOrg = document.getElementById(this.tooltip + "divfilelist");
				selectFileOrg.innerHTML = "<span><font color='black' id='" + this.tooltip + "contentlable'><b>"+this.label+"列表：</b></font></span><br/>";	
}
		
// 初始隐藏ToolTip浮动框
DropDownList.prototype.InitToolTip = function()
{
				var selectOrg = document.getElementById(this.tooltip);
				selectOrg.style.display = "none";
}
		
// 下拉列表选项改变时利用Ajax返回下级组织列表
DropDownList.prototype.Change_Select = function(level)
{ 
		    var oOrgid = document.getElementById(this.tooltip + 'orgid'+level);
		    var orgid;
		    var orgname;    
		    if(oOrgid!=null){
		    	orgid = oOrgid.value;
		    	orgname = oOrgid.options[oOrgid.selectedIndex].text;
		    	if(this.returnValueFromList == true){
        			this.setOrgidFromList(orgid, orgname);
        	}
		    }else{
		    	orgid = 0;
		    	orgname = "";
		    } 
		    
        
            
				var urlreal = this.url + escape(orgid);   
				    
				if(window.XMLHttpRequest)
				{
				  this.req=new XMLHttpRequest();
				}else if(window.ActiveXObject)
				{
				  this.req=new ActiveXObject("Microsoft.XMLHTTP");
				}
				    
				if(this.req)
				{
				   this.req.open("GET",urlreal,false);
				   this.req.setRequestHeader("If-Modified-Since", 0);
				   this.req.send("");
				   this.req.onreadystatechange = this.ajaxevent(level);
				}
}
		
DropDownList.prototype.ajaxevent = function(level)
{ 				
				if (this.req.readyState == 4){						
						if (this.req.status == 200 || this.req.status == 304){
								this.parseMessage(level);
						}
				}
}
				
// 具体的显示下级组织子项的方法
DropDownList.prototype.parseMessage = function(level)
{	
				var xmlDoc=this.req.responseXML.documentElement;
				var xSel1=xmlDoc.getElementsByTagName('orgsdir');	
				
				// 如果下级组织包含非叶节点，填充下级下拉列表框数据					 
				if(xSel1.length > 0){				
						// 删除所有子级以下级别的下拉列表框

						var hLevel = parseInt(level)+2;
						while(document.getElementById(this.tooltip + "orgid" + hLevel.toString()) != null){
								var nextroot=document.getElementById(this.tooltip + "orgid" + hLevel.toString());
								nextroot.parentNode.removeChild(nextroot);										
								hLevel++ ;
						}
						
						// 当前下拉列表框数目不够用，生成一个下拉列表框	
						if(document.getElementById(this.tooltip + "orgid"+(parseInt(level)+1).toString()) == null){//动态增加下拉列表框
								var innerhtml = ""
								innerhtml += this.addSelectListHtml(innerhtml,parseInt(level)+1);											
								var selectDirOrg = document.getElementById(this.tooltip + "divdirlist");	
								selectDirOrg.innerHTML += innerhtml;
						}	
						
						// 填充下级下拉列表框数据

						var select_root=document.getElementById(this.tooltip + "orgid"+(parseInt(level)+1).toString());
						select_root.options.length=0;
																
						var oOption = document.createElement("option");
						select_root.options.add(oOption);								
						oOption.appendChild(document.createTextNode("--请选择--"));	
						oOption.setAttribute("value","-1");	 
						    
						for(var i=0;i<xSel1.length;i++)
						{
						    var xValue=xSel1[i].childNodes[0].firstChild.nodeValue;
						    var xText=xSel1[i].childNodes[1].firstChild.nodeValue;				
						       
						    var oOption = document.createElement("option");
								select_root.options.add(oOption);								
								oOption.appendChild(document.createTextNode(xText));	
								oOption.setAttribute("value",xValue);
										
						    try{
						      select_root.add(option);
						    }catch(e){
						    }
						} 
				}else{// 如果下级组织不包含非叶节点，删除所有下级下拉列表框数据	
						var hLevel = parseInt(level)+1;
						while(document.getElementById(this.tooltip + "orgid" + hLevel.toString()) != null){
								var nextroot=document.getElementById(this.tooltip + "orgid" + hLevel.toString());
								nextroot.parentNode.removeChild(nextroot);
								hLevel++ ;
						}
				}
				
				// 显示所有下级叶节点 
				var xSel2=xmlDoc.getElementsByTagName('orgsfile');
				var selectFileOrg=document.getElementById(this.tooltip + "divfilelist");		    
				    
				var str = "<table width='480' align='left'>";
				for(var i=0;i<xSel2.length;i+=3)
				{	
				    str += "<tr>";
				    var j = i;
				    while(xSel2[j] != null && j < i+3){
					    var xValue=xSel2[j].childNodes[0].firstChild.nodeValue;
					    var xText=xSel2[j].childNodes[1].firstChild.nodeValue;
					    str += "<td width='160'><a href='javascript:" + this.dropDownList + ".setOrgidFromText(" + xValue + ", \"" + xText + "\" );' class='a_link'>" + xText + "</a></td>";		 
					    j++;
						}
						str += "</tr>";
						    }		    
								str += "</table>";
				selectFileOrg.innerHTML = "<span><font color='black' id='" + this.tooltip + "contentlable'><b>"+this.label+"列表：</b></font></span><br/>" + str;	
					
		
}
// 初次打开浮动框时生成html的DIV代码
DropDownList.prototype.generatorToolTip = function()
{
				var tipbox = document.getElementById(this.tooltip);
				tipbox.innerHTML = ""
				+"<div id='" + this.tooltip + "xMsg1' "
				            	+"style='z-index:10002;"
							        +"  	  width:" + this.width + "px;"					            	
							        +"    	left:" + this.left + "px;"
							        +"    	top:" + this.top + "px;"
							        +"    	background-color:white;"				            	
							        +"    	font-size:13px;"
							        +"    	font-family:Verdana;"
							        +"    	position:absolute;"
							        +"    	cursor:default;"
							        +"    	border:3px solid #54b2fc;'>"
				            	+"<div style='background-color:#dceeff;"
										  +"          	width:" + (this.width-5) + "px;"
										  +"          	border-bottom:1px solid #54b2fc;"
											+"						line-height:25px;"
											+"						text-align:center;'>"
						          +"  	<span style='width:372;padding-left:3px;' id='" + this.tooltip + "titlelable'><font color='black'><b></b></font>"
						          +"  	</span>"
				            	+"</div>"
				            	+"<div id= '" + this.tooltip + "divdirlist' style='width:" + (this.width-15) + "px;"
				            	+"						padding:6px;"
				            	+"						border-bottom:1px solid #54b2fc;"
										  +"          	background-color:white;"
										  +"          	word-break:break-all;'>"
				            	+"</div>"			            	           	
											+"<div id= '" + this.tooltip + "divfilelist' style='"
										  +"          	background-color:#dceeff;"
										  +"          	height:200px;"
										  +"          	overflow:auto;"
										  +"          	width:" + (this.width-15) + "px;"							            	
										  +"          	word-break:keep-all;"
										  +"         	padding:6px;'>"
										  +"          	<span><font color='black' id='" + this.tooltip + "contentlable'><b></b></font></span><br/>"
				            	+"</div>"
				            	+"<div style='width:" + (this.width-5) + "px;"
				            	+"						border-top:1px solid #54b2fc;"
										  +"          	background-color:white;'>"
										  +"          	<input type='button' style='float:right;' value='关闭窗口' onclick='" + this.dropDownList + ".clsToolTip()' />"
				            	+"</div>"
						    +"</div>";
				
}
		
// 点击'选择组织'链接的响应事件：显示浮动框并填充数据
DropDownList.prototype.openSelect = function()
{
				this.setPosition();
				this.generatorToolTip();				
			  this.showToolTip();				  	
			  
			  document.getElementById(this.tooltip + 'titlelable').innerHTML= "<font color='black'><b>选择"+this.label+"</b></font>";
				document.getElementById(this.tooltip + 'contentlable').innerHTML= "<b>"+this.label+"列表：</b>"; 
				
				this.Change_Select(0);
}
 

/*
使用方法
js部分：
<script type="text/javascript"> 
var dropDownList = new DropDownList("dropDownList3",
        "/phoenix4/admin/pxtrainingclass/info.do?method=ajaxlist&id=",
        "培训班",
        "toolTip",
        "fromorg");
        
window.onload=function(){
    dropDownList.InitToolTip();//初始隐藏div块
    dropDownList.returnValueFromList = true;// 是否从下拉列表返回数据
}

function orgSelect()
{		
		dropDownList.openSelect();//点击链接显示div块
}
</script>

html部分:
<div id="toolTip"></div>
<tr>
				<th width="100px">源培训班</th>
				<td><html:hidden property="fromTcID" styleId="fromorgid" value=""></html:hidden>
						<input type="text" name="fromTcName" id="fromorgname" value="" readonly="true"/>              
            <a href="javascript:orgSelect1();">选择培训班</a>*
        </td>
</tr>


java部分：

@SuppressWarnings("unchecked")
public ActionForward ajaxlist(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception
  {
    String id = request.getParameter("id");

    List<MapGetter> orgsdir = null;
    List<MapGetter> orgsfile = null;

    orgsfile = (List<MapGetter>) pxTrainingClassService.getSonFileOrgList(id);
    orgsdir = (List<MapGetter>) pxTrainingClassService.getSonDirOrgList(id);

    response.setContentType("text/xml; charset=GBK");
    response.setHeader("Cache-Control", "no-cache");

    String xml_start = "<?xml version=\"1.0\" encoding=\"GBK\"?><selects>";
    String xml_end = "</selects>";
    String xml = "";

    for (int i = 0; i < orgsdir.size(); i++)
    {
      String str = "<orgsdir><value>" + orgsdir.get(i).getString("id")
          + "</value><text>" + orgsdir.get(i).getString("name")
          + "</text></orgsdir>";
      xml += str;
    }
    for (int i = 0; i < orgsfile.size(); i++)
    {
      String str = "<orgsfile><value>" + orgsfile.get(i).getString("id")
          + "</value><text>" + orgsfile.get(i).getString("name")
          + "</text></orgsfile>";
      xml += str;
    }

    String last_xml = xml_start + xml + xml_end;
    response.getWriter().write(last_xml);
    return null;
  }
*/