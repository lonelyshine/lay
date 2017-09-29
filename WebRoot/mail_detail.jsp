<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String emailid = request.getParameter("emailid");
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 查看邮件</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>
<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"> 
<input id="emailid" type=hidden name="emailid" value="<%=emailid%>"> 
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            <a class="btn btn-block btn-primary compose-mail" href="mail_compose">写信</a>
                            <div class="space-25"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li>
                                    <a href="mailbox"> <i class="fa fa-inbox "></i> 收件箱 <span class="label label-warning pull-right" id="notreademail"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="mail_send"> <i class="fa fa-envelope-o"></i> 发信<span class="label label-warning pull-right" id="sendemailbox"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="mail_important"> <i class="fa fa-certificate"></i> 重要<span class="label label-warning pull-right" id="importantemailbox"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="mail_draft"> <i class="fa fa-file-text-o"></i> 草稿 <span class="label label-warning pull-right" id="draftemailbox"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="mail_dustbin"> <i class="fa fa-trash-o"></i> 垃圾箱<span class="label label-warning pull-right" id="dustbinemailbox"></span>
                                    </a>
                                </li>
                            </ul>
                            <h5>分类</h5>
                            <ul class="category-list" style="padding: 0">
                                <li>
                                    <a href=""> <i class="fa fa-circle text-navy"></i> 工作</a>
                                </li>
                                <li>
                                    <a href=""> <i class="fa fa-circle text-danger"></i> 文档</a>
                                </li>
                                <li>
                                    <a href=""> <i class="fa fa-circle text-primary"></i> 社交</a>
                                </li>
                                <li>
                                    <a href=""> <i class="fa fa-circle text-info"></i> 广告</a>
                                </li>
                                <li>
                                    <a href=""> <i class="fa fa-circle text-warning"></i> 客户端</a>
                                </li>
                            </ul>

                            <h5 class="tag-title">标签</h5>
                            <ul class="tag-list" style="padding: 0">
                                <li><a href=""><i class="fa fa-tag"></i> 朋友</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 工作</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 家庭</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 孩子</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 假期</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 音乐</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 照片</a>
                                </li>
                                <li><a href=""><i class="fa fa-tag"></i> 电影</a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="mail-box-header">
                    <div class="pull-right tooltip-demo">
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="回复" onclick="callback()"><i class="fa fa-reply"></i> 回复</button>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="打印邮件" onclick ="stampEmail()"><i class="fa fa-print"></i>打印邮件</button>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为垃圾邮件" onclick="tabFlotsam()"><i class="fa fa-trash-o"></i> </button>
                    </div>
                    <h2>
                    查看邮件
                </h2>
                 
                    <div class="mail-tools tooltip-demo m-t-md">


                        <h3>
                        <span class="font-noraml">主题： </span> <span id="title">幼儿园亲子班（园中园）项目方案 </span>
                    </h3>
                        <h5>
                        <span class="pull-right font-noraml" id="time">2014年10月28日(星期二) 晚上8:20</span>
                        <span class="font-noraml">发件人： </span> <span id="sender">497915773@qq.com</span>
                    </h5>
                    </div>
                </div>
                <div class="mail-box">


                    <div class="mail-body" id="content">
                       <!--  <h4>尊敬的幼儿园园长朋友：</h4>
                        <p>
                            贝贝聪教育，因您而精彩！由于婴幼教育一体化更符合婴幼儿成长需求，是全球早教专家、心理学家普遍推崇的一种办园模式。在美国、日本、英国、意大利、新加坡等国家及我国香港、台湾等地区，幼儿园普遍开设了亲子班，美国幼儿园开亲子班的比率为87%，意大利比率为83%。香港、台湾地区分别为74%、76%。2003年3月4日，国务院办公厅转发了教育部等10部门（单位）《关于幼儿教育改革与发展的指导意见》，强调发展0－6岁婴幼儿教育。在《幼儿园教育指导纲要（试行）》中已明确指出幼儿园教育要与0-3岁教育做好衔接。北京、上海等地要求在2013年，65%的公立一级幼儿园开设亲子班或园中园。
                        </p>

                        <p class="text-right">
                            贝贝聪教育科技发展有限公司
                        </p> -->
                    </div>
                     
                     
                     
                    <div class="mail-attachment" id="fileshow">
                        <p id = "filenumber">
                            <span><i class="fa fa-paperclip"></i> 2 个附件 - </span>
                            <a href="mail_detail.html#">下载全部</a> |
                            <a href="mail_detail.html#">预览全部图片</a>
                        </p>

                        <div class="attachment" id="filelist">
                            <div class="file-box">
                                <div class="file">
                                    <a href="mail_detail.html#">
                                        <span class="corner"></span>

                                        <div class="icon">
                                            <i class="fa fa-file"></i>
                                        </div>
                                        <div class="file-name">
                                            Document_2014.doc
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="file-box">
                                <div class="file">
                                    <a href="mail_detail.html#">
                                        <span class="corner"></span>

                                        <div class="image">
                                            <img alt="image" class="img-responsive" src="img/p1.jpg">
                                        </div>
                                        <div class="file-name">
                                            Italy street.jpg
                                        </div>
                                    </a>

                                </div>
                            </div>
                            <div class="file-box">
                                <div class="file">
                                    <a href="mail_detail.html#">
                                        <span class="corner"></span>

                                        <div class="image">
                                            <img alt="image" class="img-responsive" src="img/p2.jpg">
                                        </div>
                                        <div class="file-name">
                                            My feel.png
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        
                        </div>
                        
                        
                    <!-- </div> -->
                    
                    
                    <div class="mail-body text-right tooltip-demo">
                        <button class="btn btn-sm btn-white" onclick="callback()"><i class="fa fa-reply"></i> 回复</button>
                        <button class="btn btn-sm btn-white" onclick="nextEmail()"><i class="fa fa-arrow-right"></i> 下一封</button>
                        <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="打印这封邮件" class="btn btn-sm btn-white" onclick ="stampEmail()"><i class="fa fa-print"></i> 打印</button>
                        <button title="" data-placement="top" data-toggle="tooltip" data-original-title="删除邮件" class="btn btn-sm btn-white" onclick="tabFlotsam()"><i class="fa fa-trash-o"></i> 删除</button>
                    </div>
                    <div class="clearfix"></div>
                    
                    </div>

                </div>
            </div>
        </div>
    </div>


    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    
    <!-- 自定义邮件帮助js -->
    <script src="tool/js/emailTool.js"></script>

    <!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>
 
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            queryEmailContent();
            getTotalcompose(document.getElementById('basepath').value)//刷新页数
            // getNOTRead(document.getElementById('basepath').value);
        });
        
        function queryEmailContent(){
            var basepath = document.getElementById('basepath').value; 
            var emailid = document.getElementById('emailid').value; 
            var url =  basepath + "EmailContent.do"; //请求的网址  
            var reqParams = {'emailid':emailid};//请求数据
            $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:reqParams,
                        async:false,  
                        dataType:"json",  
                        success: function(data){
                            if(data.isError == false) {  
                                 total =  data.total;
						         var dataList = data.dataList;  
						         $("#content").empty();//清空表格内容
						         $("#content").html(data.CONTENT);//清空表格内容  
						         jQuery('#title').text(data.TITLE);
						         jQuery('#time').text(data.THETIME);
						         jQuery('#sender').text(data.SENDER);
						         if(data.UPLOAD==''||data.UPLOAD==null){//如果不存在附件
						           document.getElementById("fileshow").style.display = "none";
						         }else{//存在附件时
						           debugger;
						            var temp ="";
						            var tempfile="";
						            if(!((data.UPLOAD).indexOf(",") > 0)){//表示只有一个附件
						                $("#filenumber").empty();//清空原有内容
						                temp ="<span><i class='fa fa-paperclip'></i> 1 个附件 - </span><a href='mail_detail.html#'>下载全部</a> |<a href='mail_detail.html#'>预览全部图片</a>";
						                $(temp).appendTo("#filenumber");
						                
						                var filetype = (data.UPLOAD).split(".");
	         						    var imagetype = filetype[filetype.length-1].toLowerCase();//通过文件名来确定展示的文件图片 
	         						    var tempfilename ="";
	         						    var filename ="";
	         						    if((data.UPLOAD).indexOf("\\") > 0){
	         						          tempfilename = (data.UPLOAD).split("\\");
	         						          filename = tempfilename[tempfilename.length-1];
	         						    }else{
	         						          tempfilename = (data.UPLOAD).split("/");
	         						          filename = tempfilename[tempfilename.length-1];
	         						    }
	         						    $("#filelist").empty();//清空原有内容
						                tempfile="<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='"+data.UPLOAD+"'><span class='corner'></span><div class='image'><img alt='image' style='max-width:100%;height:100%;margin: 0 auto;' class='img-responsive' src='tool/image/email/"+imagetype+".png'></div><div class='file-name'> "+filename+"</div></a><ul class='dropdown-menu animated fadeInRight m-t-xs'><li><a href='form_avatar.html'>在线预览</a></li><li class='divider'></li><li><a href='login.html'>下载</a></li></ul></div></div><div class='clearfix'></div>";
						                $(tempfile).appendTo("#filelist");
						            }else{
						                var filetotal = (data.UPLOAD).split(",");
						                $("#filenumber").empty();//清空原有内容
						                temp ="<span><i class='fa fa-paperclip'></i> "+filetotal.length+" 个附件 - </span><a href='mail_detail.html#'>下载全部</a> |<a href='mail_detail.html#'>预览全部图片</a>";
						                $(temp).appendTo("#filenumber");
						                
						                for(var i=0;i<filetotal.length;i++){
						                    var filetype = filetotal[i].split(".");
		         						    var imagetype = filetype[filetype.length-1].toLowerCase();//通过文件名来确定展示的文件图片 
		         						    var tempfilename ="";
		         						    var filename ="";
		         						    if(filetotal[i].indexOf("\\") > 0){
		         						          tempfilename = filetotal[i].split("\\");
		         						          filename = tempfilename[tempfilename.length-1];
		         						    }else{
		         						          tempfilename = filetotal[i].split("/");
		         						          filename = tempfilename[tempfilename.length-1];
		         						    }
							                tempfile=tempfile+"<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='"+filetotal[i]+"'><span class='corner'></span><div class='image'><img alt='image' style='max-width:100%;height:100%;margin: 0 auto;' class='img-responsive' src='tool/image/email/"+imagetype+".png'></div><div class='file-name'> "+filename+"</div></a><ul class='dropdown-menu animated fadeInRight m-t-xs'><li><a href='form_avatar.html'>在线预览</a></li><li class='divider'></li><li><a href='login.html'>下载</a></li></ul></div></div>";
						                }
						                    $("#filelist").empty();//清空原有内容
						                    tempfile = tempfile+"<div class='clearfix'></div>";
							                $(tempfile).appendTo("#filelist");
						            }
                                   rightclick()//鼠标右键事件	
						         }
			                    }else{  
			                          //alert(data.errorMsg);
			                          layer.alert(data.errorMsg);  
			                            }  
			                      },  
			                        error: function(e){  
			                          // alert("查询失败:" + e);
			                           layer.alert("查询失败:" + e);    
			                        }  
			                    });  
			                    $('.i-checks').iCheck({
					                checkboxClass: 'icheckbox_square-green',
					                radioClass: 'iradio_square-green',
					            });
			               });
        }
        
        //鼠标右键事件
        function rightclick(){
                //阻止浏览器默认右键点击事件
		        /*document.oncontextmenu = function() {
		            return false;
		        }*/
		        //某元素组织右键点击事件
		        $(".file-box").bind("contextmenu", function(){
		            return false;
		        })
		        $(".file-box").mousedown(function(e) {
		            console.log(e.which);
		            //右键为3
		            if (3 == e.which) {
		               var righttab = $(this).children(0);
		               righttab.attr("class","file open");
		               
		              /*  $(this).onblur = function(){ 
							righttab.attr("class","file");
							return false;
				    	}  */
		               
		                 /* $(this).css({
		                    "font-size": "-=2px"
		                });  */
		                //var filebox = e.id;
		                //var downloadfilepath = $(this).children(0).children(0);
		                //var path = downloadfilepath.attr("href");
		            } else if (1 == e.which) {
		                //左键为1
		               /*  $(this).css({
		                    "font-size": "+=3px"
		                }); */
		                var downloadfilepath = $(this).children(0).children(0);
		                var path = downloadfilepath.attr("href");
		            }
		        });
        }
        
        
        function lefton(e){
           
          //var hh =e.children(0);
           var righttab = $(e).children(0);
		   righttab.attr("class","file open");
        }
        
        function passon(e){
           var righttab = $(e).children(0);
		   righttab.attr("class","file");
        }
        
        //邮件打印功能
        function stampEmail(){
            window.print();
        }
       
       
       //将选中的邮件信息标记为垃圾邮件
     function tabFlotsam(){
     debugger;
             var basepath = document.getElementById('basepath').value; 
             var emailid = document.getElementById('emailid').value; 
			 var url =  basepath + "/Emailtab.do"; //请求的网址  
			 var json ={'emailid':emailid,'field':"EMAILTYPE",'value':4}
			 $(function(){$.ajax(
			                   {
		                        type:"POST",  
		                        url:url,  
		                        data:json,  
		                        async:true,//异步  
		                        dataType:"json",  
		                        success: function(data){  
		                            if(data.isError == false) {
		                              //reload();
		                              //layer.msg(message+'成功');
		                               window.location.href="mail_compose_success.jsp?status=2";//发送邮件成功后跳转到成功页面
		                            }else{
		                              layer.msg(message+'失败');
		                            }
		                        }
						      });
			         });
     } 
        //查看下一封邮件
      function nextEmail(){
          var basepath = document.getElementById('basepath').value; 
             var emailid = document.getElementById('emailid').value; 
			 var url =  basepath + "/nextEmail.do"; //请求的网址  
			 var json ={'emailid':emailid}
			 $(function(){$.ajax(
			                   {
		                        type:"POST",  
		                        url:url,  
		                        data:json,  
		                        async:true,//异步  
		                        dataType:"json",  
		                        success: function(data){  
		                            if(data.isError == false) {
		                                 if(data.STATUS=='FAIL'){//表示查询的下一份邮件不存在，也就是本封邮件为最后一封
		                                    layer.alert("已经是最后一封邮件了");    
		                                 }else{
		                                 total =  data.total;
								         var dataList = data.dataList;  
								         $("#content").empty();//清空表格内容
								         $("#content").html(data.CONTENT);//清空表格内容  
								         jQuery('#title').text(data.TITLE);
								         jQuery('#time').text(data.THETIME);
								         jQuery('#sender').text(data.SENDER);
								         if(data.UPLOAD==''||data.UPLOAD==null){//如果不存在附件
								           document.getElementById("fileshow").style.display = "none";
								         }else{//存在附件时
								           debugger;
								            var temp ="";
								            var tempfile="";
								            if(!((data.UPLOAD).indexOf(",") > 0)){//表示只有一个附件
								                $("#filenumber").empty();//清空原有内容
								                temp ="<span><i class='fa fa-paperclip'></i> 1 个附件 - </span><a href='mail_detail.html#'>下载全部</a> |<a href='mail_detail.html#'>预览全部图片</a>";
								                $(temp).appendTo("#filenumber");
								                
								                var filetype = (data.UPLOAD).split(".");
			         						    var imagetype = filetype[filetype.length-1].toLowerCase();//通过文件名来确定展示的文件图片 
			         						    var tempfilename ="";
			         						    var filename ="";
			         						    if((data.UPLOAD).indexOf("\\") > 0){
			         						          tempfilename = (data.UPLOAD).split("\\");
			         						          filename = tempfilename[tempfilename.length-1];
			         						    }else{
			         						          tempfilename = (data.UPLOAD).split("/");
			         						          filename = tempfilename[tempfilename.length-1];
			         						    }
			         						    $("#filelist").empty();//清空原有内容
								                tempfile="<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='"+data.UPLOAD+"'><span class='corner'></span><div class='image'><img alt='image' style='max-width:100%;height:100%;margin: 0 auto;' class='img-responsive' src='tool/image/email/"+imagetype+".png'></div><div class='file-name'> "+filename+"</div></a><ul class='dropdown-menu animated fadeInRight m-t-xs'><li><a href='form_avatar.html'>在线预览</a></li><li class='divider'></li><li><a href='login.html'>下载</a></li></ul></div></div><div class='clearfix'></div>";
								                $(tempfile).appendTo("#filelist");
								            }else{
								                var filetotal = (data.UPLOAD).split(",");
								                $("#filenumber").empty();//清空原有内容
								                temp ="<span><i class='fa fa-paperclip'></i> "+filetotal.length+" 个附件 - </span><a href='mail_detail.html#'>下载全部</a> |<a href='mail_detail.html#'>预览全部图片</a>";
								                $(temp).appendTo("#filenumber");
								                
								                for(var i=0;i<filetotal.length;i++){
								                    var filetype = filetotal[i].split(".");
				         						    var imagetype = filetype[filetype.length-1].toLowerCase();//通过文件名来确定展示的文件图片 
				         						    var tempfilename ="";
				         						    var filename ="";
				         						    if(filetotal[i].indexOf("\\") > 0){
				         						          tempfilename = filetotal[i].split("\\");
				         						          filename = tempfilename[tempfilename.length-1];
				         						    }else{
				         						          tempfilename = filetotal[i].split("/");
				         						          filename = tempfilename[tempfilename.length-1];
				         						    }
									                tempfile=tempfile+"<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='"+filetotal[i]+"'><span class='corner'></span><div class='image'><img alt='image' style='max-width:100%;height:100%;margin: 0 auto;' class='img-responsive' src='tool/image/email/"+imagetype+".png'></div><div class='file-name'> "+filename+"</div></a><ul class='dropdown-menu animated fadeInRight m-t-xs'><li><a href='form_avatar.html'>在线预览</a></li><li class='divider'></li><li><a href='login.html'>下载</a></li></ul></div></div>";
								                }
								                    $("#filelist").empty();//清空原有内容
								                    tempfile = tempfile+"<div class='clearfix'></div>";
									                $(tempfile).appendTo("#filelist");
								            }
		                                   rightclick()//鼠标右键事件	
								         }
								         
								         //重新设置本页面中的邮件id
								         document.getElementById('emailid').value = data.EMAILID;
								         //console.log(data.EMAILID);
								         //console.log( document.getElementById('emailid').value )
								         
								        } 
								         
								         
		                            }else{
		                              layer.msg(message+'失败');
		                            }
		                        },error: function(e){  
			                          // alert("查询失败:" + e);
			                           layer.alert("查询失败:" + e);    
			                        } 
						      });
						      
						      $('.i-checks').iCheck({
					                checkboxClass: 'icheckbox_square-green',
					                radioClass: 'iradio_square-green',
					            });
			         });
      
      }  
      
      //回复邮件
      function callback(){
         var email = document.getElementById('emailid').value;
         window.location.href="mail_callback.jsp?emailid="+email;//回复邮件
      }
    </script>

    
    

</body>

</html>
