<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ionicons/2.0.1/css/ionicons.min.css">
<link rel="shortcut icon" type="${pageContext.request.contextPath}/images/x-icon" href="images/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Play" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<style type="text/css">
.hero-img {
    margin-left: 80px;
}

    
</style>
<body>
	<header>
	<nav class="main-nav">
		<div class="container">
			<div class="row">
				<div class="col-1-4">
					<h1 class="logo"><a href="index.jsp">Old Hand</a>
						<img src="images/logo.png" alt="">
					</h1>
				</div>
				<div class="col-3-4">
					<ul id="menu" class="main-menu">
						<li><a href="#" class="active">首页</a></li>
						<li><a href="${pageContext.request.contextPath}/about.mvc">关于我们</a></li>
						<li>
							<c:if test="${not empty userType}">
								<c:if test="${userType == 'buyer'}">
									<a href="${pageContext.request.contextPath}/jsp/BuyResoldSearch.jsp">二手车</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/jsp/BuyNewSearch.jsp">新车</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/jsp/RentSearch.jsp">租车</a>
								</c:if>
								<c:if test="${userType == 'saler'}">
									<a href="${pageContext.request.contextPath}/jsp/salerOfCar.jsp">我的爱车</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/jsp/saleCar.jsp">发布新车</a>
								</c:if>
							</c:if>
							<c:if test="${empty userType}">
								<a href="${pageContext.request.contextPath}/jsp/login.jsp">请先登录 </a>
							</c:if>
						</li>
						<li>
							<c:if test="${not empty name}">
								<a>你好，${name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/loginout.mvc">注销</a>
							</c:if>
							<c:if test="${empty name}">
								<a href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
							</c:if>
						</li>
						<li><a href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="hero-img">
		 <img src="images/kulinan.jpg" alt="kulinan" class="hero" >
		
		<div class="text-wrap"  >
			<p class="title">O&H</p>
			<p class="description">拥有你的爱车</p>
			<a href="${pageContext.request.contextPath}/toSearch.mvc" class="btn">寻找爱车</a>
		</div>
	</div>
</header>


<div class="services-section">
	<div class="container">
		<div class="row">
			<div class="title-and-desc">
				<h2 class="section-title">
					<span class="separate">Old&Hand</span>
					The Best For You
				</h2>
					<p class="body-text">
						集二手车、新车、租车功能于一体，随时随地任性找车，
					</p>
					<p class="body-text">IM匿名咨询让您放心，消息动态推送让您省心，服务承诺让您安心，</p>
					<p class="body-text">数据百科锦囊让您感受贴心漫漫找车路，我们努力为您想更多</p>
			</div>
		</div>

		<div class="row">
			<div class="col-1-3">
				<div class="service">
					<a href="jsp/BuyResoldSearch.jsp"><img src="images/serv-ico1.png" alt="icon" class="serv-icon"></a>
					<p class="serv-title">二手好车&nbsp;&nbsp;&nbsp;为您而选 </p>
						<p class="body-text">二手好车那么多，我们为你精选，</p> 
						<p class="body-text"></p>
						<p class="body-text">O&H越来越懂你</p>
				</div>
			</div>
			<div class="col-1-3">
				<div class="service">
					<a href="jsp/BuyNewSearch.jsp"><img src="images/serv-ico2.png" alt="icon" class="serv-icon"></a>
					<p class="serv-title">优质新车&nbsp;&nbsp;&nbsp;为您推荐</p>
						<p class="body-text">海量新车资源</p> 
						<p class="body-text"></p>
						<p class="body-text">纵览爱车，恋上出行</p>
				</div>
			</div>
			<div class="col-1-3">
				<div class="service">
					<a href="jsp/BuyNewSearch.jsp"><img src="images/serv-ico3.png" alt="icon" class="serv-icon"></a>
					<p class="serv-title">新车&nbsp;&nbsp;&nbsp;新出发</p>
						<p class="body-text">真实信息准确同步</p> 
						<p class="body-text"></p>
						<p class="body-text">新车新起点</p>
				</div>
			</div>
			<div class="col-1-3">
				<div class="service">
					<a href="jsp/RentSearch.jsp"><img src="images/serv-ico4.png" alt="icon" class="serv-icon"></a>
					<p class="serv-title">爱租车&nbsp;&nbsp;&nbsp;省下钱</p>
						<p class="body-text">为您推荐最优质的租车服务</p> 
						<p class="body-text"></p>
						<p class="body-text">不为出行而愁</p>
				</div>
			</div>
			<div class="col-1-3">
				<div class="service">
					<a href="MapMain.jsp"><img src="images/serv-ico5.png" alt="icon" class="serv-icon"></a>
					<p class="serv-title">地图旅行&nbsp;&nbsp;&nbsp;自在人生</p>
						<p class="body-text">如果你有一百万  买辆车吧 </p> 
						<p class="body-text"></p>
						<p class="body-text">新车 新旅行 新出发 新人生</p>
				</div>
			</div>
			<div class="col-1-3">
				<div class="service">
					<a href="MapMain.jsp"><img src="images/serv-ico6.png" alt="icon" class="serv-icon"></a>
					<p class="serv-title">同城交易&nbsp;&nbsp;&nbsp;交易安心</p>
						<p class="body-text">专业团队开启您的新车之旅</p> 
						<p class="body-text"></p>
						<p class="body-text">国外车源，选O&H</p>
				</div>
			</div>
		</div>

	</div>
</div>

<!-- LATEST WORK SECTION -->
<div class="latest-work">
	<div class="container">
		<h2 class="section-title">为您创造出行的故事</h2>
		<p class="body-text">同城买车，为您精确定位，精选4S店全程无忧</p>
		
		<div class="row">
			<div class="col-1-2">
				<a href="${pageContext.request.contextPath}/jsp/BuyNewSearch.jsp">
					<div class="img-wrapper">
						<img src="images/car1.png" alt="car1">
						<div class="img-hover">
							<div class="caption-box">
								<i class="ion-ios-eye-outline"></i>
								<p class="caption-text">查看该车信息</p>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-1-2">
				<a href="projectpage.html">
					<div class="img-wrapper">
						<img src="images/car2.png" alt="car2">
						<div class="img-hover">
							<div class="caption-box">
								<i class="ion-ios-eye-outline"></i>
								<p class="caption-text">查看该车信息</p>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-1-2">
				<a href="projectpage.html">
					<div class="img-wrapper">
						<img src="images/car3.png" alt="car3">
						<div class="img-hover">
							<div class="caption-box">
								<i class="ion-ios-eye-outline"></i>
								<p class="caption-text">查看该车信息</p>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-1-2">
				<a href="projectpage.html">
					<div class="img-wrapper">
						<img src="images/car4.png" alt="car4">
						<div class="img-hover">
							<div class="caption-box">
								<i class="ion-ios-eye-outline"></i>
								<p class="caption-text">查看该车信息</p>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-1-2">
				<a href="projectpage.html">
					<div class="img-wrapper">
						<img src="images/car5.png" alt="car5">
						<div class="img-hover">
							<div class="caption-box">
								<i class="ion-ios-eye-outline"></i>
								<p class="caption-text">查看该车信息</p>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-1-2">
				<a href="projectpage.html">
					<div class="img-wrapper">
						<img src="images/car6.png" alt="car6">
						<div class="img-hover">
							<div class="caption-box">
								<i class="ion-ios-eye-outline"></i>
								<p class="caption-text">查看该车信息</p>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<a href="work.html" class="all-work">
			<i class="ion-grid"></i>
			<span>All Search</span>
		</a>
	</div>
</div>

<div class="our-clients">
	<div class="container">
		<h2 class="section-title">郑重承诺</h2>
		<p class="body-text">我们O&H励志于为用户创造最好的购车平台，最真实的车辆信息，最真实的价格</p>
		<p class="body-text">如有假冒伪劣，假一赔十（劳斯莱斯！）</p>
		<div class="row">
			<div class="col-1-6">
				<img src="images/client1.png" alt="client-logo">
			</div>
			<div class="col-1-6">
				<img src="images/client2.png" alt="client-logo">
			</div>
			<div class="col-1-6">
				<img src="images/client3.png" alt="client-logo">
			</div>
			<div class="col-1-6">
				<img src="images/client4.png" alt="client-logo">
			</div>
			<div class="col-1-6">
				<img src="images/client5.png" alt="client-logo">
			</div>
			<div class="col-1-6">
				<img src="images/client6.png" alt="client-logo">
			</div>

		</div>
	</div>
</div>

<!-- FOOTER SECTION -->
<footer>
	<div class="container">
		<p class="title">联系方式</p>
		<img src="images/logo-footer.png" alt="logo">
		<p class="body-text">地址/Address:山东省青岛市市南区宁夏路308号</p>
		<p class="body-text">电话/Tel:17865421702</p>
		<p class="body-text last">邮箱/Mail:WeAreBestOldHand@163.com</p>
		<div class="social-media-footer">
			<a href="#"><i class="ion-social-facebook"></i></a>
			<a href="#"><i class="ion-social-linkedin"></i></a>
			<a href="#"><i class="ion-social-twitter"></i></a>
			<a href="#"><i class="ion-social-instagram-outline"></i></a>
		</div>
		<p class="copyright">&copy; 2018 O&HINDEX.COM All Rights Reserved</p>
	</div>
</footer>

<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>