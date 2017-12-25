$(function(){
	
	$('.nav3').addClass('selected');
	
	$('.associations_content').hover(function(){
		$(this).addClass('hoverStyle');
		var heightVal = Math.ceil($(this).find('.associationList li').length/4);
		var animateNeed = heightVal > 2 ? true : false;
		heightVal = heightVal > 2 ? heightVal * 22 : 44;
		if(animateNeed) {
			$('.associationList').stop(false,true);
			$(this).parent().addClass('absolute');
			$(this).find('.associationList').animate({'height': heightVal + 'px','z-index':'30'},100);
		}
	},function(){
		var heightVal = Math.ceil($(this).find('.associationList li').length/4);
		if(heightVal > 2) {
			$('.associationList').stop(false,true);
			$(this).find('.associationList').animate({'height':'44px','z-index':'0'},100);
			$(this).parent().removeClass('absolute');
		}
		$(this).removeClass('hoverStyle');
	});
	
	// Dialog Link
	$('#cooperateLawyerAssociationDialog').click(function () {
    	$('#cooperateLawyerAssociationDialogWindow').dialog('open');
		return false;
	});
	$('#cooperateLawyerAssociationForm').validationEngine();
	// Dialog Simple
	$('#cooperateLawyerAssociationDialogWindow').dialog({
		autoOpen: false,
		closeOnEscape: true,
		resizable: false,
		title: '律协合作申请',
		width: 600,
		buttons: {
			"提交": function () {
				if ($('#cooperateLawyerAssociationForm').validationEngine('validate')) {
					var aidentity=$('#aidentity').val();
					var aorganization=$('#aorganization').val();
					var acontact=$('#acontact').val();
					var atel=$('#atel').val();
					var aemail=$('#aemail').val();
					var anumber=$('#anumber').val();
					var anote=$('#anote').val();
					var action=$('#cooperateLawyerAssociationForm').attr('action');
					$.post(action,{'aidentity':aidentity,'aorganization':aorganization,'acontact':acontact,
						'atel':atel,'aemail':aemail,'anumber':anumber,'anote':anote},function(){
						$("#reset").click();//触发reset按钮 } 
						alert('申请成功！');
					});
				$('#cooperateLawyerAssociationForm').validationEngine("hide");
		    	$(this).dialog("close");
				}
		    },
		    "取消": function () {
		    	$('#cooperateLawyerAssociationForm').validationEngine("hide");
		    	$("#reset").click();//触发reset按钮 } 
		    	$(this).dialog("close");
		    }
	    },
		close: function(event, ui){
			$('#cooperateLawyerAssociationForm').validationEngine('hide');
			$("#reset").click();//触发reset按钮 } 
	    	$(this).dialog("close");
		}

	});
	

	
});