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

@WebServlet(urlPatterns = {"/updateInterests"})
public class UpdateInterestsServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		Account user = (Account)session.getAttribute("user");
		String[] interests = req.getParameterValues("interests");
		if (interests == null) {
			interests = new String[0];
		}
		int[] interestIDs = new int[interests.length];
		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			for (int i = 0; i < interests.length; i++) {
				interestIDs[i] = DBUtils.findInterestID(conn, interests[i]);
				//res.getWriter().println(courseIDs[i]);
			}
			int profileID = DBUtils.findProfileID(conn, user.getAccountID());
			DBUtils.updateInterests(conn, interestIDs, profileID);
			session.removeAttribute("userInterestsNames");
		}
		catch (Exception e) {
			res.getWriter().println(e.getMessage());
		}
		
		res.sendRedirect("myInfoView.jsp");

	}
}
