/**
 * 
 */

    $(function(){

             $(".menu >ul >li").hover(function(){

                $(this).find(".sub_menu").show();

             },function(){

                $(this).find(".sub_menu").hide();
             });

           });
//
   
//
function get() {
	
	  obj = document.getElementsByName("price");
	  var check_val = [];
	  obj2 = document.getElementsByName("acreage");
	  var check_val2 = [];
	  obj3 = document.getElementsByName("htype");
	  var check_val3 = [];
	   for(var k=0;k<obj.length;k++){
	        if(obj[k].checked)
	            check_val.push(obj[k].value);
         
	    }
	   for(var y=0;y<obj2.length;y++){
	        if(obj2[y].checked)
	            check_val2.push(obj2[y].value);
        
	    }
	   for(var x=0;x<obj3.length;x++){
	        if(obj3[x].checked)
	            check_val3.push(obj3[x].value);
       
	    }
	   check_val.push("1000");// 放在最后用于判断是否为空
	   check_val2.push("1000");
	   check_val3.push("1000");
	
	   //
		 $.ajax({ 

	       data:{"check_val":check_val,"check_val2":check_val2,"check_val3":check_val3},

	        type:"post", 
	        traditional: true,
	       dataType: 'json',

	        url:"/ssh/sd.mvc", 
	        
	        async : false, 
	        
	        success:function(data){
	        	markers.length = 0;
	        	 contents.length = 0;
	        	 adds.length  = 0;
	        	 bdds.length = 0;
	        	 for(var i=0;i<nums.length;i++){ nums[i]=0}
	        	 myLabels.length = 0;
	        	 markernew.length = 0;
	        	 markernew2.length = 0;
	        	
	        	for(var j=0;j<data.length;j++)  
		          {   var newsiteMap = data[j]; 
		          var x = Number(newsiteMap.x);
			        var y  = Number(newsiteMap.y);
			        var con = newsiteMap.content;
			        var add  = newsiteMap.add;
			        markers[j]={name:x,age:y};
			       
			        var pointnew = new BMap.Point(markers[j].name,markers[j].age); 
			  	  var myIcon = new BMap.Icon("2.png", new BMap.Size(60,60));  
			    	var marker	 = new BMap.Marker(pointnew,{icon:myIcon});  
			       
			        
		    		 markernew.push(marker);
		    		
		    		 contents[j]= con;
		    	
		    		 adds[j] = add;
		    		 //
		    		 geoc.getLocation(pointnew, function (rs) {  
			             var addComp = rs.addressComponents;  
			             var address =addComp.street ;  
			          
			             //
			           if  (address !== '')  
		                  { 
			              localSearch = new BMap.LocalSearch(map);
			             localSearch.search(address);
			       　　 localSearch.setSearchCompleteCallback(function (searchResult) {
			       　　　     　var poi = searchResult.getPoi(0);
		               var pointnew2 = new BMap.Point(poi.point.lng,poi.point.lat); 
			              var youLabel = new BMap.Label(address,     // 为lable填写内容
			            	  	    {offset:new BMap.Size(-50,-50),                  // label的偏移量，为了让label的中心显示在点上
			            	  	    position:pointnew2});                                // label的位置
			            	  	  youLabel.setStyle({                                   // 给label设置样式，任意的CSS都是可以的
			            	  		 borderRadius:"60px", 
			            			    background:"green",   
			            			     opacity: "0.8",  
			            			    fontSize:"12px",               // 字号
			            			    border:"0",                    // 边
			            			    height:"50px",                // 高度
			            			    width:"50px",                 // 宽
			            			    textAlign:"center",            // 文字水平居中显示
			            			    lineHeight:"50px",            // 行高，文字垂直居中显示
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
			               var youLabel2 = new BMap.Label(tnt,     // 为lable填写内容
				            	  	    {offset:new BMap.Size(-50,-50),                  // label的偏移量，为了让label的中心显示在点上
				            	  	    position:pointnew3});                                // label的位置
				            	  	  youLabel2.setStyle({                                   // 给label设置样式，任意的CSS都是可以的
				            	  		 borderRadius:"60px", 
				            			    background:"green",   
				            			     opacity: "0.8",  
				            			    fontSize:"12px",               // 字号
				            			    border:"0",                    // 边
				            			    height:"60px",                // 高度
				            			    width:"60px",                 // 宽
				            			    textAlign:"center",            // 文字水平居中显示
				            			    lineHeight:"50px",            // 行高，文字垂直居中显示
				            			    cursor:"pointer"
				            	  	});

				            	  	youLabel2.tt = address;
				            	  	youLabel2.addEventListener("mouseover", function(e){  
				            			
					       			   	 this.setStyle({
					       			   		 background:"red",  });
					       			//
					       			    var bdary = new BMap.Boundary();
							            bdary.get(address, function(rs){       // 获取行政区域
							          var count = rs.boundaries.length; // 行政区域的点有多少个
							             
							          for(var i = 0; i < count; i++){
							        	 ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#458B00"}); // 建立多边形覆盖物
							        	
							       
							        	 ply.setFillOpacity("0");
							              map.addOverlay(ply);  // 添加覆盖物
							          }    
							    
							      });   
					       			   	 
					       			   	 //
					       			  	});         
				            		youLabel2.addEventListener("click", function(){  
					            	  	   map.setZoom(14);  
					            	 	}); 

				            	  	myLabels.push(youLabel2);
				            	
				 }); 
				               });
		    		 
			           
			             if (bdds.indexOf(add) == -1) {
			            	 bdds.push(add); // 判断在arr_1数组中是否存在，不存在则push到arr_1数组中
			             }
			             
		    		 
		    		 
		    		
		          
	     
		          }// for
	        	for(var j=0;j<adds.length;j++)  {
	        		for(var i=0;i<bdds.length;i++)  {
	        			
	        			       if(adds[j] == bdds[i]){
	        			    	   nums[i]++;
	        			    	  
	        			       }
	        				        	 
	        				          }}
//	        	
	        },
	       
	         error:function(data){ 
	            alert("fail"); 
	        }

	        }); 
  }