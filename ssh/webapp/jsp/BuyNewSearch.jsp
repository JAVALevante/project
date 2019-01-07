<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
element.style {
    background-color: #00AE66;
    margin-left: 30px;
    color: white;
    width: 80px;
    height: 40px;
    border-radius: 3px;
    float: left;
}
#top {
	height: 50px;
	margin-left: 10%;
	margin-right: 10%;
	background-color: darkcyan;
}

#top2 {
	height: 450px;
	position: relative;
	width: 270px;
	top: -450px;
	left: 250px;
	background-color: rgba(0, 0, 0, 0.5);
}

#selectdiv {
	height: 70%;
	width: 250px;
}

#selectdiv select {
	margin-top: 20px;
	height: 30px;
	width: 100px;
	height: 30px;
	margin-left: 20px;
	border-radius: 5px;
	color: white;
	background-color: rgba(0, 0, 0, 0.4);
}

li {
	list-style-type: none;
}

#searchbtn {
	height: 30px;
	width: 120px;
	margin-left: 70px;
	border: none;
	border-radius: 5px;
	background-color: sandybrown;
	color: white;
	font-size: 15px;
	border: none;
	margin-left: 70px;
}

#list {
	margin-top: -450px;
	margin-left: 10%;
	margin-right: 10%;
}

#mainA {
	font-size: 28px;
	color: #333;
	font-weight: bold;
	text-decoration: none;
	letter-spacing: 2px;
}

#mainA:HOVER {
	color: sandybrown;
}

#span1 {
	font-size: 16px;
	color: gray;
}

#span2 {
	font-size: 18px;
	color: #333;
	margin-left: 20px;
}

#span3 {
	margin-left: 15px;
	font-size: 14px;
}

#price {
	color: red;
	font-size: 30px;
	font-weight: bold;
}

#nli {
	margin-top: 8px;
}

#list_div {
	height: 220px;
	width: 220px;
	float: left;
}

#list_inner1 {
	margin-top: 20px;
	height: 220px;
	width: 580px;
	float: left;
	background-color: #f7f7f7;
	margin-left: 20px;
}

#ul {
	height: 490px;
}

#imgstyle {
	width: 220px;
	height: 200px;
}

#formation {
	height: 50px;
	margin-top: 20px;
	border-bottom: solid 5px darkcyan;
}

#formation li {
	height: 50px;
	width: 90px;
	float: left;
	margin-left: 20px;
}

#formation a {
	margin-left: 22px;
	float: left;
	margin-top: 19px;
	color: white;
	font-size: 13px;
	text-decoration: none;
}

#AescBtn, #MescBtn {
	height: 50px;
	width: 90px;
	border: none;
	background-color: white;
}

#pagebtn {
	color: sandybrown;
	font-weight: bold;
	font-size: 50px;
	border: none;
	background-color: white;
}

#ad_img {
	margin-top: 5px;
	margin-left: 10%;
	margin-right: 10%;
	height: 450px;
}

#inner a {
	width: 5px;
	height: 5px;
	display: block;
	border: 1px solid white;
	background-color: gray;
	float: left;
	margin: 0 10px;
	border-radius: 10px;
	text-align: center;
	text-decoration: none;
}

div#inner {
	width: 200px;
	height: 20px;
	position: relative;
	top: 430px;
	left: 520px;
}

