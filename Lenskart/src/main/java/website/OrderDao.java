package website;
import java.util.*;
import java.io.*;
import java.sql.*;
public class OrderDao
{
	private Connection con;

	private String query;
    private PreparedStatement stm;
    private ResultSet rs;
    
    

	public OrderDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(Order model) {
        boolean result = false;
        try
        {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, model.getId());
            stm.setInt(2, model.getUid());
            stm.setInt(3, model.getQunatity());
            stm.setString(4, model.getDate());
            stm.executeUpdate();
            result = true;
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

    public List<Order> userOrders(int id)
    {
        List<Order> list = new ArrayList<>();
        try
        {
            query = "select * from orders where u_id=? order by orders.o_id desc";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next())
            {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("p_id");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id)
    {
        try 
        {
            query = "delete from orders where o_id=?";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, id);
            stm.execute();
            //result = true;
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
    }
}
