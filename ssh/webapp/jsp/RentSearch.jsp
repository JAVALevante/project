<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎来到老司机豪车网站e</title>
<style>
#up {
	margin-left: 10%;
	margin-right: 10%;
	border: solid 2px darkcyan;
	height: 55px;
}

#main {
	margin-top: 8px;
	margin-left: 10%;
	margin-right: 10%;
	height: 312px;
	border: solid 1px darkcyan;
}

#up1 {
	height: 80px;
	margin-left: 10%;
	margin-right: 10%;
	background-color: darkcyan;
	margin-top: 12px;
}

#up1 li {
	float: left;
}

#search {
	padding-top: 25px;
	margin-left: 20%;
}

.sear {
	height: 20px;
	width: 300px;
	border-radius: 5px;
	border: solid 1px gray;
}

#search select {
	height: 25px;
	width: 60px;
	border-radius: 5px;
}

#main li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
}

#main a {
	font-size: 13px;
	color: darkcyan;
}

li {
	list-style-type: none;
}

a {
	text-decoration: none;
}

#main a:HOVER {
	color: sandybrown;
}

#ul1 {
	margin-top: 20px;
}

#list {
	margin-top: 30px;
	margin-left: 10%;
	margin-right: 10%;
	border: solid 1px darkcyan;
}

#list_div {
	margin-top: 10px;
	height: 160px;
	width: 370px;
	float: left;
}

#mainA {
	font-size: 28px;
	color: #333;
	font-weight: bold;
	text-decoration: none;
	letter-spacing: 3px;
}

#mainA:HOVER {
	color: darkcyan;
}

#span1 {
	font-size: 13px;
	font-weight: bold;
}

#price {
	color: #db4c3f;
	font-size: 30px;
	font-weight: bold;
}

#list_inner1 {
	height: 180px;
	width: 100%;
	border-bottom: solid 1px darkgray;
}

#imgstyle {
	width: 250px;
	height: 160px;
}

#con {
	width: 70px;
	height: 42px;
	font-size: 15px;
	color: #232836;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border: solid 2px sandybrown;
	border-top-left-radius: 7px
}

#searchhouse {
	width: 530px;
	height: 40px;
	border: none;
	background-color: ghostwhite;
	color: darkcyan;
	font-size: 20px;
}

#searchbtn {
	width: 100px;
	height: 42px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border: none;
	font-size: 20px;
	color: white;
	background-color: sandybrown;
}

#formation {
	margin-top: -20px;
	height: 55px;
	background-color: gainsboro;
	border-top: solid 1px ghostwhite;
}

#formation li {
	float: left;
}

#formation  select {
	height: 30px;
	width: 100px;
	margin-top: 15px;
	margin-left: 45px;
	color: darkcyan;
	font-size: 15px;
	border: none;
	background-color: gainsboro;
}

#mput1, #mput2, #aput1, #aput2 {
	width: 100px;
	height: 20px;
	border: solid 1.5px darkcyan;
	border-radius: 5px;
}

#distric, #area, #money, #types {
	width: 100px;
	height: 25px;
	text-align: center;
	border: solid 1.5px darkcyan;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	color: darkcyan;
	border: solid 1.5px darkcyan;
}

#pagebtn {
	border: solid 1.5px darkcyan;
	color: sandybrown;
	font-weight: bold;
}

