<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Angling Booking Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-publish.css" />
<link href="${pageContext.request.contextPath}/css/style-publish.css" rel='stylesheet' type='text/css' media="all">
<link href="//fonts.googleapis.com/css?family=Cuprum:400,700" rel="stylesheet">
<title>欢迎来到老司机豪车网站</title>
</head>
<body>
	<h1 class="header-w3ls">出  租 豪  车 </h1>
	<div class="appointment-w3">
		<form action="${pageContext.request.contextPath}/rentHouse.mvc" method="post" enctype="multipart/form-data">
			<div class="main">
				<div class="form-left-w3l">
					<input type="text" class="top-up" name="house_name" placeholder="请输入爱车名" required="required" />
				</div>
				<div class="form-right-w3ls ">
					<input type="text" class="top-up" id="house_province" name="house_province" placeholder="所在省份" required="required" />
					<div class="clearfix" ></div>
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<input type="text" id="house_city" name="house_city" placeholder="所在城市" required="required"/>
				</div>
				<div class="form-right-w3ls ">
					<input class="buttom" type="text"id="house_distric"  name="house_distric" placeholder="所在的区" required="required"/>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<select class="form-control" name="house_design" required="required">
						<option value="爱车品牌">爱车品牌</option>
						<option value="玛莎拉蒂">玛莎拉蒂</option>
						<option value="保时捷">保时捷</option>
						<option value="捷豹">捷豹</option>
						<option value="凯迪拉克">凯迪拉克</option>
						<option value="奔驰">奔驰</option>
					</select>
				</div>
				<div class="form-right-w3ls ">
					<input class="buttom" type="text" name="house_date" placeholder="最短租期（单位：天）" required="required"/>
					<div class="clearfix"></div>
				</div>
				
			</div>
			<div class="main">
				<input type="hidden" name="house_RB"   value="租" required="required"/>
				<div class="form-left-w3l">
					<input type="text" name="house_money" placeholder="每日租金" required="required"/>
					<div class="clearfix"></div>
				</div>
				<div class="form-right-w3ls ">
					<input type="text" name="house_area" placeholder="发动机排量" required="required"/>
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<select class="form-control" name="house_type">
						<option value="车型">车型</option>
						<option value="SUV">SUV</option>
						<option value="轿跑">轿跑</option>
						<option value="敞篷跑车">敞篷跑车</option>
						<option value="房车">房车</option>
						<option value="商务车">商务车</option>
						<option value="混合动力车">混合动力车</option>
						<option value="清洁能源车">清洁能源车</option>
						<option value="轿车">轿车</option>
					</select>
				</div>
				<div class="form-right-w3ls">
					<input class="buttom" type="file" name="house_url"
						placeholder="上传您车辆的照片" required="required"/>
					<div class="clearfix"></div>
				</div>
			</div>
			
			<div class="form-control-w3l">
				<textarea name="house_info" placeholder="车辆描述..."></textarea>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<input type="hidden" name="h_x" id="h_x" /> 
				</div>
				<div class="form-left-w3l">
					<input type="hidden" name="h_y" id="h_y" /> 
				</div>
			</div>
			 <div class="form-control-w3l" id='allmap' style='opacity:0.6; width:650px; height: 225px;  display: block'></div>  
			
			<div class="btnn">
				<input type="submit" value="发    布">
			</div>
			<br/><br/>
			<p ><a style="color: white;" href="${pageContext.request.contextPath}/index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: white;" href="${pageContext.request.contextPath}/jsp/saleHouse.jsp">我要卖车</a></p>
		</form>
	</div>
	<div class="copy">
		<p> &copy; 2018 O&HINDEX.COM All Rights Reserved </p>
	</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=v7ugaj8evae4hfLSRrlxn6cRAYIMixt2"></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-2.2.3.min-publish.js'></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui-publish.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
		
		//
		 
	    var map = new BMap.Map("allmap");  
	    var geoc = new BMap.Geocoder();   //地址解析对象  
	    var markersArray = [];  
	    var geolocation = new BMap.Geolocation();  
	  
	    var dd = "12.3423435";
				          

	    var point = new BMap.Point(116.331398, 39.897445);  
	    map.centerAndZoom(point, 12); // 中心点  

	    //获取当前位置
	    geolocation.getCurrentPosition(function (r) {  
	        if (this.getStatus() == BMAP_STATUS_SUCCESS) {  
	            var mk = new BMap.Marker(r.point);  
	            //map.addOverlay(mk);  
	            map.panTo(r.point);  
	            map.enableScrollWheelZoom(true);  
	        }  
	        else {  
	            alert('failed' + this.getStatus());  
	        }  
	    }, {enableHighAccuracy: true})  

	    map.addEventListener("click", showInfo);  
	  
	  
	    //清除标识  
	    function clearOverlays() {  
	        if (markersArray) {  
	            for (i in markersArray) {  
	                map.removeOverlay(markersArray[i])  
	            }  
	        }  
	    }  
	    //地图上标注  
	    function addMarker(point) {  
	        var marker = new BMap.Marker(point);  
	        markersArray.push(marker);  
	        clearOverlays();  
	        map.addOverlay(marker);  
	    }  
	    //点击地图时间处理  
	    function showInfo(e) {  
	        document.getElementById('h_x').value = e.point.lng;  
	        document.getElementById('h_y').value =  e.point.lat;  
	        geoc.getLocation(e.point, function (rs) {  
	            var addComp = rs.addressComponents;  
	            var address =  addComp.province + addComp.city +addComp.district ;  
	            if (confirm("确定要地址是" + address + "?")) {  
	                document.getElementById('house_distric').value = addComp.district;  
	                document.getElementById('house_province').value = addComp.province;
	                document.getElementById('house_city').value = addComp.city;
	            }  
	        });  
	        addMarker(e.point);  
	    } 
	</script>
</body>
</html>