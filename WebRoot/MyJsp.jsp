<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>做题页</title>
    <style type="text/css">
    .aaa {
	text-align: center;
	font-weight: bold;
}
   .aa {
	text-align: center;
}
#tijiao {
	text-align: center;
}
  #form p label {
	text-align: center;
}
  #form1{
	text-align: center;
}
.qqq {
	text-align: center;
	font-size: 36px;
	font-family: "微软雅黑";
}
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body background="timg.jpg">
  <p>&nbsp;  </p>
  <p class="qqq">做题页</p>
  <p>&nbsp;</p>
  <p>
  <form id="form1" name="form1" method="post" action="MyJsp1.jsp">
  <table width="386" border="1" align="center">
  <tr>
    <td width="79" height="23" class="aaa">题号</td>
    <td width="116" class="aaa">题目</td>
    <td width="169" class="aaa">答案</td>
  </tr>

  
  <%
  	int time1=(int)session.getAttribute("time");
  	dao.DBUtil db=new dao.DBUtil();
  	Connection conn =db.getConn();
		Statement stmt = conn.createStatement();//从数据库里面取东西对比    
	    ResultSet rs=stmt.executeQuery("select * from yunsuan");
	    int x=0;
	    int y=1;
		while(rs.next())
		{
			x++;
			int num1=rs.getInt("num1");
			int num2=rs.getInt("num2");
			String symbol=rs.getString("symbol");
   %>
   <table width="386" border="1" align="center">
   		<tr>
    <td width="79" height="23" class="aa"><%=y %>.</td>
    <td width="116" class="aa"><%=num1+symbol+num2 %>=</td>
    <td width="169" class="aa">
    <input type="text" name="<%=x %>" id="<%=x %>" />
    </td>
  </tr>
</table>
   <%
   y++;
   		}
    %>
    </table>
    <p>&nbsp;</p>
    <input type="submit" name="tijiao" id="tijiao"  value="提交" />
    </form>
    <p>&nbsp; </p>
　　　　<head>
　　　　　　<script type="text/javascript">
　　　　　　　　var time =<%=time1%>; //时间,秒
　　　　　　　　function Redirect() {
 　　　　　　　　window.location = "MyJsp1.jsp";
　　　　　　　　}
　　　　　　　　var i = 0;
　　　　　　　　function dis() {
 　　　　　　　　document.all.s.innerHTML = "还剩" + (time - i) + "秒";
 　　　　　　　　i++;
　　　　　　　　}
　　　　　　　　timer = setInterval('dis()', 1000); //显示时间
　　　　　　　　timer = setTimeout('Redirect()', time * 1000); //跳转
　　　　　　</script>
　　</head>
<table width="507" border="1" align="center">
　　　　<td width="229" class="a" style="text-align: center; color: #F00;"><span  id="s"></span></td>
</table>
  </body>
</html>
