<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  

  <title>开发者联盟</title>
  <link rel="shortcut icon" href="favicon.ico">
 
  <link rel="stylesheet" id="patternfly-adjusted-css" href="Login/Css/app.css"
  type="text/css" media="all">
  
  
  <link href="hAdmin/css/bootstrap.min.css" rel="stylesheet">
  <link href="hAdmin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
  <link href="hAdmin/css/animate.css" rel="stylesheet">
  <link href="hAdmin/css/style.css" rel="stylesheet">
  <link href="hAdmin/css/login.css" rel="stylesheet">
  <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
   </script>

  <script type="text/javascript" src="Login/Scripts/jquery.js"></script>

  <script type="text/javascript" src="Login/Scripts/bootstrap.min.js"></script>

  <style>
    #main article { border-bottom: none; }
	body{
		    font: 500 .875em PingFang SC,Lantinghei SC,Microsoft Yahei,Hiragino Sans GB,Microsoft Sans Serif,WenQuanYi Micro Hei,sans;
        background-color: #07040e;
	}
  #canvas {
                position: absolute;
    z-index: 10;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    cursor: none;
        }
        .content{
      position: absolute;
    z-index: 11;
    right: 0;
    left: 0;
    top: 0;
    bottom: 0;
}
.splash{
  position: relative;
  }
  </style>
</head>
<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"> 
<body class="home page page-id-194 page-template page-template-page-homepage page-template-page-homepage-php custom-background" ondragstart="window.event.returnValue=false" oncontextmenu="window.event.returnValue=false" onselectstart="event.returnValue=false">
  <header role="banner">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
          </button>
          <a class="navbar-brand" id="logo" title="HY-PHP" href=""> 开发者联盟</a>
        </div>
        <!-- end .navbar-header -->
        <div class="navbar-collapse collapse">
          <ul id="menu-primary" class="nav navbar-nav navbar-right">

            <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children dropdown">
              <a href="http://www.baidu.com" class="dropdown-toggle">百度 </a>
            </li>
			<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children dropdown">
              <a href="http://www.w3school.com.cn/tags/tag_header.asp" class="dropdown-toggle">W3School</a>
            </li>
			<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children dropdown">
              <a href="http://blog.csdn.net/gao_chun/article/details/47263063" class="dropdown-toggle"> android开发举例 </a>
            </li>
			<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children dropdown">
              <a href="http://www.runoob.com/java/java-tutorial.html" class="dropdown-toggle"> java开发网站</a>
            </li>
          </ul>
        </div>
        <!-- end .navbar-collapse -->
      </div>
      <!-- end .container -->
    </nav>
    <!-- end .navbar -->
  </header>
  <!-- end header -->
  <div class="jumbotron">
    <div class="container">
      <div class="splash">
        <div class="content">
          <img src="Login/Picture/3.png" alt="PatternFly logo" class="wow fadeInDown animated"
          style="visibility: visible; animation-name: fadeInDown;">
		       <div class="signinpanel">
		         <div class="row">
		            <div class="col-sm-12">
		                <form id="form1" method="post" action="<%=basePath%>login" >
		                     <h4 class="no-margins">欢迎来到开发者联盟</h4> 
		                  <!--   <p class="m-t-md">登录到H+后台主题UI框架</p> -->
		                    <input type="text" name="userCode" class="form-control uname" placeholder="用户名" />
		                    <input type="password" name="userPassword" class="form-control pword m-b" placeholder="密码" />
		                    <!-- <a href="">忘记密码了？</a> -->
		                    <a onclick="repassword()">忘记密码了？</a> | <a onclick="register()">注册一个新账号</a>
		                    <button class="btn btn-success btn-block">登录</button>
		                </form>
		                
		                
		                <form id="form2" style="display:none;" method="post" action="<%=basePath%>repassword" >
		                     <h4 class="no-margins">欢迎来到开发者联盟</h4> 
		                    <input id="name1" type="text" name="userCode" class="form-control uname" placeholder="用户名" />
		                    <input id="email1" type="text" name="email" class="form-control uname" placeholder="邮箱" onblur="emailrule(this)"/>
		                    <div>
		                    <button id="button1" type="button" class="btn btn-w-m btn-success" style='float:left;' onclick="ficationCode()">免费获取验证码</button> 
		                    <input style='float:left' type="text" name="verificationCode" class="form-control pword m-b" placeholder="验证码" onclick="codeRight(this)"/>
		                    </div>
		                    <input id="password1" type="password" name="userPassword" class="form-control pword m-b" placeholder="新密码" />
		                    <input id="newpassword" type="password" name="newuserPassword" class="form-control pword m-b" placeholder="确认密码" onblur="psaawordrule1(this)" />
		                    <a onclick="reback()">返回</a> | <a onclick="register()">注册一个新账号</a>
		                    <button class="btn btn-success btn-block">登录</button>
		                </form>
		                
		                
		                <form id="form3" style="display:none;" method="post" action="<%=basePath%>register" >
		                     <h4 class="no-margins">欢迎来到开发者联盟</h4> 
		                    <input type="text" name="userCode" class="form-control uname" placeholder="用户名" />
		                    <input type="text" name="userName" class="form-control uname" placeholder="用户昵称" />
		                    <input type="text" name="email" class="form-control pword m-b" placeholder="邮箱" onblur="emailrule1(this)" />
		                    <input id="password2" type="password" name="userPassword" class="form-control pword m-b" placeholder="密码" />
		                    <input id="newpassword" type="password" name="newuserPassword" class="form-control pword m-b" placeholder="确认密码" onblur="psaawordrule2(this)" />
		                    <a onclick="reback()">返回</a> | <a onclick="repassword()">忘记密码</a>
		                    <button class="btn btn-success btn-block">注册</button>
		                </form>
		                
		                
		            </div>
		        </div>
		        <div class="signup-footer">
		            <div class="pull-left">
		                &copy; 开发者联盟
		            </div>
		        </div>
		    </div>
