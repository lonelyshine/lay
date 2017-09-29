<%@ page language="java" import="java.util.*,com.cy.ssm.beans.UserBean" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserBean user = (UserBean)request.getSession().getAttribute("user");

String QQ ="";
if(user.getQq()!=null){
QQ=user.getQq();
}
String tempTEL ="";
if(user.getTel()!=null){
tempTEL = user.getTel();
}
String EMAIL ="";
if(user.getEmail()!=null){
  EMAIL=user.getEmail();
}

String TEL ="";
if(user.getTel()!=null){
TEL= user.getTel();;
}
String BIRTHDAY ="";
if(user.getBirthday()!=null){
BIRTHDAY= user.getBirthday().toString();
}
 String SEX ="";
if(user.getSex()!=null){
if(user.getSex().equals("1")){
SEX="男"; 
}else{
SEX="女"; 
}
}
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 个人资料</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="css/plugins/clockpicker/clockpicker.css" rel="stylesheet"> 
   
</head>
<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"> 
<body class="gray-bg">
<!-- 个人信息编辑弹出框     开始 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
 <div class="modal-content">
 <div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
  <h4 class="modal-title" id="myModalLabel">个人信息</h4>
 </div>
 <div class="modal-body">
  <div class="form-group">
  <label for="txt_userName">昵称</label>
  <input type="text" name="txt_userName" class="form-control" id="txt_userName" placeholder="昵称">
  </div>
  <div class="form-group">
  <label for="txt_userAge">年龄</label>
  <input type="text" name="txt_userAge" class="form-control" id="txt_userAge" placeholder="年龄">
  </div>
  <div class="form-group">
  <label for="txt_userSex">性别</label>
  <input type="text" name="txt_userSex" class="form-control" id="txt_userSex" onblur = "checkSex(this)" placeholder="性别">
  </div>
 <div class="form-group" id="data_1">
 <label for="txt_userBirthday">生日</label>
 <div class="input-group date">
     <input type="text" name="txt_userBirthday" class="form-control" id="txt_userBirthday"  placeholder="2014-11-11">
     <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
 </div>
  </div>
  <div class="form-group">
  <label for="txt_userTel">电话</label>
  <input type="text" name="txt_userTel" class="form-control" id="txt_userTel" placeholder="电话">
  </div>
  <div class="form-group">
  <label for="txt_userQq">QQ号码</label>
  <input type="text" name="txt_userQq" class="form-control" id="txt_userQq" placeholder="QQ号码">
  </div>
  <div class="form-group">
  <label for="txt_userEmail">邮箱</label>
  <input type="text" name="txt_userEmail" class="form-control" id="txt_userEmail" placeholder="邮箱">
  </div>
  <div class="form-group">
  <label for="txt_userAddress">地址</label>
  <input type="text" name="txt_userAddress" class="form-control" id="txt_userAddress" placeholder="地址">
  </div>
   <div class="form-group">
  <label for="txt_userBrief">个人介绍</label>
  <input type="text" name="txt_userBrief" class="form-control" id="txt_userBrief" placeholder="个人介绍">
  </div> 
 </div>
 <div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
  <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
 </div>
 </div>
 </div>
 </div>
