<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>答案页</title>
     <style type="text/css">

  #form1 p label {
	text-align: center;
}
  #form1 {
	text-align: center;
}
     </style>
    <style type="text/css">
.a {
	color: #0F0;
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
  <p class="qqq">结果页</p>
  <p>&nbsp;</p>
  <p>
    <% 
  		dao.DBUtil db=new dao.DBUtil();
  		Connection conn =db.getConn();
		Statement stmt = conn.createStatement();//从数据库里面取东西对比    
	    ResultSet rs=stmt.executeQuery("select * from yunsuan");
	    int x=0;
	    double q=0;//对题数
			  double p=0;//错题数
		while(rs.next())
		{
			x++;
			String y=String.valueOf(x);
			int num1=rs.getInt("num1");
			int num2=rs.getInt("num2");
			String symbol=rs.getString("symbol");
			int find=rs.getInt("find");
			int a=0;
			
			if(request.getParameter(y)!=null&&(!"".equals(request.getParameter(y))))
			{
				a=Integer.parseInt(request.getParameter(y));
			}
   %>
  </p>
         <table width="507" border="1" align="center">
  			<tr>
    <td width="131" style="text-align: center"><%=num1+symbol+num2 %>=</td>
    <td width="125" style="text-align: center"><%=a %></td>
    
		<%
			if(find==a)
			{
				q++;
		 %>
		 <td width="229" class="a" style="text-align: center">回答正确</td>
		 <%
		 	}
		 	else
		 	{
		 		p++;
		  %>
		<td width="229" class="a" style="text-align: center; color: #F00;">回答错误,正确答案为<%=find %></td>
	<%
	
	}
	}
	 %>
  </tr>
		</table>
  <%
   stmt.executeUpdate("delete from  yunsuan");
  	
   %>
   <br>
   <br>
   <br>
     <table width="700" border="1" align="center">
  <tr>
    <td width="200" height="23" class="aaa">总题数：<%=q+p%></td>
    <td width="300" class="aaa">做对<%=q %>题   正确率：<%=q/(q+p)*100 %>%</td>
    <td width="200" class="aaa">做错<%=p %>题</td>
  </tr>
  </table>
       <form id="form1" name="form1" method="post" action="index.jsp">
       <p>&nbsp;</p>
       <input type="submit" name="tijiao" id="tijiao" value="继续答题" />
    </form>
  </body>
</html>
