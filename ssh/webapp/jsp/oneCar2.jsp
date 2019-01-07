<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=v7ugaj8evae4hfLSRrlxn6cRAYIMixt2"></script>
    <title>欢迎来到老司机豪车网站</title>
</head>
<style>
    body{  
    margin: 0px;  
}  
.header{

    margin:0px;
    padding:0px;
}
.page-header{
height:190px;
    background: url("header-title.jpg") no-repeat scroll top center/ cover;   
font-weight: 300;
z-index:0;
 text-align:center;
 color: white;
 padding-top: 50px;


}
.mid{
box-shadow: darkgrey 10px 10px 30px 5px ;
    width: 1150px;
position: absolute;
z-index:10;
background-color: white;
top: 170px;
margin:0px 0px 0px 150px;
}
#left{

height:50%;
 width:50%;
 background-color:white;
 float: left;
}
#right{

 float: right;
width:50%;
height:50%;
 background-color: white;
}
#bottom{

 background-color: white;
height:100%;
}
.white{
height:1400px;
z-index:0;
}

#back{
float: right;
margin:0px 40px 0px 0px;
}
#container{
    box-shadow: darkgrey 10px 10px 30px 5px ;
}
.img{
            margin:20px auto;
            border:2px solid darkslategray;
            box-shadow: darkgrey 10px 10px 30px 5px ;
height:500px;
 width: 500px;
margin:10px 10px 10px 10px;
}
 .uu{padding: 0;
  height:20%;
  margin :0px 0px 0px 0px;
  }
  .ii{
   line-height:300%;   
  text-align:center;
  width:25%;
   float: left;  
  height:100%;
  list-style-type:none;
  background-color:#5D6D7E;
  }
   .iii{
   line-height:300%;   
  text-align:center;
  width:25%;
   float: left;  
margin :10px 0px 0px 0px;
  list-style-type:none;
   background-color:grey;
  }

  .iii:hover{
  background-color:#D0D3D4;
  }
  .ii:hover{
  background-color:#D0D3D4;
  }
 .hh{
   width:25%;
 float: left; 
     list-style-type:none;
      background-color:#28B463;

 }
 #hat{
  width:100%;
  height:80px;
     float: right; 
     top:1000px;
 }
 input, textarea {
 
        
    padding: 4px;

    border: solid 1px #E5E5E5;

    outline: 0;

    font: normal 13px/100% Verdana, Tahoma, sans-serif;

    width: 200px;

    background: #FFFFFF;

    box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;

    -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;

    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;    
    height:30px;
}
textarea {
   height:200px;
    width: 300px;
}
#dang{
height:600px;
width:150px;
  background:#FFFFFF;
  top:970px;
  z-index:100;
  position:absolute;
}

</style>
<body onload="mmapp();">
      <!-- page header -->    
    
                        <div  class="page-header">
                             <h2 class="header">车辆信息</h2>
                            <p class="header" >老司机专注做豪车</p>
                        </div>
           
            <div class="mid">
 

          <div id="left"> <img class="img" src="${pageContext.request.contextPath}<%=request.getParameter("url")%>" alt="" /> </div>


          <div id="right" >
   
                    <a id="back">>>返回</a>
                     车名:<input type="text" id  = "name" name = "name"  readonly="readonly"/><br>
                  全新/二手:<input type="text" id  = "RB" name = "RB"  readonly="readonly" /><br>          
		地址:<input type="text" id  = "add" name = "add"  readonly="readonly"  /><br>
		价格 （万/辆）:<input type="text" id  = price name = "price"  readonly="readonly" /><br>
	          排量:<input type="text" id  = "acreage" name = "acreage"  readonly="readonly" /><br>
		车型:<input type="text" id  = H_type name = "H_type"  readonly="readonly"/><br>
	            简介:<textarea  type="text" id  ="con"  readonly="readonly"></textarea>
	    </div>
      <!--  <div id="bottom" > 
 <div style="position:absolute;z-index:20;top:800px;left:0px;width:1000px;height:600px;border: solid 1px black;" id="container"></div>
<div id="xx" style="z-index:30;OVERFLOW-Y: auto; OVERFLOW-X:hidden;opacity:0.8; background-color:#ffffff; position:absolute;top:800px;left:-300px;width:300px;height:470px;">
		   <ul class ="uu">
                    <li class = "ii">教育</li>
                    <li class = "ii">医疗</li>
                    <li class = "ii">购物</li>
                    <li class = "ii">交通</li>
		
		  </ul>
	
		   <ul class ="uu" id="J_List"></ul> 
	  
		
		</div>

       
       </div> -->

           
    
    </div>

 <div class="white">
               
               <div id="dang"></div>
            </div>

		
			  
			<footer style="color:white;text-align:center;background-color:#333;height:100px;">
                 <p>BuyMore Template <i class=" lnr lnr-heart"></i> Powered By <a href="http://bootultra.com">Boot Ultra</a> | All Rights Reserved</p>      
                BuyMore Template
			</footer>


