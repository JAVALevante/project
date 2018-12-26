$(function(){	
	$("#houseinfo-list").datagrid({
		url: contextPath+ '/houseinfo/query',
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
		   {title:'客户姓名',field:'name',align:'center',width:60},
		   {title:'入住时间',field:'starttime',align:'center',width:60},
		   {title:'退房时间',field:'endtime',align:'center',width:60},
		   {title:'入住天数',field:'days',align:'center',width:60},
		   {title:'总价',field:'total',align:'center',width:60},
		   {title:'登记时间',field:'dengjitime',align:'center',width:60},
		   {title:'是否退宿',field:'status',align:'center',width:60,formatter:function(value,row,index){
			   if(value===0){
				   return "否"
			   }else{
				   return "是"
			   }
		   }},
		   {title:'操作',field:'aaaa',align:'center',width:60,formatter:function(value,row,index){
			   return "<a href='#'  id='update' onclick=shijian.update("+ row.id +",'"+row.hnum+"') class='easyui-linkbutton'> 退房 </a>"
		   }},
		   ]],
		   toolbar:'#houseinfo-list-toolbar'
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
			$("#houseinfo-dialog").dialog({
				title: '添加信息',    
			    width: 550,    
			    height: 350,    
			    closed: false,    
			    cache: false,  
			    href: contextPath+'/houseinfo/houseinfoAddAndUpdate',    
			    //遮罩层
			    modal: true,
			    buttons:[{
					text:'添加',
					iconCls:'icon-ok',
					handler:function(){
						$("#houseinfo-form").form("submit",{
							url:contextPath+'/houseinfo/add',
							onSubmit:function(p){
								return $(this).form('validate');
							},
							success:function(result){
								var data = $.parseJSON(result);
								if(data.code === 200){
									//成功后关闭窗口
									$("#houseinfo-dialog").dialog('close');
									//清除窗口信息
									$("#houseinfo-dialog").dialog('clear');
									$.messager.show({
										title:'提示',
										msg:data.msg,
										timeout:5000,
										showType:'slide'
									});
									$("#houseinfo-list").datagrid("reload");
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
		update:function(value,value2){
			$.messager.confirm('确认','确认退宿吗？？',function(r){    
			    //点击确认时，r为true
				if (r){
			        $.ajax({
			        	url:contextPath+"/houseinfo/update",
			        	data:"id="+value+"&status=1&hnum="+value2,
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
			        		$("#houseinfo-list").datagrid("reload");
			        	}
			        })
			    }    
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
            var reg = /[A-Z].*\d[0-9]{2,3}$/;    
            return reg.test(value)
        },    
        message: '房间编号为大写英文字母+3位数字'   
    }    
}); 
$.extend($.fn.validatebox.defaults.rules, {    
    minLength: {    
        validator: function(value, param){    
            return value.length >= param[0];    
        },    
        message: 'Please enter at least {0} characters.'   
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