#tag li {
	width: 80px;
	height: 20px;
	float: left;
	font-size: 13px;
	border-radius: 2px;
}
</style>
</head>
<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {

		ajaxCondition(0, 'h_id');

	}
	function distric(target) {
		var c = document.getElementById("condition1");
		c.style.display = "block";
		$("#distric").val($(target).text());
		ajaxCondition(0, "h_id");
	}
	function money(target) {
		var c = document.getElementById("condition2");
		c.style.display = "block";
		$("#money").val($(target).text());
		ajaxCondition(0, "h_id");
	}
	function area(target) {
		var c = document.getElementById("condition3");
		c.style.display = "block";
		$("#area").val($(target).text());
		ajaxCondition(0, "h_id");
	}
	function types(target) {
		var c = document.getElementById("condition4");
		c.style.display = "block";
		$("#types").val($(target).text());
		ajaxCondition(0, "h_id");
	}
	function closedisplay(condition, value) {

		var v = document.getElementById(value);
		v.value = "";
		var c = document.getElementById(condition);
		c.style.display = "none";
		ajaxCondition(0, "h_id");
	}

	function moneyself() {
		var v1 = document.getElementById("mput1");
		var v2 = document.getElementById("mput2");
		var c = document.getElementById("condition2");
		c.style.display = "block";
		$("#money").val(v1.value + "-" + v2.value + "元");
		ajaxCondition(0, "h_id");
		v1.value = "";
		v2.value = "";

	}
	function areaself() {
		var v1 = document.getElementById("aput1");
		var v2 = document.getElementById("aput2");
		var c = document.getElementById("condition3");
		c.style.display = "block";
		$("#area").val(v1.value + "-" + v2.value + "平");
		ajaxCondition(0, "h_id");
		v1.value = "";
		v2.value = "";
	}

	function test() {
		var distric = document.getElementById("distric").value;
		var money = document.getElementById("money").value;
		var area = document.getElementById("area").value;
		var types = document.getElementById("types").value;
		var a1 = "", a2 = "";
		var m1 = "", m2 = "";

		if (money == "") {
			m1 = "";
			m2 = "";
		} else {
			if (money == "1000元以下") {
				m1 = "0";
				m2 = "1000";
			} else {
				if (money == "5000元以上") {
					m1 = "5000";
					m2 = "10000";
				} else {

					var arr = money.split("-");
					if (arr[1].length == 4) {
						m1 = arr[0];
						m2 = arr[1].substring(0, 3);
					} else {
						m1 = arr[0];
						m2 = arr[1].substring(0, 4);
					}
				}
			}
		}

		switch (area) {
		case "SUV":
			a1 = "0";
			a2 = "50";
			break;
		case "200平以上":
			a1 = "200";
			a2 = "400";
			break;
		case "50-70平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 2);
			break;
		case "70-90平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 2);
			break;
		case "90-110平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "110-130平":
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
		case "":
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

		if (types == "") {
			types = "";
		} else {
			if (types == "4室以上") {
				types = "%5室%";
			} else {
				types = "%" + types + "%";

			}
		}

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

		for (var i = a; i < a + 5; i++) {
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
			var housetype = result.h_houseType;
			var RB = result.h_RB;
			var url = result.h_url;
			var x = result.h_x;
			var y = result.h_y;
			var con = result.h_info;

			item = "<li id='list_inner1'><div id='list_div' style='width: 300px;'><img id='imgstyle' alt='11' src='.."+url+"'></div>"
					+ "<div id='list_div' style='margin-left: 30px;'>"
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
					+ "&housetype="
					+ housetype
					+ "&url="
					+ url
					+ "&design="
					+ design
					+ "'>"
					+ name
					+ "</a>"
					+ "<br><br> <span id='span1' style='color:#666;'>中国"
					+ distric
					+ "&nbsp&nbsp|</span>"
					+ "<span id='span1' style='margin-left: 10px;color:#666;'>"
					+ types
					+ "&nbsp&nbsp|</span>"
					+ "<span id='span1' style='margin-left: 10px;color:#666;'>"
					+ area
					+ "排量&nbsp&nbsp|</span><span id='span1' style='margin-left: 10px;color:#666;'></span><br><br>"
					+ "<span id='span1' style='color: darkgray;'>"
					+ housetype
					+ "</span><span id='span1' style='margin-left: 10px;color: darkgray;'></span>"
					+ "<span id='span1' style='margin-left: 10px; color: darkgray;'>"
					+ RB
					+ "车</span><ul id='tag' style='margin-top: 10px;'><li style='border:1px solid #357eac; margin-left: -40px;	color: #6e96af'>"
					+ "<span style='margin-left: 13px;'>随时试车</span></li><li style='border:1px solid #33BE85; margin-left: 8px;color: #33BE85;'>"
					+ "<span style='margin-left: 12px;'>"
					+ design
					+ "</span></li><li style='border:1px solid  orangered; margin-left: 8px;color:orange'>"
					+ "<span style='margin-left: 8px;'>奢华驾驶</span></li><li style='border:1px solid  darkorchid; margin-left: 8px;color:purple'>"
					+ "<span style='margin-left: 13px;'>欲购从速</span></li></ul>"
					+ "</div>"
					+ "<div id='list_div' style='margin-left: 90px;'>"
					+ "<div style='margin-top: 50px;margin-left: 50px;'><span id='price'>"
					+ money
					+ "</span> <span style='color: #db4c3f;'>元/月</span><span	 style='margin-left: 50px; color: blue;'>最短租期"
					+ date + "个月</span></div></div></li>"
			$("#ul").append(item);
		}
	}

	function AEscOrDesc() {
		var Aesc = document.getElementById("Aesc").value;

		if (Aesc == "从小到大") {
			ajaxCondition(0, "h_area");
		} else if (Aesc == "从大到小") {
			ajaxCondition(0, "h_area desc");
		} else {

			ajaxCondition(0, 'h_id');
		}

	}

	function MEscOrDesc() {

		var Mesc = document.getElementById("Mesc").value;

		if (Mesc == "从小到大") {
			ajaxCondition(0, "h_money");
		} else if (Mesc == "从大到小") {
			ajaxCondition(0, "h_money desc");
		} else {

			ajaxCondition(0, 'h_id');
		}

	}

	function defaultEsc() {
		document.getElementById("Aesc").value = "面积排序";
		document.getElementById("Mesc").value = "售价排序";
		ajaxCondition(0, 'h_id');
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
				RB : "租",
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

			}
		});

	}

	function SearchList() {

		var con = document.getElementById("con").value;
		var c1 = document.getElementById("condition1");
		var c2 = document.getElementById("condition2");
		var c3 = document.getElementById("condition3");
		var c4 = document.getElementById("condition4");

		switch (con) {
		case "位置":
			c1.style.display = "block";
			$("#distric").val($("#searchhouse").val());
			$("#searchhouse").val("");
			ajaxCondition(0, 'h_id');
			break;
		case "价格":
			c2.style.display = "block";
			$("#money").val($("#searchhouse").val());
			$("#searchhouse").val();
			ajaxCondition(0, 'h_id');
			break;
		case "面积":
			c3.style.display = "block";
			$("#area").val($("#searchhouse").val());
			$("#searchhouse").val();
			ajaxCondition(0, 'h_id');
			break;
		case "类型":
			c4.style.display = "block";
			$("#types").val($("#searchhouse").val());
			$("#searchhouse").val();
			ajaxCondition(0, 'h_id');
			break;
		}

	}
