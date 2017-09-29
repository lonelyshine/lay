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


    <title> - 写信</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

<!-- 进度条的css样式 --> 
<style>  
    body { font-size: 12px; }   
    #n { margin:10px auto; width:920px; border:1px solid #CCC;  
     font-size:14px; line-height:30px; }   
    #n a { padding:0 4px; color:#333 }   
    .Bar ,.Bars { position: relative; width: 100px;  
        /* 宽度 */ border: 1px solid #B1D632; padding: 1px; }   
    .Bar div,.Bars div { display: block; position: relative;  
     background:#00F;/* 进度条背景颜色 */ color: #333333;  
     height: 10px; /* 高度 */ line-height: 10px;  
      /* 必须和高度一致，文本才能垂直居中 */ }   
    .Bars div{ background:#090}   
    .Bar div span,.Bars div span { position: absolute; width: 50px;  
     /* 宽度 */ text-align: center; font-weight: bold; }   
    .cent{ margin:0 auto; width:300px; overflow:hidden}   
</style>

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
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="存为草稿" onclick ="savedraft()"><i class="fa fa-pencil"></i> 存为草稿</button>
                        <a href="mailbox" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="放弃"><i class="fa fa-times"></i> 放弃</a>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="抄送" onclick ="copySend()"><i class="fa fa-pencil"></i> 抄送</button>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="密送" onclick ="secretSend()"><i class="fa fa-pencil"></i> 密送</button>
                    </div>
                    <h2>
                    写信
                </h2>
                </div>
                <div class="mail-box">


                    <div class="mail-body">

                        <form class="form-horizontal" method="get">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">收件人：</label>

                                <div class="col-sm-10">
                                    <input id = "getEmailperson" type="text" class="form-control" onchange = "checkMail(this)" value="">
                                </div>
                            </div>
                            
                            
                            <div class="form-group" id ="copySend" style="display:none">
                                <label class="col-sm-2 control-label">抄送人：</label>

                                <div class="col-sm-10">
                                    <input id = "copyEmailperson" type="text" class="form-control" onchange = "checkMail(this)" value="">
                                </div>
                            </div>
                            <div class="form-group" id ="secretSend" style="display:none">
                                <label class="col-sm-2 control-label">密送人：</label>

                                <div class="col-sm-10">
                                    <input id = "secretEmailperson" type="text" class="form-control" onchange = "checkMail(this)" value="">
                                </div>
                            </div>
                            
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">主题：</label>

                                <div class="col-sm-10">
                                    <input id = "sub" type="text" class="form-control" value="">
                                </div>
                            </div>
                        </form>

                    </div>

                    <div class="mail-text h-200" style= "width:100%">

                        <div class="summernote">
                            <!-- <h2>hAdmin后台主题</h2>
                            <p>，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本，当然，也集成了很多功能强大，用途广泛的国内外jQuery插件及其他组件，她可以用于所有的Web应用程序，如<b>网站管理后台</b>，<b>网站会员中心</b>，<b>CMS</b>，<b>CRM</b>，<b>OA</b>等等，当然，您也可以对她进行深度定制，以做出更强系统。</p>
                            </p> -->
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="mail-body text-right tooltip-demo">
                    
                        <div class = "uploadFile" id="uploadFile" style ="position: absolute;left:40px;">
                            <!-- <div id ="enclosure1" style="background-color:#E3EAF4;float:left;">
	                            <div style ="float:left">
	                            <img src="img/1.png" style="width:30px;height:30px;"/>
	                            </div>
	                            <div style ="float:left">
	                              <div title="jxl_poi.rar" style="float:left;margin-left:8px;">jxl_poi.rar</div>
	                              <div style="margin-left:5px;">1.8M <span class="nui-txt-suc" style="font-family:华文中宋; color:green;">上传完成</span></div>
	                            </div>
	                             <div style ="float:left;margin-left:55px;background-color:;" onmouseover="mOver(this)" onmouseout="mOut(this)">
	                              <a id ="delete" href="javascript:void(0)" style="font-family:华文中宋; color:#24B839;">删除</a> 
	                             </div>
                            </div>
                            
                            <div id ="enclosure1" style="background-color:#E3EAF4;float:left;">
	                            <div style ="float:left">
	                            <img src="img/1.png" style="width:30px;height:30px;"/>
	                            </div>
	                            <div style ="float:left">
	                              <div title="jxl_poi.rar" style="margin-right:20px;">jxl_poi.rar</div>
	                              <div class='Bars' style="margin-left:8px;display:;"><div style='width: 100%;'><span>100%</span></div></div>
	                              <div style="margin-left:5px;display:none;">1.8M <span class="nui-txt-suc" style="font-family:华文中宋; color:green;">上传完成</span></div>
	                            </div>
	                             <div style ="float:left;margin-left:55px;background-color:;" onmouseover="mOver(this)" onmouseout="mOut(this)">
	                              <a id ="delete" href="javascript:void(0)" style="font-family:华文中宋; color:#24B839;">删除</a> 
	                             </div>
                            </div> -->
                        </div>
                        
                        <button  class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="Send" onclick ="sendEmail()"><i class="fa fa-reply"></i> 发送</button>
                        <a href="mailbox" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i> 放弃</a>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to draft folder" onclick ="savedraft()"><i class="fa fa-pencil"></i> 存为草稿</button>
                        <button class="btn btn-success " type="button" onclick ="upload()" ><i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">上传</span></button>
                    </div>
                    <div class="clearfix"></div>



                </div>
            </div>
        </div>
    </div>





    <div style="visibility:hidden;">
    
    <progress id="progressBar" value="0" max="100"></progress>
    <span id="percentage"></span>
    
    <form id= "uploadForm">
    <input type="file" id="file" name="file"  onchange="fileChange()"/>
    </form>
    
    </div>







    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>

    <!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    
    <!-- 自定义邮件帮助js -->
    <script src="tool/js/emailTool.js"></script>
    
    <!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>

    <!-- SUMMERNOTE -->
    <script src="js/plugins/summernote/summernote.min.js"></script>
    <script src="js/plugins/summernote/summernote-zh-CN.js"></script>
    <script  type="text/javascript">
      var numFile;//附件个数
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });


            $('.summernote').summernote({
                lang: 'zh-CN'
            });
            
            getTotalcompose(document.getElementById('basepath').value);//获取邮件总数
            /* var temp = '${userEmail}';
            console.log(temp); */
            //清空原有的附件html
            $(".uploadFile").empty();
            numFile =0;
            //加载回复的邮件信息            
            queryEmailContent();
        });
        var edit = function () {
            $('.click2edit').summernote({
                focus: true
            });
        };
        var save = function () {
            var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
            $('.click2edit').destroy();
        };
        
        
     //校验邮箱地址
     function checkMail(e){
       var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
       var flag = true;
       debugger;
       var temp = e.value;
       if(temp.lastIndexOf(';')==-1){//当输入的地址不是以；结尾时
          e.value = e.value+";";
       }
       var adress = e.value.split(";"); 
       for(var i=0;i<adress.length;i++){
           if(adress[i]==""||filter.test(adress[i])){
              continue;
           }else{
             //alert("您的电子邮件格式不正确");
             flag =  false;
           }
       }
       if(flag==false){
           //alert("您的电子邮件格式不正确");
           layer.alert("您的电子邮件格式不正确");
           return null;
       }else{
            return adress;       
       }
     }
        
      //发送邮件
     function sendEmail(){
     debugger;
      //获取发送的人
      var getEmailperson="";
      var tempgetEmailperson = document.getElementById("getEmailperson").value.split(";");
       for(var i=0;i<tempgetEmailperson.length;i++){
           if(tempgetEmailperson[i]==""){
              continue;
           }else{
            if(getEmailperson==""){
               getEmailperson = getEmailperson+tempgetEmailperson[i];
            }else{
               getEmailperson =getEmailperson+";"+tempgetEmailperson[i]; 
            }
           }
       }
      //获取抄送的人
      var copyEmailperson = "";
      var tempcopyEmailperson = document.getElementById("copyEmailperson").value.split(";");
       for(var i=0;i<tempcopyEmailperson.length;i++){
           if(tempcopyEmailperson[i]==""){
              continue;
           }else{
            if(copyEmailperson==""){
               copyEmailperson = copyEmailperson+tempcopyEmailperson[i];
            }else{
               copyEmailperson =copyEmailperson+";"+tempcopyEmailperson[i]; 
            }
           }
       }
      //获取密送的人
      var secretEmailperson = "";
      var tempsecretEmailperson = document.getElementById("secretEmailperson").value.split(";");
       for(var i=0;i<tempsecretEmailperson.length;i++){
           if(tempsecretEmailperson[i]==""){
              continue;
           }else{
            if(secretEmailperson==""){
               secretEmailperson = secretEmailperson+tempsecretEmailperson[i];
            }else{
               secretEmailperson =secretEmailperson+";"+tempsecretEmailperson[i]; 
            }
           }
       }
      //获取主题
      var sub = document.getElementById("sub").value;
      //获取附件
      debugger;
      var uploadFile = document.getElementById('uploadFile').getElementsByTagName('a');
      var fileName="";
      for(var i=0;i<uploadFile.length;i++){
         var name  = uploadFile[i].name;
         if(fileName==""){
            fileName = fileName+name;           
         }else{
            fileName= fileName+","+name;
         }
      }
      console.log(getEmailperson+"-----"+copyEmailperson+"------"+secretEmailperson+"------"+sub);
      //获取发送的内容
       var contenttext = $(".note-editable").text();
       var contenthtml = $(".note-editable").html();
       if(getEmailperson==''||contenttext==''){
           layer.alert("您输入的地址为空或发送邮件内容可能为空");  
       }else{
       //ajax请求发送邮件
            var basepath = document.getElementById('basepath').value; 
            var url =  basepath + "/SendEamil.do"; //请求的网址  
            var reqParams = {'getEmailperson':getEmailperson, 'copyEmailperson':copyEmailperson,'secretEmailperson':secretEmailperson,'sub':sub,'contenttext':contenttext,'contenthtml':contenthtml,'fileName':fileName};//请求数据
            $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:reqParams,  
                        async:false,  
                        dataType:"json",  
                        success: function(data){  
                            if(data.isError == false) {
                              //alert("发送邮件成功");
                              //layer.alert("发送邮件成功");
                              window.location.href="mail_compose_success.jsp?status=1";//发送邮件成功后跳转到成功页面
                            }else{
                              //alert("发送邮件失败");
                              layer.alert("发送邮件失败");
                            }
                        }
			      });
             });
             }
     }
     
     
      //将邮件存为草稿
     function savedraft(){
     debugger;
      //获取发送的人
      var getEmailperson="";
      var tempgetEmailperson = document.getElementById("getEmailperson").value.split(";");
       for(var i=0;i<tempgetEmailperson.length;i++){
           if(tempgetEmailperson[i]==""){
              continue;
           }else{
            if(getEmailperson==""){
               getEmailperson = getEmailperson+tempgetEmailperson[i];
            }else{
               getEmailperson =getEmailperson+";"+tempgetEmailperson[i]; 
            }
           }
       }
      //获取抄送的人
      var copyEmailperson = "";
      var tempcopyEmailperson = document.getElementById("copyEmailperson").value.split(";");
       for(var i=0;i<tempcopyEmailperson.length;i++){
           if(tempcopyEmailperson[i]==""){
              continue;
           }else{
            if(copyEmailperson==""){
               copyEmailperson = copyEmailperson+tempcopyEmailperson[i];
            }else{
               copyEmailperson =copyEmailperson+";"+tempcopyEmailperson[i]; 
            }
           }
       }
      //获取密送的人
      var secretEmailperson = "";
      var tempsecretEmailperson = document.getElementById("secretEmailperson").value.split(";");
       for(var i=0;i<tempsecretEmailperson.length;i++){
           if(tempsecretEmailperson[i]==""){
              continue;
           }else{
            if(secretEmailperson==""){
               secretEmailperson = secretEmailperson+tempsecretEmailperson[i];
            }else{
               secretEmailperson =secretEmailperson+";"+tempsecretEmailperson[i]; 
            }
           }
       }
      //获取主题
      var sub = document.getElementById("sub").value;
      //获取附件
      debugger;
      var uploadFile = document.getElementById('uploadFile').getElementsByTagName('a');
      var fileName="";
      for(var i=0;i<uploadFile.length;i++){
         var name  = uploadFile[i].name;
         if(fileName==""){
            fileName = fileName+name;           
         }else{
            fileName= fileName+","+name;
         }
      }
      console.log(getEmailperson+"-----"+copyEmailperson+"------"+secretEmailperson+"------"+sub);
      //获取发送的内容
       var contenttext = $(".note-editable").text();
       var contenthtml = $(".note-editable").html();
       if(getEmailperson==''||contenttext==''){
           layer.alert("您输入的地址为空或发送邮件内容可能为空");  
       }else{
       //ajax请求发送邮件
            var basepath = document.getElementById('basepath').value; 
            var url =  basepath + "/SaveDraft.do"; //请求的网址  
            var reqParams = {'getEmailperson':getEmailperson, 'copyEmailperson':copyEmailperson,'secretEmailperson':secretEmailperson,'sub':sub,'contenttext':contenttext,'contenthtml':contenthtml,'fileName':fileName};//请求数据
            $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:reqParams,  
                        async:false,  
                        dataType:"json",  
                        success: function(data){  
                            if(data.isError == false) {
                              //alert("发送邮件成功");
                              //layer.alert("保存草稿邮件成功");
                              debugger;
                              window.location.href="mail_compose_success.jsp?status=0";//发送邮件成功后跳转到成功页面
                            }else{
                              //alert("发送邮件失败");
                              layer.alert("保存草稿邮件失败");
                            }
                        }
			      });
             });
             }
     }
     
     
     //抄送人显示/隐藏
     function copySend(){
	     var type =  document.getElementById("copySend").style.display;
	     if(type == "none"){
	     document.getElementById("copySend").style.display="";//显示
	     }else{
	     document.getElementById("copySend").style.display="none";//隐藏
	     }
     }   
     //密送人显示/隐藏
     function secretSend(){
	     var type =  document.getElementById("secretSend").style.display;
	     if(type == "none"){
	     document.getElementById("secretSend").style.display="";//显示
	     }else{
	     document.getElementById("secretSend").style.display="none";//隐藏
	     }
     }
     
     
     //增加附件文件（点击form时触发）
     function upload(){
            var input = document.getElementById("file"); 
            input.click();
        }
      //用于监控上传附件的进度条
        function progressFunction(evt) {
            var progressBar = document.getElementById("progressBar");
            var percentageDiv = document.getElementById("percentage");
            if (evt.lengthComputable) {
                progressBar.max = evt.total;
                progressBar.value = evt.loaded;
                percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
                console.log(Math.round(evt.loaded / evt.total * 100));
                //$("#bar"+numFile+" div").style.width = Math.round(evt.loaded / evt.total * 100)+"%";
                $("#bar"+numFile+" div")[0].style.width = Math.round(evt.loaded / evt.total * 100)+"%";
                $("#bar"+numFile+" span").text(Math.round(evt.loaded / evt.total * 100)+"%");
                if(evt.loaded==evt.total){
                    $("#bar"+numFile+"")[0].style.display ="none";
                    $("#status"+numFile+"")[0].style.display ="";
                    //alert("上传完成100%");
                }
             }
       }
       //当选中附件后触发该方法
       function fileChange(){
           // debugger;
            numFile = numFile+1;
            var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
            var name = fileObj.name;
            
            var size = fileObj.size;
            var basepath = document.getElementById('basepath').value; 
            var FileController = basepath +"upload/";// 接收上传文件的后台地址 
            
            // FormData 对象
            var form = new FormData($( "#uploadForm" )[0]);

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
			           var a = document.getElementById("delete"+numFile);
			           var path = responseText.split("\"");
			           
			           a.name = path[3]; 
			        }  
			    } 
                //alert("上传完成!");
            };

            xhr.upload.addEventListener("progress", progressFunction, false);
            xhr.send(form);
            
            /* 
            var temp = "<div id ='enclosure1' style='background-color:#E3EAF4;float:left;'><div style ='float:left'><img src='img/1.png' style='width:30px;height:30px;'/></div>"
	                   +"<div style ='float:left'><div title='jxl_poi.rar' style='float:left;margin-left:8px;'>jxl_poi.rar</div>"
	                   +"<div class='Bars' style='float:left'><div style='width: 100%;'><span>100%</span></div></div>" 
	                   +"<div style='margin-left:5px;display:none;'>1.8M <span class='nui-txt-suc' style='font-family:华文中宋; color:green;'>上传完成</span></div></div>"
	                   +"<div style ='float:left;margin-left:8px;background-color:;' onmouseover='mOver(this)' onmouseout='mOut(this)'>"
	                   +"<a id ='delete' href='javascript:void(0)' style='font-family:华文中宋; color:#24B839;'>删除</a></div></div>";
	                    */
	          var filetype = name.split(".");
	          var imagetype = filetype[filetype.length-1].toLowerCase();//通过文件名来确定展示的文件图片 
	                   
	         var temp = "<div id ='enclosure"+numFile+"' style='background-color:#E3EAF4;float:left;'>"
	                            +"<div style ='float:left'>"
	                            +"<img src='tool/image/email/"+imagetype+".png' style='width:30px;height:30px;'/>"
	                            +"</div>"
	                            +"<div style ='float:left'>"
	                              +"<div title='"+name+"' style='margin-right:20px;'>"+name+"</div>"
	                              +"<div class='Bars' id ='bar"+numFile+"' style='margin-left:8px;display:;'><div style='width: 100%;'><span>100%</span></div></div>"
	                              +"<div id ='status"+numFile+"' style='margin-left:5px;display:none;'>"+(size/(1024*1024)).toFixed(2)+"M <span class='nui-txt-suc' style='font-family:华文中宋; color:green;'>上传完成</span></div>"
	                            +"</div>"
	                             +"<div style ='float:left;margin-left:55px;background-color:;' onmouseover='mOver(this)' onmouseout='mOut(this)'>"
	                              +"<a id ='delete"+numFile+"' name='' onclick = 'del(this)' style='font-family:华文中宋; color:#24B839;'>删除</a> "
	                             +"</div>"
                            +"</div>";          
	        $(temp).appendTo(".uploadFile");
            
       }
       
       
       //删除附件按钮鼠标悬停事件
       function mOver(ele){  
            ele.style.backgroundColor="#B9C1CB";
            //$(ele.class+" a").css("color","white");
	    };  
	    function mOut(ele){  
	        ele.style.backgroundColor="";
           // $(ele.class+" a").css("color","bule");
	    };  
       
       //删除邮件中的附件
       function del(e){
         // debugger;
          var path = (e.name).split("/");
          var basepath = document.getElementById('basepath').value; 
          var url =  basepath + "/deleteFile.do"; //请求的网址  
          var reqParams = {'path':path[4]};//请求数据
            $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:reqParams,  
                        async:false,  
                        dataType:"json",  
                        success: function(data){  
                            if(data.isError == false) {
                              //alert("删除邮件附件成功");
                              //获取a标签的父div的父div 删除该节点
                              var id = $(e).parent().parent().attr("id");
                              document.getElementById(id).remove();
                            }else{
                              //alert("删除附件附件失败");
                            }
                        }
			      });
             });
       }
       
       //放弃发送邮件按钮
       function giveUp(){
       debugger;
       var basepath = document.getElementById('basepath').value; 
       var url =  basepath + "/mailbox"; //请求的网址  
          $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:{},  
                        async:false,  
                        dataType:"json",  
                        success: function(data){  
                            if(data.isError == false) {
                             layer.msg('邮件放弃成功');   
                            }else{
                             layer.msg('邮件放弃失败');  
                            }
                        }
			      });
             });
       }
       
       
       
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
                            debugger;
                               //设置收件人员
                               var sender = data.SENDER;
                               var tempsender="";
                               if(sender.indexOf(">") > 0){
                                 //设置收件人员  str = str.match(/aaa(\S*)fff/)[1];
                                 //document.getElementById("getEmailperson").value = sender.substring(1,sender.length-1);//设置收件人员
                                 document.getElementById("getEmailperson").value = sender.match(/<(\S*)>/)[1];//设置收件人员
                                 //tempsender = sender.substring(1,sender.length-1);
                                 tempsender = sender.match(/<(\S*)>/)[1];
                               }else{
                                 document.getElementById("getEmailperson").value = sender;//设置收件人员
                                 tempsender = sender;
                               }  
                               
                               // 设置抄送人员
                               var copyrecipient = data.COPYRECIPIENTS;
                               if(copyrecipient==''||copyrecipient==null){
                                  document.getElementById("copySend").style.display="none";//隐藏
                               }else{
                                  document.getElementById("copySend").style.display="";//隐藏
                               var tempcopy = "";//表示抄送者
                               if(copyrecipient.indexOf(",") > 0){//表示包含多个人员
                                 var tempcopyrecipient = copyrecipient.split(",");
                                 for(var i=0;i<tempcopyrecipient.length;i++){
                                 
                                     if(tempcopyrecipient[i].indexOf(">") > 0){
		                                  //tempcopy = tempcopy+ tempcopyrecipient[i].substring(1,tempcopyrecipient[i].length-1)+";";//设置收件人员
		                                  tempcopy = tempcopy+ tempcopyrecipient[i].match(/<(\S*)>/)[1]+";";//设置收件人员
		                               }else{
		                                  tempcopy = tempcopy+ tempcopyrecipient[i]+";";//设置收件人员
		                               }
		                                 
                                 }
                                 document.getElementById("copySend").value = tempcopy;//设置收件人员
                               }else if(copyrecipient.indexOf(";") > 0){
                                 var tempcopyrecipient = copyrecipient.split(";");
                                 for(var i=0;i<tempcopyrecipient.length;i++){
                                 
                                     if(tempcopyrecipient[i].indexOf(">") > 0){
		                                  //tempcopy = tempcopy+ tempcopyrecipient[i].substring(1,tempcopyrecipient[i].length-1)+";";//设置收件人员
		                                  tempcopy = tempcopy+ tempcopyrecipient[i].match(/<(\S*)>/)[1]+";";//设置收件人员
		                               }else{
		                                  tempcopy = tempcopy+ tempcopyrecipient[i]+";";//设置收件人员
		                               }
		                                 
                                 }
                                 document.getElementById("copySend").value = tempcopy;//设置收件人员
                               }else{
	                                 if(copyrecipient.indexOf(">") > 0){
	                                 //设置收件人员
		                                 //document.getElementById("copySend").value = copyrecipient.substring(1,copyrecipient.length-1);//设置收件人员
		                                 document.getElementById("copySend").value = copyrecipient.match(/<(\S*)>/)[1];//设置收件人员
		                               }else{
		                                 document.getElementById("copySend").value = copyrecipient;//设置收件人员
		                               }  
                               }
                               }
                               
                               //设置密送人员
                               var secretrecipient = data.SECRETRECIPIENTS;
                               if(secretrecipient==''||secretrecipient==null){
                                   document.getElementById("secretSend").style.display="none";//隐藏
                               }else{
                                   document.getElementById("secretSend").style.display="";//显示
                               var tempsecret = "";//表示抄送者
                               if(secretrecipient.indexOf(",") > 0){//表示包含多个人员
                                 var tempsecretrecipient = secretrecipient.split(",");
                                 for(var i=0;i<tempsecretrecipient.length;i++){
                                 
                                     if(tempsecretrecipient[i].indexOf(">") > 0){
		                                  //tempsecret = tempsecret+ tempsecretrecipient[i].substring(1,tempsecretrecipient[i].length-1)+";";//设置收件人员
		                                  tempsecret = tempsecret+ tempsecretrecipient[i].match(/<(\S*)>/)[1]+";";//设置收件人员
		                               }else{
		                                  tempsecret = tempsecret+ tempsecretrecipient[i]+";";//设置收件人员
		                               }
		                                 
                                 }
                                 document.getElementById("secretSend").value = tempsecret;//设置收件人员
                               }else if(copyrecipient.indexOf(";") > 0){
                                  var tempsecretrecipient = secretrecipient.split(";");
                                 for(var i=0;i<tempsecretrecipient.length;i++){
                                 
                                     if(tempsecretrecipient[i].indexOf(">") > 0){
		                                  //tempsecret = tempsecret+ tempsecretrecipient[i].substring(1,tempsecretrecipient[i].length-1)+";";//设置收件人员
		                                  tempsecret = tempsecret+ tempsecretrecipient[i].match(/<(\S*)>/)[1]+";";//设置收件人员
		                               }else{
		                                  tempsecret = tempsecret+ tempsecretrecipient[i]+";";//设置收件人员
		                               }
		                                 
                                 }
                                 document.getElementById("secretSend").value = tempsecret;//设置收件人员
                               }else{
	                                 if(secretrecipient.indexOf(">") > 0){
	                                 //设置收件人员
		                                 //document.getElementById("secretSend").value = secretrecipient.substring(1,secretrecipient.length-1);//设置收件人员
		                                 document.getElementById("secretSend").value = secretrecipient.match(/<(\S*)>/)[1];//设置收件人员
		                               }else{
		                                 document.getElementById("secretSend").value = secretrecipient;//设置收件人员
		                               }  
                               }
                               }
                               
                               //获取收件人员
                               var recipient = data.RECIPIENTS;
                               var temprecipient = "";//表示抄送者
                               if(recipient.indexOf(",") > 0){//表示包含多个人员
                                 var temprecipientrecipient = recipient.split(",");
                                 for(var i=0;i<temprecipientrecipient.length;i++){
                                 
                                     if(temprecipientrecipient[i].indexOf(">") > 0){
		                                  //temprecipient = temprecipient+ temprecipientrecipient[i].substring(1,recipient.length-1)+";";//设置收件人员
		                                  temprecipient = temprecipient+ temprecipientrecipient[i].match(/<(\S*)>/)[1]+";";//设置收件人员
		                               }else{
		                                  temprecipient = temprecipient+ temprecipientrecipient[i]+";";//设置收件人员
		                               }
		                                 
                                 }
                               }else if(recipient.indexOf(";") > 0){
                                  var temprecipientrecipient = recipient.split(";");
                                 for(var i=0;i<temprecipientrecipient.length;i++){
                                 
                                     if(temprecipientrecipient[i].indexOf(">") > 0){
		                                  //temprecipient = temprecipient+ temprecipientrecipient[i].substring(1,recipient.length-1)+";";//设置收件人员
		                                  temprecipient = temprecipient+ temprecipientrecipient[i].match(/<(\S*)>/)[1]+";";//设置收件人员
		                               }else{
		                                  temprecipient = temprecipient+ temprecipientrecipient[i]+";";//设置收件人员
		                               }
		                                 
                                 }
                               }else{
	                                 if(recipient.indexOf(">") > 0){
	                                   //设置收件人员
		                                 //temprecipient = recipient.substring(1,recipient.length-1);//设置收件人员
		                                 temprecipient = recipient.match(/<(\S*)>/)[1];//设置收件人员
		                               }else{
		                                 temprecipient = recipient;//设置收件人员
		                               }  
                               }
                               
                               //设置标题
                               document.getElementById("sub").value = data.TITLE;//设置收件人员
                               
                               //设置邮件内容
                                var content = "<br><br><br>------------------ 原始邮件 ------------------<br>发件人:"+tempsender+"<br>发送时间:"+data.THETIME+"<br>收件人:"+temprecipient+"<br>主题:"+data.TITLE+"<br>"+data.CONTENT;
                                //var contenthtml = $(".note-editable").html();
                                 $(".note-editable").html(content);
                                 
                                 //设置附件内容
                                 
                                if(data.UPLOAD!=''&&data.UPLOAD!=null){
                                 if(!((data.UPLOAD).indexOf(",") > 0)){//表示只有一个附件
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
						                var temp = "<div id ='enclosure1' style='background-color:#E3EAF4;float:left;'>"
				                            +"<div style ='float:left'>"
				                            +"<img src='tool/image/email/"+imagetype+".png' style='width:30px;height:30px;'/>"
				                            +"</div>"
				                            +"<div style ='float:left'>"
				                              +"<div title='"+filename+"' style='margin-right:20px;'>"+filename+"</div>"
				                              +"<div class='Bars' id ='bar1' style='margin-left:8px;display:;'><div style='width: 100%;'><span>100%</span></div></div>"
				                              +"<div id ='status1' style='margin-left:5px;display:none;'>"+(1024/(1024*1024)).toFixed(2)+"M <span class='nui-txt-suc' style='font-family:华文中宋; color:green;'>上传完成</span></div>"
				                            +"</div>"
				                             +"<div style ='float:left;margin-left:55px;background-color:;' onmouseover='mOver(this)' onmouseout='mOut(this)'>"
				                              +"<a id ='delete1' name='' onclick = 'del(this)' style='font-family:华文中宋; color:#24B839;'>删除</a> "
				                             +"</div>"
			                            +"</div>"; 
	                                    $(temp).appendTo(".uploadFile");
	                                    
	                                    
						            }else{
						                var filetotal = (data.UPLOAD).split(",");
						                for(var i=0;i<filetotal.length;i++){
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
						                var temp = "<div id ='enclosure"+i+"' style='background-color:#E3EAF4;float:left;'>"
				                            +"<div style ='float:left'>"
				                            +"<img src='tool/image/email/"+imagetype+".png' style='width:30px;height:30px;'/>"
				                            +"</div>"
				                            +"<div style ='float:left'>"
				                              +"<div title='"+filename+"' style='margin-right:20px;'>"+filename+"</div>"
				                              +"<div class='Bars' id ='bar"+i+"' style='margin-left:8px;display:;'><div style='width: 100%;'><span>100%</span></div></div>"
				                              +"<div id ='status"+i+"' style='margin-left:5px;display:none;'>"+(1024/(1024*1024)).toFixed(2)+"M <span class='nui-txt-suc' style='font-family:华文中宋; color:green;'>上传完成</span></div>"
				                            +"</div>"
				                             +"<div style ='float:left;margin-left:55px;background-color:;' onmouseover='mOver(this)' onmouseout='mOut(this)'>"
				                              +"<a id ='delete"+i+"' name='' onclick = 'del(this)' style='font-family:华文中宋; color:#24B839;'>删除</a> "
				                             +"</div>"
			                            +"</div>";    
	                                    $(temp).appendTo(".uploadFile");
						                }
						            }
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
			               });
        }
       
       
       
       
       
    </script>
      
    
    

</body>

</html>
