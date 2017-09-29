<%@ page language="java" import="java.util.*,com.cy.ssm.beans.UserBean" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserBean user = (UserBean)request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 文件管理器</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet"> 
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
     <!-- 右侧弹出层样式 -->
    <!-- <link rel="stylesheet" type="text/css" href="css/bootstrap-grid.min.css" />
    <link rel="stylesheet" type="text/css" href="css/reset.css"> -->
	
    
    
    
<!-- <style>
 .demo-class{
     margin-left:auto;margin-right:2px;width:60%;height:90%;background:#000; filter:alpha(opacity:30); opacity:0.3;
 }
</style> -->

</head>
<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"> 
<!-- <input id="file-3" type="file" multiple=true > -->  <!-- style="display:none;" -->
<input type="hidden" id="availHeight" name="availHeight" value="">
<input type="hidden" id="availWidth" name="availWidth" value="">
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                            <h5>显示：</h5>
                            <a onclick="filetype(this)" id="all" name ="all" class="file-control active">所有</a>
                            <a onclick="filetype(this)" id="doc" name ="doc" class="file-control">文档</a>
                            <a onclick="filetype(this)" id="movie" name ="movie" class="file-control">视频</a>
                            <a onclick="filetype(this)" id="sound" name ="sound" class="file-control">音乐</a>
                            <a onclick="filetype(this)" id="image" name ="image" class="file-control">图片</a>
                            <div class="hr-line-dashed"></div>
                            <button onclick ="uploadfile()" class="btn btn-primary btn-block">上传文件</button>
                            <div class="hr-line-dashed"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list" style="padding: 0">
                                <li id="filedoc" onclick="folder(this)" class="file-control "><a ><i class="fa fa-folder"></i> 文件</a>
                                </li>
                                <li id="fileimage" onclick="folder(this)" class="file-control "><a ><i class="fa fa-folder"></i> 图片</a>
                                </li>
                                <li id="fileweb" onclick="folder(this)" class="file-control "><a ><i class="fa fa-folder"></i> Web页面</a>
                                </li>
                                <li id="fileinsertimage" onclick="folder(this)" class="file-control "><a ><i class="fa fa-folder"></i> 插图</a>
                                </li>
                                <li id="filemovie" onclick="folder(this)" class="file-control "><a ><i class="fa fa-folder"></i> 电影</a>
                                </li>
                                <li id="filebook" onclick="folder(this)" class="file-control "><a ><i class="fa fa-folder"></i> 书籍</a>
                                </li>
                            </ul>
                            <h5 class="tag-title">标签</h5>
                            <ul class="tag-list" style="padding: 0">
                                <li id="tab1" onclick="filetab(this)"><a class="file-control">爱人</a>
                                </li>
                                <li id="tab2" onclick="filetab(this)"><a class="file-control">工作</a>
                                </li>
                                <li id="tab3" onclick="filetab(this)"><a class="file-control">家庭</a>
                                </li>
                                <li id="tab4" onclick="filetab(this)"><a class="file-control">孩子</a>
                                </li>
                                <li id="tab5" onclick="filetab(this)"><a class="file-control">假期</a>
                                </li>
                                <li id="tab6" onclick="filetab(this)"><a class="file-control">音乐</a>
                                </li>
                                <li id="tab7" onclick="filetab(this)"><a class="file-control">照片</a>
                                </li>
                                <li id="tab8" onclick="filetab(this)"><a class="file-control">电影</a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="bbbbbb" class="col-sm-9 animated fadeInRight">
                <div class="row">
                    <div class="col-sm-12">
                    <!-- 文件列表 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
   
   <div style="visibility:hidden;">
    
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
    <script src="js/bootstrap-switch.js"></script>
   
     <!-- 加载弹出层样式的相关js -->
    <script src="layer-v2.4/layer/layer.js"></script>


    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>


    <script>
    
    /* window.onload = function() {
        queryFileList('','','');
    } */
    
       var timeid;
       var winWidth = 0;//屏幕宽
       var winHeight = 0;//屏幕高
        $(document).ready(function () {
            $('.file-box').each(function () {
                animationHover(this, 'pulse');
            });
            //获取屏幕的宽高
           // findDimensions();
           //加载文件信息
          // debugger;
           queryFileList('','','');
        });
       //加载文件数据
       function queryFileList(fileCategory,folder,filetab){
      // debugger;
            var basepath = document.getElementById('basepath').value; 
            var url =  basepath + "/FileList.do"; //请求的网址  
            var reqParams = {'fileCategory':fileCategory, 'folder':folder,'filetab':filetab};//请求数据
            $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:reqParams,
                        async:false,  
                        dataType:"json",  
                        success: function(data){
                                 //var temp ="";
						         $(".col-sm-12").empty();//清空表格内容  
						         if (data.length > 0 ) {
						                for(var i=0;i<data.length;i++){
						                var temp = "";
						                var imagetype =data[i].FILENAME.split(".");
						                if(data[i].FILETYPE == "fa-file-image-o"){
						                     //imagetype = data[i].FILENAME.split(".");
						                     temp ="<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='download.jsp?filepath="+data[i].FILEPATH+"&filename="+data[i].FILENAME+"' ><span class='corner'></span><div class='image'><img alt='image' class='img-responsive' src='fileManager/"+data[i].ID+"."+imagetype[imagetype.length-1]+"'></div><div class='file-name' style='overflow: hidden; white-space: nowrap; text-overflow: clip;'>"+data[i].FILENAME+"<br/><small>添加时间："+data[i].FILETIME+"</small></div></a></div></div>";          
						                }else{
						                     //imagetype = data[i].FILENAME.split(".");
						                     temp ="<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='download.jsp?filepath="+data[i].FILEPATH+"&filename="+data[i].FILENAME+"' ><span class='corner'></span><div class='icon'><i class='fa "+data[i].FILETYPE+"'></i></div><div class='file-name' style='overflow: hidden; white-space: nowrap; text-overflow: clip;'>"+data[i].FILENAME+"<br/><small>添加时间："+data[i].FILETIME+"</small></div></a></div></div>";          
						                }
								         $(temp).appendTo(".col-sm-12");
						                }    
						                    } else {                                  
						                         /*  $(".col-sm-12").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');  */ 
						                    }
			                      },  
			                        error: function(e){  
			                           //alert("查询失败:" + e);
			                           layer.msg('查询失败');   
			                        }  
			                    });  
			               });
       }
       
       //上传文件
       function uploadfile(){
               var input = document.getElementById("file"); 
               input.click();
       } 
        
       //用于监控上传附件的进度条
        function progressFunction(evt) {
            var progressdiv = document.getElementById("progressdiv"+timeid);
            var progress = document.getElementById("progress"+timeid);
            if (evt.lengthComputable) {
                //progressBar.max = evt.total;
                //progressBar.value = evt.loaded;
                progress.style.width=Math.round(evt.loaded / evt.total * 100)+"%";
                if(evt.loaded==evt.total){
                    progressdiv.style.display ="none";
                    
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
            var FileController = basepath +"fileManager/";// 接收上传文件的后台地址 
            
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
			           debugger;
			           var temppath = responseText.split("\"");
			           
			           document.getElementById("a"+timeid).href = "download.jsp?filepath="+temppath[3]+"&filename="+name;
			           document.getElementById("img"+timeid).src = path;
			           
			           /*  var temppath = "fileManager/"+timeid+"."+tempfilename[tempfilename.length-1];
			           var temp ="";
			           if(filetype == "fa-file-image-o"){
			                 temp = "<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='fileManager/"+timeid+"."+filetype[filetype.length-1]+"' download='"+timeid+"."+filetype[filetype.length-1]+"' ><span class='corner'></span><div class='image'><img alt='image' class='img-responsive' src='"+temppath+"'></div><div class='file-name' style='overflow: hidden; white-space: nowrap; text-overflow: clip;'>"+name+"<br/><small>添加时间："+time+"</small></div></a><div id='progressdiv"+timeid+"' class='progress'><div id='progress"+timeid+"' style='width: 0%;' class='progress-bar'></div></div></div></div>";          
			           }else{
			                 temp = "<div onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a href='fileManager/"+timeid+"."+filetype[filetype.length-1]+"' download='"+timeid+"."+filetype[filetype.length-1]+"'><span class='corner'></span><div class='icon'><i class='fa "+filetype+"'></i></div><div class='file-name' style='overflow: hidden; white-space: nowrap; text-overflow: clip;'>"+name+"<br/><small>添加时间："+time+"</small></div></a><div id='progressdiv"+timeid+"' class='progress'><div id='progress"+timeid+"' style='width: 0%;' class='progress-bar'></div></div></div></div>";          
			           }
			              //temp = temp+"<div><span>当前项目进度：</span><div class='stat-percent'>48%</div><div class='progress progress-mini'><div style='width: 48%;' class='progress-bar'></div></div></div>";
			           $(temp).appendTo(".col-sm-12"); */
			           
			        }  
			    } 
                //alert("上传完成!");
            };
            //文件唯一的id
             var tempdate = new Date();
	         timeid = tempdate.getFullYear().toString()+(tempdate.getMonth()+1).toString()+tempdate.getDate().toString()+tempdate.getHours().toString()+tempdate.getMinutes().toString()+tempdate.getSeconds().toString()+tempdate.getMilliseconds().toString();        
             document.getElementById("fileid").value = timeid;
              //文件所属文件夹
              debugger;
               var folderlist = $(".folder-list")[0].childNodes;//.childNodes;
                for(var i=0;i<folderlist.length;i++){
                        var foldertype = folderlist[i];
                        if(foldertype.className=='file-control active'){
                            document.getElementById("folder").value = foldertype.id;
                        }
                }
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
	          
	          var time = tempdate.getFullYear().toString()+"-"+(tempdate.getMonth()+1).toString()+"-"+tempdate.getDate().toString(); 
	          document.getElementById("filetime").value = time;
              
              xhr.upload.addEventListener("progress", progressFunction, false);
              // FormData 对象
              var form = new FormData($( "#uploadForm" )[0]);
              xhr.send(form);
	          //var tempdate = new Date();
	          //timeid = tempdate.getFullYear().toString()+(tempdate.getMonth()+1).toString()+tempdate.getDate().toString()+tempdate.getHours().toString()+tempdate.getMinutes().toString()+tempdate.getSeconds().toString()+tempdate.getMilliseconds().toString();        
	          var path = "fileManager/"+timeid+"."+tempfilename[tempfilename.length-1];
	          var temp ="";
	          if(filetype == "fa-file-image-o"){
	                 temp = "<div id='"+timeid+"' onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a id='a"+timeid+"' href='' ><span class='corner'></span><div class='image'><img id='img"+timeid+"' alt='image' class='img-responsive' src=''></div><div class='file-name' style='overflow: hidden; white-space: nowrap; text-overflow: clip;'>"+name+"<br/><small>添加时间："+time+"</small></div></a><div id='progressdiv"+timeid+"' class='progress'><div id='progress"+timeid+"' style='width: 0%;' class='progress-bar'></div></div></div></div>";          
	                 
	          }else{
	                 temp = "<div id='"+timeid+"' onmouseover='lefton(this)' onmouseout='passon(this)' class='file-box'><div class='file'><a id='a"+timeid+"' href=''><span class='corner'></span><div class='icon'><i class='fa "+filetype+"'></i></div><div class='file-name' style='overflow: hidden; white-space: nowrap; text-overflow: clip;'>"+name+"<br/><small>添加时间："+time+"</small></div></a><div id='progressdiv"+timeid+"' class='progress'><div id='progress"+timeid+"' style='width: 0%;' class='progress-bar'></div></div></div></div>";          
	          }
	              //temp = temp+"<div><span>当前项目进度：</span><div class='stat-percent'>48%</div><div class='progress progress-mini'><div style='width: 48%;' class='progress-bar'></div></div></div>";
	        $(temp).appendTo(".col-sm-12"); 
       }
       
       
       /*  //获取屏幕的宽高
		function findDimensions() //函数：获取尺寸
		{
		//获取窗口宽度
		if (window.innerWidth)
		winWidth = window.innerWidth;
		else if ((document.body) && (document.body.clientWidth))
		winWidth = document.body.clientWidth;
		//获取窗口高度
		if (window.innerHeight)
		winHeight = window.innerHeight;
		else if ((document.body) && (document.body.clientHeight))
		winHeight = document.body.clientHeight;
		//通过深入Document内部对body进行检测，获取窗口大小
		if (document.documentElement  && document.documentElement.clientHeight && document.documentElement.clientWidth)
		{
		
		winHeight = document.documentElement.clientHeight;
		winWidth = document.documentElement.clientWidth;
		}
		//结果输出至两个文本框
		document.getElementById('availHeight').value = winHeight;
		document.getElementById('availWidth').value = winWidth; 
		}
 */
 
       function download1(e){
       debugger;
            var basepath = document.getElementById('basepath').value; 
          
            var a = document.createElement('a');
			var url = window.URL.createObjectURL(blob);
			var filename = e.id;
			a.href = basepath +"fileManager/"+filename;
			a.download = filename;
			a.click();
			window.URL.revokeObjectURL(url);
       }
 
        //文件类型
        function filetype(e){
                var id = e.id;
                e.className = "file-control active";
                var abrother  = $("#"+id+"").siblings("a");//获取兄弟节点中的a标签节点
                //$(abrother).css("class","file-control");//className = "";
                
                for(var i=0;i<abrother.length;i++){
                      var a = abrother[i];
                      a.className = "file-control";
                }
                //当相通过文件类型查询文件列表时需要查询所有的该类型的文件，所以需要将文件夹、标签等选中属性去除
                var folderlist = $(".folder-list")[0].childNodes;//.childNodes;
                for(var i=0;i<folderlist.length;i++){
                        var foldertype = folderlist[i];
                        if(foldertype.className=='file-control active'){
                            foldertype.className = "file-control";
                        }
                }
                var taglist = $(".tag-list")[0].childNodes;//.childNodes;
                for(var i=0;i<folderlist.length;i++){
                        var foldertype = folderlist[i];
                        if(foldertype.className=='file-control active'){
                            foldertype.className = "file-control";
                        }
                }
                //通过文件类型查询文件
                if(id=='all'){
                    queryFileList('','',''); 
                }else{
                    queryFileList(id,'',''); 
                }
                
                
        }
        //文件夹
        function folder(e){
                var id = e.id;
                e.className = "file-control active";
                var abrother  = $("#"+id+"").siblings("li");//获取兄弟节点中的a标签节点
                //$(abrother).css("class","file-control");//className = "";
                
                for(var i=0;i<abrother.length;i++){
                      var a = abrother[i];
                      a.className = "file-control";
                }
                
                //通过文件夹型查询文件
                queryFileList('',id,''); 
                
        }
        //文件标签
        function filetab(e){
                var id = e.id;
               // e.className = "file-control active";
                e.firstChild.className = "file-control active";
		             
                var abrother  = $("#"+id+"").siblings("li");//获取兄弟节点中的a标签节点
                //$(abrother).css("class","file-control");//className = "";
                
                for(var i=0;i<abrother.length;i++){
                      var a = abrother[i].firstChild;
                      a.className = "file-control";
                }
                //通过文件夹型查询文件
                queryFileList('','',id);
        }
        
        //添加悬浮属性
        function lefton(e){
         e.className = "file-box animated pulse" ;
        }
        //添加悬浮属性
        function passon(e){
           e.className ="file-box" ;
        }
        
           /* function loadFile() {//定时检测    
                    loadjscssfile('css/font-awesome.css', "css"); //加载你的css文件
                    loadjscssfile('css/animate.css', "css"); //加载你的js文件
                    loadjscssfile('css/style.css', "css"); //加载你的js文件
                    loadjscssfile('fileupload/css/bootstrap.css', "css"); //加载你的css文件
                    loadjscssfile('fileupload/css/fileinput.css', "css"); //加载你的js文件
                    loadjscssfile('fileupload/js/jquery.min.js', "js"); //加载你的js文件
                    
                    loadjscssfile('fileupload/js/fileinput.js', "js"); //加载你的css文件
                    loadjscssfile('fileupload/js/bootstrap.js', "js"); //加载你的js文件
                    loadjscssfile('js/bootstrap.min.js', "js"); //加载你的js文件
            }
        
         //动态加载 js /css 
        function loadjscssfile(filename, filetype) {
            if (filetype == "js") { //判定文件类型
                var fileref = document.createElement('script')//创建标签
                fileref.setAttribute("type", "text/javascript")//定义属性type的值为text/javascript
                fileref.setAttribute("src", filename)//文件的地址
            }
            else if (filetype == "css") { //判定文件类型
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", filename)
            }
            if (typeof fileref != "undefined")
                document.getElementsByTagName("head")[0].appendChild(fileref)
        } */
        
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
        
        
        
        
    </script>

</body>

</html>
