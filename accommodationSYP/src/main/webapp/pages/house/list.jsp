<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/easyui/include.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/house/list.js"></script>
</head>
	<body>
		<table id="house-list"></table>
		<!-- 员工列表工具栏 -->
		<div id="house-list-toolbar">
			<a  href="javascript:void(0)" class="easyui-linkbutton" onclick="shijian.add()" data-options="iconCls:'icon-add'">新增</a> 
			<a  href="javascript:void(0)" class="easyui-linkbutton" onclick="shijian.query()" data-options="iconCls:'icon-search',plain:true">查询</a>
		</div>
		<!-- 模糊查询页面 -->
		<div id="house-dialog"></div>
	</body>
</html>