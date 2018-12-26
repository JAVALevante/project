<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<body>
	<!-- 注意登陆后，注册的emp在session里有，在reqeust也有，这里最好写上sessionScope -->
		<form id="house-form" method="post">
			<table style="margin:10px auto" cellpadding="5px" cellspacing="10px">
				<c:choose>
					<c:when test="${empty house.hnum}">
						<tr>
					<td>房间号:</td>
					<td><input name="hnum" class="easyui-textbox" 
					data-options="required:true,width:180,validType:'num'"  value="${house.hnum}"/></td>
				</tr>
				<tr>
					<td>房间种类:</td>
					<td><input id="ca" name="hcategory" class="easyui-combobox" 
					 onchange="updateprice(this.value)"
					data-options="required:true,width:180,
						valueField: 'label',
						textField: 'value',
						data: [{
							label: '标准间',
							value: '标准间'
							},{
							label: '单人间',
							value: '单人间'
							},{
							label: '大床房',
							value: '大床房'
							}],
							panelHeight:null,
							onSelect:function(value){
								if(value.value=='标准间'){
									$('#salary').numberbox('setValue',100)
								}else if(value.value=='单人间'){
									$('#salary').numberbox('setValue',80)
								}else if(value.value=='大床房'){
								  $('#salary').numberbox('setValue',150)
								}
								
							}"  value="${house.hcategory}"
							/>
					</td>
				</tr>
				<tr>
					<td>住宿单价:</td>
					<td>
						<input id="salary" name="hprice" class="easyui-numberbox" 
						data-options="required:true,width:180" readonly="readonly" value="${house.hprice}"/>
					</td>
				</tr>
				<tr>
					<td>房间设备:</td>
					<td>
						 <input type="checkbox" value="网络"
             				name="hequip">网络
				        <input type="checkbox" value="电脑"
				               name="hequip">电脑
				        <input type="checkbox" value="书桌"
				               name="hequip" >书桌
				        <input type="checkbox" value="电视"
				               name="hequip" >电视
			
					</td>
				</tr>
					</c:when>
				
				<c:otherwise>
					<tr>
					<td>房间号:</td>
					<td><input name="hnum" class="easyui-textbox" 
					data-options="required:true,width:180,validType:'num'"  value="${house.hnum}" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>房间种类:</td>
					<td><input id="ca" name="hcategory" class="easyui-combobox" 
					 onchange="updateprice(this.value)"
					data-options="required:true,width:180,
						valueField: 'label',
						textField: 'value',
						data: [{
							label: '标准间',
							value: '标准间'
							},{
							label: '单人间',
							value: '单人间'
							},{
							label: '大床房',
							value: '大床房'
							}],
							panelHeight:null,
							onSelect:function(value){
								if(value.value=='标准间'){
									$('#salary').numberbox('setValue',100)
								}else if(value.value=='单人间'){
									$('#salary').numberbox('setValue',80)
								}else if(value.value=='大床房'){
								  $('#salary').numberbox('setValue',150)
								}
								
							}"  value="${house.hcategory}"
							 disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td>住宿单价:</td>
					<td>
						<input id="salary" name="hprice" class="easyui-numberbox" 
						data-options="required:true,width:180"  value="${house.hprice}" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td>房间设备:</td>
					<td>
						 <input type="checkbox" value="网络"
             				name="hequip">网络
				        <input type="checkbox" value="电脑"
				               name="hequip">电脑
				        <input type="checkbox" value="书桌"
				               name="hequip" >书桌
				        <input type="checkbox" value="电视"
				               name="hequip" >电视
			
					</td>
				</tr>
				</c:otherwise>
				</c:choose>
			</table>
		</form>
		<script type="text/javascript">
			$(function(){
				debugger
				var msg = '${house.hequip}'
				var checkBoxAll =$("input[name='hequip']");//获取前缀为checkbox_的所有多选框对象
				var checkArray = msg.split(",");
				 console.log(checkArray)
				 for(var i=0;i<checkArray.length;i++){//
			 //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
					    $.each(checkBoxAll,function(j,checkbox){
					        //获取复选框的value属性
					       var checkValue=$(checkbox).val();
					        if(checkArray[i]==checkValue){
					               $(checkbox).attr("checked",true);
					         }
					    })
				}
			})
		</script>
	</body>