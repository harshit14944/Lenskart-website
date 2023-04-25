package website;
import java.sql.*;
public class UserDao {
	private Connection con;
	private String query;
    private PreparedStatement stm;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=? and password=?";
            stm = this.con.prepareStatement(query);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if(rs.next())
            {
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return user;
    }
}
