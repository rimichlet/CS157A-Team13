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
import cs157aProject.model.Preference;
import cs157aProject.model.Profile;
import cs157aProject.model.StudentAccount;

@WebServlet(urlPatterns = {"/myInfo"})
public class MyInfoServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		Account user = (Account)session.getAttribute("user");
		int accountID = user.getAccountID();


		try {
			Connection conn = MySQLConn.getMySQLConnection();
			
			//student account from accountId
			StudentAccount studentUser = DBUtils.findStudentAccount(conn, accountID);
			
			//campus name from studentAccount campusID
			String campus_name = DBUtils.campusLookup(conn, studentUser.getCampusID());
			
			//profileID from accountID
			int profileID = DBUtils.findProfileID(conn, accountID);
			
			//enrollments list from profileID
			int[] enrollments = DBUtils.findEnrollments(conn, profileID);
			String[] courseNames = new String[enrollments.length];
			for (int i = 0; i < enrollments.length; i++) {
				courseNames[i] = DBUtils.findCourseName(conn, enrollments[i]);
			}
			
			//profile from profileID
			Profile p = DBUtils.findProfile(conn, profileID);
			String userD = p.getDescription();
			
			//preference from profileID
			Preference pre = DBUtils.findPreference(conn, profileID);
			
			
			//interests from interestID
			int[] interests = DBUtils.findInterests(conn, profileID);
			String[] interestNames = new String[interests.length];
			for (int i = 0; i < interests.length; i++) {
				interestNames[i] = DBUtils.findInterestName(conn, interests[i]);
			}
			
			session.setAttribute("userInterestsNames", interestNames);
			session.setAttribute("userOnlineOpt", pre.getOnlineOpt());
			session.setAttribute("userLocation", pre.getLocation());
			session.setAttribute("userDescription", userD);
			session.setAttribute("user_course_names", courseNames);
			session.setAttribute("user_campus", campus_name);
			session.setAttribute("studentAccountUser", studentUser);
			
			//res.sendRedirect("myInfoView.jsp");
			//out.println("accountID = " + user.getAccountID());
		}
		catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println(e.getMessage());
		}
	}

}
