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
<form action="filter" method="get">
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
</body>
</html>