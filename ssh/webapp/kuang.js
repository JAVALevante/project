/**
 * 
 */
var dflag="0";  
var sflag="0";  
var a1;  
var b1;  
var a2;  
var b2;  
var polygon="";  
  

//第一次第二次点击不同事件
map.addEventListener("click", function(e){   
    if(sflag=="1"){  
        dflag="0"; 
        var a;
      if(a1>a2){a =a1;a1=a2;a2=a;}
      if(b1>b2){b =b1;b1=b2;b2=b;}
        $.ajax({ 

 	       data:{"a1":a1,"a2":a2,"b1":b1,"b2":b2},

 	        type:"post", 

 	       dataType: 'json',

 	        url:"/ssh/sg.mvc", 
 	        
 	        async : false, 
 	        
 	        success:function(data){ 
 	       
 	        	 for(var j=0;j<data.length;j++)  
 		          {    
 	        		 
 	        		 var newsiteMap = data[j];  
 	     	        var x = newsiteMap.x;
 	     	        var y  = newsiteMap.y;
 	     	        var con = newsiteMap.content;
 	     	        var add  = newsiteMap.add; 
 	     	      var pointnew = new BMap.Point(x,y); 
 	     	    var myIcon = new BMap.Icon("2.png", new BMap.Size(60,60));  
		    	var marker	 = new BMap.Marker(pointnew,{icon:myIcon});  
 	     	   var infoWindow = new BMap.InfoWindow(con);
 	    		
 	     	 marker.infoWindow = infoWindow
 	     	   marker.addEventListener("mouseover", function(e){  
 	     			
 	    			this.openInfoWindow(e.target.infoWindow);
 	   			
 	   			 }); 
 	     	marker.addEventListener("click", function(e){  
 			var ln = Number(this.getPosition().lng);
		     var la =  Number(this.getPosition().lat);
		     
		     $.ajax({ 

			       data:{"lng":ln,"lat":la},

			        type:"post", 

			       dataType: 'json',

			        url:"/ssh/test3.mvc", 
			        
			        async : false, 
			        
			        success:function(data){ 
			     	
			        	 var name = data.name;
		   		     	    var RB = data.RB;
	    	        var con = data.content;
	    	        var add  = data.province+data.city+data.distric; 
	    	        var price = data.price
	    	        var acreage  = data.acreage;
 	     	        var housetype  = data.housetype;
	    	        var H_type  = data.H_type;
	    	        var url = data.url;
	 	     	      location.href="onehouse.jsp?x="+ln+"&con="+con+"&y="+y+"&add="+add+
	 	     	    "&acreage="+acreage+"&housetype="+housetype+"&price="+price+"&H_type="+H_type+
	 	     	  "&name="+name+"&RB="+RB+"&url="+url;//需要跳转的地址
			        
			        },

			         error:function(data){ 

			        }

			        });
		     
		
			 }); 
  		
 	  	        map.addOverlay(marker);  
 		         
 		          
 		          
 		          }
           
 	     
 	        },

 	         error:function(data){ 

 	           alert("fail"); 

 	        }

 	        }); 
         
		
        
        //
        return;  
    }       
    if(dflag=="1"){  
        a1=Number(e.point.lng);  
        b1=Number(e.point.lat);  
        beginMove();  
    }   
       
});   
  
  
function beginMove(){  
    map.addEventListener("mousemove", add_marker);
    
}  


function add_marker(e){   
        if(dflag=="1"){  
            if(polygon!=""){  
                map.removeOverlay(polygon);  
                polygon="";  
            } 
            a2=Number(e.point.lng);  
            b2=Number(e.point.lat);    
            polygon = new BMap.Polygon([  
              new BMap.Point(a1,b1),  
              new BMap.Point(a2,b1),  
              new BMap.Point(a2,b2),  
              new BMap.Point(a1,b2)  
            ], {strokeColor:"green", strokeWeight:6, strokeOpacity:0.5});  
            map.addOverlay(polygon);  
            sflag="1";  
        }   
    };
    //画框找房开启
 function stop() {
	   dflag="1";  
	    sflag="0";
    map.clearOverlays(); 
    clearInterval(timer);
    }
 //画框找房关闭
    function nostop() {
    	 dflag="0";  
         map.clearOverlays(); 
       map.removeEventListener("mousemove", add_marker);

        get();
        timer =  setInterval("addMapOverlay()",1000);
        }