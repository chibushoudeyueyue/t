<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>欢迎</title>
<link type="text/css" rel="stylesheet" href="css/login.css" />
 <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
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
                    <small>用户列表 —— 显示所有用户  </small>
                </h1>
                 <div style="color: red"> 
                	${message}
                	</div>
                <div align="right"> 
                	 <%=request.getSession().getAttribute("username")==null?
					"":
					"欢迎您:"+request.getSession().getAttribute("username")+"&nbsp;&nbsp;<a href='/SSM/user/selectMyById.do'>修改信息</a>&nbsp;&nbsp;<a href='/SSM/loginout.jsp'>退出登录</a>"%>
					
            	</div>
       	 	</div>
    	</div>
    
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户id</th>
                    <th>用户名字</th>
                    <th>用户密码</th>
                    <th>手机号码</th>
                    <th>管理员</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.telephone}</td>
                        <td>${user.admin==1?"是":"否"}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/rest/user/selectUserById/${user.id}">更改</a> |
                            <a href="${pageContext.request.contextPath}/rest/user/deleteUserById/${user.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>
</body>
</html>

