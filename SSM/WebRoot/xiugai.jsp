<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>修改用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.js"   type="text/javascript"></script>
	<%
	String error=(String)request.getAttribute("message");
	if(error!=null&&error.equals("telephoneisexit")){
 %>
 	<script type="text/javascript">
 		alert("手机号已存在");
 	</script>
 <%
 	}
 	
  %>
    <script type="text/javascript">
    
    //添加手机号自定义验证
	$.validator.addMethod("istelephone",function(value,element){
		var reg=/^1[345789][0-9]{9}$/;//正则表达式
		return reg.test(value);
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
					istelephone:true
				}
			},
			//不通过显示的信息
			messages:{
				username:{
					required:"用户名不能为空",
				},
				password:{
					required:"密码不能为空"
				},
				telephone:{
					required:"手机号不能为空",
					istelephone:"手机号格式不正确"
					
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
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改用户</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/user/editUserById.do" name=registerForm method="post" id="registerForm">
        <input type="hidden" name="id" value="${user.id}" />
		        用户名：<input type="text" id="username" name="username" value="${user.username}" /><br>
		        <br>
		        密&nbsp;&nbsp;&nbsp; 码：<input type="text" id="password" name="password" value="${user.password}" /><br>
		         <br>
    	   	手机号：<input type="text" name="telephone" id="telephone" value="${user.telephone}" /><br>
      		 <input type="hidden" name="admin" value="${user.admin}" /><br>
        <input type="submit" value="提交" />
    </form>
    
</div>
  </body>
</html>
