<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<body>
	<!-- 注意登陆后，注册的emp在session里有，在reqeust也有，这里最好写上sessionScope -->
		<form id="houseinfo-form" method="post">
			<table style="margin:10px auto" cellpadding="5px" cellspacing="10px">
				<tr>
					<td>住宿单价:</td>
					<td>
						<input id="hprice" name="hprice" class="easyui-numberbox" 
						data-options="required:true,width:180" hidden="true"/>
					</td>
				</tr>
			
				<tr>
					<td>房间编号:</td>
					<td><input name="hnum" id="cc" class="easyui-combotree"
					 data-options="url:'${pageContext.request.contextPath }/houseinfo/getHouse',
					 required:true,
					 width:180,
					 <!-- 是否有下拉动画 -->
					 animate:true,
					 <!-- 是否加虚线 -->
					 lines:true,
					 onChange:function(){
					 	var hnum = $('#cc').combotree('getValue')
					 	$.ajax({
					 	   url: '${pageContext.request.contextPath }/houseinfo/getPrice',
					 	   data:'hnum='+hnum,
					 	   type:'post',
					 	   dataType:'json',
					 	   success:function(data){
					 	   		$('#hprice').numberbox('setValue',data);
					 	   }
 					 	});
					 }
					"/></td>
					 <!-- 加载结束后执行此方法，setValue要在setText上面，否则会被覆盖 -->
				</tr>
				<tr>
					<td>客户姓名:</td>
					<td><input name="name" class="easyui-textbox" 
					data-options="required:true,width:180"/></td>
				</tr>
				<tr>
					<td>身份证号:</td>
					<td><input name="card" class="easyui-textbox" 
					data-options="required:true,width:180,validType:'minLength[18]'"/></td>
				</tr>
				<tr>
					<td>入住时间:</td>
					<td><input id="st" name="starttime" class="easyui-datebox" 
					data-options="required:true,width:180"/></td>
				</tr>
				<tr>
					<td>退宿时间:</td>
					<td><input name="endtime" id="et" class="easyui-datebox" 
					data-options="required:true,width:180,onSelect:function(data){
						var st  = $('#st').datebox('getValue');
						var et = $('#et').datebox('getValue');
						if(st>et){
							alert('请注意日期区间')
							$('#et').datebox('clear')
						}else{
							var num = DateDiff(et,st);
							var days = $('#hprice').numberbox('getValue');
							$('#days').numberbox('setValue',num)
							$('#salary').numberbox('setValue',num*days)
						}
					}"/></td>
				</tr>
				<tr>
					<td>入住天数:</td>
					<td><input name="days" id="days" class="easyui-numberbox" 
					data-options="required:true,width:180" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>住宿总价:</td>
					<td>
						<input id="salary" name="total" class="easyui-numberbox" 
						data-options="required:true,width:180" readonly="readonly""/>
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			 function DateDiff(sDate1, sDate2) {    //sDate1和sDate2是2006-12-18格式  
	            var aDate, oDate1, oDate2, iDays
	            aDate = sDate1.split("-")
	            oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])    //转换为12-18-2006格式  
	            aDate = sDate2.split("-")
	            oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])
	            iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24)    //把相差的毫秒数转换为天数  
	            return iDays
	        }
		</script>
	</body>