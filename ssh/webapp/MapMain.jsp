<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎来到老司机豪车网站</title>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<style type="text/css">
ul {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

.menu>ul>li {
	background-color: green;
	float: left;
	width: 205px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	color: white;
	margin-right: 10px;
}

.menu>ul>li:hover {
	background-color: #228B22;
}

.sub_menu {
	display: none;
}

.sub_menu>li {
	background-color: #2F4F4F;
}

.sub_menu>li:hover {
	background-color: #2F4F4F;
}

#container {
	z-index: -1;
	position: absolute;
}
</style>


</head>

<body onload="getdata();">
	<div class="main">
		<form action="" method="get">
			<div class="menu">

				<ul>
					<li>首页</li>
					<li>
						品牌
						<div>
							<ul class="sub_menu">
								<li>
									<label>
										<input name="acreage" type="checkbox" value="0" />
										玛莎拉蒂
									</label>
									<label>
										<input name="acreage" type="checkbox" value="50" />
										法拉利
									</label>
									</br>
									<label>
										<input name="acreage" type="checkbox" value="100" />
										奔驰
									</label>
									<label>
										<input name="acreage" type="checkbox" value="150" />
										凯迪拉克
									</label>
									</br>
								</li>

							</ul>
						</div>
					</li>
					<li>
						车型
						<div>
							<ul class="sub_menu">
								<li>
									<label>
										<input name="htype" type="checkbox" value="一居室 " />
										SUV
									</label>
									<label>
										<input name="htype" type="checkbox" value="二居室" />
										轿跑
									</label>
									</br>
									<label>
										<input name="htype" type="checkbox" value="三居室" />
										敞篷跑车
									</label>
									<label>
										<input name="htype" type="checkbox" value="四居室" />
										房车
									</label>
									</br>
								</li>

							</ul>
						</div>
					</li>
					<li>
						价格
						<div>
							<ul class="sub_menu">
								<li>
									<label>
										<input name="price" type="checkbox" value="0" />
										50万以下
									</label>
									<label>
										<input name="price" type="checkbox" value="50" />
										50-100万
									</label>
									</br>
									<label>
										<input name="price" type="checkbox" value="100" />
										100-150万
									</label>
									<label>
										<input name="price" type="checkbox" value="150" />
										150-200万
									</label>
									</br>
									<input type='button' value='提交' onclick="get()" />
								</li>

							</ul>
						</div>
					</li>
					<li>
						画图找
						<div>
							<ul class="sub_menu">
								<li>
									<input type='button' value='开启' onclick="stop()" />
									<input type='button' value='关闭' onclick="nostop()" />
								</li>

							</ul>
						</div>
					</li>
				</ul>

			</div>
		</form>
	</div>

	<div style="width: 100%; height: 700px; border: 1px solid gray" id="container"></div>
</body>
</html>
<script type="text/javascript">




	addMapOverlay1();//请求坐标


function getdata() {
	
	 timer =  setInterval("addMapOverlay()",1000);//刷新
}


