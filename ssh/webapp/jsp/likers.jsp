<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>欢迎来到老司机豪车网站</title>
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min-myhouse.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/font-awesome.min-myhouse.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/linearicons-myhouse.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style-myhouse.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/responsive-myhouse.css"
	rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		var num = 6;//每页显示多少条数据，暂定设为6.
		var page;//总页数
		var now_page = 1;//当前页数
		$.ajax({
			url : "/ssh/findLiker.mvc",/*获取自己后台对应的url*/
			type : "post",
			data : {
			
			},
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				/*主体代码*/
				if (data.length % num == 0) {
					page = data.length / num;
					/*数据长度是6的倍数，直接取商作为总页数*/
				} else {
					page = Math.ceil(data.length / num);
					/*数据长度不是6的倍数，用ceil()函数向上取整*/
				}
				var index = num;
				/*此时index和num都为6*/
				dataDisplay(data, 0, index);
				/*默认第一页显示第0条到第index条数据*/
				/*------------------------------------------------------------------------------*/
				$("#right").click(function() {
					now_page++; /*每次点击下一页，页数+1*/
					$("#page").text(now_page);/*改变分页按钮上显示的页数*/
					if (now_page + 1 > page) {
						$("#right").attr('disabled', "true");
						/*如果是最后一页，就禁用a标签*/
					} else {
						$("#right").removeAttr("disabled");
						/*如果不是最后一页，就重新启用a标签*/
					}

					if (now_page - 1 < 1) {
						$("#left").attr('disabled', "true");
						/*如果是第一页，就禁用a标签*/
					} else {
						$("#left").removeAttr("disabled");
						/*如果不是第一页，就重新启用a标签*/
					}
					$("#tbody").empty();/*清空上一页显示的数据*/
					dataDisplay(data, index, index = index + num);
					/*显示新一页的数据，*/
				});

				$("#left").click(
						function() {
							now_page--;/*每次点击上一页，页数-1*/
							$("#page").text(now_page); //改变分页按钮上显示的页数
							if (now_page - 1 < 1) {
								$("#left").attr('disabled', "true");
								/*如果是第一页，就禁用a标签*/
							} else {
								$("#left").removeAttr("disabled");
								/*如果不是第一页，就重新启用a标签*/
							}

							if (now_page + 1 > page) {
								$("#right").attr('disabled', "true");
								/*如果是最后一页，就禁用a标签*/
							} else {
								$("#right").removeAttr("disabled");
								/*如果不是最后一页，就重新启用a标签*/
							}
							$("#tbody").empty();/*清空上一页显示的数据*/
							dataDisplay(data, index = index - 2 * num,
									index = index + num);
							/*显示新一页的数据，*/
						}); 
			}
		});
});

	function dataDisplay(result, begin, end) {
		var str;
		for (var i = begin; i < end; i++) {
			/*用拼接字符串的方式，把数据动态添加到前端页面的表格上*/
			str =  "<div style='width:360px;height:400px;float:left;margin-left:22px;'><img style='width:360px;height:230px;float:left;' src='${pageContext.request.contextPath}"+result[i].h_url+"'/>"
			+ "<p><span style='font-size:30px;font-weight:bold;'>&nbsp;&nbsp;"+ result[i].h_name + "</span>"
			+ "<span style='margin-left:15px;font-size:15px;'>&nbsp;&nbsp;&nbsp;&nbsp;出售方式："+ result[i].h_RB + "</span></p>"
			+ "<p><span style='margin-left:15px;font-size:15px;'>关注者："+ result[i].b_name + "</span>"
			+ "<span style='margin-left:15px;font-size:15px;'>|&nbsp;&nbsp;&nbsp;性别："+ result[i].b_gender + "</span></p>"
			+ "<p style='margin-left:15px;font-size:15px;'>联系方式："+ result[i].b_telephone + "</p>"
			+ "<p style='margin-left:15px;font-size:15px;'>买家留言："+ result[i].b_message + "</p></div>";
			$("#tbody").append(str);
			
		}
	}
