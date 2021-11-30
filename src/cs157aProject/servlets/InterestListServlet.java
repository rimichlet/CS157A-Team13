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

@WebServlet(urlPatterns = {"/interestList"})
public class InterestListServlet extends HttpServlet{

public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			String[] interestNames = DBUtils.getInterestList(conn);
			session.setAttribute("interestListNames", interestNames);
		}
		catch (Exception e) {
			res.getWriter().println(e.getMessage());
		}
	}
}
