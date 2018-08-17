package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import user.users;

public class Dao {
	public void add(Connection conn ,users u) throws SQLException
	{
		try{
		Statement stmt = conn.createStatement();//浠庢暟鎹簱閲岄潰鍙栦笢瑗垮姣�    
	    PreparedStatement sql =conn.prepareStatement("insert into yunsuan(num1,num2,symbol,find)values(?,?,?,?)");  
	    sql.setInt(1,u.num1);  
	    sql.setInt(2,u.num2);  
	    sql.setString(3,u.symbol);  
	    sql.setInt(4,u.find);
	    int rtn=sql.executeUpdate();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
