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

@WebServlet(urlPatterns = {"/filter"})
public class FilterServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
	
		HttpSession session = req.getSession();
		session.removeAttribute("resultProfileID");
		String[] filters = (String[])session.getAttribute("filters");
		//String[] filterInit = {"all", "all"};


		int[] resultProfileID = new int[0];
		
		/*
		boolean noFilter = true;
		for (String s : filters) {
			if (!s.equals("all")) {
				noFilter=false;
			}
		}
		
		String sql = "SELECT profileID FROM profile";
		if (noFilter==false) {
			sql = sqlGenerate(filters);
		}
		*/

		//res.getWriter().println("onlineOpt = " + filters[0]);
		//res.getWriter().println("classFilter = " + filters[1]);
		
		
		String sql = sqlGenerate(filters);


		
		try {
			Connection conn = MySQLConn.getMySQLConnection();
			resultProfileID = DBUtils.filterWithQuery(conn, sql);
		}
		catch (Exception e) {
			res.getWriter().print(e.getMessage());
		}
		session.setAttribute("resultProfileID", resultProfileID);
		//res.sendRedirect("filterView.jsp");
		/*
		res.getWriter().println(sql);
		for (int id : resultProfileID) {
			res.getWriter().println(id);
		}
		*/
		
	}
	
	//get all the ids
	public String sqlGenerate(String[] filters) {
		String sql = "SELECT profileID FROM profile";
		
		//filter by class
		if (!filters[1].equals("all")) {
			int courseID = 0;
			try {
				Connection conn = MySQLConn.getMySQLConnection();
				courseID = DBUtils.findCourseID(conn, filters[1]);
			}
			catch (Exception e){
				System.out.println(e.getMessage());
			}
			sql = sql + " WHERE profileID in (SELECT studentID FROM enrollment WHERE courseID = " + courseID + ")";
		}
		return sql;
	}
}
