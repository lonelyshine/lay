<%@ page language="java" import="java.util.*,com.cy.ssm.beans.UserBean" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="jsrun/jsrunlist/css/succulent.css">
    <title>多肉商城</title>
	
	
	 <style>
@import url(http://fonts.googleapis.com/css?family=Inconsolata:400,700);
@import url(http://fonts.googleapis.com/css?family=Hammersmith+One);

body {
  background-color: #ccc;
}
.container {
  width: 512px;
  height: 380px;   
  margin: auto;
  margin-top: 0;
}

.heart {
  z-index: 1;
  width: 150px;
  height: 150px;
  position: absolute;
  top: 50%;
  margin-top: -75px;
  left: 50%;
  margin-left: -75px;
  background-size: 100%;
  background-repeat: no-repeat;
  background-image:url("data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjE3M3B4IiBoZWlnaHQ9IjE1OHB4IiB2aWV3Qm94PSIwIDAgMTczIDE1OCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTczIDE1OCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8cGF0aCBmaWxsPSIjRUY0NjU3IiBkPSJNMTU3LjMzMSwxNS41MDRjLTE5LjU1OS0xOS41NTktNTEuMjcxLTE5LjU1OS03MC44MzEsMGMtMTkuNTU5LTE5LjU1OS01MS4yNzEtMTkuNTU5LTcwLjgzMSwwDQoJYy0xOS41NTksMTkuNTU5LTE5LjU1OSw1MS4yNzEsMCw3MC44MzFsNzAuODMxLDcwLjgzbDcwLjgzMS03MC44M0MxNzYuODksNjYuNzc1LDE3Ni44OSwzNS4wNjQsMTU3LjMzMSwxNS41MDR6Ii8+DQo8L3N2Zz4=");
}
.hometown {
  font-family:'Inconsolata', sans-serif;
  font-weight: bold;
  font-size: 2.0em;
  text-transform: uppercase;
  position: relative;
  z-index: 1;
  width: 512px;
  height: 512px;
  color: #FFF;
}
#top {
  width: 200px;
  margin: auto;
  position: relative;
}
#top span {
  height: 350px;
  position: absolute;
  width: 20px;
  left: 50%;
  margin-left: -10px;
  top: 110px;
}
.char1 {
	transform: rotate(-36deg);
}
.char2 {
	transform: rotate(-24deg);
}
.char3 {
	transform: rotate(-12deg);
}
.char4 {
	transform: rotate(0deg);
}
.char5 {
	transform: rotate(12deg);
}
.char6 {
	transform: rotate(24deg);
}
.char7 {
	transform: rotate(36deg);
}

#bottom span {
  height: 350px;
  line-height: 700px;
  position: absolute;
  width: 20px;
  left: 50%;
  margin-left: -10px;
  top: 10px;
}

#bottom .char1 {
	transform: rotate(36deg);
}
#bottom .char2 {
	transform: rotate(27deg);
}
#bottom .char3 {
	transform: rotate(18deg);
}
#bottom .char4 {
	transform: rotate(9deg);
}
#bottom .char5 {
	transform: rotate(0deg);
}
#bottom .char6 {
	transform: rotate(-9deg);
}
#bottom .char7 {
	transform: rotate(-18deg);
}
#bottom .char8 {
	transform: rotate(-27deg);
}
#bottom .char9 {
	transform: rotate(-36deg);
}

.city {
  font-family:"Hammersmith One";
  width: 100%;
  height: 300px;
  padding-top: 45px;
  text-align: center;
  font-size: 3.0em;
  z-index: 100;
  position: absolute;
  top: 50%;
  margin-top: -110px;
}

.heart {
  animation: HEARTBEAT 2.5s infinite;
}
#top span {
  animation: BOUNCE 2.5s infinite;
}

