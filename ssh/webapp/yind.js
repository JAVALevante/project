/**
 * 
 */
 function addMapOverlay() {


    var u = map.getZoom(); // 定义地图缩放等级的变量
	map.clearOverlays();
	
	if( u >= 14 &&u <= 16 ){
		

		 for (var index = 0; index < markernew2.length; index++) {
			 markernew2[index].addEventListener("click", function(e){  
				  map.setZoom(17);  
		 			 });
			 
			
			 
				markernew2[index].addEventListener("mouseover", function(e){  
		   			//
					this.setStyle({                                   //给label设置样式，任意的CSS都是可以的
			    		 background:"red", 
			    	});
					
		 			//
		 			 });
				markernew2[index].addEventListener("mouseout", function(e){  
		   			//
					this.setStyle({                                   //给label设置样式，任意的CSS都是可以的
			    		 background:"green", 
			    	});
					
		 			//
		 			 });
			 
			 
		 map.addOverlay(markernew2[index]);  
		 }
		 }
	else if (u >= 17) {   //

  	 for (var index = 0; index < markernew.length; index++) {
  		 var infoWindow = new BMap.InfoWindow(contents[index]);
  		 markernew[index].infoWindow = infoWindow
  		markernew[index].addEventListener("mouseover", function(e){  
   			
  			this.openInfoWindow(e.target.infoWindow);
 			
 			 }); 
  		 markernew[index].addEventListener("click", function(e){  
    			var ln = this.getPosition().lng;
   		     var la = this.getPosition().lat;
   			
   			 $.ajax({ 

   		       data:{"lng":ln,"lat":la},

   		        type:"post", 

   		       dataType: 'json',

   		        url:"/ssh/test3.mvc", 
   		        
   		        async : false, 
   		        
   		        success:function(data){ 
   		     	    var name = data.name;
   		     	    var RB = data.RB;
 	     	        var x = data.x;
 	     	        var y  = data.y;
 	     	        var con = data.content;
 	     	      
 	     	        var add  = data.province+data.city+data.distric; 
 	     	        var acreage  = data.acreage;
 	     	        var housetype  = data.housetype;
 	     	        var price = data.price
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
     		
  		
 	        map.addOverlay(markernew[index]);  
  	 }
  	 

  }
	
	
	else {

		 for(var q=0;q<myLabels.length;q++)  
 {    
			 myLabels[q].addEventListener("mouseout", function(e){  
			
			   	 this.setStyle({
			   		 background:"green",  });

			  	}); 
		 
			 
			 
			map.addOverlay(myLabels[q]);
	 }

    }
    
}
