
/*显示课程*/
function showCourse(obj){
	$("#courseUl").empty();
	var courseIds = $(obj).val();
	if(courseIds!=null&&$.trim(courseIds)!=""){
		/*去后台查询*/
		$.getJSON(ctx+"/admin/DjCourse/showCourse.do",{"courseIds":courseIds}, function( data) {
			$.each(data,function(i,item){
				var course = " <font color = red class=error>没有该课程!请检查该课程ID是否正确 </font>";
				if( "NONE"!= $.trim(item.courseName)){
					course = " 课程名称: "+item.courseName;
				}
				var li = "<li>"+
		 			 	 "<div>课程ID: "+item.courseId+course+"</div>"+
		 			 	 "</li>";
				$("#courseUl").append(li);
			});
		});
	}
}

/*显示老师*/
function showTeacher(obj){
	$("#teacherUl").empty();
	var teacherIds = $(obj).val();
	if(teacherIds!=null&&$.trim(teacherIds)!=""){
		/*去后台查询*/
		$.getJSON(ctx+"/admin/DjTeacher/showTeacher.do",{"teacherIds":teacherIds}, function( data) {
			$.each(data,function(i,item){
				var teacher = " <font color = red class=error>没有该老师信息!请检查该教室编号是否正确 </font>";
				if( "NONE"!= $.trim(item.tchName)){
					teacher = " 教师姓名: "+item.tchName;
				}
				var li = "<li>"+
		 			 	 "<div>老师ID: "+item.teacherId+teacher+"</div>"+
		 			 	 "</li>";
				$("#teacherUl").append(li);
			});
		});
	}
}

function choose(){
	var ks = $("#ks");
	if(ks.attr("readonly")){
		ks.attr("readonly","");
	}else{
		ks.attr("readonly","readonly");
	}
}