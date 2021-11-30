<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search for Students</title>
</head>
<body>
<h1>Search for Students</h1>
<a href="homepage.jsp">Home</a>
<form action="setfilter" method="get">
  <label for="onlineOpt">Online Option</label>
  <select name="onlineOpt" id="onlineOpt">
  	<option value="all">All</option>
    <option value="yes">Yes</option>
    <option value="no">No</option>
    <option value="both">Both</option>
  </select>
  <label for="classFilter">Class</label>
  <select name="classFilter" id="classFilter">
  <option value="all">All</option>
  <%
	RequestDispatcher rd = request.getRequestDispatcher("courseList");
	rd.include(request, response);
	String[] course_names = (String[])session.getAttribute("courseList");
	if (course_names != null){
		for (String s : course_names){
			out.println("<option value=\"" + s + "\">" + s + "</option>");	
		}	
	}  
  %>
  </select>
  <br><br>
  <input type="submit" value="Submit">
</form>
<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Online</th>
<th>View Profile</th>
</tr>
 <%
	RequestDispatcher rd2 = request.getRequestDispatcher("filter");
	rd2.include(request, response);
	rd2 = request.getRequestDispatcher("getNames");
	rd2.include(request, response);
	
	int[] displayedProfiles = (int[])session.getAttribute("resultProfileID");
	String[] displayedNames = (String[])session.getAttribute("displayNames");
	String[] displayedOnline = (String[])session.getAttribute("onlineOptionsList");
	
	if (displayedProfiles != null){
		for (int i= 0; i < displayedProfiles.length; i++){
			out.println("<tr>");
			out.println("<td>" + displayedProfiles[i] + "</td>");
			out.println("<td>" + displayedNames[i] + "</td>");
			out.println("<td>" + displayedOnline[i] + "</td>");
			out.println("<td><form action=\"viewProfile?profileID=" + displayedProfiles[i] + "\" method = \"post\"><input type=\"submit\" value=\"View\"></form><td>");
			out.println("</tr>");
		}	
	}  
	%>
	</table>
</body>
</html>