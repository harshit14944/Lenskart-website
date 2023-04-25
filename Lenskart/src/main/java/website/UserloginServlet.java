package website;

import java.io.IOException;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserloginServlet
 */
@WebServlet("/User-Login")
public class UserloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserloginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("userlogin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) 
		{
			String email = request.getParameter("useremail");
			String password = request.getParameter("userpass");
			UserDao udao=new UserDao(DbCon.getConnection());
			User user=udao.userLogin(email, password);
			if (user != null)
			{
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("Index.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("userlogin.jsp");
				rd.include(request, response);
			}
		}
	}

}

