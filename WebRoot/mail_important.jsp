<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    
    <!-- 自定义邮件帮助js -->
    <script src="tool/js/emailTool.js"></script>
    
    <!-- 加载弹出层样式的相关js -->
    <script src="layer-v1.8.5/layer/layer.min.js"></script>
    <title> - 重要邮件箱</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">  <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">



   <!-- <link href="tipped_css/demo.css" rel="stylesheet" type="text/css" media="all" />

		[if LTE IE 8]>
			<link href="http://formstone.it/css/demo.ie.css" rel="stylesheet" type="text/css" media="all" />
		<![endif]

		<script src="tipped_js/demo.js"></script>

		<link href="tipped_css/jquery.fs.tipper.css" rel="stylesheet" type="text/css" media="all" />
		<script src="tipped_js/jquery.fs.tipper.js"></script>

		<style>
			.tipped { background: #999; clear: both; float: none; display: block; margin: 20px auto; width: 50%; }
			.tipped:hover { background: #777; }
		</style>
 -->
		<!-- <script>
			$(document).ready(function() {
				$(".tipped").tipper();
			});
        </script> -->
</head>

<input id="basepath" type=hidden name="basepath" value="<%=basePath%>"> 
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

                    <div class="pull-right mail-search">
                        <div class="input-group">
                            <input id="searchTitle" type="text" class="form-control input-sm" name="search" placeholder="搜索邮件标题">
                            <div class="input-group-btn">
                                <button onclick="searchTitleAndType()" class="btn btn-sm btn-primary">搜索 </button>
                            </div>
                        </div>
                    </div>
                    
                    <h2 id ="emailnumberandnoread"> 收件箱 (16)</h2>
                    <div class="mail-tools tooltip-demo m-t-md">
                        <div class="btn-group pull-right">
                            <!-- <button class="btn btn-white btn-sm " onclick="pre()" ><i class="fa fa-arrow-left"></i>
                            </button>
                            <button class="btn btn-white btn-sm " onclick="next()" ><i class="fa fa-arrow-right"></i>
                            </button> -->
                              <button id ="pre"  type="button" class="btn btn-white"  onclick="pre()"><i class="fa fa-chevron-left"></i>
                                </button>
                                
                                <button id="page1" class="btn btn-white" style="display:'';"></button>
                                <button id="page2" class="btn btn-white" style="display:'';"></button>
                                <button id="page3" class="btn btn-white" style="display:'';"></button>
                                <button id="page4" class="btn btn-white" style="display:'';"></button>
                                <button id="page5" class="btn btn-white" style="display:'';"></button>
                                
                                <button id ="next" type="button" class="btn btn-white" onclick="next()"><i class="fa fa-chevron-right"></i>
                                </button>
                                <select id="emailnumber" class="input-sm inline" onchange="pageChange()">
                                    <option value="0">5</option>
                                    <option value="1">10</option>
                                    <option value="2">15</option>
                                    <option value="3">20</option>
                                </select>
                            
                        </div>
                       
                       
                     <!--   <div class="btn-group">
                                <button type="button" class="btn btn-white"><i class="fa fa-chevron-left"></i>
                                </button>
                                <button class="btn btn-white">1</button>
                                <button class="btn btn-white  active">2</button>
                                <button class="btn btn-white">3</button>
                                <button class="btn btn-white">4</button>
                                <button type="button" class="btn btn-white"><i class="fa fa-chevron-right"></i>
                                </button>
                            </div> -->
                       
                        
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="reload()" title="刷新邮件列表"><i class="fa fa-refresh"></i> 刷新</button>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为已读" onclick="tabRead()"><i class="fa fa-eye"></i>
                        </button>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为重要" onclick="tabImport()"><i class="fa fa-exclamation"></i>
                        </button>
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为垃圾邮件" onclick="tabFlotsam()"><i class="fa fa-trash-o"></i>
                        </button>

       
                    </div>
                </div>
                <div class="mail-box">

                    <table class="table table-hover table-mail">
                        <thead> 
                    		<tr>
                    			<th class="check-mail" style="visibility:hidden;" >
	                               <input type="checkbox" class="i-checks" id="box">
	                             </th>
                    			<th  class="sort-column mail-ontact" style="cursor:pointer;" onclick="sender()">发件人<i id="sender" class="fa fa-sort"><i></th>
                    			<th  class="sort-column  text-left " style="cursor:pointer;" onclick="emailStatus()">状态<i id="emailStatus" class="fa fa-sort"><i></th>
                    			<th  class="sort-column mail-subject" style="cursor:pointer;" onclick="titlename()">标题<i id="titlename" class="fa fa-sort"><i></th>
                    			<th  class="sort-column  text-left" style="cursor:pointer;"  onclick="isupload()">附件<i id="isupload" class="fa fa-sort"><i></th>
                    			<th  class="sort-column text-right mail-date" style="cursor:pointer;" onclick="thetime()">时间<i id="thetime" class="fa fa-sort"><i></th>
                    		</tr>
                    	</thead>
                        <tbody>
                           <!-- <tr class="unread">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">支付宝</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">支付宝提醒</a>
                                </td>
                                <td class=""><i class="fa fa-paperclip"></i>
                                </td>
                                <td class="text-right mail-date">昨天 10:20</td>
                            </tr>
                             <tr class="unread">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks" checked>
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">Amaze UI</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">Amaze UI Beta2 发布</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">上午10:57</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">WordPress</a> <span class="label label-warning pull-right">验证邮件</span>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">wp-user-frontend-pro v2.1.9</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">上午9:21</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">史上最全！淘宝双11红包疯抢攻略！</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">中午12:24</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a> <span class="label label-danger pull-right">AD</span>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">亲，双11来啦！帮你挑货，还送你4999元红包！仅此一次！</a>
                                </td>
                                <td class=""><i class="fa fa-paperclip"></i>
                                </td>
                                <td class="text-right mail-date">上午6:48</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">支付宝</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">支付宝提醒</a>
                                </td>
                                <td class=""><i class="fa fa-paperclip"></i>
                                </td>
                                <td class="text-right mail-date">昨天 10:20</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">Amaze UI</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">Amaze UI Beta2 发布</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">上午10:57</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">WordPress</a> <span class="label label-warning pull-right">验证邮件</span>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">wp-user-frontend-pro v2.1.9</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">上午9:21</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">史上最全！淘宝双11红包疯抢攻略！</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">中午12:24</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a> <span class="label label-danger pull-right">AD</span>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">亲，双11来啦！帮你挑货，还送你4999元红包！仅此一次！</a>
                                </td>
                                <td class=""><i class="fa fa-paperclip"></i>
                                </td>
                                <td class="text-right mail-date">上午6:48</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">支付宝</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">支付宝提醒</a>
                                </td>
                                <td class=""><i class="fa fa-paperclip"></i>
                                </td>
                                <td class="text-right mail-date">昨天 10:20</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">Amaze UI</a>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">Amaze UI Beta2 发布</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">上午10:57</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="mail_detail.html">WordPress</a> <span class="label label-warning pull-right">验证邮件</span>
                                </td>
                                <td class="mail-subject"><a href="mail_detail.html">wp-user-frontend-pro v2.1.9</a>
                                </td>
                                <td class=""></td>
                                <td class="text-right mail-date">上午9:21</td>
                            </tr>
                            <tr class="read">
                            
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                
                                <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a>
                                </td>
                                
                                <td class="mail-subject"><a href="mail_detail.html">史上最全！淘宝双11红包疯抢攻略！</a>
                                </td>
                                
                                <td class=""></td>
                                
                                <td class="text-right mail-date">中午12:24</td>
                            </tr>
                            <tr class="read">
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                
                                <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a> <span class="label label-danger pull-right">AD</span>
                                </td>
                                
                                
                                <td class="mail-subject"><a href="mail_detail.html">亲，双11来啦！帮你挑货，还送你4999元红包！仅此一次！</a>
                                </td>
                                
                                <td class=""><i class="fa fa-paperclip"></i>
                                </td>
                                
                                <td class="text-right mail-date">上午6:48</td>
                                
                            </tr> -->
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
    </div>


<!--     全局js
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    自定义js
    <script src="js/content.js?v=1.0.0"></script>


    iCheck
    <script src="js/plugins/iCheck/icheck.min.js"></script> -->
    <script type="text/javascript">
        var page ;
        var pagenumber;
        var total;
        var email ;
        var type;
        var selectNumber;//表示每次查询邮件展示在前台页面中的条数
        debugger;
        $(document).ready(function () {
        	/* $(".tipped").tipper(); */
             $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            }); 
            pagenumber = $('#emailnumber option:selected').text();//获取每页展示邮件信息的数量
            console.log(pagenumber);
            page = 1;
            type ='5';
	        email = '${userEmail}';
	        queryEmailtype(email,page,pagenumber,type);
	        // getNOTRead(document.getElementById('basepath').value);//获取未读邮件数量
	        getTotalbytype(document.getElementById('basepath').value,type);//获取邮件总数
	        document.getElementById("pre").disabled="disabled"; //初始化刚进入该界面的时候“上一页按钮是不可以点击的”
        });
        
        function queryEmailtype(email,pageNumber,pageSize,type){
            var basepath = document.getElementById('basepath').value; 
            var url =  basepath + "/EamilListByType.do"; //请求的网址  
            var reqParams = {'email':email, 'pageNumber':pageNumber,'pageSize':pageSize,'type':type};//请求数据
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
						         $("table tbody").empty();//清空表格内容  
						         if (dataList.length > 0 ) {
						                    selectNumber = dataList.length;
						                    for(var i=0;i<dataList.length;i++){
						                    if(dataList[i].EMAILSTATUS==1){
						                         if(dataList[i].ISUPLOAD=='true'){
						                              /* var temp = "<tr class='read'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'  ><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
 					                                var temp = "<tr class='read'> <td class='check-mail'> <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1'  class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>已读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
 					                                 $(temp).appendTo("table tbody");
						                         }else{
						                           /* var temp = "<tr class='read'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'  ><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
 					                                var temp = "<tr class='read'> <td class='check-mail'> <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1'  class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>已读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
 					                                 $(temp).appendTo("table tbody");
						                         }
 					                    }else{
 					                            if(dataList[i].ISUPLOAD=='true'){
 					                               /* var temp = "<tr class='unread'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
						                          var temp = "<tr class='unread'> <td class='check-mail'>  <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1' class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>未读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
						                          $(temp).appendTo("table tbody");
 					                            }else{
 					                               /* var temp = "<tr class='unread'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
						                          var temp = "<tr class='unread'> <td class='check-mail'>  <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1' class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>未读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
						                          $(temp).appendTo("table tbody");
 					                            }
						                    } 
						                    }
						                    } else {                                  
						                          $("table tbody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');  
						                    }  
			                    }else{  
			                         // alert(data.errorMsg);
			                          layer.alert(data.errorMsg);  
			                            }  
			                      },  
			                        error: function(e){  
			                           //alert("查询失败:" + e);
			                           layer.msg('查询失败');   
			                        }  
			                    });  
			                    $('.i-checks').iCheck({
					                checkboxClass: 'icheckbox_square-green',
					                radioClass: 'iradio_square-green',
					            });
			               });
        }
    
    
   //动态加载js、css 等文件     
   function loadjscssfile(filename, filetype) {
    if (filetype == "js") {
        var fileref = document.createElement('script');
        fileref.setAttribute("type", "text/javascript");
        fileref.setAttribute("src", filename);
    } else if (filetype == "css") {
 
        var fileref = document.createElement('link');
        fileref.setAttribute("rel", "stylesheet");
        fileref.setAttribute("type", "text/css");
        fileref.setAttribute("href", filename);
    }
    if (typeof fileref != "undefined") {
        document.getElementsByTagName("head")[0].appendChild(fileref);
    }
 
}

/* 
  function mOver(ele){  //当鼠标悬停在这上面时
      var cla = ele.className;
      if(cla.indexOf("checked")!=-1){
       ele.className = cla+ " hover";
      }else{
      ele.className = "icheckbox_square-green hover";
      }
      //ele.innerHTML = "谢谢";  
    }  
    function mOut(ele){  //当鼠标离开在这上面时
      var cla = ele.className;
      if(cla.indexOf("checked")!=-1){
       ele.className = "icheckbox_square-green checked";
      }else{
      ele.className = "icheckbox_square-green";
      }
      //ele.innerHTML = "把鼠标放在上面";  
    }  
    
    function mDown(ele){ 
     var cla = ele.className;
      if(cla.indexOf("checked")!=-1){
       ele.className = "icheckbox_square-green";
      }else{
      ele.className = "icheckbox_square-green checked";
      } 
     // ele.innerHTML = "鼠标已按下";  
     // ele.style.backgroundColor = "blue"; 
    }   */
    
    //上一页
    function pre(){
     if(page<=1){
      document.getElementById("pre").disabled="disabled";
     }else{
       if(document.getElementById('searchTitle').value!=''&&document.getElementById('searchTitle').value!=null){
          document.getElementById("next").disabled=""; 
          page = page-1;
          searchTitleAndType(page);
          if(page>=4){
	        $("#page1").text(page-3);
	        $("#page2").text(page-2);
	        $("#page3").text(page-1);
	        $("#page4").text(page); 
	           document.getElementById("page4").className="btn btn-white active";
	            activeNumber(4);
	       }else{
	       debugger;
	       document.getElementById("page"+page).className="btn btn-white active";
	       activeNumber(page);
	       }
       }else{
       document.getElementById("next").disabled=""; 
       page = page-1;
       queryEmailtype(email,page,pagenumber,type);
       if(page>=4){
        $("#page1").text(page-3);
        $("#page2").text(page-2);
        $("#page3").text(page-1);
        $("#page4").text(page); 
           document.getElementById("page4").className="btn btn-white active";
            activeNumber(4);
       }else{
       debugger;
       document.getElementById("page"+page).className="btn btn-white active";
       activeNumber(page);
       }
       }
     }
    }
    //下一页
   function next(){
     if(page>total/pagenumber){
     document.getElementById("next").disabled="disabled";
     }else{
       if(document.getElementById('searchTitle').value!=''&&document.getElementById('searchTitle').value!=null){
          document.getElementById("pre").disabled="";
          page = page+1;
          searchTitleAndType(page);
           if(page>4){
	        $("#page1").text(page-3);
	        $("#page2").text(page-2);
	        $("#page3").text(page-1);
	        $("#page4").text(page); 
	        document.getElementById("page4").className="btn btn-white active";
	        activeNumber(4);
	       }else{
	       document.getElementById("page"+page).className="btn btn-white active";
	       activeNumber(page);
	       }
       }else{
       document.getElementById("pre").disabled="";
       page = page+1;
       queryEmailtype(email,page,pagenumber,type);
       if(page>4){
        $("#page1").text(page-3);
        $("#page2").text(page-2);
        $("#page3").text(page-1);
        $("#page4").text(page); 
        document.getElementById("page4").className="btn btn-white active";
        activeNumber(4);
       }else{
       document.getElementById("page"+page).className="btn btn-white active";
       activeNumber(page);
       }
       }
     }
    }
    //修改标签页的标识状态
    function activeNumber(page){
       for(var i=1;i<6;i++){
          if(i!=page){
           document.getElementById("page"+i).className="btn btn-white";
          }
       }
    }
    
    function sender(){ //按照发送邮件人查询
        document.getElementById("emailStatus").className = "fa fa-sort";
        document.getElementById("titlename").className = "fa fa-sort";
        document.getElementById("isupload").className = "fa fa-sort";
        document.getElementById("thetime").className = "fa fa-sort";
       var cla = document.getElementById("sender").className;
       if(cla == 'fa fa-sort'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'sender','asc',type)
          document.getElementById("sender").className = "fa fa-sort-up";
       }else if(cla == 'fa fa-sort-up'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'sender','desc',type)
          document.getElementById("sender").className = "fa fa-sort-down";
       }else if(cla == 'fa fa-sort-down'){
          queryEmailtype(email,page,pagenumber,type);
          document.getElementById("sender").className = "fa fa-sort";
       }
    }
    
    function emailStatus(){ //按照邮件状态查询
        document.getElementById("sender").className = "fa fa-sort";
        document.getElementById("titlename").className = "fa fa-sort";
        document.getElementById("isupload").className = "fa fa-sort";
        document.getElementById("thetime").className = "fa fa-sort";
        
       var cla = document.getElementById("emailStatus").className;
       if(cla == 'fa fa-sort'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'emailStatus','asc',type)
          document.getElementById("emailStatus").className = "fa fa-sort-up";
       }else if(cla == 'fa fa-sort-up'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'emailStatus','desc',type)
          document.getElementById("emailStatus").className = "fa fa-sort-down";
       }else if(cla == 'fa fa-sort-down'){
          queryEmailtype(email,page,pagenumber,type);
          document.getElementById("emailStatus").className = "fa fa-sort";
       }
    }
    
    function titlename(){ //按照邮件标题查询
        document.getElementById("sender").className = "fa fa-sort";
        document.getElementById("emailStatus").className = "fa fa-sort";
        document.getElementById("isupload").className = "fa fa-sort";
        document.getElementById("thetime").className = "fa fa-sort";
        
       var cla = document.getElementById("titlename").className;
       if(cla == 'fa fa-sort'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'title','asc',type)
          document.getElementById("titlename").className = "fa fa-sort-up";
       }else if(cla == 'fa fa-sort-up'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'title','desc',type)
          document.getElementById("titlename").className = "fa fa-sort-down";
       }else if(cla == 'fa fa-sort-down'){
          queryEmailtype(email,page,pagenumber,type);
          document.getElementById("titlename").className = "fa fa-sort";
       }
    }
    
    function isupload(){ //按照邮件标题查询
        document.getElementById("sender").className = "fa fa-sort";
        document.getElementById("emailStatus").className = "fa fa-sort";
        document.getElementById("titlename").className = "fa fa-sort";
        document.getElementById("thetime").className = "fa fa-sort";
        
       var cla = document.getElementById("isupload").className;
       if(cla == 'fa fa-sort'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'isupload','asc',type)
          document.getElementById("isupload").className = "fa fa-sort-up";
       }else if(cla == 'fa fa-sort-up'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'isupload','desc',type)
          document.getElementById("isupload").className = "fa fa-sort-down";
       }else if(cla == 'fa fa-sort-down'){
          queryEmailtype(email,page,pagenumber,type);
          document.getElementById("isupload").className = "fa fa-sort";
       }
    }
    
    
    function thetime(){ //按照邮件标题查询
        document.getElementById("sender").className = "fa fa-sort";
        document.getElementById("emailStatus").className = "fa fa-sort";
        document.getElementById("titlename").className = "fa fa-sort";
        document.getElementById("isupload").className = "fa fa-sort";
        
       var cla = document.getElementById("thetime").className;
       if(cla == 'fa fa-sort'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'thetime','asc',type)
          document.getElementById("thetime").className = "fa fa-sort-up";
       }else if(cla == 'fa fa-sort-up'){
          queryEmailByTermAndType('${userEmail}',page,pagenumber,'thetime','desc',type)
          document.getElementById("thetime").className = "fa fa-sort-down";
       }else if(cla == 'fa fa-sort-down'){
          queryEmailtype(email,page,pagenumber,type);
          document.getElementById("thetime").className = "fa fa-sort";
       }
    }
    
    
    /*
    * 通过条件查询邮件信息
    */
    function queryEmailByTermAndType(email,pageNumber,pageSize,term,sort,type){
            var basepath = document.getElementById('basepath').value; 
            var url =  basepath + "/EamilListByTermAndType.do"; //请求的网址  
            var reqParams = {'email':email, 'pageNumber':pageNumber,'pageSize':pageSize,'term':term,'sort':sort,'type':type};//请求数据
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
						         $("table tbody").empty();//清空表格内容  
						         if (dataList.length > 0 ) {
						                    selectNumber = dataList.length;
						                    for(var i=0;i<dataList.length;i++){
						                    debugger;
						                    if(dataList[i].EMAILSTATUS==1){
						                      if(dataList[i].ISUPLOAD=='true'){
						                              /* var temp = "<tr class='read'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'  ><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
 					                                var temp = "<tr class='read'> <td class='check-mail'> <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1'  class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>已读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
 					                                 $(temp).appendTo("table tbody");
						                         }else{
						                           /* var temp = "<tr class='read'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'  ><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
 					                                var temp = "<tr class='read'> <td class='check-mail'> <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1'  class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>已读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
 					                                 $(temp).appendTo("table tbody");
						                         }
 					                    }else{
 					                              if(dataList[i].ISUPLOAD=='true'){
 					                               /* var temp = "<tr class='unread'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
						                          var temp = "<tr class='unread'> <td class='check-mail'>  <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1' class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>未读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
						                          $(temp).appendTo("table tbody");
 					                            }else{
 					                               /* var temp = "<tr class='unread'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
						                          var temp = "<tr class='unread'> <td class='check-mail'>  <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1' class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>未读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
						                          $(temp).appendTo("table tbody");
 					                            }
						                    } 
						                    }
						                    } else {                                  
						                          $("table tbody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');  
						                    }  
			                    }else{  
			                          //alert(data.errorMsg);  
			                          layer.alert(data.errorMsg);
			                            }  
			                      },  
			                        error: function(e){  
			                           //alert("查询失败:" + e);  
			                           layer.msg('查询失败'); 
			                        }  
			                    });  
			                    $('.i-checks').iCheck({
					                checkboxClass: 'icheckbox_square-green',
					                radioClass: 'iradio_square-green',
					            });
			               });
        }
        
        
        
        function pageChange(){ //当改变邮件每页展示数量后
          debugger;
          page = 1;
          pagenumber = $('#emailnumber option:selected').text();//获取每页展示邮件信息的数量
          queryEmailtype(email,page,pagenumber,type);
          getTotalbytype(document.getElementById('basepath').value,type);//获取邮件总数
          document.getElementById('searchTitle').value='';
        }
        
            
    //根据标题修改查询邮件数据
    function searchTitleAndType(searchpage){
            var basepath = document.getElementById('basepath').value; 
            var url =  basepath + "/EamilListByTitleAndType.do"; //请求的网址  
            var title = document.getElementById('searchTitle').value;
            var temppage;
            if(searchpage==''||searchpage==null){
               temppage = 1;
            }else{
               temppage = searchpage;
            } 
            var reqParams = {'email':email, 'pageNumber':temppage,'pageSize':pagenumber,'title':title,'type':type};//请求数据
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
                                 total =  data.total;
						         var dataList = data.dataList;  
						         $("table tbody").empty();//清空表格内容  
						         if (dataList.length > 0 ) {
						                    selectNumber = dataList.length;
						                    for(var i=0;i<dataList.length;i++){
						                    if(dataList[i].EMAILSTATUS==1){
						                      if(dataList[i].ISUPLOAD=='true'){
						                              /* var temp = "<tr class='read'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'  ><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
 					                                var temp = "<tr class='read'> <td class='check-mail'> <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1'  class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>已读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
 					                                 $(temp).appendTo("table tbody");
						                         }else{
						                           /* var temp = "<tr class='read'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'  ><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
 					                                var temp = "<tr class='read'> <td class='check-mail'> <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1'  class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>已读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
 					                                 $(temp).appendTo("table tbody");
						                         }
 					                    }else{
 					                              if(dataList[i].ISUPLOAD=='true'){
 					                               /* var temp = "<tr class='unread'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
						                          var temp = "<tr class='unread'> <td class='check-mail'>  <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1' class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>未读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
						                          $(temp).appendTo("table tbody");
 					                            }else{
 					                               /* var temp = "<tr class='unread'> <td class='check-mail'><div class='icheckbox_square-green' style='position: relative;' onmouseover='mOver(this)' onmouseout='mOut(this)' onmousedown='mDown(this)'><input type='checkbox' class='i-checks' style='position: absolute; opacity: 0;'><ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td><td class='mail-ontact'><a href='mail_detail.html'>"+dataList[i].SENDER+"</a><span class='label label-warning pull-right'>验证邮件</span></td>"
						                            +"<td class='mail-subject'><a href='mail_detail.html'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa fa-paperclip'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME.date+"</td></tr>"; */
						                          var temp = "<tr class='unread'> <td class='check-mail'>  <input id='emailid"+i+"' value='"+dataList[i].EMAILID+"' style='display:none'><input type='checkbox' id='check"+i+"' name='check1' class='i-checks' ></td><td class='mail-ontact'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].SENDER+"</a></td><td><i class='fa fa fa-envelope-o btn-white'>未读</i></td>"
						                            +"<td class='mail-subject' style='width:30%;'><a href='mail_detail.jsp?emailid="+dataList[i].EMAILID+"'>"+dataList[i].TITLE+"</a></td><td class=''><i class='fa'></i></td><td class='text-right mail-date'>"+dataList[i].THETIME+"</td></tr>";
						                          $(temp).appendTo("table tbody");
 					                            }
						                    } 
						                    }
						                   //设置标签页数
			                              var temppagenumber = Math.ceil(dataList[0].TOTAL/($('#emailnumber option:selected').text())) ;
			                              if(temppagenumber==4){
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
			                              }else if(temppagenumber==1){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 document.getElementById("page2").style.display = "none";
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="disabled";
			                              }else if(temppagenumber==2){
			                                 $("#page1").text(1);
			                                 document.getElementById("page1").className="btn btn-white active";
			                                 $("#page2").text(2);
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 
			                                 document.getElementById("page1").style.display = "";
			                                 document.getElementById("page2").style.display = "";
			                                 
			                                 document.getElementById("next").disabled="";
			                              }else if(temppagenumber==3){
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
			                              }else if(temppagenumber>4){
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
			                              }else if(temppagenumber==0){
			                                 document.getElementById("page2").style.display = "none";
			                                 document.getElementById("page3").style.display = "none";
			                                 document.getElementById("page4").style.display = "none";
			                                 document.getElementById("page5").style.display = "none";
			                                 document.getElementById("page1").style.display = "none";
			                                 document.getElementById("next").disabled="disabled";
			                              }
						                    } else {                                  
						                          $("table tbody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');  
						                    }  
			                    }else{  
			                          //alert(data.errorMsg);
			                          layer.alert(data.errorMsg);
			                            }  
			                      },  
			                        error: function(e){  
			                           //alert("查询失败:" + e); 
			                           layer.msg('查询失败'); 
			                        }  
			                    });  
			                    $('.i-checks').iCheck({
					                checkboxClass: 'icheckbox_square-green',
					                radioClass: 'iradio_square-green',
					            });
			               });
    }
    
    //刷新按钮
    function reload(){
    debugger;
       $('#emailnumber option:selected').text('5');
        pagenumber = $('#emailnumber option:selected').text();//获取每页展示邮件信息的数量
        page = 1;
       	email = '${userEmail}';
       	queryEmailtype(email,page,pagenumber,type);
        getTotalbytype(document.getElementById('basepath').value,type);//获取邮件总数
       	//queryEmail(email,page,pagenumber);
       	//getNOTRead(document.getElementById('basepath').value);//获取未读邮件数量
       	//getTotal(document.getElementById('basepath').value);//获取邮件总数
       	document.getElementById("pre").disabled="disabled"; //初始化刚进入该界面的时候“上一页按钮是不可以点击的
       	document.getElementById('searchTitle').value='';
       	activeNumber(page);
    }
    
     //将选中的邮件信息标记为已读
     function tabRead(){
         tabchange("EMAILSTATUS",1,"邮件标记已读");
    }
    
    //将选中的邮件信息标记为重要
     function tabImport(){
         tabchange("EMAILTYPE",5,"邮件标记重要");
    }
    
    //将选中的邮件信息标记为垃圾邮件
   function tabFlotsam(){
         tabchange("EMAILTYPE",4,"邮件标记垃圾邮件");
    }
    
    </script>

</body>

</html>
