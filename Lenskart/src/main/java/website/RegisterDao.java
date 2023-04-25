package website;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

public class RegisterDao
{
	private String drivername="com.mysql.jdbc.Driver";
	private String databasename="webproject";
	private String user="root";
	private String pass="";
	public void registerdriver()
	{
		try {
			Class.forName(drivername);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	User obj=new User();
	public Connection getConnection()
	{
		Connection con=null;
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databasename+"",user,pass);
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return con;
	}
	public void insert(User u)
	{
		registerdriver();
		Connection con=getConnection();
		PreparedStatement stm;
		try 
		{
			stm=con.prepareStatement("insert into users values(?,?,?,?)");
			stm.setInt(1,u.getId());
			stm.setString(2, u.getName());
			stm.setString(3, u.getEmail());
			stm.setString(4, u.getPassword());
			stm.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