</style>
</head>
<script src="<%=request.getContextPath() %>/js/jquery-2.1.1.min.js"></script>
<script>
	window.onload = function() {

		ajaxCondition(0, 'h_id');

	}

	function test() {
		var distric = document.getElementById("distric").value;
		var money = document.getElementById("money").value;
		var area = document.getElementById("area").value;
		var types = document.getElementById("types").value;
		var a1 = "", a2 = "";
		var m1 = "", m2 = "";

		if (distric == "交易地") {
			distric = "";
		}

		if (money == "总价") {
			m1 = "";
			m2 = "";
		} else {
			if (money == "80万以下") {
				m1 = "0";
				m2 = "80";
			} else {
				if (money == "500万以上") {
					m1 = "500";
					m2 = "1000";
				} else {
					var arr = money.split("-");
					if (arr[1].length == 3) {
						m1 = arr[0];
						m2 = arr[1].substring(0, 2);
					} else {
						m1 = arr[0];
						m2 = arr[1].substring(0, 3);
					}
					;

				}
			}
		}
		switch (area) {
		case "玛莎拉蒂":
			a1 = "0";
			a2 = "50";
			break;
		case "200平以上":
			a1 = "200";
			a2 = "400";
			break;
		case "劳斯莱斯":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 2);
			break;
		case "捷豹":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 2);
			break;
		case "奔驰":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "法拉利":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "130-150平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "150-200平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "200平以上":
			area = area.substring(0, 3);
			break;
		case "品牌":
			a1 = "";
			a2 = "";
			break;
		default:
			var arr = area.split("-");
			if (arr[1].length == 3) {
				a1 = arr[0];
				a2 = arr[1].substring(0, 2);
			} else {
				a1 = arr[0];
				a2 = arr[1].substring(0, 3);
			}

		}

		if (types == "车型") {
			types = "";
		} else {
			if (types == "5室及以上") {
				types = "5室";
			}
		}

		/* alert(distric + "," + a1 + "," + a2 + "," + m1 + "," + m2 + "," + types);   */
		var myValue = new Array();

		myValue[0] = distric;
		myValue[1] = m1;
		myValue[2] = m2;
		myValue[3] = a1;
		myValue[4] = a2;
		myValue[5] = types;

		return myValue;
	}

	function num(a, data) {

		$("#ul li").eq(0).nextAll().remove();

		var item;
		var result;
		for (var i = a; i < a + 4; i++) {
			result = data.msg[i];

			var id = result.h_id;
			var name = result.h_name;
			var add = result.h_province + result.h_city + result.h_distric;
			var area = result.h_area;
			var distric = result.h_distric;
			var types = result.h_type;
			var money = result.h_money;
			var date = result.h_date;
			var design = result.h_design;
			var h_type = result.h_h_type;
			var RB = result.h_RB;
			var url = result.h_url;
			var x = result.h_x;
			var y = result.h_y;
			var con = result.h_info;
			item = "<li id='list_inner1'><div id='list_div'><img id='imgstyle' alt='11' src='.."+url+"'></div>"
					+ "<div id='list_div' style='width:350px;'><ul style='margin-left:35px;'><li id='nli'>"
					+ "<a id='mainA' href='oneCar2.jsp?name="
					+ name
					+ "&add="
					+ add
					+ "&RB="
					+ RB
					+ "&area="
					+ area
					+ "&types="
					+ types
					+ "&date="
					+ date
					+ "&money="
					+ money
					+ "&x="
					+ x
					+ "&y="
					+ y
					+ "&con="
					+ con
					+ "&h_type="
					+ h_type
					+ "&url="
					+ url
					+ "&design="
					+ design
					+ "'>"

					+ name
					+ "</a>"

					+ "</span></li><li id='nli' style='margin-top:15px;'>"
					+ "<span id='span1' style='font-size: 20px;'>▶</span><span id='span2'>"
					+ distric
					+ "</span></li><li id='nli'><span id='span1'>排量:</span>"
					+ "<span id='span2'>"
					+ area
					+ "升</span></li><li id='nli'><span id='span1'>上架日期:</span>"
					+ "<span id='span2' style='color: #f15044; font-weight: bold;'>"
					+ date
					+ "</span></li><li id='nli'><span id='span1'>总价:</span>"
					+ "<span id='span2'>"
					+ money
					+ "万/辆起</span></li><li id='nli' style='margin-left:-20px;'>"
					+ "<div style='background-color: #00AE66; margin-left: 30px; color: white; width: 60px; height: 22px; border-radius: 3px; float: left'>"
					+ "<span id='span3'>在售</span></div><div style='background-color: orange; margin-left: 20px; color: white; width: 90px; height: 22px; border-radius: 3px; float: left'>"
					+ "<span id='span3'>"
					+ design
					+ "</span>"
					+ "</div>"
					+ "<div  style='background-color: red; margin-left: 20px; color: white; width: 80px; height: 22px; border-radius: 3px; float: left'>"
					+ "<span style='margin-left: 15px; font-size: 14px;'>"
					+ types + "</span></div></li></ul></div></li>"
			$("#ul").append(item);
		}
	}

	var t = 0;

	function ajaxCondition(b, v) {

		var distric = test()[0];
		var minmoney = test()[1];
		var maxmoney = test()[2];
		var minarea = test()[3];
		var maxarea = test()[4];
		var types = test()[5];

		$.ajax({
			type : "post",
			url : "/ssh/ajaxhouse.mvc",
			data : {
				distric : distric,
				minmoney : minmoney,
				maxmoney : maxmoney,
				minarea : minarea,
				maxarea : maxarea,
				types : types,
				RB : "新",
				EscORDesc : v
			},
			dataType : "json",
			success : function(data) {
				if (data.msg == "fail") {
					$("#ul li").eq(0).nextAll().remove();
					item1 = "<li><p>对不起未找到相关内容！</p></li>"
					$("#ul").append(item1);
				} else {

					if (b == 0) {
						t = 0;
					}
					if (b == 2) {
						t = t - 5
					}
					if (b == 1) {
						t = t + 5;
					}

					num(t, data);

				}

			},
			error : function(data) {
				alert(data.msg);
			}
		});

	}

	function Aesc() {
		var btn = document.getElementById("AescBtn");
		var btn1 = document.getElementById("MescBtn");
		var li1 = document.getElementById("li1");
		var lia = document.getElementById("lia");
		btn.style.backgroundColor = "sandybrown";
		btn.style.color = "white";
		btn1.style.backgroundColor = "white";
		btn1.style.color = "black";
		btn1.value = "售价";
		li1.style.backgroundColor = "white";
		lia.style.color = "black";

		if (btn.value == "品牌") {
			btn.value = "品牌 ↑";
			ajaxCondition(0, 'h_area desc');
		} else if (btn.value == "品牌 ↑") {
			btn.value = "品牌 ↓";
			ajaxCondition(0, 'h_area');
		} else {
			btn.value = "品牌";

		}

	}

	function Mesc() {
		var btn = document.getElementById("AescBtn");
		var btn1 = document.getElementById("MescBtn");
		var li1 = document.getElementById("li1");
		var lia = document.getElementById("lia");
		btn1.style.backgroundColor = "sandybrown";
		btn1.style.color = "white";
		btn.style.backgroundColor = "white";
		btn.style.color = "black";
		li1.style.backgroundColor = "white";
		lia.style.color = "black";
		btn.value = "品牌";

		if (btn1.value == "售价") {
			btn1.value = "售价 ↑";
			ajaxCondition(0, 'h_money desc');
		} else if (btn1.value == "售价 ↑") {
			btn1.value = "售价 ↓";
			ajaxCondition(0, 'h_money');
		} else {
			btn1.value = "售价";

		}

	}

	function defaultEsc() {
		var btn = document.getElementById("AescBtn");
		var btn1 = document.getElementById("MescBtn");
		var li1 = document.getElementById("li1");
		var lia = document.getElementById("lia");
		btn1.style.backgroundColor = "white";
		btn1.style.color = "black";
		btn.style.backgroundColor = "white";
		btn.style.color = "black";
		li1.style.backgroundColor = "sandybrown";
		lia.style.color = "white";
		btn.value = "品牌";
		btn1.value = "售价";
		ajaxCondition(0, 'h_id')
	}

	function changePic(picName) {
		document.getElementById("ad_img").style.backgroundImage = "url(../images/"
				+ picName + ")";

	}
