<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		var num = 3;//每页显示多少条数据，暂定设为6.
		var page;//总页数
		var now_page = 1;//当前页数
		$.ajax({
			url : "/ssh/findSalerOfHouse.mvc",/*获取自己后台对应的url*/
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
		var RB;
		var date;
		var money;
		for (var i = begin; i < end; i++) {
			/*用拼接字符串的方式，把数据动态添加到前端页面的表格上*/
			if(result[i].h_RB == "二手"){
				RB = "销售方式：二手出售";
				date = "";
				money = "总价：" + result[i].h_money +"万";
			}else if(result[i].h_RB == "新"){
				RB = "销售方式：新车出售";
				date = "发布日期：" + result[i].h_date ;
				money = "总价：" + result[i].h_money + "万";
			}else{
				RB = "销售方式：出租";
				date = "租期：" + result[i].h_date ;
				money = "每月租金：" + result[i].h_money + "元";
			}
			str =  "<img style='width:300px;height:230px;float:left;' src='${pageContext.request.contextPath}"+result[i].h_url+"'/>" 
			+ "<p ><h3 style='font-size:30px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ result[i].h_name + "</h3></p>"
			+ "<p><span style='margin-left:40px;font-size:15px;'>所在省份："+ result[i].h_province + "</span>"
			+ "<span style='margin-left:15px;font-size:15px;'>|&nbsp;&nbsp;&nbsp;所在市："+ result[i].h_city + "</span>"
			+ "<span style='margin-left:15px;font-size:15px;'>|&nbsp;&nbsp;&nbsp;所在区："+ result[i].h_distric + "</span></p>"
			+ "<p><span style='margin-left:40px;font-size:15px;'>排量："+ result[i].h_area + "升</span>"
			+ "<span style='margin-left:15px;font-size:15px;'>|&nbsp;&nbsp;&nbsp;车型："+ result[i].h_type + "</span></p>"
			+ "<p><span style='margin-left:40px;font-size:15px;'>"+ RB + "</span>"
			+ "<span style='margin-left:15px;font-size:15px;'>"+ date + "</span></p>"
			+ "<p><span style='margin-left:40px;font-size:15px;'>"+ money + "</span></p>"
			+ "<form style='margin-left:300px;width:200px;' action='${pageContext.request.contextPath}/deleteSalerOfHouse.mvc'>"
			+ "<input type='hidden' value='" + result[i].h_id+"' name='hid' /><input style='color:white;background-color:rgb(234,44,88);width:100px;height:40px;margin-left:40px;border:0px;' type='submit' value='取消发布' /></form><br/><br/>"
			 + "<a style='color:white;' href='${pageContext.request.contextPath}/jsp/detail.jsp?h_name="
			+ result[i].h_name
			+ "&h_province="
			+ result[i].h_province
			+ "&h_city="
			+ result[i].h_city
			+ "&h_distric="
			+ result[i].h_distric
			+ "&h_area="
			+ result[i].h_area
			+ "&h_type="
			+ result[i].h_type
			+ "&h_date="
			+ result[i].h_date
			+ "&h_money="
			+ result[i].h_money
			+ "&h_info="
			+ result[i].h_info
			+ "&h_url="	
			+ result[i].h_url
			+ "&h_RB="
			+ result[i].h_RB
			+ "&h_design="
			+ result[i].h_design
			+ "&h_id="
			+ result[i].h_id
			+ "'><div style='float:left;text-align:center;line-height:40px;color:white;background-color:rgb(234,44,88);width:100px;height:40px;margin-left:450px;margin-top:-80px;border:0px;'>查看详情<div/></a><br/><br/>";
	$("#tbody").append(str);

			/*代码里拼接上去的数据仅供参考，具体视项目需求而定*/
		}
	}
</script>

</head>
<body>
	<!-- page header -->
	<section class="page-header">
	<div class="page-header-overlay">
		<div clapass="container">
			<div class="row">
				<div class="section-title col-md-offset-3 col-md-6 text-center">
					<h2>名 下 爱  车</h2>
					<p>这里陈列出您发布的所有爱车，您还可以在左边的导航栏中进行一系列操作。 并且为您推荐了车辆和交易数量。</p>
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
						<h3 class="pull-left">爱  车 列 表</h3>
						<ul class="list-inline pull-right">
							<li><a href="${pageContext.request.contextPath}/index.jsp">首
									页</a></li>
							<li><i class="fa fa-angle-double-right"></i></li>
							<li><a href="${pageContext.request.contextPath}/jsp/likers.jsp">关 注 我 的  </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- Product -->
	<section class="product-list">
	<div class="grid-product">
		<div class="container">
			<div class="row">
				<!-- left sidebar -->
				<div class="col-md-3">
					<div class="sidebar">
						<!-- category widget -->
						<div class="panel widget panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">操 作 菜 单</h3>
							</div>
							<div class="panel-body">
								<ul class="category-list">
									<li><i class="fa fa-eye side-icon pull-left active"></i>我
										的  爱  车 <i class="fa fa-angle-right pull-right"></i></li>
									<li><i class="fa fa-eyedropper side-icon pull-left"></i><a
										style="color: RGB(89, 89, 89);"
										href="${pageContext.request.contextPath}/jsp/likers.jsp">关
											注 我 的</a><i class="fa fa-angle-right pull-right"></i></li>
									<li><i class="fa fa-flask side-icon pull-left"></i><a style="color: RGB(89, 89, 89);"
										href="${pageContext.request.contextPath}/jsp/BuyResoldSearch.jsp">寻 找 车  源</a>
										 <i class="fa fa-angle-right pull-right"></i></li>
									<li><i class="fa fa-fire side-icon pull-left"></i><a
										style="color: RGB(89, 89, 89);"
										href="${pageContext.request.contextPath}/index.jsp">返 回 首
											页</a> <i class="fa fa-angle-right pull-right"></i></li>
								</ul>
							</div>
						</div>


						<!-- Manufatues widget -->
						<div class="panel manufatue widget panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">今 日 交 易</h3>
							</div>
							<div class="panel-body">
								<ul class="category-list">
									<li><i class="side-icon pull-right active">150</i>捷豹E-PACE</li>
									<li><i class="side-icon pull-right active">37</i>劳斯莱斯CULLINAN
									</li>
									<li><i class="side-icon pull-right active">50</i>奔驰GLC</li>
									<li><i class="side-icon pull-right active">78</i>凯迪拉克XT5</li>
									<li><i class="side-icon pull-right active">94</i>特斯拉ModelX</li>
								</ul>
							</div>
						</div>


						<!-- Discount widget -->
						<div
							class="panel hidden-xs hidden-sm discount widget panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">今 日 推 荐</h3>
							</div>
							<div class="panel-body">
								<img class="img-responsive"
									src="${pageContext.request.contextPath}/images/SUV.png"
									alt="discount" />
								<div class="discount-label">最 新 豪 车</div>
							</div>
						</div>
					</div>
				</div>
				<!-- product list -->
				<div id="col-md-9" class="col-md-9">
					<!-- ad 3 -->
					<div class="row">
						<div class="ad-3">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div>
									<img class="img-responsive ad-3"
										src="${pageContext.request.contextPath}/images/SUV.png"
										alt="" />
								</div>
							</div>
						</div>
					</div>


					<%-- <c:if test="${not empty houses}">
						<c:forEach items="${houses}" var="house">
							<div class="rowm-30">
								<div class="col-md-4 col-sm-5 col-xs-12">
									<div class="single-grid">
										<div class="grid-img">
											<img src="${house.h_url}" class="img-resposive" /> <strong>100%</strong>
											<div class="grid-overlay">
												<ul>
													<li><i class="lnr lnr-link"></i></li>
													<li><i class="lnr lnr-heart"></i></li>
													<li><i class="lnr lnr-camera"></i></li>
													<li><i class="lnr lnr-cart"></i></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-8 col-sm-7 col-xs-12 list-detail">
									<h3>${house.h_name}<span>￥${house.h_money}/平方(月)</span>
									</h3>
									<p>所 在 省 份 ：${house.h_province}&nbsp;&nbsp;&nbsp;&nbsp; 所 在
										城 市 ：${house.h_city}&nbsp;&nbsp;&nbsp;&nbsp; 所 在 区
										：${house.h_distric}</p>
									<p>
										<c:if test="${house.h_RB == '租'}">
								出 售 方 式 ：出  租 &nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
										<c:if test="${house.h_RB == '二手'}">
								出 售 方 式 ：出  售 &nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
										<c:if test="${house.h_RB == '租'}">最 短 租 期 ：${house.h_date}</c:if>
									</p>
									<p>面 积 ：${house.h_area} 平方 &nbsp;&nbsp;&nbsp;&nbsp; 格 局
										：${house.h_type}</p>
									<p>房 屋 描 述 ：${house.h_info}</p>
									<p></p>
									<form
										action="${pageContext.request.contextPath}/deleteSalerOfHouse.mvc">
										<input type="hidden" value="${house.h_id}" name="hid" /> <input
											class="btn btn-default" type="submit" value="删 除 该 房" />
									</form>
								</div>
							</div>
						</c:forEach>
					</c:if>
					 --%>
					
					<!-- <nav>
					<ul class="pager pull-left">
						<li><a href="#">Previous</a></li>
						<li>
							<ul class="page-numb">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
							</ul>
						</li>
						<li><a href="#">Next</a></li>
					</ul>
					</nav> -->
					<div>
							<div id="tbody" >

							</div>
					</div>
	<div style="position:absolute;bottom:-50px;left:210px;">
		<ul class="pagination">
			<li><a style="color:rgb(234,44,88);border: 1px solid rgb(234,44,88);" id="left" href="javascript:;">上一页</a></li>
			<li class="active"><a style="background-color:rgb(234,44,88);border: 1px solid rgb(234,44,88); " id="page" href="javascript:;">1</a></li>
			<li><a style="color:rgb(234,44,88);border: 1px solid rgb(234,44,88);" id="right" href="javascript:;">下一页</a></li>
		</ul>
	</div>
				</div>
			</div>
		</div>
	</div>

	</section>
	

	<!-- Middle footer -->
	<section class="middle-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-xs-12 text-center">
				<div>
					<a class="site-title" href="index.html">Old<span>&Hand</span></a>
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

	<script
		src="${pageContext.request.contextPath}/js/jquery-2.1.1-myhouse.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.min-myhouse.js"></script>
</body>
</html>