</body>
        <script type="text/javascript">  
var o = 0;
     var name = "<%=request.getParameter("name")%>";
     var RB = "<%=request.getParameter("RB")%>";
    var con = "<%=request.getParameter("con")%>";
    var add = "<%=request.getParameter("add")%>";
    
    
    var acreage = "<%=request.getParameter("area")%>"; 
      var H_type = "<%=request.getParameter("types")%>"; 
    var price = "<%=request.getParameter("money")%>"; 
    var url = "<%=request.getParameter("url")%>"; 
    
    var local;
    var local2;
    var p = true;
    document.getElementById("name").value =name;
    document.getElementById("RB").value =RB;
   document.getElementById("con").value = con;
   document.getElementById("add").value = add;
   document.getElementById("price").value = price;
   document.getElementById("acreage").value = acreage;
   document.getElementById("H_type").value = H_type;
  
 /*  function mmapp() {
	var map = new BMap.Map("container");    //创建地图容器
	 var point = new BMap.Point(x,y);      //创建一个点
	 var myIcon = new BMap.Icon("2.png", new BMap.Size(60,60));   
	  var marker = new BMap.Marker(point,{icon:myIcon});  // 创建标注
	  marker.addEventListener("click", function(e){  
	    if(p){
		  one();}else{
			  two();
		  }
	  
	  });
	   local2 = new BMap.LocalSearch(map, {
		  //
		onSearchComplete: function(results){
			// 判断状态是否正确
			if (local.getStatus() == BMAP_STATUS_SUCCESS){
				var s = [];
				o = results.getCurrentNumPois();
				for (var i = 0; i < results.getCurrentNumPois(); i ++){
					s.push(results.getPoi(i).title + ", " + results.getPoi(i).address);
					addLi(i);
					document.getElementById(i).value =s[i];		
				
				}
				
				//document.getElementById("r-result").innerHTML = s.join("<br/>");
			}
		}
	
	   
		});
	   local = new BMap.LocalSearch(map, {
		
		   renderOptions:{map: map}
		   
			});
	
	 map.centerAndZoom(point, 17);  
	  map.enableScrollWheelZoom(true);  
		map.addOverlay(marker);
   }
   function addLi(i){
	   var li_1=document.createElement("output");
	   var li_2=document.createElement("li");

	      li_2.style.width ="100%";
	      li_2.setAttribute("class","iii");
	      li_1.setAttribute("id",i);
	       li_2.setAttribute("id","a"+i);
	      document.getElementById("J_List").appendChild(li_2);
	      document.getElementById("a"+i).appendChild(li_1);
   }
  function removeLi(){
	   var nodeul = document.getElementById('J_List');//找到父节点

	   for (var i = 0; i <o;i ++){
		  var li_lan = nodeul.children[0];//找到要删除的子节点
		   nodeul.removeChild(li_lan);//使用removeChild()函数删除
		   }
   }
 
   function school() {
	   removeLi();
	   local.searchNearby("学校", new BMap.Point(x, y),1000);
	   local2.searchNearby("学校", new BMap.Point(x, y),1000);
 
   }
   function hospital() {
	   removeLi();
	   local.searchNearby("医院", new BMap.Point(x, y),1000);
	   local2.searchNearby("医院", new BMap.Point(x, y),1000);
	 
   }
   function supermarket() {
	   removeLi();
	   local.searchNearby("超市", new BMap.Point(x, y),1000);
	   local2.searchNearby("超市", new BMap.Point(x, y),1000);
	   }
   function traffic() {
	   removeLi();
	   local.searchNearby("公交站", new BMap.Point(x, y),1000);
	   local2.searchNearby("公交站", new BMap.Point(x, y),1000);
	
   }
   
   //
   

    var xx=document.getElementById('xx');
    var xxleft = parseInt(xx.style.left);
    var  t;

     function one(){

     t=setInterval(rollRight,1);
     p=false;
     }
     function two(){
     t=setInterval(rollLeft,1);
     p=true;
     }
    
    //向左移动
    function rollLeft(){

        xxleft--;
        xxleft--;
        xxleft--;
        xx.style.left = xxleft+'px';
        if(xxleft <=-320 ){
          clearInterval(t);
        }
      
    }
    //向右移动
    function rollRight(){
   
        xxleft++;
        xxleft++;
        xxleft++;
        xx.style.left = xxleft+'px';
        if(xxleft >=-8){
          clearInterval(t);
        }
    }
   
    var oli = document.getElementsByClassName("ii");
   
        oli[0].onclick = function () {
        	school();
        };
        oli[1].onclick = function () {
        	hospital();
        };
        oli[2].onclick = function () {
        	supermarket();
        };
        oli[3].onclick = function () {
        	traffic();
        }; */
   
   
</script>
</html>