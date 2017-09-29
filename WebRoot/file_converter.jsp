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
    <title>文件转换器</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    
       <!-- jqgrid-->
    <link href="css/plugins/jqgrid/ui.jqgrid.css?0820" rel="stylesheet">
    
    
</head>
<body class="gray-bg">
    <div class="row">
        <div class="col-sm-12">
            <div class="wrapper wrapper-content">
                <div class="row animated fadeInRight">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="text-center float-e-margins p-md">
                                <span>文件转换样式：</span>
                                <a href="#" class="btn btn-xs btn-primary" id="lightVersion">浅色</a>
                                <a href="#" class="btn btn-xs btn-primary" id="darkVersion">深色</a>
                                <a href="#" class="btn btn-xs btn-primary" id="leftVersion">布局切换</a>
                            </div>
                            <div class="" id="ibox-content">

                                <div id="vertical-timeline" class="vertical-container light-timeline">
                                    <div class="vertical-timeline-block">
                                        <div class="vertical-timeline-icon navy-bg">
                                            <i class="fa fa-briefcase"></i>
                                        </div>

                                        <div class="vertical-timeline-content">
                                            <h2>待转换文件</h2>
                                            <p>请上传您要转换的文件,或者在文件管理器中选择您要转换的文件
                                            </p>
                                             <div class="pull-right tooltip-demo">
                                                 
                                                 <div class="btn-group">
					                                <button id ="filelisttype1" data-toggle="dropdown" class="btn btn-primary dropdown-toggle" >文件类型 <span class="caret"></span>
					                                </button>
					                                <ul class="dropdown-menu">
					                                    <li><a onclick="filetype1(this)">word</a>
					                                    </li>
					                                    <li><a onclick="filetype1(this)">excel</a>
					                                    </li>
					                                    <li><a onclick="filetype1(this)">txt</a>
					                                    </li>
					                                    <li><a onclick="filetype1(this)">html</a>
					                                    </li>
					                                </ul>
					                            </div>
                                             
						                        <button class="btn btn-success " type="button" onclick ="uploadfile()" ><i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">上传</span></button>
						                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="转换" onclick ="secretSend()"><i class="fa fa-pencil"></i>转换</button>
						                    </div>
						                    
						                      <div class="file-box">
					                            <div class="file">
					                                <a>
					                                    <span class="corner"></span>
					
					                                    <div class="icon">
					                                        <i class="img-responsive fa fa-film"></i>
					                                    </div>
					                                    <div id="file1" class="file-name">
					                                       <!--  Monica's birthday.mpg4 -->
					                                        <br/>
					                                        <small>添加时间：</small>
					                                    </div>
					                                </a>
					                                <div id='waitprogressdiv' class='progress'><div id='waitprogress' style='width: 0%;' class='progress-bar'></div></div>
					                            </div>
					                        </div>
						                    
						                    
                                            <span class="vertical-date">
                                                                                                                                         今天 <br>
                                        <small id="date1">2月3日</small>
                                    </span>
                                        </div>
                                    </div>

                                    <div class="vertical-timeline-block">
                                        <div class="vertical-timeline-icon blue-bg">
                                            <i class="fa fa-file-text"></i>
                                        </div>

                                        <div class="vertical-timeline-content">
                                            <h2>转换后的文件</h2>
                                            <p>您是否要保存该文件，若保存将存储到文件管理中</p>
                                            <div class="pull-right tooltip-demo">
						                       <!--  <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="转换文件类型" onclick ="savedraft()"><i class="fa fa-pencil"></i> 转换文件类型</button> -->
						                        
						                         <div class="btn-group">
					                                <button id ="filelisttype2" data-toggle="dropdown" class="btn btn-primary dropdown-toggle" >转换文件类型 <span class="caret"></span>
					                                </button>
					                                <ul class="dropdown-menu">
					                                    <li><a onclick="filetype2(this)">word</a>
					                                    </li>
					                                    <li><a onclick="filetype2(this)">excel</a>
					                                    </li>
					                                    <li><a onclick="filetype2(this)">txt</a>
					                                    </li>
					                                    <li><a onclick="filetype2(this)">html</a>
					                                    </li>
					                                </ul>
					                            </div>
					                            
						                        <button class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="下载"><i class="fa fa-download"></i> 下载</button>
						                    </div>
						                      <div class="file-box">
					                            <div class="file">
					                                <a>
					                                    <span class="corner"></span>
					
					                                    <div class="icon">
					                                        <i class="img-responsive fa fa-film"></i>
					                                    </div>
					                                    <div id="file2" class="file-name">
					                                       <!--  Monica's birthday.mpg4 -->
					                                        <br/>
					                                        <small>添加时间：</small>
					                                    </div>
					                                </a>
					                                <div id='successprogressdiv' class='progress'><div id='successprogress' style='width: 0%;' class='progress-bar'></div></div>
					                            </div>
					                        </div>
                        
                                            <span class="vertical-date">
                                                                                                                                               今天 <br>
                                        <small id="date2">2月3日</small>
                                    </span>
                                        </div>
                                    </div>
                                </div>

                        <div class="jqGrid_wrapper">
                            <table id="table_list_2"></table>
                            <div id="pager_list_2"></div>
                        </div>
                        
                        
                                  
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    
    
    <div style="visibility:hidden;">
    
    <form id= "uploadForm">
    <input type="file" id="file" name="file"  onchange="fileChange()"/>
    <input type="text" id="fileid" name="fileid"/>
    <input type="text" id="filetime" name="filetime"/>
    </form>
    </div>
    
    

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    
    
    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>

    <!-- jqGrid -->
    <script src="js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
    <script src="js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>

    <script>
        $(document).ready(function () {

            // Local script for demo purpose only
            $('#lightVersion').click(function (event) {
                event.preventDefault()
                $('#ibox-content').removeClass('ibox-content');
                $('#vertical-timeline').removeClass('dark-timeline');
                $('#vertical-timeline').addClass('light-timeline');
            });

            $('#darkVersion').click(function (event) {
                event.preventDefault()
                $('#ibox-content').addClass('ibox-content');
                $('#vertical-timeline').removeClass('light-timeline');
                $('#vertical-timeline').addClass('dark-timeline');
            });

            $('#leftVersion').click(function (event) {
                event.preventDefault()
                $('#vertical-timeline').toggleClass('center-orientation');
            });
            
            //添加日期
            var tempdate = new Date();
            $("#date1").text((tempdate.getMonth()+1).toString()+"月"+tempdate.getDate().toString()+"日");
            $("#date2").text((tempdate.getMonth()+1).toString()+"月"+tempdate.getDate().toString()+"日");

              //上传文件
       function uploadfile(){
               var input = document.getElementById("file"); 
               input.click();
       } 
        
       //用于监控上传附件的进度条
        function progressFunction(evt) {
            var progressdiv = document.getElementById("waitprogressdiv");
            var progress = document.getElementById("waitprogress");
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
            
            //回填文件名称
            $("file1").text("name");
            
            var size = fileObj.size;
            var basepath = document.getElementById('basepath').value; 
            var FileController = basepath +"waitfileManager/";// 接收上传文件的后台地址 
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
			        }  
			    } 
                //alert("上传完成!");
            };
            //文件唯一的id
             var tempdate = new Date();
	         timeid = tempdate.getFullYear().toString()+(tempdate.getMonth()+1).toString()+tempdate.getDate().toString()+tempdate.getHours().toString()+tempdate.getMinutes().toString()+tempdate.getSeconds().toString()+tempdate.getMilliseconds().toString();        
             document.getElementById("fileid").value = timeid;
	          
	          var time = tempdate.getFullYear().toString()+"-"+(tempdate.getMonth()+1).toString()+"-"+tempdate.getDate().toString(); 
	          document.getElementById("filetime").value = time;
              
              xhr.upload.addEventListener("progress", progressFunction, false);
              // FormData 对象
              var form = new FormData($( "#uploadForm" )[0]);
              xhr.send(form);
       }












             $.jgrid.defaults.styleUI = 'Bootstrap';
            // Examle data for jqGrid
            var mydata = [
                {
                    id: "1",
                    invdate: "2010-05-24",
                    name: "test",
                    note: "note",
                    tax: "10.00",
                    total: "2111.00"
                },
                {
                    id: "2",
                    invdate: "2010-05-25",
                    name: "test2",
                    note: "note2",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "3",
                    invdate: "2007-09-01",
                    name: "test3",
                    note: "note3",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "4",
                    invdate: "2007-10-04",
                    name: "test",
                    note: "note",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "5",
                    invdate: "2007-10-05",
                    name: "test2",
                    note: "note2",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "6",
                    invdate: "2007-09-06",
                    name: "test3",
                    note: "note3",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "7",
                    invdate: "2007-10-04",
                    name: "test",
                    note: "note",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "8",
                    invdate: "2007-10-03",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "21.00",
                    total: "320.00"
                },
                {
                    id: "9",
                    invdate: "2007-09-01",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "11",
                    invdate: "2007-10-01",
                    name: "test",
                    note: "note",
                    amount: "200.00",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "12",
                    invdate: "2007-10-02",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "13",
                    invdate: "2007-09-01",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "14",
                    invdate: "2007-10-04",
                    name: "test",
                    note: "note",
                    amount: "200.00",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "15",
                    invdate: "2007-10-05",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "16",
                    invdate: "2007-09-06",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "17",
                    invdate: "2007-10-04",
                    name: "test",
                    note: "note",
                    amount: "200.00",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "18",
                    invdate: "2007-10-03",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "19",
                    invdate: "2007-09-01",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "21",
                    invdate: "2007-10-01",
                    name: "test",
                    note: "note",
                    amount: "200.00",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "22",
                    invdate: "2007-10-02",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "23",
                    invdate: "2007-09-01",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "24",
                    invdate: "2007-10-04",
                    name: "test",
                    note: "note",
                    amount: "200.00",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "25",
                    invdate: "2007-10-05",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "26",
                    invdate: "2007-09-06",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                },
                {
                    id: "27",
                    invdate: "2007-10-04",
                    name: "test",
                    note: "note",
                    amount: "200.00",
                    tax: "10.00",
                    total: "210.00"
                },
                {
                    id: "28",
                    invdate: "2007-10-03",
                    name: "test2",
                    note: "note2",
                    amount: "300.00",
                    tax: "20.00",
                    total: "320.00"
                },
                {
                    id: "29",
                    invdate: "2007-09-01",
                    name: "test3",
                    note: "note3",
                    amount: "400.00",
                    tax: "30.00",
                    total: "430.00"
                }
            ];

            
         $("#table_list_2").jqGrid({
                data: mydata,
                datatype: "local",
                height: 450,
                autowidth: true,
                shrinkToFit: true,
                rowNum: 20,
                rowList: [10, 20, 30],
                colNames: ['序号', '日期', '源文件', '转换后文件', '转换耗时', '是否成功', '备注'],
                colModel: [
                    {
                        name: 'id',
                        index: 'id',
                        editable: true,
                        width: 60,
                        sorttype: "int",
                        search: true
                    },
                    {
                        name: 'invdate',
                        index: 'invdate',
                        editable: true,
                        width: 90,
                        sorttype: "date",
                        formatter: "date"
                    },
                    {
                        name: 'name',
                        index: 'name',
                        editable: true,
                        width: 100
                    },
                    {
                        name: 'amount',
                        index: 'amount',
                        editable: true,
                        width: 80,
                        align: "right",
                        sorttype: "float",
                        formatter: "number"
                    },
                    {
                        name: 'tax',
                        index: 'tax',
                        editable: true,
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    },
                    {
                        name: 'total',
                        index: 'total',
                        editable: true,
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    },
                    {
                        name: 'note',
                        index: 'note',
                        editable: true,
                        width: 100,
                        sortable: false
                    }
                ],
                pager: "#pager_list_2",
               // viewrecords: true,
                caption: "文件转换记录",
                //add: true,
                edit: true,
                //addtext: 'Add',
                edittext: 'Edit',
                hidegrid: false
            });

            // Add selection
            $("#table_list_2").setSelection(4, true);


            // Setup buttons
             $("#table_list_2").jqGrid('navGrid', '#pager_list_2', {
                edit: true,
                add: false,
                del: true,
                search: true
            }, {
                height: 200,
                reloadAfterSubmit: true
            }); 

            // Add responsive to jqGrid
            $(window).bind('resize', function () {
                var width = $('.jqGrid_wrapper').width();
                $('#table_list_1').setGridWidth(width);
                $('#table_list_2').setGridWidth(width);
            });

        });
        
        //选择文件类型后将按钮展示成文件类型
        function filetype1(e){
               $("#filelisttype1").text(e.innerText);
        }
        
        function filetype2(e){
               $("#filelisttype2").text(e.innerText);
        }
        
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </script>
</body>

</html>
