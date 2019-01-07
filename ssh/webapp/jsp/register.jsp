<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/css/font-awesome-register.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/css/style-register.css" rel='stylesheet' type='text/css' />
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister" rel="stylesheet">
</head>
<body>
	<h1>
		<span>买</span>家   /   <span>卖</span>家 <span>用</span>户 <span>注</span>册
	</h1>
	<div class="bg-agile">
		<div class="book-appointment">
			<h2>Register Now</h2>
			<div class="book-form agileits-login">
				<form action="${pageContext.request.contextPath}/register.mvc" method="post">
					<div class="agileits_reservation_grid">
						<div class="phone_email">
							<div class="form-text">
								<i class="fa fa-user" aria-hidden="true"></i>
								 <input type="text" name="user_name" placeholder="您的姓名/名字" required="required" />
							</div>
						</div>
						<div class="phone_email phone_email1">
							<div class="form-text">
								<i class="fa fa-envelope-o" aria-hidden="true"></i> 
								<input type="text" name="user_username" placeholder="用户名/邮箱账号" required="required" />
							</div>
						</div>
						<div class="phone_email">
							<div class="form-text">
								<i class="fa fa-phone" aria-hidden="true"></i> 
								<input type="text" name="user_telephone" placeholder="手机/电话号码" required="required" />
							</div>
						</div>
						<div class="phone_email phone_email1">
							<div class="form-text">
								<i class="fa fa-users" aria-hidden="true"></i>
								 <input type="text" name="user_password" placeholder="密码" required="required" />
							</div>
						</div>
						<div class="span1_of_1">
							<!-- start_section_room -->
							<div class="section_room">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i> 
								<select id="country" onchange="change_country(this.value)" class="frm-field required" name="user_age">
									<option value="18">年龄</option>
									<option value="18">18  岁</option><option value="19">19  岁</option>
									<option value="20">20  岁</option><option value="21">21  岁</option>
									<option value="22">22  岁</option><option value="23">23  岁</option>
									<option value="24">24  岁</option><option value="25">25  岁</option>
									<option value="26">26  岁</option><option value="27">27  岁</option>
									<option value="28">28  岁</option><option value="29">29  岁</option>
									<option value="30">30  岁</option><option value="31">31  岁</option>
									<option value="32">32  岁</option><option value="33">33  岁</option>
									<option value="34">34  岁</option><option value="35">35  岁</option>
									<option value="36">36  岁</option><option value="37">37  岁</option>
									<option value="38">38  岁</option><option value="39">39  岁</option>
									<option value="40">40  岁</option><option value="41">41  岁</option>
									<option value="42">42  岁</option><option value="43">43  岁</option>
									<option value="44">44  岁</option><option value="45">45  岁</option>
									<option value="46">46  岁</option><option value="47">47  岁</option>
									<option value="48">48  岁</option><option value="49">49  岁</option>
									<option value="50">50  岁</option><option value="51">51  岁</option>
									<option value="52">52  岁</option><option value="53">53  岁</option>
									<option value="54">54  岁</option><option value="55">55  岁</option>
									<option value="56">56  岁</option><option value="57">57  岁</option>
									<option value="58">58  岁</option><option value="59">59  岁</option>
									<option value="60">60  岁</option><option value="61">61  岁</option>
									<option value="62">62  岁</option><option value="63">63  岁</option>
									<option value="64">64  岁</option><option value="65">65  岁</option>
									<option value="66">66  岁</option><option value="67">67  岁</option>
									<option value="68">68  岁</option><option value="69">69  岁</option>
									<option value="70">70  岁</option><option value="71">71  岁</option>
									<option value="72">72  岁</option><option value="73">73  岁</option>
									<option value="74">74  岁</option><option value="75">75  岁</option>
									<option value="76">76  岁</option><option value="77">77  岁</option>
									<option value="78">78  岁</option><option value="79">79  岁</option>
									<option value="80">80  岁</option><option value="81">81  岁</option>
									<option value="82">82  岁</option><option value="83">83  岁</option>
									<option value="84">84  岁</option><option value="85">85  岁</option>
									<option value="86">86  岁</option><option value="87">87  岁</option>
									<option value="88">88  岁</option><option value="89">89  岁</option>
									<option value="90">90  岁</option><option value="91">91  岁</option>
									<option value="92">92  岁</option><option value="93">93  岁</option>
									<option value="94">94  岁</option><option value="95">95  岁</option>
									<option value="96">96  岁</option><option value="97">97  岁</option>
									<option value="98">98  岁</option><option value="99">99  岁</option>
									<option value="100">100  岁</option>
								</select>
							</div>
						</div>
						<div class="span1_of_1 phone_email1">
							<!-- start_section_room -->
							<div class="section_room">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								 <select id="country1" onchange="change_country(this.value)" class="frm-field required" name="user_gender">
									<option value="男">性别</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<input type="submit" value="提  交  注  册"><br/><br/><br/>
					<p><a href="${pageContext.request.contextPath}/index.jsp" style="color:white;">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:white;" href="${pageContext.request.contextPath}/jsp/login.jsp">已 有 账 号</a></p>
				</form>
			</div>

		</div>
	</div>
	<div class="copy w3ls">
		<p>
			&copy; 2018 B&RINDEX.COM All Rights Reserved 
		</p>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/jquery-ui-register.css" />
	<script
		src="${pageContext.request.contextPath}/js/jquery-ui-register.js"></script>
	<script>
						  $(function() {
							$( "#datepicker,#datepicker1,#datepicker2,#datepicker3" ).datepicker();
						  });
				  </script>

</body>
</html>