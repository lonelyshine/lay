function getNOTRead(basepath){
		     //var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/EmailNotRead.do"; //请求的网址  
			 var number = 1;
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              $("#notreademail").text(data.notReadEmail);
			                            }else{
			                              //alert("获取未读邮件失败");
			                              layer.msg('获取未读邮件失败');
			                            }
			                        }
						      });
			         });
    }
    
    function getTotal(basepath){
		     //var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/EmailTotal.do"; //请求的网址  
			 var number = 1;
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              $("#emailnumberandnoread").text( "收件箱(总计"+data.TOTAL+",未读"+data.NOREAD+")");
			                              $("#notreademail").text(data.NOREAD+"/"+data.TOTAL);
			                              $("#sendemailbox").text(data.SEND);
			                              $("#importantemailbox").text(data.IMPORTANT);
			                              $("#draftemailbox").text(data.DRAFT);
			                              $("#dustbinemailbox").text(data.DUSTBIN);
			                              var pagenumber = Math.ceil(data.TOTAL/($('#emailnumber option:selected').text())) ;
			                              
			                              if(pagenumber==4){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 $("#page3").text(3);
			                                 $("#page4").text(4);
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 document.getElementById("page3").style.display = "";
			                                 document.getElementById("page4").style.display = "";
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber==1){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 document.getElementById("page2").style.display = "none";
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="disabled";
			                              }else if(pagenumber==2){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber==3){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 $("#page3").text(3);
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 document.getElementById("page3").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber>4){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 $("#page3").text(3);
			                                 $("#page4").text(4);
			                                 $("#page5").text("...");
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 document.getElementById("page3").style.display = "";
			                                 document.getElementById("page4").style.display = "";
			                                 document.getElementById("page5").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber==0){
			                                 document.getElementById("page2").style.display = "none";
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 document.getElementById("page1").style.display = "none";
			                                 document.getElementById("next").disabled="disabled";
			                              }
			                              
			                            }else{
			                              //alert("获取邮件总数失败");
			                              layer.msg('获取邮件总数失败');
			                            }
			                        }
						      });
			         });
    }
    
    function getTotalbytype(basepath,type){
		     //var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/EmailTotal.do"; //请求的网址  
			 var number = 1;
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                            	var pagenumber;
			                            	if(type==1){//收件箱
			                            	  $("#emailnumberandnoread").text( "收件箱(总计"+data.TOTAL+",未读"+data.NOREAD+")");
			                            	     pagenumber = Math.ceil(data.TOTAL/($('#emailnumber option:selected').text()));
			                            	}else if(type ==2){//草稿箱
			                            	  $("#emailnumberandnoread").text( "草稿箱(总计"+data.DRAFT+")");
			                            	  pagenumber = Math.ceil(data.DRAFT/($('#emailnumber option:selected').text()));
			                            	}else if(type ==3){//发件箱
			                            	  $("#emailnumberandnoread").text( "发件箱(总计"+data.SEND+")");
			                            	     pagenumber = Math.ceil(data.SEND/($('#emailnumber option:selected').text()));
			                            	}else if(type ==4){//垃圾邮件箱
			                            	  $("#emailnumberandnoread").text( "发件箱(总计"+data.DUSTBIN+")");
			                            	    pagenumber = Math.ceil(data.DUSTBIN/($('#emailnumber option:selected').text()));
			                            	}else if(type ==5){//重要邮件箱
			                            	  $("#emailnumberandnoread").text( "重要邮箱(总计"+data.IMPORTANT+")");
			                            	  pagenumber = Math.ceil(data.IMPORTANT/($('#emailnumber option:selected').text())) ;
			                            	}
			                              $("#notreademail").text(data.NOREAD+"/"+data.TOTAL);
			                              $("#sendemailbox").text(data.SEND);
			                              $("#importantemailbox").text(data.IMPORTANT);
			                              $("#draftemailbox").text(data.DRAFT);
			                              $("#dustbinemailbox").text(data.DUSTBIN);
			                              
			                              if(pagenumber==4){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 $("#page3").text(3);
			                                 $("#page4").text(4);
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 document.getElementById("page3").style.display = "";
			                                 document.getElementById("page4").style.display = "";
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber==1){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 document.getElementById("page2").style.display = "none";
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="disabled";
			                              }else if(pagenumber==2){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber==3){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 $("#page3").text(3);
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 document.getElementById("page3").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber>4){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 $("#page3").text(3);
			                                 $("#page4").text(4);
			                                 $("#page5").text("...");
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 document.getElementById("page3").style.display = "";
			                                 document.getElementById("page4").style.display = "";
			                                 document.getElementById("page5").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(pagenumber==0){
			                                 document.getElementById("page2").style.display = "none";
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 document.getElementById("page1").style.display = "none";
			                                 document.getElementById("next").disabled="disabled";
			                              }
			                              
			                            }else{
			                              //alert("获取邮件总数失败");
			                              layer.msg('获取邮件总数失败');
			                            }
			                        }
						      });
			         });
    }
    
    
     function getTotalcompose(basepath){
		     //var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/EmailTotal.do"; //请求的网址  
			 var number = 1;
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                              $("#emailnumberandnoread").text( "收件箱(总计"+data.TOTAL+",未读"+data.NOREAD+")");
			                              $("#notreademail").text(data.NOREAD+"/"+data.TOTAL);
			                              $("#sendemailbox").text(data.SEND);
			                              var hh = $("#important");
			                              $("#importantemailbox").text(data.IMPORTANT);
			                              $("#draftemailbox").text(data.DRAFT);
			                              $("#dustbinemailbox").text(data.DUSTBIN);
			                            }else{
			                              //alert("获取邮件总数失败");
			                              layer.msg('获取邮件总数失败');
			                            }
			                        }
						      });
			         });
    }
    
    
    
    //将选中的邮件信息标记为已读
     function tabchange(field,value,message){
         var box; //临时变量，表示每行数据前选项
         var inputvalue; //表示邮件的emailid的input
         var emailid="";
         for(var i=0;i<selectNumber;i++){
             box = document.getElementById("check"+i);
             if(box.checked){
               inputvalue = document.getElementById("emailid"+i);
               emailid = emailid+inputvalue.value+",";
             }
         }
       if(emailid!=''){
             var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/Emailtab.do"; //请求的网址  
			 var json ={'emailid':emailid,'field':field,'value':value}
			 $(function(){$.ajax(
			                   {
		                        type:"POST",  
		                        url:url,  
		                        data:json,  
		                        async:true,//异步  
		                        dataType:"json",  
		                        success: function(data){  
		                            if(data.isError == false) {
		                              reload();
		                              layer.msg(message+'成功');
		                            }else{
		                              layer.msg(message+'失败');
		                            }
		                        }
						      });
			         });
       
       }
       
    }
    
    
    
    function skippage(url,json){//控制页面跳转
     $(function(){$.ajax(
	                   {
                        type:"POST",  
                        url:url,  
                        data:json,  
                        async:true,//异步  
                        dataType:"json",  
                        success: function(data){  
                            if(data.isError == false) {
                              layer.msg(message+'成功');
                            }else{
                              layer.msg(message+'失败');
                            }
                        }
				      });
			         });
    }
    