var timer;
 var markers = [];//所有点坐标
 var myLabels = [];
 var markernew = [];//房屋 
 var markernew2 = [];//街道
 var contents = [];//房屋简介
 var adds = [];//区名
 var bdds=[];
 var ply;//覆盖物
 var ply2;
  var nums = new Int8Array(100);//各区房屋数初始让各项均为零


  var map;    //创建地图容器
  var point;      //创建一个点
   var geoc;   //地图解析器
   var localSearch;//地址解析器
   var localSearch2;//地址解析器

 function addMapOverlay1() {

	 map = new BMap.Map("container");    //创建地图容器
	  point = new BMap.Point(120.371473,36.118823);      //创建一个点
	 map.centerAndZoom(point, 13);                       //设立中心点和地图级别，就是初始化地图
	  map.enableScrollWheelZoom(true);  
	  geoc = new BMap.Geocoder(); 

	  

	 $.ajax({ 

	        type:"POST", 
	    
	        url:"/ssh/sc.mvc", 
	        success:function(data){ 
	    
	          for(var j=0;j<data.length;j++)  
	          {  
	        	 
	        var newsiteMap = data[j];  
	        var x = newsiteMap.x;
	        var y  = newsiteMap.y;
	        var con = newsiteMap.content;
	        var add  = newsiteMap.add;
	        markers[j]={name:x,age:y};
	        contents[j]= con;
	        adds[j] = add;
	        
	    	 var pointnew = new BMap.Point(markers[j].name,markers[j].age); 
	           geoc.getLocation(pointnew, function (rs) {  
	             var addComp = rs.addressComponents;  
	             var address =addComp.street ;  
	            
	           if  (address !== '')  
                  { 
	        	 
	              localSearch = new BMap.LocalSearch(map);
	             localSearch.search(address);
	      localSearch.setSearchCompleteCallback(function (searchResult) {
	       var poi = searchResult.getPoi(0);
	    
               var pointnew2 = new BMap.Point(poi.point.lng,poi.point.lat); 
	         	              var youLabel = new BMap.Label(address,     //为lable填写内容
	            	  	    {offset:new BMap.Size(-50,-50),                  //label的偏移量，为了让label的中心显示在点上
	            	  	    position:pointnew2});                                //label的位置
	            	  	  youLabel.setStyle({                                   //给label设置样式，任意的CSS都是可以的
	            	  		 borderRadius:"60px", 
	            			    background:"green",   
	            			     opacity: "0.8",  
	            			    fontSize:"12px",               //字号
	            			    border:"0",                    //边
	            			    height:"50px",                //高度
	            			    width:"50px",                 //宽
	            			    textAlign:"center",            //文字水平居中显示
	            			    lineHeight:"50px",            //行高，文字垂直居中显示
	            			    cursor:"pointer"
	            	  	});
	            	  	
	            	  	    
	            	  	markernew2.push(youLabel);
	              
	              
	              
	              
	              
	       });
                  } 
	             
	
	    	 });
  
	               geoc.getLocation(pointnew, function (rs) { 
	            	  
	             var addComp = rs.addressComponents;  
	             var address =addComp.district;  
	                   
	    	 localSearch2 = new BMap.LocalSearch(map);
	    	localSearch2.search(address);
	     
	       localSearch2.setSearchCompleteCallback(function (searchResult) {
	       　
	       　　 	var poi2 = searchResult.getPoi(0);
	   
               var pointnew3 = new BMap.Point(poi2.point.lng,poi2.point.lat); 

  			 for(var i=0;i<nums.length;i++){
  		       if(address==bdds[i]){var tnt=address+nums[i]+"套"}
   }
        
               var youLabel2 = new BMap.Label(tnt,     //为lable填写内容
	            	  	    {offset:new BMap.Size(-50,-50),                  //label的偏移量，为了让label的中心显示在点上
	            	  	    position:pointnew3});                                //label的位置
	            	  	  youLabel2.setStyle({                                   //给label设置样式，任意的CSS都是可以的
	            	  		 borderRadius:"60px", 
	            			    background:"green",   
	            			     opacity: "0.8",  
	            			    fontSize:"12px",               //字号
	            			    border:"0",                    //边
	            			    height:"60px",                //高度
	            			    width:"60px",                 //宽
	            			    textAlign:"center",            //文字水平居中显示
	            			    lineHeight:"50px",            //行高，文字垂直居中显示
	            			    cursor:"pointer"
	            	  	});
	            	
	            	 	 
	            	  	youLabel2.addEventListener("mouseover", function(e){  
	            	  		
	       			   	 this.setStyle({
	       			   		 background:"red",  });
	       			   	 
			             var bdary = new BMap.Boundary();
			            bdary.get(address, function(rs){       //获取行政区域
			          var count = rs.boundaries.length; //行政区域的点有多少个
			             
			          for(var i = 0; i < count; i++){
			        	 ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#458B00"}); //建立多边形覆盖物
			        	
			       
			        	 ply.setFillOpacity("0");
			              map.addOverlay(ply);  //添加覆盖物
			          }    
			    
			      });   
	       		
	       			  	}); 
	            		
	            	  	youLabel2.addEventListener("click", function(){  
	            	  	   map.setZoom(14);  
	            	 	}); 
	            	  	
	            	  	
	            	  	
	            	  		myLabels.push(youLabel2);
	            	 
	            	    
	            	
	            
	       }); 
	               });
	    	
	               
		             if (bdds.indexOf(add) == -1) {
		            	 bdds.push(add); //判断在arr_1数组中是否存在，不存在则push到arr_1数组中
		             }
		             
	        

	    		 //地址解析
	    		  var myIcon = new BMap.Icon("2.png", new BMap.Size(60,60));  
	    	var marker	 = new BMap.Marker(pointnew,{icon:myIcon});  
	    	 
	    		 markernew.push(marker);


	          }
	          //for
for(var j=0;j<adds.length;j++)  {
	for(var i=0;i<bdds.length;i++)  {
		       if(adds[j] == bdds[i]){
		    	   nums[i]++;
		    	  
		       }
			          }}
	        },
	         error:function(data){ 
	            alert("fail"); 
	        }
	        }); 
 }
</script>
<script type="text/javascript" src="yind.js"> </script>
<script type="text/javascript" src="select.js"> </script>
<script type="text/javascript" src="kuang.js"> </script>
</html>