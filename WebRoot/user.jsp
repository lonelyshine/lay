<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<title>Bootstrap分页实例</title>  
<link href="<%=request.getContextPath()%>/static/js/bootstrap//css/bootstrap.min.css" rel="stylesheet">  
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>  
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap.min.js"></script>  
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap-paginator.min.js"></script>  
<style type="text/css">  
#queryDiv {  
 margin-right: auto;  
 margin-left: auto;  
 width:600px;  
}  
#textInput {  
 margin-top: 10px;  
}  
#tableResult {  
 margin-right: auto;  
 margin-left: auto;  
 width:600px;  
}  
td {  
 width:150px  
}  
</style>

<style>  
    body { font-size: 12px; }   
    #n { margin:10px auto; width:920px; border:1px solid #CCC;  
     font-size:14px; line-height:30px; }   
    #n a { padding:0 4px; color:#333 }   
    .Bar ,.Bars { position: relative; width: 200px;  
        /* 宽度 */ border: 1px solid #B1D632; padding: 1px; }   
    .Bar div,.Bars div { display: block; position: relative;  
     background:#00F;/* 进度条背景颜色 */ color: #333333;  
     height: 20px; /* 高度 */ line-height: 20px;  
      /* 必须和高度一致，文本才能垂直居中 */ }   
    .Bars div{ background:#090}   
    .Bar div span,.Bars div span { position: absolute; width: 200px;  
     /* 宽度 */ text-align: center; font-weight: bold; }   
    .cent{ margin:0 auto; width:300px; overflow:hidden}   
</style>  
  
</head>  
<body>  
    <div id = "queryDiv">  
        <input id = "textInput" type="text" placeholder="请输入用户名" >  
        <button id = "queryButton" class="btn btn-primary" type="button">查询</button>  
    </div>  
    <form id="form1">  
        <table class="table table-bordered" id = 'tableResult'>  
            <caption>查询用户结果</caption>  
            <thead>  
                <tr>  
                    <th>序号</th>  
                    <th>用户名</th>  
                    <th>密码</th>  
                    <th>用户邮箱</th>  
                </tr>  
            </thead>  
            <tbody id="tableBody">  
            </tbody>  
        </table>  
        <!-- 底部分页按钮 -->  
        <div id="bottomTab"></div>  
    </form>  
    <script type='text/javascript'>      
        var PAGESIZE = 10;  
        var options = {    
            currentPage: 1,  //当前页数  
            totalPages: 10,  //总页数，这里只是暂时的，后头会根据查出来的条件进行更改  
            size:"normal",    
            alignment:"center",    
            itemTexts: function (type, page, current) {    
                switch (type) {    
                    case "first":    
                        return "第一页";    
                    case "prev":    
                        return "前一页";    
                    case "next":    
                        return "后一页";    
                    case "last":    
                        return "最后页";    
                    case "page":    
                        return  page;    
                }                   
            },    
            onPageClicked: function (e, originalEvent, type, page) {    
                var userName = $("#textInput").val(); //取内容  
                buildTable(userName,page,PAGESIZE);//默认每页最多10条  
            }    
        }    
  
        //获取当前项目的路径  
        var urlRootContext = (function () {  
            var strPath = window.document.location.pathname;  
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);  
            return postPath;  
        })();  
          
         
        //生成表格  
        function buildTable(userName,pageNumber,pageSize) {  
             var url =  urlRootContext + "/list.do"; //请求的网址  
             var reqParams = {'userName':userName, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据  
             $(function () {     
                  $.ajax({  
                        type:"POST",  
                        url:url,  
                        data:reqParams,  
                        async:false,  
                        dataType:"json",  
                        success: function(data){  
                            if(data.isError == false) {  
                           // options.totalPages = data.pages;  
                        var newoptions = {    
                        currentPage: 1,  //当前页数  
                        totalPages: data.pages==0?1:data.pages,  //总页数  
                        size:"normal",    
                        alignment:"center",    
                        itemTexts: function (type, page, current) {    
                        switch (type) {    
                            case "first":    
                            return "第一页";    
                            case "prev":    
                            return "前一页";    
                            case "next":    
                            return "后一页";    
                            case "last":    
                            return "最后页";    
                        case "page":    
                        return  page;    
                }                   
            },    
            onPageClicked: function (e, originalEvent, type, page) {    
                var userName = $("#textInput").val(); //取内容  
                buildTable(userName,page,PAGESIZE);//默认每页最多10条  
            }    
         }                           
         $('#bottomTab').bootstrapPaginator("setOptions",newoptions); //重新设置总页面数目  
         var dataList = data.dataList;  
         $("#tableBody").empty();//清空表格内容  
         if (dataList.length > 0 ) {  
             $(dataList).each(function(){//重新生成  
                    console.log(this.TITLE);
                    $("#tableBody").append('<tr>');  
                    $("#tableBody").append('<td>' + this.EMAILID + '</td>');  
                    $("#tableBody").append('<td>' + this.CONTENT + '</td>');  
                    $("#tableBody").append('<td>' + this.SENDER + '</td>');  
                    $("#tableBody").append('<td>' + this.TITLE + '</td>');  
                    $("#tableBody").append('</tr>');  
                    });    
                    } else {                                  
                          $("#tableBody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');  
                    }  
                    }else{  
                          alert(data.errorMsg);  
                            }  
                      },  
                        error: function(e){  
                           alert("查询失败:" + e);  
                        }  
                    });  
               });  
        }  
          
        //渲染完就执行  
        $(function() {  
              
            //生成底部分页栏  
            $('#bottomTab').bootstrapPaginator(options);       
              
            buildTable("",1,10);//默认空白查全部  
              
            //创建结算规则  
            $("#queryButton").bind("click",function(){  
                var userName = $("#textInput").val();     
                console.log(userName);
                buildTable(userName,1,PAGESIZE);  
            });  
        });  
    </script> 
    
    
    
<div class="cent">   
<p>   
百分比进度条样式:   
</p>   
<p>   
<div class="Bar">   
    <div style="width: 50%;">   
        <span>50%</span>   
    </div>   
</div>   
</p>   
<p>   
<div class="Bar">   
    <div style="width: 80%;">   
        <span>80%</span>   
    </div>   
</div>   
</p>   
<p>   
<div class="Bars">   
    <div style="width: 100%;">   
        <span>100%</span>   
    </div>   
</div>   
</p>   
</div>      
    
    
    
    
    
    
    
    
    
    
    
     
</body>  
</html>  