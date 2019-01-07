<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shadow Login Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="//fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Arsenal:400,400i,700,700i" rel="stylesheet">
</head>
<body>
	<!-- main --> 
	<div class="main-agileinfo slider ">
		<div class="items-group">
			<div class="item agileits-w3layouts">
				<div class="block text main-agileits"> 
					<span class="circleLight"></span> 
					<!-- login form -->
					<div class="login-form loginw3-agile"> 
						<div class="agile-row">
							<h1>&mdash;&mdash;&mdash;&nbsp;&nbsp;登录&nbsp;&nbsp;&mdash;&mdash;&mdash;</h1> 
							<div class="login-agileits-top"> 	
								<form action="${pageContext.request.contextPath}/login.mvc" method="post"> 
									<p>用户名 / 账号 </p>
									<input type="text" class="name" name="user_username" required="required"/>
									<p>密 码</p>
									<input type="password" class="password" name="user_password" required="required"/>  
									<br/><br/>
									<div>
										<input id="b" type="radio" class="checkbox" name="user_type" checked="checked" value="buyer"/>
										<label for="b"> 买家</label> 
										<input id="a"  type="radio" class="checkbox" name="user_type" value="saler"/>
										<label for="a"> 卖家</label> 
									</div> 
									<br/><br/><br/>
									<input type="submit" value="登 录"> 
								</form> 	
							</div> 
							<div class="login-agileits-bottom wthree"> 
								<h6><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/jsp/register.jsp">还没有账号?</a></h6>
							</div> 
						</div>  
					</div>   
				</div>
				<div class="w3lsfooteragileits">
					<p> &copy; 2018 O&HINDEX.COM All Rights Reserved </p>
				</div> 
			</div>   
		</div>
	</div>	 

</body>
</html>