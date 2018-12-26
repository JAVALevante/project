$(function(){
	$("a.opts").click(function(){
		//获取自定义元素
		var url = $(this).attr("url");
		if(url != undefined && url != null && url != ''){
			//这里选项卡加载的就是ifram的url的地址
			//嵌套Ifram而不用href的原因： 避免id相同的选项卡出现加载失败问题
			var option = {
				"url":'<iframe src="'+contextPath+url+'"  height="100%" width="100%" frameborder="0" scrolling="auto"></iframe>',
				"title":$(this).html()
			};
			tabs(option);
			
		}
	});
	// 判断密码是否一致   
	$.extend($.fn.validatebox.defaults.rules, {    
	    equals: {    
	        validator: function(value,param){    
	            return value == $(param[0]).val();    
	        },    
	        message: '密码不匹配'   
	    }    
	});
});
function tabs(option){
	//获取选项卡对象,--- 不是单独的选项卡，而是那一行蓝条，只是用它来调用方法用的~
	var tabs = $("#content");
	//根据选项卡的标题判断是否存在
	var exists = $(tabs).tabs("exists",option.title);
	if(exists){//选项卡存在，选中并刷新选项卡(刷新选项卡需要获取选中的选项卡)
		//选中点击的选项卡
		$(tabs).tabs("select",option.title);
		//获取指定的选项卡
		var tab = $(tabs).tabs("getTab",option.title);
		console.log($(tabs).title);
		//更新
		$(tabs).tabs("update",{
			tab : tab,
			options:{
				titel:option.title,
				content : option.url,
				closable:true
			}
		})
	}else{//不存在，添加选项卡
		$(tabs).tabs("add",{
			title:option.title,
			content:option.url,
			closable:true
		})
	}
	
}
function logout(){
	window.location.replace(contextPath+"/login/logout")
}
function updatePwd(){
	$("#updatePwd-dialog").dialog({
		title:'密码修改',
		width:400,
	    height: 200,  
	    closed: false,    
	    cache: false, 
		href:contextPath + "/pages/emp/updatePwd.jsp",
		modal:true,
		buttons:[{
			text:'更改',
		    iconCls:'icon-edit',
		    handler:function(){
		    	$("#emp-form").form("submit",{
		    		url:contextPath+"/emp/updatePwd",
		    		onSubmit:function(p){
		    			return $(this).form('validate');
		    		},
		    		success:function(rs){
		    			var data = $.parseJSON(rs);
		    			$("#updatePwd-dialog").dialog('close');
		    			$("#updatePwd-dialog").dialog('clear');
		    			if(data.code===500){
			    			$.messager.show({
								title:'提示',
								msg:data.msg,
								timeout:3000,
								showType:'slide'
							});
			    			return;
		    			}
		    			window.location.href = contextPath+"/";
		    			
		    		}
		    	})
		    }
		}]
	});
}