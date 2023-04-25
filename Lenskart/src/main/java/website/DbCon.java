package website;
import java.sql.*;
public class DbCon
{
	private static Connection connection=null;
	public static Connection getConnection()
	{
		if(connection==null)
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject","root","");
			}
			catch (ClassNotFoundException | SQLException e)
			{

				e.printStackTrace();
			}
		}
		else
		{
			
		}
		return connection;
		
	}
}