</script>

<body>
	<div id="up">
		<h1 style="margin-top: 3px; margin-left: 20px; color: darkcyan;">租车</h1>
	</div>
	<div id="up1">
		<ul style="padding-left: 100px; padding-top: 20px;">
			<li><select id="con">
					<option>条件</option>
					<option>购车地</option>
					<option>价格</option>
					<option>车型</option>
					<option>品牌</option>
			</select></li>
			<li><input id="searchhouse" type="text" /></li>
			<li><input id="searchbtn" value="搜索" type="button"
				onclick="SearchList()"></li>
		</ul>

	</div>
	<div id="main">
		<div style="padding-top: 15px; height: 170px;">
			<ul>
				<li style="font-size: 16px; font-weight: bold; color: sandybrown">区域：</li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">北京</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">上海</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">武汉</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">成都</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">郑州</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">青岛</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">重庆</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">杭州</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">天津</a></li>
				<li><a href="javascript:void(0)"
					onclick="distric(this);return false">南京</a></li>
			</ul>
			<br />
			<ul id="ul1">
				<li style="font-size: 16px; font-weight: bold; color: sandybrown">租金：</li>
				<li><a href="javascript:void(0)"
					onclick="money(this);return false">1000元以下</a></li>
				<li><a href="javascript:void(0)"
					onclick="money(this);return false">1000-2000元</a></li>
				<li><a href="javascript:void(0)"
					onclick="money(this);return false">2000-3000元</a></li>
				<li><a href="javascript:void(0)"
					onclick="money(this);return false">3000-5000元</a></li>
				<li><a href="javascript:void(0)"
					onclick="money(this);return false">5000元以上</a></li>
				<li><input id="mput1" style="width: 30px;" type="text">
					- <input id="mput2" style="width: 30px;" type="text"> 元 <input
					style="width: 50px; height: 25px; background-color: sandybrown; border: none; color: white;"
					type="button" value="确定" onclick="moneyself()"></li>
			</ul>
			<br />
			<ul id="ul1">
				<li style="font-size: 16px; font-weight: bold; color: sandybrown">车型：</li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">SUV</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">轿跑</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">敞篷跑车</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">轿车</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">房车</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">商务车</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">混合动力车</a></li>
				<li><a href="javascript:void(0)"
					onclick="area(this);return false">清洁能源车</a></li>
				
			</ul>
			<br />
			<ul id="ul1">
				<li style="font-size: 16px; font-weight: bold; color: sandybrown">品牌：</li>
				<li><a href="javascript:void(0)"
					onclick="types(this);return false">玛莎拉蒂</a></li>
				<li><a href="javascript:void(0)"
					onclick="types(this);return false">保时捷</a></li>
				<li><a href="javascript:void(0)"
					onclick="types(this);return false">法拉利</a></li>
				<li><a href="javascript:void(0)"
					onclick="types(this);return false">捷豹</a></li>
				<li><a href="javascript:void(0)"
					onclick="types(this);return false">奔驰</a></li>
			</ul>

		</div>


		<ul
			style="padding-top: 13px; height: 45px; background-color: gainsboro;">
			<li style="font-size: 16px; font-weight: bold; color: sandybrown;">条件：</li>
			<li id="condition1" style="display: none"><input id="distric"
				type="text"> <input type="button"
				style="width: 20px; height: 20px; background-color: red; border-radius: 3px; border: none; color: white;"
				value="X" onclick="closedisplay('condition1','distric')"></li>
			<li id="condition2" style="display: none"><input id="money"
				type="text"> <input type="button"
				style="width: 20px; height: 20px; background-color: red; border-radius: 3px; border: none; color: white;"
				value="X" onclick="closedisplay('condition2','money')"></li>
			<li id="condition3" style="display: none"><input id="area"
				type="text"> <input type="button"
				style="width: 20px; height: 20px; background-color: red; border-radius: 3px; border: none; color: white;"
				value="X" onclick="closedisplay('condition3','area')"></li>
			<li id="condition4" style="display: none"><input id="types"
				type="text"> <input type="button"
				style="width: 20px; height: 20px; background-color: red; border-radius: 3px; border: none; color: white;"
				value="X" onclick="closedisplay('condition4','types')"></li>
		</ul>

		<ul id="formation">
			<li
				style="font-size: 16px; font-weight: bold; color: sandybrown; padding-top: 15px;">筛选：</li>
			<li style="margin-top: 17px;"><a style="font-size: 15px;"
				href="javascript:void(0)" onclick="defaultEsc()">默认排序</a></li>
			<li><select id="Aesc" onchange="AEscOrDesc()">
					<option>车型排序</option>
					<option>从小到大</option>
					<option>从大到小</option>
			</select></li>
			<li><select id="Mesc" onchange="MEscOrDesc()">
					<option>租金排序</option>
					<option>从低到高</option>
					<option>从高到低</option>
			</select></li>
		</ul>


	</div>


	<div id="list">
		<div></div>
		<ul id="ul">
			<li></li>
		</ul>

		<div style="margin-top: 50px;">
			<input id="pagebtn" type="button" value="首页"
				onclick="ajaxCondition(0)"> <input id="pagebtn"
				type="button" value="上一页" onclick="ajaxCondition(2)"> <input
				id="pagebtn" type="button" value="下一页" onclick="ajaxCondition(1)">
		</div>
	</div>
</body>
</html>