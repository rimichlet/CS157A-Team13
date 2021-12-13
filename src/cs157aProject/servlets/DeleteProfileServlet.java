package cs157aProject.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs157aProject.DBUtils;
import cs157aProject.MySQLConn;

@WebServlet(urlPatterns = {"/deleteProfile"})
public class DeleteProfileServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		int profileID = Integer.parseInt(req.getParameter("profileID"));
		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			DBUtils.deleteProfile(conn, profileID);
			res.sendRedirect("adminPage.jsp");
			//int accID = DBUtils.findAccountID(conn, profileID);
		}
		catch (Exception e) {
			
		}
	}

}
