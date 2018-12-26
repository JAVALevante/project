<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<body>
			<table style="margin:10px auto" cellpadding="5px" cellspacing="10px">
				<tr>
					<td>房间号:</td>
					<td><input id="hnum" name="hnum" class="easyui-textbox" 
					data-options="width:180"/></td>
				</tr>
				<tr>
					<td>最低价格:</td>
					<td><input id="starthprice" name="starthprice" class="easyui-numberbox" 
					data-options="width:180"/></td>
				</tr>
				<tr>
					<td>最高价格:</td>
					<td><input id="endhprice" name="endhprice" class="easyui-numberbox" 
					data-options="width:180,onChange:function(data){
							debugger
							var sprice = $('#starthprice').numberbox('getValue')
							var endhprice = $('#endhprice').numberbox('getValue')
							var s1 = parseInt(sprice)
							var s2 = parseInt(endhprice)
							if(s1 > s2){
								alert('注意价格区间')
								$('#starthprice').numberbox('clear')
								$('#endhprice').numberbox('clear')
							}
						}"/></td>
				</tr>
				
			</table>
			<script type="text/javascript">
					function yanzheng1(value){
						console.log("AAAAAAAAAAAAA")
						console.log(value)
					}
			</script>
	</body>