<!--           <h1 class="wow fadeIn animated" data-wow-delay="750ms" style="visibility: visible; animation-delay: 750ms; animation-name: fadeIn;">
                                   开发者联盟
          </h1> -->
<!--           <p class="description wow fadeIn animated" data-wow-delay="1250ms" style="visibility: visible; animation-delay: 1250ms; animation-name: fadeIn;">
            开发者联盟
          </p> -->
		 <!--  <div style=" position: fixed;width: 100%;bottom: 30px;box-sizing: border-box; left: 0;">开发者联盟工作室</div> -->
        </div>
      </div>
    </div>
  <canvas id="canvas" width="1659" height="425"></canvas>
  <!-- <div id="particles-js"></div> -->
  </div>


<!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>
    <script src="js/jquery.min.js?v=2.1.4"></script>

<script src="Login/Scripts/hovertreewelcome.js"></script>
<script type="text/javascript">
    var tempuserinfo = '${tempuser}';
    var tempusermessage = '${usermessage}';
    if(tempuserinfo!=null&&tempuserinfo!=''){
       layer.msg(tempuserinfo);
       tempuserinfo='';
    }
    
    if(tempusermessage!=null&&tempusermessage!=''){
       layer.msg(tempusermessage);
       tempusermessage='';
    }
    document.getElementById("button1").disabled = true;
    function repassword(){
        document.getElementById("form1").style.display='none';
        document.getElementById("form3").style.display='none';
        document.getElementById("form2").style.display='';
    }
   function register(){
        document.getElementById("form1").style.display='none';
        document.getElementById("form2").style.display='none';
        document.getElementById("form3").style.display='';
   }
  
  function reback(){
       document.getElementById("form1").style.display='';
       document.getElementById("form2").style.display='none';
       document.getElementById("form3").style.display='none';
  }
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
  
    function emailrule1(e){
  var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   var temp = e.value;
   if(!filter.test(temp)){
           layer.msg('您输入的邮件地址有误');
           }else{
           document.getElementById("button1").disabled = false;
           }
  }
  
    //获取验证码倒计时时间
    var countdown=60; 
	function settime() {
	var timer = window.setTimeout(function() { 
	settime(); 
	},1000);
	
	var val = document.getElementById("button1"); 
	if (countdown == 0) { 
	val.disabled = false;
	val.textContent="免费获取验证码";
	//当获取的验证码时间倒计时为0的时候 去除setTimeout()定时方法
	window.clearInterval(timer); 
	countdown = 60; 
	} else { 
	val.disabled = true;
	val.textContent="重新发送(" + countdown + ")"; 
	countdown--; 
	}
	}
  
  
  //获取邮箱中的验证码
  function ficationCode(){
   var email = document.getElementById("email1").value;
   var nameCode = document.getElementById("name1").value;
   var copyEmailperson ='';
   var secretEmailperson='';
   var sub='开发者联盟密码找回';
   settime();
   var basepath = document.getElementById('basepath').value; 
			 var url =  basepath + "/ficationCode"; //请求的网址  
			 $(function(){$.ajax(
			                   {  
			                        type:"POST",  
			                        url:url,  
			                        data:{'getEmailperson':email,'nameCode':nameCode,'sub':sub},  
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
  }
  
  function psaawordrule1(e){
    var password = document.getElementById("password1").value;
     if(password!=e.value){
       layer.msg('您输入的密码不一致');
     }else if(e.value==''||e.value==null){
       layer.msg('您输入的密码为空');
     }
  }
  
   function psaawordrule2(e){
    var password = document.getElementById("password2").value;
     if(password!=e.value){
       layer.msg('您输入的密码不一致');
     }else if(e.value==''||e.value==null){
       layer.msg('您输入的密码为空');
     }
  }


// particlesJS('particles-js',
//   {
//     "particles": {
//       "number": {
//         "value": 110,
//         "density": {
//           "enable": true,
//           "value_area": 800
//         }
//       },
//       "color": {
//         "value": "#ffffff"
//       },
//       "shape": {
//         "type": "circle",
//         "stroke": {
//           "width": 0,
//           "color": "#000000"
//         },
//         "polygon": {
//           "nb_sides": 5
//         },
//         "image": {
//           "src": "img/github.svg",
//           "width": 100,
//           "height": 100
//         }
//       },
//       "opacity": {
//         "value": 0.5,
//         "random": false,
//         "anim": {
//           "enable": false,
//           "speed": 1,
//           "opacity_min": 0.1,
//           "sync": false
//         }
//       },
//       "size": {
//         "value": 1,
//         "random": true,
//         "anim": {
//           "enable": false,
//           "speed": 20,
//           "size_min": 0.1,
//           "sync": false
//         }
//       },
//       "line_linked": {
//         "enable": true,
//         "distance": 40,
//         "color": "#fff",
//         "opacity": 1,
//         "width": 1
//       },
//       "move": {
//         "enable": true,
//         "speed": 3,
//         "direction": "none",
//         "random": false,
//         "straight": false,
//         "out_mode": "out",
//         "attract": {
//           "enable": false,
//           "rotateX": 600,
//           "rotateY": 1200
//         }
//       }
//     },
//     "interactivity": {
//       "detect_on": "canvas",
//       "events": {
//         "onhover": {
//           "enable": true,
//           "mode": "grab"
//         },
//         "onclick": {
//           "enable": true,
//           "mode": "push"
//         },
//         "resize": true
//       },
//       "modes": {
//         "grab": {
//           "distance": 120,
//           "line_linked": {
//             "opacity": 1
//           }
//         },
//         "bubble": {
//           "distance": 400,
//           "size": 40,
//           "duration": 2,
//           "opacity": 8,
//           "speed": 3
//         },
//         "repulse": {
//           "distance": 300
//         },
//         "push": {
//           "particles_nb": 4
//         },
//         "remove": {
//           "particles_nb": 2
//         }
//       }
//     },
//     "retina_detect": true,
//     "config_demo": {
//       "hide_card": false,
//       "background_color": "#b61924",
//       "background_image": "",
//       "background_position": "50% 50%",
//       "background_repeat": "no-repeat",
//       "background_size": "cover"
//     }
//   }

// );


        ; (function (window) {

            var ctx,
                hue,
                logo,
                form,
                buffer,
                target = {},
                tendrils = [],
                settings = {};

            settings.debug = true;
            settings.friction = 0.5;
            settings.trails = 20;
            settings.size = 50;
            settings.dampening = 0.25;
            settings.tension = 0.98;

            Math.TWO_PI = Math.PI * 2;

            // ========================================================================================
            // Oscillator 何问起
            // ----------------------------------------------------------------------------------------

            function Oscillator(options) {
                this.init(options || {});
            }

            Oscillator.prototype = (function () {

                var value = 0;

                return {

                    init: function (options) {
                        this.phase = options.phase || 0;
                        this.offset = options.offset || 0;
                        this.frequency = options.frequency || 0.001;
                        this.amplitude = options.amplitude || 1;
                    },

                    update: function () {
                        this.phase += this.frequency;
                        value = this.offset + Math.sin(this.phase) * this.amplitude;
                        return value;
                    },

                    value: function () {
                        return value;
                    }
                };

            })();

            // ========================================================================================
            // Tendril hovertree.com
            // ----------------------------------------------------------------------------------------

            function Tendril(options) {
                this.init(options || {});
            }

            Tendril.prototype = (function () {

                function Node() {
                    this.x = 0;
                    this.y = 0;
                    this.vy = 0;
                    this.vx = 0;
                }

                return {

                    init: function (options) {

                        this.spring = options.spring + (Math.random() * 0.1) - 0.05;
                        this.friction = settings.friction + (Math.random() * 0.01) - 0.005;
                        this.nodes = [];

                        for (var i = 0, node; i < settings.size; i++) {

                            node = new Node();
                            node.x = target.x;
                            node.y = target.y;

                            this.nodes.push(node);
                        }
                    },

                    update: function () {

                        var spring = this.spring,
                            node = this.nodes[0];

                        node.vx += (target.x - node.x) * spring;
                        node.vy += (target.y - node.y) * spring;

                        for (var prev, i = 0, n = this.nodes.length; i < n; i++) {

                            node = this.nodes[i];

                            if (i > 0) {

                                prev = this.nodes[i - 1];

                                node.vx += (prev.x - node.x) * spring;
                                node.vy += (prev.y - node.y) * spring;
                                node.vx += prev.vx * settings.dampening;
                                node.vy += prev.vy * settings.dampening;
                            }

                            node.vx *= this.friction;
                            node.vy *= this.friction;
                            node.x += node.vx;
                            node.y += node.vy;

                            spring *= settings.tension;
                        }
                    },

                    draw: function () {

                        var x = this.nodes[0].x,
                            y = this.nodes[0].y,
                            a, b;

                        ctx.beginPath();
                        ctx.moveTo(x, y);

                        for (var i = 1, n = this.nodes.length - 2; i < n; i++) {

                            a = this.nodes[i];
                            b = this.nodes[i + 1];
                            x = (a.x + b.x) * 0.5;
                            y = (a.y + b.y) * 0.5;

                            ctx.quadraticCurveTo(a.x, a.y, x, y);
                        }

                        a = this.nodes[i];
                        b = this.nodes[i + 1];

                        ctx.quadraticCurveTo(a.x, a.y, b.x, b.y);
                        ctx.stroke();
                        ctx.closePath();
                    }
                };

            })();

            // ----------------------------------------------------------------------------------------

            function init(event) {

                document.removeEventListener('mousemove', init);
                document.removeEventListener('touchstart', init);

                document.addEventListener('mousemove', mousemove);
                document.addEventListener('touchmove', mousemove);
                document.addEventListener('touchstart', touchstart);

                mousemove(event);
                reset();
                loop();
            }

            function reset() {

                tendrils = [];

                for (var i = 0; i < settings.trails; i++) {

                    tendrils.push(new Tendril({
                        spring: 0.45 + 0.025 * (i / settings.trails)
                    }));
                }
            }

            function loop() {

                if (!ctx.running) return;

                ctx.globalCompositeOperation = 'source-over';
                ctx.fillStyle = 'rgba(8,5,16,0.4)';
                ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
                ctx.globalCompositeOperation = 'lighter';
                ctx.strokeStyle = 'hsla(' + Math.round(hue.update()) + ',90%,50%,0.25)';
                ctx.lineWidth = 1;

                if (ctx.frame % 60 == 0) {
                    console.log(hue.update(), Math.round(hue.update()), hue.phase, hue.offset, hue.frequency, hue.amplitude);
                }

                for (var i = 0, tendril; i < settings.trails; i++) {
                    tendril = tendrils[i];
                    tendril.update();
                    tendril.draw();
                }

                ctx.frame++;
                ctx.stats.update();
                requestAnimFrame(loop);
            }

            function resize() {
                ctx.canvas.width = window.innerWidth;
                ctx.canvas.height = window.innerHeight;
            }

            function start() {
                if (!ctx.running) {
                    ctx.running = true;
                    loop();
                }
            }

            function stop() {
                ctx.running = false;
            }

            function mousemove(event) {
                if (event.touches) {
                    target.x = event.touches[0].pageX;
                    target.y = event.touches[0].pageY;
                } else {
                    target.x = event.clientX
                    target.y = event.clientY;
                }
                event.preventDefault();
            }

            function touchstart(event) {
                if (event.touches.length == 1) {
                    target.x = event.touches[0].pageX;
                    target.y = event.touches[0].pageY;
                }
            }

            function keyup(event) {

                switch (event.keyCode) {
                    case 32:
                        save();
                        break;
                    default:
                        // console.log(event.keyCode); hovertree.com
                }
            }

            function letters(id) {

                var el = document.getElementById(id),
                    letters = el.innerHTML.replace('&amp;', '&').split(''),
                    heading = '';

                for (var i = 0, n = letters.length, letter; i < n; i++) {
                    letter = letters[i].replace('&', '&amp');
                    heading += letter.trim() ? '<span class="letter-' + i + '">' + letter + '</span>' : '&nbsp;';
                }

                el.innerHTML = heading;
                setTimeout(function () {
                    el.className = 'transition-in';
                }, (Math.random() * 500) + 500);
            }

            function save() {

                if (!buffer) {

                    buffer = document.createElement('canvas');
                    buffer.width = screen.availWidth;
                    buffer.height = screen.availHeight;
                    buffer.ctx = buffer.getContext('2d');

                    form = document.createElement('form');
                    form.method = 'post';
                    form.input = document.createElement('input');
                    form.input.type = 'hidden';
                    form.input.name = 'data';
                    form.appendChild(form.input);

                    document.body.appendChild(form);
                }

                buffer.ctx.fillStyle = 'rgba(8,5,16)';
                buffer.ctx.fillRect(0, 0, buffer.width, buffer.height);

                buffer.ctx.drawImage(canvas,
                    Math.round(buffer.width / 2 - canvas.width / 2),
                    Math.round(buffer.height / 2 - canvas.height / 2)
                );

                buffer.ctx.drawImage(logo,
                    Math.round(buffer.width / 2 - logo.width / 4),
                    Math.round(buffer.height / 2 - logo.height / 4),
                    logo.width / 2,
                    logo.height / 2
                );

                window.open(buffer.toDataURL(), 'wallpaper', 'top=0,left=0,width=' + buffer.width + ',height=' + buffer.height);

                // form.input.value = buffer.toDataURL().substr(22);
                // form.submit(); hovertree.com
            }

            window.requestAnimFrame = (function () {
                return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function (fn) { window.setTimeout(fn, 1000 / 60) };
            })();

            window.onload = function () {

                ctx = document.getElementById('canvas').getContext('2d');
                ctx.stats = new Stats();
                ctx.running = true;
                ctx.frame = 1;

               

                hue = new Oscillator({
                    phase: Math.random() * Math.TWO_PI,
                    amplitude: 85,
                    frequency: 0.0015,
                    offset: 285
                });

             

                document.addEventListener('mousemove', init);
                document.addEventListener('touchstart', init);
                document.body.addEventListener('orientationchange', resize);
                window.addEventListener('resize', resize);
                window.addEventListener('keyup', keyup);
                window.addEventListener('focus', start);
                window.addEventListener('blur', stop);

                resize();

                if (window.DEBUG) {

                    var gui = new dat.GUI();

                    // gui.add(settings, 'debug');
                    settings.gui.add(settings, 'trails', 1, 30).onChange(reset);
                    settings.gui.add(settings, 'size', 25, 75).onFinishChange(reset);
                    settings.gui.add(settings, 'friction', 0.45, 0.55).onFinishChange(reset);
                    settings.gui.add(settings, 'dampening', 0.01, 0.4).onFinishChange(reset);
                    settings.gui.add(settings, 'tension', 0.95, 0.999).onFinishChange(reset);

                    document.body.appendChild(ctx.stats.domElement);
                }
            };

        })(window);

    </script>



</body>
</html>
