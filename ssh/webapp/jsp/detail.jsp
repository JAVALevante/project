<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车辆详情</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min-myhouse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min-myhouse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/linearicons-myhouse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style-myhouse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive-myhouse.css" rel="stylesheet">

<style type="text/css">
input:hover {
	background-color: rgb(230, 230, 230);
}
</style>

</head>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
	function show() {
		$("#submit").css("display", "block");
		$(".input").attr("disabled", false);
		$(".input").css("border", "1px solid gray");
		$("#btn").css("display", "none");
		$("#btn2").css("display", "block");
	}
	function show2() {
		$("#submit").css("display", "none");
		$(".input").attr("disabled", true);
		$(".input").css("border", "0px");
		$("#btn").css("display", "block");
		$("#btn2").css("display", "none");
	}
</script>
<body>
	<%
		String h_name = request.getParameter("h_name");
		String h_info = request.getParameter("h_info");
		String h_province = request.getParameter("h_province");
		String h_city = request.getParameter("h_city");
		String h_distric = request.getParameter("h_distric");
		Double h_area = Double.parseDouble(request.getParameter("h_area"));
		String h_type = request.getParameter("h_type");
		String h_date = request.getParameter("h_date");
		Double h_money = Double.parseDouble(request.getParameter("h_money"));
		String h_RB = request.getParameter("h_RB");
		Integer h_id = Integer.valueOf(request.getParameter("h_id"));
		String h_design = request.getParameter("h_design");
		String h_url = request.getParameter("h_url");
		request.setAttribute("h_area", h_area);
		request.setAttribute("h_province", h_province);
		request.setAttribute("h_city", h_city);
		request.setAttribute("h_distric", h_distric);
		request.setAttribute("h_design", h_design);
		request.setAttribute("h_info", h_info);
		request.setAttribute("h_money", h_money);
		request.setAttribute("h_name", h_name);
		request.setAttribute("h_RB", h_RB);
		request.setAttribute("h_type", h_type);
		request.setAttribute("h_url", h_url);
		request.setAttribute("h_date", h_date);
		request.setAttribute("h_id", h_id);
	%>

	<!-- page header -->
	<section class="page-header">
	<div class="page-header-overlay">
		<div class="container">
			<div class="row">
				<div class="section-title col-md-offset-3 col-md-6 text-center">
					<h2>${h_name}</h2>
					<p>${h_info}</p>
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
						<h3 class="pull-left">车  辆 详 情</h3>
						<ul class="list-inline pull-right">
							<li>
								<a href="${pageContext.request.contextPath}/jsp/BuyNewSearch.jsp">新车</a>
							</li>
							<li>
								<i class="fa fa-angle-double-right"></i>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/jsp/RentSearch.jsp">租车</a>
							</li>
							<li>
								<i class="fa fa-angle-double-right"></i>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/jsp/BuyResoldSearch.jsp">二手车</a>
							</li>
							<li>
								<i class="fa fa-angle-double-right"></i>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- Single Product -->
	<section class="single-product">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6 col-xs-12">
				<div style="height: 500px; width: 450px;" class="single-product-img">
					<img style="height: 500px; width: 450px;" class="img-responsive"
						src="${pageContext.request.contextPath}${h_url}" alt="车辆图片" />
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/updateHouse.mvc">
				<div style="margin-left: 110px;" class="col-md-6 col-sm-6 col-xs-12">

					<div class="single-product-detail">
						<h2>
							<input class="input" style="border: 0px; background-color: white; width: 200px;"
								disabled="disabled" type="text" value="${h_name}" name="h_name" />
						</h2>
						<ul class="list-inline">
							<li>
								<i class="lnr lnr-star"></i>
							</li>
							<li>
								<i class="lnr lnr-star"></i>
							</li>
							<li>
								<i class="lnr lnr-star"></i>
							</li>
							<li>
								<i class="lnr lnr-star"></i>
							</li>
							<li>
								<i class="lnr lnr-star-half"></i>
							</li>
							<li>
								<span style="color: rgb(51, 51, 51);">品质保障</span>
							</li>
						</ul>

						<p style="color: rgb(51, 51, 51); font-weight: bold; font-style: normal;">
							所在地区：
							<input class="input" style="border: 0px; background-color: white; width: 50px;"
								disabled="disabled" type="text" value="${h_province}" name="h_province" />
							&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
							<input class="input" style="border: 0px; background-color: white; width: 50px;"
								disabled="disabled" type="text" value="${h_city}" name="h_city" />
							&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
							<input class="input" style="border: 0px; background-color: white; width: 50px;"
								disabled="disabled" type="text" value="${h_distric}" name="h_distric" />
						</p>
						<p style="color: rgb(51, 51, 51); font-weight: bold; font-style: normal;">
							排量：
							<span style="font-size: 25px;">
								<input class="input" style="border: 0px; background-color: white; width: 40px;"
									disabled="disabled" type="text" value="${h_area}" name="h_area" />
							</span>
							升&nbsp;&nbsp;&nbsp;&nbsp; 车型：${h_type}
						</p>
						<p style="color: rgb(51, 51, 51); font-weight: bold; font-style: normal;">
							<c:if test="${h_RB == '二手'}">
                             			销售方式：出售
                             		</c:if>
							<c:if test="${h_RB == '租'}">
                             			销售方式：出租
                             		</c:if>
						</p>
						<p style="color: rgb(51, 51, 51); font-weight: bold; font-style: normal;">
							简介：
							<input class="input" style="border: 0px; background-color: white;" disabled="disabled"
								type="text" value="${h_info}" name="h_info" />
						</p>

						<div style="border: 0px; margin-left: -12px;" class="table table-responsive table-bordered">
							<ul class="list-inline">
								<li class="yellow">${h_design}</li>
								<li class="red">里程小于10km</li>
								<li class="black">随时试车</li>
							</ul>
						</div>
						<div class="price">
							<p style="color: rgb(51, 51, 51); font-weight: bold; font-style: normal; margin-top: -10px;">
								<c:if test="${h_RB == '二手'}">
                             			总价：￥<span style="font-size: 40px;">
										<input class="input"
											style="border: 0px; background-color: white; height: 60px; width: 150px;"
											disabled="disabled" type="text" value="${h_money}" name="h_money" />
									</span>万
                             		</c:if>
								<c:if test="${h_RB == '租'}">
									<span style="font-size: 40px;">
										<input class="input"
											style="border: 0px; background-color: white; height: 60px; width: 150px;"
											disabled="disabled" type="text" value="${h_money}" name="h_money" />
									</span>/月
                             		</c:if>
							</p>
						</div>
						
						<br />
						<div style="margin-top: 5px;" class="add-cart">
							<input id="submit" class="btn btn-default"
								style="background-color: rgb(234, 44, 88); border: 0px; font-size: 15px; display: none; margin-left: 120px; margin-left: 120px;"
								type="submit" value="提交">
						</div>

						<input type="hidden" value="${h_id}" name="h_id" />
					</div>
				</div>
			</form>

		</div>
		<input type="button"
			style="width: 100px; height: 40px; margin-left: 500px; margin-top: -60px; z-index: 8"
			class="btn btn-default" id="btn" value="BY O&H" onclick="show()" />
		<input type="button"
			style="width: 100px; height: 40px; margin-left: 500px; margin-top: -60px; z-index: 1; display: none;"
			class="btn btn-default" id="btn2" value="取消修改" onclick="show2()" />

	</div>
	</section>


	<!-- Product description -->
	<section class="single-description">
	<div cl class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 ">
				<div class="description-tab">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="#tab1" aria-controls="home" role="tab" data-toggle="tab">基本属性</a>
						</li>
						<li role="presentation">
							<a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Question</a>
						</li>
						<li role="presentation">
							<a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">About</a>
						</li>
						<li role="presentation">
							<a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">Review</a>
						</li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="tab1">
							<h3>
							敢为英雄
