<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/easyui/include.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	#center{
		background-image:url("../js/aaa.jpg");	
		background-size:390px 300px;
	}
	#north{
		background-image:url("../js/aaa.jpg");
		background-size:100px 140px;
	}
</style>
</head>
	<body>
		<div class="easyui-layout" data-options="fit:true">   
   			<div id="north" data-options="region:'north',height:80">
   				<div style="float:right;margin-right: 50px;line-height:78px">
   					<span>欢迎：${e.ename}</span>
   					<span><a href="javascript:void(0)" onclick="logout()">退出</a></span>
   					<span><a href="javascript:void(0)" onclick="updatePwd()">修改密码</a></span>
   				</div>
   			</div>   
    		<div data-options="region:'west',title:'菜单',split:true,width:200">
    			<div id="aa" class="easyui-accordion" data-options="fit:true">   
	    			<div title="系统权限">   
	       			 	<ul class="easyui-tree">
	       			 		<li><a class="opts" url="/pages/index.jsp">用户权限</a></li>
	       			 		<li><a class="opts">角色权限</a></li>
	       			 		<li><a class="opts">访问权限</a></li>
	       			 	</ul>
	    			</div>   
	    			<div title="员工管理"> 
	    				<ul class="easyui-tree">
	    					<!-- url：自定义属性~~ -->
	       			 		<li><a class="opts" url="/house/list">房间信息管理</a></li> 
	       			 		<li><a class="opts" url="/houseinfo/list">入住信息管理</a></li> 
	       			 	</ul>  
	    			</div>  

				</div>  
    			
    		</div>   
    		<div id="center" data-options="region:'center'">
    			<div id="content" class="easyui-tabs" data-options="fit:true"></div>
    		</div>   
		</div>  
		<div id="updatePwd-dialog"></div>
	</body>
</html>