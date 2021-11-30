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

@WebServlet(urlPatterns = {"/changeDescription"})
public class ChangeDescriptionServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		String desc = req.getParameter("description");
		
		int profileID = (int) session.getAttribute("userProfileID");
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			DBUtils.updateDescription(conn, profileID, desc);
			res.sendRedirect("myInfoView.jsp");
		}
		catch (Exception e) {
			res.getWriter().println(e.getMessage());
		}
		
	}
}
