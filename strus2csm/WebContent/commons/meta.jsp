<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>

<!-- optional javascript: effects.js,jquery.js -->
	<link href="<c:url value="/styles/css/global.css"/>" type="text/css" rel="stylesheet">

<!-- rapid-validation BEGIN-->
	<link href="<c:url value="/widgets/rapid-validation/validation.css"/>" type="text/css" rel="stylesheet">
	<script src="<c:url value="/widgets/rapid-validation/prototype_for_validation.js"/>" type="text/javascript"></script>
	
	<!-- 
	<script src="<c:url value="/widgets/rapid-validation/effects.js"/>" type="text/javascript"></script>
	-->
	
	<!-- show validation error as tooptips -->
	<script src="<c:url value="/widgets/rapid-validation/tooltips.js"/>" type="text/javascript"></script>
	<link href="<c:url value="/widgets/rapid-validation/tooltips.css"/>" type="text/css" rel="stylesheet">
	
	<script src="<c:url value="/widgets/rapid-validation/validation_cn.js"/>" type="text/javascript"></script>
<!-- rapid-validation END-->

<script src="<c:url value="/styles/js/application.js"/>" type="text/javascript"></script>

<script src="<c:url value="/widgets/My97DatePicker/WdatePicker.js"/>" type="text/javascript"></script>
<script src="<c:url value="/styles/js/jquery.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		
		jQuery("input[type=text]").addClass("max-length-50");
	
	});
</script>