$(function(){	
	$("#house-list").datagrid({
		url: contextPath+ '/house/query',
		method:'post',
		loadMsg:'郑老刁正在套猴子，请耐心等待~~~',
		striped:true,
		pagination:true,
		rownumbers:true,
		pageNumber:1,
		pageSize:4,
		pageList:[4,8,16,32],
		fit:true,
		fitColumns:true,
		columns :[[
		   {title:'主键ID',field:'id',checkbox:true},
		   {title:'房间号',field:'hnum',align:'center',width:60},
		   {title:'房间种类',field:'hcategory',align:'center',width:60},
		   {title:'房间单价',field:'hprice',align:'center',width:60},
		   {title:'房间设备',field:'hequip',align:'center',width:60/*,formatter:function(value,row,index){
			  
		   }*/},
		   {title:'房间状态',field:'hstatus',align:'center',width:60,formatter:function(value,row,index){
			   if(value===0){
				   return '空闲'
			   }else{
				   return "已预定";
			   }
		   }},
		   
		   {title:'操作',field:'aaaa',align:'center',width:60,formatter:function(value,row,index){
			   return "<a href='#'  id='update' onclick='shijian.update("+ row.id +")' class='easyui-linkbutton'> 修改 </a>"+
			   "<a href='#'  id='delete' onclick='shijian.remove("+ row.id +")' class='easyui-linkbutton'> 删除 </a>"
		   }},
		   ]],
		   toolbar:'#house-list-toolbar'
	});
	
	
});

var shijian = {
		query:function(){
			$("#house-dialog").dialog({
				title: '房间查询',    
			    width: 550,    
			    height: 350,    
			    closed: false,    
			    cache: false, 
			    href: contextPath+'/pages/house/query.jsp',  
			    modal:true,
			    buttons:[{
			    	text:'查询',
			    	iconCls:'icon-ok',
			    	handler:function(){
			    		$("#house-list").datagrid("load",{
			    			hnum : $("#hnum").textbox("getValue"),
			    			starthprice : $("#starthprice").numberbox("getValue"),
			    			endhprice : $("#endhprice").numberbox("getValue")
			    		});
			    		$("#house-dialog").dialog("close");
			    		$("#house-dialog").dialog("clear")
			    	}
			    }]
			})
		},
		add:function(){
			$("#house-dialog").dialog({
				title: '添加房屋',    
			    width: 550,    
			    height: 350,    
			    closed: false,    
			    cache: false,  
			    href: contextPath+'/house/houseAddAndUpdate',    
			    //遮罩层
			    modal: true,
			    buttons:[{
					text:'添加',
					iconCls:'icon-ok',
					handler:function(){
						$("#house-form").form("submit",{
							url:contextPath+'/house/add',
							onSubmit:function(p){
								return $(this).form('validate');
							},
							success:function(result){
								var data = $.parseJSON(result);
								if(data.code === 200){
									//成功后关闭窗口
									$("#house-dialog").dialog('close');
									//清除窗口信息
									$("#house-dialog").dialog('clear');
									$.messager.show({
										title:'提示',
										msg:data.msg,
										timeout:5000,
										showType:'slide'
									});
									$("#house-list").datagrid("reload");
								}
								if(data.code === 500){	
									//清除窗口信息
									$.messager.show({
										title:'提示',
										msg:data.msg,
										timeout:5000,
										showType:'slide'
									});
								}
								
							}
						})
					}
				}]
			});
		},
		update:function(value){
			$("#house-dialog").dialog({
				title: '更新',    
			    width: 550,    
			    height: 350,    
			    closed: false,    
			    cache: false, 
			    href: contextPath+'/house/houseAddAndUpdate?id=' + value,  
			    modal:true,
			    buttons:[{
			    	text:'更新',
			    	iconCls:'icon-edit',
			    	handler:function(){
			    		$("#house-form").form("submit",{
			    			url:contextPath+"/house/update",
			    			onSubmit:function(p){
			    				p.id = value
			    				return $(this).form("validate")
			    			},
			    			success:function(rs){
			    				var data = $.parseJSON(rs);
								if(data.code === 200){
									//成功后关闭窗口
									$("#house-dialog").dialog('close');
									//清除窗口信息
									$("#house-dialog").dialog('clear');
									$("#house-list").datagrid("reload");
									$.messager.show({
										title:'提示',
										msg:data.msg,
										timeout:5000,
										showType:'slide'
									});
								}
								if(data.code === 500){	
									//清除窗口信息
									$.messager.show({
										title:'提示',
										msg:data.msg,
										timeout:5000,
										showType:'slide'
									});
								}
			    			}
			    		});
			    	}
			    }]
			});
		},
		remove:function(value){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    //点击确认时，r为true
				if (r){
			        $.ajax({
			        	url:contextPath+"/house/remove",
			        	data:"id="+value,
			        	dataType:'json',
			        	method:'post',
			        	success:function(data){
			        		console.log(data);
			        		$.messager.show({
								title:'提示',
								msg:data.msg,
								timeout:5000,
								showType:'slide'
							});
			        		$("#house-list").datagrid("reload");
			        	}
			        })
			    }    
			});
		}
	};

$.extend($.fn.validatebox.defaults.rules, {    
    num: {    
        validator: function(value, param){    
            var reg = /^[A-Z][1-9]\d{2}$/;    
            return reg.test(value)
        },    
        message: '房间编号为大写英文字母+3位数字'   
    }    
}); 

/*$.extend($.fn.validatebox.defaults.rules, {    
    bj: {    
        validator: function(value, param){    
            return value >= $(param[0]).val();    
        },    
        message: '注意价格区间'   
    }    
}); */
/*
function add(){
	var sal = $("#salary").textbox("getValue");
	var sal = parseInt(sal);
	$("#salary").textbox("setValue",sal+100);
}
function substract(){
	var sal = $("#salary").textbox("getValue");
	var sal = parseInt(sal);
	if(sal>=100){
		$("#salary").textbox("setValue",sal-100);
	}	
}
function deleteById(id,salary){
	$("#emp-dialog").dialog({
		title: '工资更新',    
	    width: 550,    
	    height: 350,    
	    closed: false,    
	    cache: false, 
	    href: contextPath+'/emp/updateSalary?salary='+salary,  
	    modal:true,
	    buttons:[{
	    	text:'更改',
			iconCls:'icon-ok',
			handler:function(){
				$("#emp-salary").form("submit",{
	    			url:contextPath+"/emp/updateSalarya",
	    			onSubmit:function(p){
	    				p.id = id;
	    				return $(this).form("validate")
	    			},
	    			success:function(rs){
	    				var data = $.parseJSON(rs);
						if(data.code === 200){
							//成功后关闭窗口
							$("#emp-dialog").dialog('close');
							//清除窗口信息
							$("#emp-dialog").dialog('clear');
							$("#emp-list").datagrid("reload");
							$.messager.show({
								title:'提示',
								msg:data.msg,
								timeout:5000,
								showType:'slide'
							});
						}
	    			}
	    		});
			}
	    }]
	});
}*/