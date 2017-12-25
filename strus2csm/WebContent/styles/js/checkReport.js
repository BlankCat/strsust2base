function chooseChosenLawFirm()
{
	if(document.getElementById("lbChosenLawFirm").children.length==0){
		lbAllMove("lbLawFirm","lbChosenLawFirm");
	}
	var lb = document.getElementById("lbChosenLawFirm");
	for(var i=0;i<lb.length;i++)
	{
		lb.options[i].selected = true;
	}
	return true;
}
function lbMove(lbId1,lbId2)
{
	var lb1 = document.getElementById(lbId1);
	var lb2 = document.getElementById(lbId2);
	var lb1Length = lb1.length;

	for (var i=lb1Length-1;i>=0;i--)
	{
		if (lb1.options[i].selected)
		{
			
			var newText = lb1.options[i].text;
			var newValue = lb1.options[i].value;
			var lb2Length = lb2.length;
			lb2.options[lb2Length] = new Option(newText,newValue);
			lb1.options[i] = null;
			
		}
	}
	px(lbId1);
	
	
}
function lbMove2(lbId1,lbId2)
{
	var lb1 = document.getElementById(lbId1);
	var lb2 = document.getElementById(lbId2);
	var lb1Length = lb1.length;

	for (var i=lb1Length-1;i>=0;i--)
	{
		if (lb1.options[i].selected)
		{
			
			var newText = lb1.options[i].text;
			var newValue = lb1.options[i].value;
			var lb2Length = lb2.length;
			lb2.options[lb2Length] = new Option(newText,newValue);
			lb1.options[i] = null;
			
		}
	}
	px(lbId2);
	
	
	
}
function lbAllMove(lbId1,lbId2)
{
	var lb1 = document.getElementById(lbId1);
	var lb2 = document.getElementById(lbId2);
	var lb1Length = lb1.length;
	
	for (var i=lb1Length-1;i>=0;i--)
	{
		var newText = lb1.options[i].text;
		var newValue = lb1.options[i].value;
		var lb2Length = lb2.length;
		lb2.options[lb2Length] = new Option(newText,newValue);
		lb1.options[i] = null;
	}
	px(lbId2);
}
function SendDataToGetLawFirms()
{
	var ddlCity = document.getElementById("ddlCity");
	var cityId = ddlCity.value;
	var url = "/AJAX/GetLawFirmsByCity.aspx?cityid="+cityId;
	httpRequest("GET",url,true,new HandleResponseHeader());
}

function selectAll(so){
	
	var slt=document.getElementById(so);
	for(var i=0;i<slt.options.length;i++){
		slt.options[i].selected=true;
	}
	
	
	
	
	
	
}
function HandleResponseHeader()
{
	return temp;
	function temp(){
		var lb1 = document.getElementById("lbLawFirm");
		var lb2 = document.getElementById("lbChosenLawFirm");
		lb1.innerHTML = "";
		lb2.innerHTML = "";
		lb1.options.add(new Option("loading...","loading"));
		if(request.readyState == 4)
		{
			if(request.status == 200)
			{
				var json = eval(request.responseText);	
				lb1.innerHTML = "";
				for(obj in json)
				{
					lb1.options.add(new Option(json[obj]["lawyerofficename"],json[obj]["userid"]));
				}		
			}
		}
	}
}

//排序
function px(Id){
	
	var id1 = document.getElementById(Id);
	var id1Length = id1.length;
	var arr = new Array();
	for(var i=0;i<id1Length;i++)
	{
		arr[i]= id1.options[i].text + ":" +id1.options[i].value;
	}
	arr.sort();
	while(id1Length--)
	{
		id1.options[id1Length] = null;
	}
	for(i=0;i<arr.length;i++)
	{
		var num=arr[i].indexOf(':');
		var id1text=arr[i].substring(0,num);
		var id1value=arr[i].substring(num+1);
		id1.add(new Option(id1text,id1value));	
	}
}
function change(obj){
	if(obj==0){
		$("#year").show();
		$("#month").hide();
	}else{
		$("#year").hide();
		$("#month").show();
	}
}