@keyframes HEARTBEAT {
  0% {
    transform: scale(1);
  }
  5% {
    transform: scale(1.3);
  }
  10% {
    transform: scale(1.1);
  }
  15% {
    transform: scale(1.5);
  }
  50% {
    transform: scale(1);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes BOUNCE {
  0% {
    top: 110px;
  }
  10% {
    top: 80px;
  }
  15% {
    top: 85px;
  }
  20% {
    top: 70px;
  }
  75% {
    top: 110px;
  }
  100% {
    top: 110px;
  }
}

</style>

    <script src="jsrun/jsrunlist/js/prefixfree.min.js"></script>
	
	
	
	
	
</head>

<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"/> 

<body>
    <header>
	
	  <div class="container bg">
  <div class="hometown">
    <div class="heart">
    </div>
    <div id="top">The sun</div>
    <div class="city">waite</div>
    <div id="bottom"> for you </div>
  </div>
</div>
<div style="text-align:center;clear:both">

</div>
  <script src='jsrun/jsrunlist/js/jquery.js'></script>
  <script src='jsrun/jsrunlist/js/jquery.lettering.js'></script>

  <script src="jsrun/jsrunlist/js/index.js"></script>
  
  
  
    </header>
	<div style='text-align:center'>
	
	<div class="border-radiuslist" >
    <div class="border-radius" style='float:right'>创建项目</div>
	<div class="border-radiusbetween" style='float:right'></div>
	<div class="border-radius" style='float:right'>代码仓库</div>
	<div class="border-radiusbetween" style='float:right'></div>
	<div class="border-radius" style='float:right'>我的代码</div>
	</div>
	
	</div>
	
	
	
    <div class="main">
        
		<div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
		
        <div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
        <div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
        <div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
        <div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
		
        <div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
        <div class="view">
          
			<iframe class="iframe" id="iframe" style="width:200px;height:200px;background:#000;" sandbox="allow-forms allow-popups allow-scripts allow-same-origin allow-modals" name="iframe" frameborder="0">
        </iframe>
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
        <div class="view">
            <img src="images/3.jpg" alt="">
            <div class="hover">
                <h3>创意组合</h3>
                <p>多肉组合盆栽净化空气办公桌礼物套餐</p>
            </div>
        </div>
        
        
    </div>
    
    <div style='text-align:center'>
    <div class="border-radiuslist1">
        <div class="border-radius1" style='float:right'>没有了</div>
        <div class="border-radiusbetween1" style='float:right'>1/20</div>
        <div class="border-radius1" style='float:right'>下一页</div>
    </div>
    </div>
    
 <!--    <section>
        <p>多肉植物是指植物营养器官肥大的高等植物，通常具根、茎、叶三种营养器官和花（Flower ['flauə]）、果实、种子三种繁殖器官。在园艺上，又称肉质植物或多肉花卉，但以多肉植物这个名称最为常用。全世界共有多肉植物一万余种，它们绝大部分属于高等植物（绝大多数是被子植物）。在植物分类上隶属几十个科，个别专家认为有67个科中含有多肉植物，但大多数专家认为只有50余科。
        </p>
    </section> -->
   
   <script>
        //获取相关的js代码资源
 function getmyjsrunlist(){
	         var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/getjsrunlist.do"; //请求的网址  
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{},  
			                        async:true,//异步  
			                        dataType:"json",  
			                        success: function(data){ 
			                            //layer.msg(data.message);
			                            alert(data.message); 
			                            /* debugger;
			                            if(data.isError == false) {
			                               layer.msg(data.message);
			                            }else{
			                            layer.msg(data.message);
			                                alert("保存失败！");  
			                            	//layer.msg('保存失败');
			                            } */
			                        }
						      });
			         });
	   
}
        
		var html="<h1> Hello~</h1><script type='text/javascript' src='' ></"+"script>"
		var css = "<style>h1{color:red;}</style>";
		var js = "document.getElementsByTagName('h1')[0].innerHTML='Hello World!'";
        
		var iframe = document.getElementsByTagName('iframe')[0].contentWindow;
		iframe.document.getElementsByTagName('body')[0].innerHTML=(html+css)
		window.frames['iframe'].eval(js)
	
</script>
   
   
</body>
</html>