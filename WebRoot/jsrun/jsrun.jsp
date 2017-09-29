<%@ page language="java" import="java.util.*,com.cy.ssm.beans.UserBean" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title></title>
    <!-- load ace -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="jsrun/Tiny-editor.css"/>
    
	<style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        .main{
            width: 100%;
            height: 100%;
            position: absolute;
        }
        .quarter-div{
            width: 50%;
            height: 50%;
            float: left;
        }
        .blue{
            background-color: #F3F5F6;
        }
        .green{
            background-color: #F3F5F6;
        }
        .orange{
            background-color: #F3F5F6;
        }
        .yellow{
            background-color: #F3F5F6;
        }
    </style>
	
</head>
<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"/> 
<body>
   <div class="" style="width:100%;height:4%;" >
    <a class="run button" onclick="Tiny.run()">Run</a>
    <a class="save button" onclick="Tiny.save()">Save</a>
    
    <textarea id="worksBrief" placeholder="为您的作品添加一些简介吧！！"></textarea>
    
    <label>编辑样式</label>
    <select name="iplastic" id="theme"></select>
	</div>
	
	<div id="tabPlugin" class="main ">
	 <ul id="tabControls" style="display:none" class="tabPlugin" >
        <li onclick="Tiny.tab(1)">HTML</li>
        <li onclick="Tiny.tab(2)">CSS</li>
        <li onclick="Tiny.tab(3)">JavaScript</li>
        <li onclick="Tiny.tab(4);Tiny.run()" id="resultTab">Result</li>
    </ul>
	
	
	
	
        <div class="quarter-div blue">
		
		<div class="tabContainer">
       <pre id='html' style="font-size: 16px;">
&lt;h1&gt;
    Hello~
&lt;/h1&gt;
        </pre>
    </div>
		
		</div>
        <div class="quarter-div green">
		
		<div class="tabContainer">
        <pre id= 'css' style="font-size: 16px;">
h1{
    color:red;
}
        </pre>
    </div>
		
		
		</div>
        <div class="quarter-div orange">
		
		<div class="tabContainer">
        <pre id='js' style="font-size: 16px;">

document.getElementsByTagName('h1')[0].innerHTML='欢迎使用JS编辑器!'

        </pre>

    </div>
		
		</div>
        <div class="quarter-div yellow">
		
		 <div class="tabContainer" id="dockIframe">
        <div class="split-line" id="splitLine"></div>
        <iframe class="iframe" id="iframe" sandbox="allow-forms allow-popups allow-scripts allow-same-origin allow-modals" name="iframe" frameborder="0">
        </iframe>
    </div>
		
		</div>
    </div>
	
	

<!-- 加载弹出层样式的相关js -->

<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="http://cdn.bootcss.com/ace/1.2.3/ace.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="jsrun/Tiny-editor.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="layer-v1.8.5/layer/layer.min.js"></script>
<script>
   var Tiny = new TinyEditor('Tiny-container',{
        //index : 1
    });
	//修改屏幕中出现的一条竖线
	var mm  = $('.ace_print-margin');
	mm.removeClass("ace_print-margin");
	
	
	//将编辑好的html+css+js内容保存到数据库中
 function saveJsrun(){
	debugger;
	   var worksBrief = document.getElementById('worksBrief').value;
	   if(worksBrief===null||worksBrief==''){
	    alert("请为您的作品添加简介!");  
	   	//layer.msg('请为您的作品添加简介！');
	   }else{
       var worksHtml=buffer.htmlEditor.getValue()+"<script type='text/javascript' src='' ><"+"/script>";
	   var worksCss = '<style>'+buffer.cssEditor.getValue()+'</style>';
	   var worksJs = buffer.jsEditor.getValue();
	    if((buffer.htmlEditor.getValue()==null||buffer.htmlEditor.getValue()=='')&&(buffer.cssEditor.getValue()==null||buffer.cssEditor.getValue()=='')&&(buffer.jsEditor.getValue()==null||buffer.jsEditor.getValue()=='')){
	    	alert("您的作品为空！");  
	    	//layer.msg('您的作品为空！');
	    }else{
	         var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/insertjsrun.do"; //请求的网址  
			 var json ={'worksBrief':worksBrief,'worksHtml':worksHtml,'worksCss':worksCss,'worksJs':worksJs};
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:json,  
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
	   }
}
</script>
</body>
</html>