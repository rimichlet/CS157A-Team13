package cs157aProject.servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/setfilter"})
public class SetFilterServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		String[] filters = new String[2];
		filters[0] = req.getParameter("onlineOpt");
		filters[1] = req.getParameter("classFilter");
		
		session.setAttribute("filters", filters);
		
		res.sendRedirect("filterView.jsp");
	}
}
