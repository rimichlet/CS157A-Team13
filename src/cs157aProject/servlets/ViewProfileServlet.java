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
import cs157aProject.model.Profile;
import cs157aProject.model.StudentAccount;


@WebServlet(urlPatterns = {"/viewProfile"})
public class ViewProfileServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		HttpSession session = req.getSession();
		
		session.removeAttribute("viewProfileName");
		session.removeAttribute("viewProfileDescription");
		session.removeAttribute("viewProfileEnrollments");
		session.removeAttribute("viewProfileOnline");
		session.removeAttribute("viewProfileLocation");
		
		int profileID = Integer.parseInt(req.getParameter("profileID"));
		
		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			int accID = DBUtils.findAccountID(conn, profileID);
			StudentAccount sa = DBUtils.findStudentAccount(conn, accID);
			String vpn = sa.getStudentName();
			int[] enrolls = DBUtils.findEnrollments(conn, profileID);
			
			String[] vpe = new String[enrolls.length];
			for (int i = 0; i < enrolls.length; i++) {
				vpe[i] = DBUtils.findCourseName(conn, enrolls[i]);
			}
			
			Preference p = DBUtils.findPreference(conn, profileID);
			String vpo = p.getOnlineOpt();
			String vpl = p.getLocation();
			
			Profile pro = DBUtils.findProfile(conn, profileID);
			String vpd = pro.getDescription();
			
			session.setAttribute("viewProfileName", vpn);
			session.setAttribute("viewProfileDescription", vpd);
			session.setAttribute("viewProfileEnrollments", vpe);
			session.setAttribute("viewProfileOnline", vpo);
			session.setAttribute("viewProfileLocation", vpl);
		}
		catch (Exception e)
		{
			res.getWriter().println(e.getMessage());
		}
		
		res.sendRedirect("viewProfileView.jsp");
		//res.getWriter().println("servlet called, profileID to display = " + profileID);
	}
}
