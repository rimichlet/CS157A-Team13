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
import cs157aProject.model.Preference;
import cs157aProject.model.StudentAccount;

@WebServlet(urlPatterns = {"/getNames"})
public class ListDisplayServlet extends HttpServlet
{

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		int[] ids = (int[]) session.getAttribute("resultProfileID");
		String[] names = new String[ids.length];
		String[] online = new String[ids.length];
		
		for (int i = 0; i < ids.length; i++) {
			try {
				Connection conn = MySQLConn.getMySQLConnection();
				int acctID = DBUtils.findAccountID(conn, ids[i]);
				StudentAccount sa = DBUtils.findStudentAccount(conn, acctID);
				names[i] = sa.getStudentName();
				Preference p = DBUtils.findPreference(conn, ids[i]);
				online[i] = p.getOnlineOpt();
			}
			catch (Exception e) {
				res.getWriter().println(e.getMessage());
			}
		}
		
		session.setAttribute("onlineOptionsList", online);
		session.setAttribute("displayNames", names);
	}
}
