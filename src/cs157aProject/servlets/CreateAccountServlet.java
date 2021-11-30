package cs157aProject.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs157aProject.DBUtils;
import cs157aProject.MySQLConn;


@WebServlet(urlPatterns = {"/createAccount"})
public class CreateAccountServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String campus = req.getParameter("campus");
		String name = req.getParameter("name");
		
		
		
		//res.getWriter().println("Entered username: " + username + "Entered password: " + password);
		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			DBUtils.createStudentAccount(conn, username, password, name, campus);
			//res.getWriter().println("<h2>Account created</h2><br><a href=\"login.jsp\">Back</a>");
			res.sendRedirect("login.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println(e.getMessage());
		}
	}

}