</script>
<body>
	<div id="top">
		<h1 style="color: white; margin-left: 30px;">新车</h1>
	</div>

	<div id="ad_img" style="background-image: url(../images/car1.png);">
		<div id="inner">
			<a href="javascript:changePic('car1.png');"></a> <a
				href="javascript:changePic('car2.png');"></a> <a
				href="javascript:changePic('car3.png');"></a> <a
				href="javascript:changePic('car4.png');"></a> <a
				href="javascript:changePic('car5.png');"></a>
		</div>
	</div>

	<div id="top2">
		<div id="selectdiv">
			<select style="margin-top: 70px;" id="distric">
				<option>交易地</option>
				<option>崂山区</option>
				<option>即墨区</option>
				<option>李沧区</option>
				<option>莱西区</option>
				<option>城阳区</option>
				<option>市南区</option>
				<option>市北区</option>
				<option>黄岛区</option>
				<option>胶州区</option>
				<option>平度区</option>
			</select> <select id="types">
				<option>车型</option>
				<option>SUV</option>
				<option>轿跑</option>
				<option>敞篷跑车</option>
				<option>轿车</option>
				<option>房车</option>
				<option>商务车</option>
				<option>清洁能源车</option>
			</select> <br> <select id="money">
				<option>总价</option>
				<option>80万以下</option>
				<option>80-100万</option>
				<option>100-15万</option>
				<option>150-200万</option>
				<option>200-300万</option>
				<option>300-500万</option>
				<option>500万以上</option>
			</select> <select id="area">
				<option>品牌</option>
				<option>玛莎拉蒂</option>
				<option>劳斯莱斯</option>
				<option>捷豹</option>
				<option>奔驰</option>
				<option>法拉利</option>

			</select>
		</div>
		<input id="searchbtn" type="button" onclick="ajaxCondition(0,'h_id')"
			value="筛选">

	</div>
	<div id="list">
		<div style="height: 70px;">
			<ul id="formation">
				<li id="li1" style="margin-left: 0px; background-color: sandybrown;"><a
					id="lia" onclick="defaultEsc()" href="javascript:void(0)">默认排序</a></li>
				<li><input id="AescBtn" type="button" onclick="Aesc()"
					value="品牌"></li>
				<li><input id="MescBtn" type="button" onclick="Mesc()"
					value="售价"></li>

			</ul>
		</div>

		<ul id="ul">
			<li></li>
			<!-- <li id="list_inner1"><div id="list_div">
					<img id="imgstyle" alt="11" src="../images/car6.png">
				</div>
				<div id="list_div" style="width: 300px">
					<ul>
						<li class="nli"><a id="mainA">荣安水木清华</a><span
							style="border: solid 1px #269CFF; margin-left: 30px; color: #269CFF">商业区</span></li>
						<li class="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">崂山区</span></li>
						<li class="nli"><span id="span1">排量:</span><span id="span2">80升</span></li>
						<li class="nli"><span id="span1">上架日期:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">10000</span></li>
						<li class="nli"><span id="span1">总价:</span><span id="span2">80万/辆起</span></li>
						<li class="nli" style="margin-left: -50px;"><div
								style="background-color: #00AE66; margin-left: 30px; color: white; width: 63px; height: 45px; border-radius: 3px; float: left">
								<span id="span3">在售</span>
							</div>
							<div
								style="background-color: orange; margin-left: 10px; color: white; width: 90px; height: 22px; border-radius: 3px; float: left">
								<span id="span3">靠近地铁</span>
							</div>
							<div
								style="background-color: red; margin-left: 10px; color: white; width: 80px; height: 22px; border-radius: 3px; float: left">
								<span id="span3">1室两厅</span>
							</div></li>
					</ul>
				</div></li> -->
		</ul>

	</div>


</body>
</html>