圆润流线尽展夺目丰姿；动态操控选择控制器，五种驾驶模式掌控人生起伏；创新豪华内饰彰显率性气质。
							</h3>
							<p></p>
						</div>
						<div role="tabpanel" class="tab-pane" id="tab2">
							<h3></h3>
							<p></p>
						</div>
						<div role="tabpanel" class="tab-pane" id="tab3">
							<h3></h3>
							<p></p>
						</div>
						<div role="tabpanel" class="tab-pane" id="tab4">
							<h3></h3>
							<p></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>




	<br />
	<br />
	<!-- Middle footer -->
	<section class="middle-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-xs-12 text-center">
				<div>
					<a class="site-title" href="index.html">
						OLD
						<span>&HAND</span>
					</a>
					<p class="m-f-p">版权所有：O&H科技有限公司 地址：山东省青岛市青岛大学 咨询热线：4008-823-823，17865421702
						备案号：鲁ICP备11027744号-2 公安机关备案号：鲁公网安备41010502002091号</p>
				</div>
				<ul class="list-inline social-icon">
					<li>
						<i class=" fa fa-facebook"></i>
					</li>
					<li>
						<i class=" fa fa-google-plus"></i>
					</li>
					<li>
						<i class=" fa fa-linkedin"></i>
					</li>
					<li>
						<i class=" fa fa-twitter"></i>
					</li>
					<li>
						<i class=" fa fa-skype"></i>
					</li>
				</ul>
				<ul class="list-inline address">
					<li>
						<i class=" lnr lnr-home"></i>山东省青岛市青岛大学
					</li>
					<li>
						<i class=" lnr lnr-envelope"></i>951021432@qq.com
					</li>
					<li>
						<i class=" lnr lnr-phone-handset"></i>4008-823-823，17865421702
					</li>
				</ul>
			</div>
		</div>
	</div>
	</section>

	<footer class="bottom-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6 col-xs-12 text-center">
				<p class="copyright">&copy; 2018 B&RINDEX.COM All Rights Reserved</p>
			</div>
		</div>
	</div>
	</footer>

	<!--======== All Javascript =========-->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min-myhouse.js"></script>

</body>
</html>