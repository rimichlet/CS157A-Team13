package cs157aProject.servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/viewProfile"})
public class ViewProfileServlet extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		int profileID = Integer.parseInt(req.getParameter("profileID"));
		
		res.getWriter().println("servlet called, profileID to display = " + profileID);
	}
}
