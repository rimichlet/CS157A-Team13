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

@WebServlet(urlPatterns = {"/changePreferences"})
public class ChangePreferenceServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		String online = req.getParameter("online");
		String location = req.getParameter("location");
		int profileID = (int) session.getAttribute("userProfileID");
		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			DBUtils.updatePreferences(conn, profileID, online, location);
			res.sendRedirect("myInfoView.jsp");
		}
		catch (Exception e) {
			res.getWriter().println(e.getMessage());
		}
	}
}