<!-- 个人信息编辑弹出框     结束-->



    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人资料</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link" onclick="editoruserinfo()">
                                                                                   编辑
                            </a>
                        </div>
                    </div>
                    <div>
                        <div class="ibox-content no-padding border-left-right">
                            <img id="avatarimg" style="display:inline;"  alt="image" class="img-responsive" src="img/profile_big.jpg">
                            <span id="target" style="display:inline;font-size:500%;" class="glyphicon glyphicon-arrow-right"></span>
                            <img id="newavatar" style="display:inline;" onclick="changeAvatar()" alt="image" class="img-responsive" src="img/newavatar.png">
                            <div id='progressdiv' class='progress'><div id='progress' style='width: 0%;' class='progress-bar'></div></div>
                           <!--  <div style="display:inline;">
                            <img id="newavatar"  onclick="changeAvatar()" alt="image" class="img-responsive" src="img/newavatar.png">
                            <div id='progressdiv"+timeid+"' class='progress'><div id='progress"+timeid+"' style='width: 0%;' class='progress-bar'></div>
                            </div> -->
                        </div>
                        <div class="ibox-content profile-content">
                            <h4><strong><%=user.getUserName()%></strong></h4>
                            <p><i class="fa fa-map-marker"></i><%=user.getAddress()%></p>
                            <h5>
                                                                                     关于我
                            </h5>
                            <p>
                               <!--  会点前端技术，div+css啊，jQuery之类的，不是很精；热爱生活，热爱互联网，热爱新技术；有一个小的团队，在不断的寻求新的突破。 -->
                               <%=user.getBrief()%>
                            </p>
                            
                            <h5>
                                                                                  联系我                                                         
                            </h5>
                             <p>
                               <!--  会点前端技术，div+css啊，jQuery之类的，不是很精；热爱生活，热爱互联网，热爱新技术；有一个小的团队，在不断的寻求新的突破。 -->
                               QQ:<%=QQ%> <br>
                                                                                             电话:<%=tempTEL%> <br>
                            	邮箱:<%=EMAIL%> <br>
                               	生日:<%=BIRTHDAY%> <br> 
                               	性别:<%=SEX%> <br>
                            </p>
                            <div class="row m-t-lg">
                                <div class="col-sm-4">
                                    <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                    <h5><strong>169</strong> 文章</h5>
                                </div>
                                <div class="col-sm-4">
                                    <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                    <h5><strong>28</strong> 关注</h5>
                                </div>
                                <div class="col-sm-4">
                                    <span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
                                    <h5><strong>240</strong> 关注者</h5>
                                </div>
                            </div>
                            <div class="user-button">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-envelope"></i> 发送消息</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-default btn-sm btn-block"><i class="fa fa-coffee"></i> 赞助</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>最新动态</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="profile.html#">选项1</a>
                                </li>
                                <li><a href="profile.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div>
                            <div class="feed-activity-list">

                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a1.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">1天前</small>
                                        <strong>奔波儿灞</strong> 关注了 <strong>灞波儿奔</strong>.
                                        <br>
                                        <small class="text-muted">54分钟前 来自 皮皮时光机</small>
                                        <div class="actions">
                                            <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            <a class="btn btn-xs btn-danger"><i class="fa fa-heart"></i> 收藏</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/profile.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">5分钟前</small>
                                        <strong>作家崔成浩</strong> 发布了一篇文章
                                        <br>
                                        <small class="text-muted">今天 10:20 来自 iPhone 6 Plus</small>

                                    </div>
                                </div>

                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a2.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">2小时前</small>
                                        <strong>作家崔成浩</strong> 抽奖中了20万
                                        <br>
                                        <small class="text-muted">今天 09:27 来自 Koryolink iPhone</small>
                                        <div class="well">
                                            抽奖，人民币2000元，从转发这个微博的粉丝中抽取一人。11月16日平台开奖。随手一转，万一中了呢？
                                        </div>
                                        <div class="pull-right">
                                            <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                            <a class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> 评论</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a3.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">2天前</small>
                                        <strong>天猫</strong> 上传了2张图片
                                        <br>
                                        <small class="text-muted">11月7日 11:56 来自 微博 weibo.com</small>
                                        <div class="photos">
                                            <a target="_blank" href="http://24.media.tumblr.com/20a9c501846f50c1271210639987000f/tumblr_n4vje69pJm1st5lhmo1_1280.jpg">
                                                <img alt="image" class="feed-photo" src="img/p1.jpg">
                                            </a>
                                            <a target="_blank" href="http://37.media.tumblr.com/9afe602b3e624aff6681b0b51f5a062b/tumblr_n4ef69szs71st5lhmo1_1280.jpg">
                                                <img alt="image" class="feed-photo" src="img/p3.jpg">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">5小时前</small>
                                        <strong>在水一方Y</strong> 关注了 <strong>那二十年的单身</strong>.
                                        <br>
                                        <small class="text-muted">今天 10:39 来自 iPhone客户端</small>
                                        <div class="actions">
                                            <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多</button>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
    
    <div style="visibility:hidden;">
    
   <!--  <progress id="progressBar" value="0" max="100"></progress>
    <span id="percentage"></span> -->
    
    <form id= "uploadForm">
    <input type="file" id="file" name="file"  onchange="fileChange()"/>
    <input type="text" id="fileid" name="fileid"/>
    <input type="text" id="filetype" name="filetype"/>
    <input type="text" id="filetime" name="filetime"/>
    <input type="text" id="folder" name="folder"/>
    </form>
    </div>

  <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script> 



    <!-- 自定义js -->
     <script src="js/content.js?v=1.0.0"></script>


    <!-- Peity -->
     <script src="js/plugins/peity/jquery.peity.min.js"></script> 

    <!-- Peity -->
   <script src="js/demo/peity-demo.js"></script> 
    
    
    <!-- Data picker -->
 <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <!-- Clock picker -->
  <script src="js/plugins/clockpicker/clockpicker.js"></script> 
    
     <!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>
    
     <script>
     
     //头像图片相关路径设置
	if('<%=user.getAvatar()%>'==null||'<%=user.getAvatar()%>'==''){
	document.getElementById("avatarimg").src="img/profile_big.jpg";
	}else{
	var imgname = '<%=user.getAvatar()%>'.split('_');
	var imglast = imgname[1].split('.');
	
	document.getElementById("avatarimg").src='fileManager/'+imgname[0]+'.'+imglast[1];
	//document.getElementById("avatarimg").src="fileManager/2017741356733_1.JPG";
	}
     
     //修改头像
     function changeAvatar(){
          uploadfile();
     }
     
     //编辑个人信息
	function editoruserinfo(){
	$("#myModalLabel").text("个人信息");
	$('#myModal').modal();
	}
	
	//保存修改后的个人信息
	$("#btn_submit").on("click",function(e){
	   var userName = document.getElementById("txt_userName").value;
	   var userAge = document.getElementById("txt_userAge").value;
	   //校验年龄是否为两位正整数
	   var re = /^[1-9]+[0-9]*]*$/;
	   if (!re.test(userAge)&&userAge.length!=2) 
		  { 
			layer.msg("请输入两位正整数"); 
			return false; 
		  }
	   var userSex =  document.getElementById("txt_userSex").value;
	   //校验用户性别
	   if(!(userSex=='男'||userSex=='女')){
         layer.msg('性别为男或女');
       }else if(userSex=='男'){
          userSex="1";
       }else if(userSex=='女'){
          userSex="0";
       }
       
	   var userBirthday = document.getElementById("txt_userBirthday").value;
	   //校验日期
	   var bh = /^\d{4}-\d{1,2}-\d{1,2}/;
	   if(!bh.test(userBirthday)){
	     layer.msg("请输入例如：2014-12-03的日期");
	     return false;
	   }
	   
	   var userTel = document.getElementById("txt_userTel").value;
	   //校验电话号码
	   var tl = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
	   if (!tl.test(userTel)) 
		  { 
			layer.msg("请输入正确的手机号码"); 
			return false; 
		  }
		  
	   var userQq = document.getElementById("txt_userQq").value;
	   
	   var q = /[1-9][0-9]{4,}/;
	   if(!q.test(userQq)){
	       layer.msg("请输入正确的QQ号码"); 
		   return false; 
	   }
	   var userEmail = document.getElementById("txt_userEmail").value;
	   var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	   if(!filter.test(userEmail)){
	       layer.msg("请输入正确的邮件地址"); 
		   return false; 
	   }
	   
	   var userAddress = document.getElementById("txt_userAddress").value;
	   var userBrief = document.getElementById("txt_userBrief").value;
	   //请求保存个人信息
	   var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/updateUserInfo.do"; //请求的网址  
			 var json ={'userName':userName,'userAge':userAge,'userSex':userSex,'userBirthday':userBirthday,'userTel':userTel,'userQq':userQq,'userEmail':userEmail,'userAddress':userAddress,'userBrief':userBrief};
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:json,  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){  
			                            if(data.isError == false) {
			                            if(data.message!=null&&data.message!=''){//如果返回的信息不为空时
			                              layer.msg(data.message);
			                            }
			                            }else{
			                              layer.msg('获取未读邮件失败');
			                            }
			                        }
						      });
			         });
	   
	         
	})
     
     //校验用户性别
     function checkSex(val){
       if(!(val.value=='男'||val.value=='女')){
         layer.msg('性别为男或女');
       }
     }
  /*    //校验邮箱是否正确
     function emailrule(e){
  var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   var temp = e.value;
   if(!filter.test(temp)){
           layer.msg('您输入的邮件地址有误');
           }else{
           var nameCode = document.getElementById("name1").value;
           if(nameCode==null||nameCode==''){//用户名必须填写才可以
               layer.msg('用户名必须填写才可以的哟！');
           }else{
           document.getElementById("button1").disabled = false;
           }
           }
  }
    */  
     
       //上传文件
       function uploadfile(){
               var input = document.getElementById("file"); 
               input.click();
       } 
        
       //用于监控上传附件的进度条
        function progressFunction(evt) {
            var progressdiv = document.getElementById("progressdiv");
            var progress = document.getElementById("progress");
            if (evt.lengthComputable) {
                progress.style.width=Math.round(evt.loaded / evt.total * 100)+"%";
                if(evt.loaded==evt.total){
                    progressdiv.style.display ="none";
                   // document.getElementById("target").style.display ="none";
			       // document.getElementById("newavatar").style.display ="none";
                }
             } 
             
             
       }
       
       //当选中附件后触发该方法
       function fileChange(){
           debugger;
            var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
            var name = fileObj.name;
            
            var size = fileObj.size;
            var basepath = document.getElementById('basepath').value; 
            var FileController = basepath +"imageavatar/";// 接收上传文件的后台地址 
            
            /* // FormData 对象
            var form = new FormData($( "#uploadForm" )[0]); */

            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("POST", FileController, true);
            xhr.onload = function () {
            //XHR的交互状态readyState代号有：  
		    /** 
		      * 监听服务器返回的状态一共有五个状态： 
		      * 0,1,2,3,4 
		      * 0是啥都没有连接的时候 
		      * 1是open方法还没被调用 
		      * 2是open方法调用了，send方法没有执行 
		      * 3是open方法执行了，send方法也执行了 
		      * 4是返回结果的时候的状态(status)  
		      * */  
                if(xhr.readyState==4){  
			        //判断http的交互是否成功  
			        if(xhr.status==200){  
			            //获取服务器端返回的数据  
			            //一种是纯文本的形式，一种是DOM对象  
			            var responseText=xhr.responseText;
			            //将数据显示在界面上  
			            //通过DOM的方式找到div标签对应的元素节点  
			            //var divNode=document.getElementById("result");  
			            //设置元素节点中的html内容  
			           // divNode.innerHTML=responseText;  
			           var temppath = responseText.split("\"");
			           
			           document.getElementById("avatar").src = path;
			           document.getElementById("newavatar").src = "img/newavatar.png";
			           var avimgage = document.getElementById("avatar");
			           var newimage = document.getElementById("newavatar");
			           resizeTo(avimgage,200,200);
			           resizeTo(newimage,200,200);
			        }  
			    } 
                //alert("上传完成!");
            };
            //文件唯一的id
             var tempdate = new Date();
	         timeid = tempdate.getFullYear().toString()+(tempdate.getMonth()+1).toString()+tempdate.getDate().toString()+tempdate.getHours().toString()+tempdate.getMinutes().toString()+tempdate.getSeconds().toString()+tempdate.getMilliseconds().toString();        
             document.getElementById("fileid").value = timeid;
              //文件类型
	          var filetype = name.split(".");
	          var tempfilename = name.split(".");
	          var imagetype = filetype[filetype.length-1].toLowerCase();//通过文件名来确定展示的文件图片 
	          var filetype ="";
	          if(imagetype=="jpg"||imagetype=="jpeg"||imagetype=="png"||imagetype=="gif"||imagetype=="bmp"||imagetype=="tiff"||imagetype=="ai"||imagetype=="cdr"||imagetype=="eps"){
	               filetype = "fa-file-image-o";
	          }else if(imagetype=="xls"||imagetype=="xlsx"){
	               filetype = "fa-file-excel-o";       
	          }else if(imagetype=="pdf"){
	               filetype = "fa-file-pdf-o";       
	          }else if(imagetype=="mp3"){
	               filetype = "fa-file-sound-o";       
	          }else if(imagetype=="doc"||imagetype=="docx"){
	               filetype = "fa-file-word-o";       
	          }else if(imagetype=="txt"){
	               filetype = "fa-file-text";       
	          }else if(imagetype=="zip"||imagetype=="rar"||imagetype=="cab"||imagetype=="arj"||imagetype=="lzh"||imagetype=="ace"||imagetype=="7-zip"||imagetype=="tar"||imagetype=="gzip"||imagetype=="uue"||imagetype=="bz2"||imagetype=="jar"||imagetype=="iso"||imagetype=="z"){
	               filetype = "fa-file-zip-o";       
	          }else if(imagetype=="rm"||imagetype=="rmvb"||imagetype=="wmv"||imagetype=="avi"||imagetype=="mp4"||imagetype=="3gp"||imagetype=="mkv"){
	               filetype = "fa-file-movie-o";       
	          }else if(imagetype=="ppt"||imagetype=="pptx"){
	               filetype = "fa-file-powerpoint-o";       
	          }else if(imagetype=="css"||imagetype=="jsp"||imagetype=="html"||imagetype=="htm"){
	               filetype = "fa-file-code-o";       
	          }else {
	               filetype = "fa-file-o";       
	          }
	          document.getElementById("filetype").value = filetype;
	          var path = "fileManager/"+timeid+"."+tempfilename[tempfilename.length-1];
	          var time = tempdate.getFullYear().toString()+"-"+(tempdate.getMonth()+1).toString()+"-"+tempdate.getDate().toString(); 
	          document.getElementById("filetime").value = time;
              
              xhr.upload.addEventListener("progress", progressFunction, false);
              // FormData 对象
              var form = new FormData($( "#uploadForm" )[0]);
              xhr.send(form);
       }
       
       //修改图片的展示大小
       function resizeTo(img,imgWidth,imgHeight){
		  img.style.width=imgWidth; 
		  img.style.height=imgHeight;
		 }
        
    </script>
    
    

</body>
</html>