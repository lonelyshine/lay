
var host ="ws://127.0.0.1:8080/lay/lay";   
var ws = "";
      //判断当前浏览器是否支持WebSocket  
        if ('WebSocket' in window) {  
		    ws=new WebSocket(host);  
		} else if ('MozWebSocket' in window) {  
		    ws= new MozWebSocket(host);
		} else { 
			layui.use(['layer'], function(){
				  var layer = layui.layer;
				  layer.alert("您的浏览器不支持webscoket协议,建议使用新版谷歌、火狐等浏览器，请勿使用IE10以下浏览器，360浏览器请使用极速模式，不要使用兼容模式！"); 
			});
		}
         
      //连接发生错误的回调方法  
      ws.onerror = function(e) {
			layui.use(['layer'], function(){
				  var layer = layui.layer;
				  layer.alert("ws发生错误,请勿使用IE9以下浏览器，360浏览器请使用极速模式，不要使用兼容模式！"); 
			});
		} 
         
      //连接成功建立的回调方法  
      ws.onopen = function(e) {
		console.log("ws连接成功！");
		  var obj={
		  		   username:'qinxg'  //消息来源用户名
				  ,avatar: 'asdf' //消息来源用户头像
				  ,id: 1 //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
				  ,type: 'adads' //聊天窗口来源类型，从发送消息传递的to里面获取
				  ,content: 'asdasd' //消息内容
				  ,cid: 0 //消息id，可不传。除非你要对消息进行一些操作（如撤回）
				  ,mine: false //是否我发送的消息，如果为true，则会显示在右方
				  ,fromid:232323 //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
				  ,timestamp: new Date().getTime() //服务端动态时间戳			  
				 /*  avatar:"img/profile_small.jpg"
				  ,cid:0
				  ,content:"as asdf hagsdfk hgasdhf jgasd"
				  ,fromid:2
				  ,id:1
				  ,mine:false
				  ,name:"石满"
				  ,temporary:true
				  ,timestamp:1495533465937
				  ,type:"hh"
				  ,username:"石满"*/
		  		  }
		  var message =JSON.stringify(obj);
		  ws.send(message);
		} 
         
		
      //接收到消息的回调方法  
      ws.onmessage = function(e) {
		//console.log("接收到的消息");
		//console.log(e);
      	 var hh = e.data;
      	var res = JSON.parse(hh);
      	layui.layim.getMessage(res);
      	
      }  
         
      //连接关闭的回调方法  
      ws.onclose = function(){  
          console.log("ws断开连接！");
      }  
         
      //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
      window.onbeforeunload = function(){  
          ws.close();  
      }  
         
      //将消息显示在网页上  
      function setMessageInnerHTML(innerHTML){  
          document.getElementById('message').innerHTML += innerHTML + '<br/>';  
      }  
         
      //关闭连接  
      function closeWebSocket(){  
          ws.close();  
      }  
         
      //发送消息  
      function send(data){ 
      	if(data.to.type=='friend'){//发送私聊信息
      	 var id;
      	 if(data.mine.id==data.to.id){
      	     id =data.to.fromid;
      	 }else if(data.mine.id==data.to.fromid){
      	 	 id = data.to.id;
      	 }else{
      	     id = data.to.id;
      	 } 
          var obj={
		  		   username: data.mine.username //消息来源用户名
				  ,avatar: data.mine.avatar //消息来源用户头像
				  ,id: id //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
				  ,type: data.to.type //聊天窗口来源类型，从发送消息传递的to里面获取
				  ,content: data.mine.content //消息内容
				  ,cid: 0 //消息id，可不传。除非你要对消息进行一些操作（如撤回）
				  ,mine: false //是否我发送的消息，如果为true，则会显示在右方
				  ,fromid:data.mine.id //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
				  ,timestamp: new Date().getTime() //服务端动态时间戳
		  		  }
		  var message =JSON.stringify(obj);
		  ws.send(message);
      	}else{//发送群组信息
      		   var id = data.to.id;
      	     var memberssum ="";
      	     var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "getTolkGroupList.do"; //请求的网址  
			 $(function(){$.ajax({  
	                        type:"POST",  
	                        url:url,  
	                        data:{'id':1},  
	                        async:false,//异步  
	                        dataType:"json",  
	                        success: function(data){
		                        if(data!=''&&data!=null){
		                        	 memberssum = memberssum + data[0].USERID;
		                             for(var i=1;i<data.length;i++){
		                                    memberssum = memberssum +"."+data[i].USERID;
		                             }
		                           }else{
		                           layer.msg('获取信息失败');
		                      }
	                      }
				     });
			 });
      	   
          var obj={
		  		   username: data.mine.username //消息来源用户名
				  ,avatar: data.mine.avatar //消息来源用户头像
				  ,id: id //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
				  ,type: data.to.type //聊天窗口来源类型，从发送消息传递的to里面获取
				  ,content: data.mine.content //消息内容
				  ,cid: 0 //消息id，可不传。除非你要对消息进行一些操作（如撤回）
				  ,mine: false //是否我发送的消息，如果为true，则会显示在右方
				  ,fromid:data.mine.id //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
				  ,timestamp: new Date().getTime() //服务端动态时间戳
				  ,members:memberssum
				  ,mineid:data.mine.id
		  		  }
		  var message =JSON.stringify(obj);
		  ws.send(message);
      	}
      }  