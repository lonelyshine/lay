<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-31j">
    <meta name="decorator" content="default"/>

<title>成功页面</title>
<script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
</head>
<input id="status" type=hidden name="emailid" value="<%=status%>"> 
<body class="gray-bg">
    <div class="lock-word animated fadeInDown">
    </div>
    <div class="middle-box text-center lockscreen animated fadeInDown">
        <div>
            <div class="m-b-md">
                <img alt="image" style="width:150px;"class="img-circle circle-border" src="tool/image/email/success.jpg">
            </div>
            <%-- <c:if test="${status == '0'}">
            <p>邮件已经保存到草稿箱！</p>
            </c:if>
            <c:if test="${status == '1'}">
            <p>邮件发送成功！</p>
            </c:if>
            <c:if test="${status == '2'}">
            <p>邮件发送失败！</p>
            </c:if>
            <c:if test="${status == '3'}">
            <p>该用户没有添加邮箱或没有添加邮箱用户名和邮箱密码！</p>
            </c:if> --%>
            <p id="message"></p>
            
            <form class="m-t" role="form" action="index.html">
                <a href="mailbox" class="btn btn-primary block full-width">返回</a>
            </form>
        </div>
    </div>
    <script  type="text/javascript">
         var status = document.getElementById('status').value; 
         if(status==0){
            $("#message").text("邮件已经保存到草稿箱！");
         }else if(status==1){
            $("#message").text("邮件发送成功！");
         }else if(status==2){
            $("#message").text("邮件成功转入垃圾箱！");
         }
    </script>
</body>
</html>