<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"   type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/zhuce.css" />
<script type="text/javascript">
	$(document).ready(function () {
		var height=$(document).height();
		$('.main').css('height',height);
	});
    //添加手机号自定义验证
	$.validator.addMethod("istelephone",function(value,element){
		var reg=/^1[345789][0-9]{9}$/;//正则表达式
		return reg.test(value);
	});
	//添加自定义 验证用户名 是否存在：
	$.validator.addMethod("checkTelephone",function(value,element){
		var flag=null;
		$.ajax({
	 		async:false,
	 		url:"${pageContext.request.contextPath}/user/checkTelephone.do",
	 		type:"GET",
	 		data:"telephone="+value,
	 		success:function(mydata){
	 			if(mydata=="yes"){
	 				flag=false;
	 			}else{
	 				flag=true;
	 			}
	 		}
	 	});
		return flag;
	});

	// 在键盘按下并释放及提交后验证提交表单
	$().ready(function(){
		$("#registerForm").validate({
			rules:{
				username:{
					required:true,
				},
				password:{
					required:true
				},
				telephone:{
					required:true,
					istelephone:true,
					checkTelephone:true
				}
			},
			//不通过显示的信息
			messages:{
				username:{
					required:"请填写",
				},
				password:{
					required:"请填写"
				},
				telephone:{
					required:"请填写",
					istelephone:"格式不正确",
					checkTelephone:"号码已存在"
				}
			}
		});
	});
</script>
<style>
.error{
	color:red;
}
</style>
</head>

<body>
<div class="main">
  <div class="main0">
     <div class="main_left">
        <img src="${pageContext.request.contextPath}/images/zhuce-image-3.png" class="theimg"/>
        <img src="${pageContext.request.contextPath}/images/zhuce-image-2.png" class="secimg"/>
        <img src="${pageContext.request.contextPath}/images/zhuce-image-1.png" class="firimg"/>
     </div>
     <form action="${pageContext.request.contextPath}/user/registerUser.do" method="post" id="registerForm" name="registerForm">
	     <div class="main_right" >
	        <div class="main_r_up">
	            <img src="${pageContext.request.contextPath}/images/user.png" />
	            <div class="pp">注册</div>
	        </div>
	        <div class="sub"><p>已经注册？<a href="${pageContext.request.contextPath}/index.jsp"><span class="blue">请登录</span></a></p></div>
	        <div class="txt txt0">
	            <span style="letter-spacing:8px;">手机号:</span>
	            <input name="telephone" type="text" class="txtphone" placeholder="请输入手机号码" id="telephone"/>
	        </div>
	     	<div class="txt txt0">
            	<span style="letter-spacing:8px;">用户名:</span>
            	<input name="username" type="text" class="txtphone" placeholder="请输入用户名" id="username"/>
        	</div>
        	<div class="txt txt0">
            	<span style="letter-spacing:4px;">登录密码:</span>
            	<input name="password" type="password" class="txtphone" placeholder="请输入密码" id="password"/>
       	 	</div>
	       	<br/>
	       	 <input type="submit" value="确定注册" class="xiayibu"/>
     	</div>
     	
      </form>
  </div>
</div>

<div class="footer">
  <div class="footer0">
     <div class="footer_l">使用条款 | 隐私保护</div>
     <div class="footer_r">©dayue.fun</div>
  </div> 
</div>
</body>
</html>

