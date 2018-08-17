<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  #form2 p {
	text-align: center;
}
  #form1 p label {
	text-align: center;
}
  #form1 {
	text-align: center;
}
  </style>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body background="timg.jpg">
  <form id="form2" name="form2" method="post" action="">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
    <form id="form1" name="form1" method="post" action="servlet/YunServlet?method=add">
  <p>
    <span id="form1">
    <label for="name">要做的题数:</label>
    <input type="text" name="num" id="num" />
    </span></p>
  <p>
    <label for="name2">限制的时间:</label>
    <input type="text" name="time" id="time" />
  </p>
  	
     <p>
       <input type="submit" name="tijiao" id="tijiao"  align="center" value="提交" />
     </p>
</form>
  </body>
</html>
