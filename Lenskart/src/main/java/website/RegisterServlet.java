package website;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register-user")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		{
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			int id = Integer.parseInt(request.getParameter("userid"));
			String name = request.getParameter("username");
			String email = request.getParameter("useremail");
			String password = request.getParameter("userpass");
			User obj=new User(id,name,email,password);
			RegisterDao red=new RegisterDao();
			red.insert(obj);
			RequestDispatcher rd=request.getRequestDispatcher("userlogin.jsp");
			response.sendRedirect("userlogin.jsp");
	}
	}

}
