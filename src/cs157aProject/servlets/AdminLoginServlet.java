package cs157aProject.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs157aProject.DBUtils;
import cs157aProject.MySQLConn;
import cs157aProject.model.Account;

@WebServlet(urlPatterns = {"/adminlogin"})
public class AdminLoginServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		Account user = null;
		
		try {
			
			Connection conn = MySQLConn.getMySQLConnection();
			user = DBUtils.findAdminUser(conn, username, password);
			//out.println("accountID = " + user.getAccountID());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		if (user == null) {
			res.sendRedirect("adminLogin.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			res.sendRedirect("adminPage.jsp");
		}
	}
}
