<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>

<%
	String error=(String)request.getAttribute("error");
	if(error!=null&&error.equals("error")){
 %>
 	<script type="text/javascript">
 		alert("用户名或密码错误");
 	</script>
 <%
 	}else if(error!=null&&error.equals("zccg")){
  %>
	<script type="text/javascript">
 		alert("注册成功");
 	</script>
<%
	}
 %>
</head>

<body>
<form action="${pageContext.request.contextPath}/user/loginCheck.do" method="post" id="loginForm">
	<div class="main">
	  <div class="main0">
	     <div class="main_left">
	        <img src="${pageContext.request.contextPath}/images/login-image-3.png" class="theimg"/>
	        <img src="${pageContext.request.contextPath}/images/login-image-2.png" class="secimg"/>
	        <img src="${pageContext.request.contextPath}/images/login-image-1.png" class="firimg"/>
	     </div>
	     <div class="main_right">
	        <div class="main_r_up">
	            <img src="${pageContext.request.contextPath}/images/user.png" />
	            <div class="pp">登录</div>
	        </div>
	        <div class="sub"><p>还没有账号？<a href="${pageContext.request.contextPath}/zhuce.jsp"><span class="blue">立即注册</span></a></p></div>
	        <div class="txt">
	            <span style="letter-spacing:8px;">手机号:</span>
	            <input name="telephone" type="text" class="txtphone" id="telephone" placeholder="请输入注册手机号" required/>
	        </div>
	        <div class="txt">
	            <span style="letter-spacing:4px;">登录密码:</span>
	            <input name="password" type="password" class="txtphone" id="password" placeholder="请输入登录密码" required/>
	        </div>
	      
	      <!--   <div class="xieyi">
	            <input name="" type="checkbox" value="" checked="checked"/>
	            记住我 <a href="password.jsp"><span class="blue" style=" padding-left:130px; cursor:pointer">忘记密码?</span></a>
	        </div> -->
	        <br />
	        <input type="submit" value="登录" class="xiayibu"/>
	     </div>
	  </div>
	</div>
</form>
<div class="footer">
  <div class="footer0">
     <div class="footer_l">使用条款 | 隐私保护</div>
     <div class="footer_r">@dayue.fun</div>
  </div> 
</div>
</body>
</html>