</script>
</head>
<body>


	<!-- page header -->
	<section class="page-header">
	<div class="page-header-overlay">
		<div class="container">
			<div class="row">
				<div class="section-title col-md-offset-3 col-md-6 text-center">
					<h2>关 注 我 的 人</h2>
					<p>这里陈列出所有关注您的爱车的人，您可以通过查看这些人的喜好，向他们推荐你拥有的车辆， 并与他们联系。</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- menu row -->
	<section class="menu-row">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="menu-link">
					<div class="well well-lg page-label">
						<h3 class="pull-left">关 注 我 的</h3>
						<ul class="list-inline pull-right">
							<li><a href="${pageContext.request.contextPath}/index.jsp">首
									页</a></li>
							<li><i class="fa fa-angle-double-right"></i></li>
							<li><a href="${pageContext.request.contextPath}/jsp/salerOfHouse.jsp">车 辆 列 表</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- blog post -->
	<section>
	<div class="container">
		<div class="row m-30">
			<%-- <c:if test="${not empty likers}">
				<c:forEach items="${likers}" var="liker">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="single-post">
							<div class="post-img">
								<img src="${liker.h_url}" width="100%" alt="房子" />
							</div>
							<p style="color:RGB(89,89,89);font-size: 20px;">
								<span>${liker.h_name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>销售方式：${liker.h_RB}</span>
							</p>
							<p>姓名：${liker.b_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：${liker.b_gender}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式：${liker.b_telephone}</p>
							<p>买 家 留 言 ：${liker.b_message}</p>
						</div>
					</div>
				</c:forEach>
			</c:if> --%>
			<div>
				<div id="tbody" >

				</div>
			</div>
	        <div style="position:absolute;bottom:-500px;left:590px;">
				<ul class="pagination">
					<li><a style="color:rgb(234,44,88);border: 1px solid rgb(234,44,88);" id="left" href="javascript:;">上一页</a></li>
					<li class="active"><a style="background-color:rgb(234,44,88);border: 1px solid rgb(234,44,88); " id="page" href="javascript:;">1</a></li>
					<li><a style="color:rgb(234,44,88);border: 1px solid rgb(234,44,88);" id="right" href="javascript:;">下一页</a></li>
				</ul>
			</div>
		</div>
		<!-- blog post row -->
	</div>
	</section>
	<!-- Middle footer -->
	<section class="middle-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-xs-12 text-center">
				<div>
					<a class="site-title" href="index.html">Buy<span>&RENT</span></a>
					<p class="m-f-p">版权所有：O&H科技有限公司 地址：山东省青岛市青岛大学
						咨询热线：4008-823-823，17865421702 备案号：鲁ICP备11027744号-2
						公安机关备案号：鲁公网安备41010502002091号</p>
				</div>
				<ul class="list-inline social-icon">
					<li><i class=" fa fa-facebook"></i></li>
					<li><i class=" fa fa-google-plus"></i></li>
					<li><i class=" fa fa-linkedin"></i></li>
					<li><i class=" fa fa-twitter"></i></li>
					<li><i class=" fa fa-skype"></i></li>
				</ul>
				<ul class="list-inline address">
					<li><i class=" lnr lnr-home"></i>山东省青岛市青岛大学</li>
					<li><i class=" lnr lnr-envelope"></i>951021432@qq.com</li>
					<li><i class=" lnr lnr-phone-handset"></i>4008-823-823，17865421702
					</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
	<!-- bottom footer -->
	<footer class="bottom-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6 col-xs-12 text-center">
				<p class="copyright">&copy; 2018 O&HINDEX.COM All Rights
					Reserved</p>
			</div>
		</div>
	</div>
	</footer>
	<!--======== All Javascript =========-->
	<script
		src="${pageContext.request.contextPath}/js/jquery-2.1.1-myhouse.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.min-myhouse.js"></script>
</body>
</html>