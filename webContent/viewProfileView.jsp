<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
</head>
<style>
body{
background-color: lightblue;
}
</style>
<body>
<h1>${viewProfileName}</h1>
<p>${viewProfileDescription }</p>
<h2>Enrollments</h2>
<%
	String[] print = (String[])session.getAttribute("viewProfileEnrollments");
	for (int i = 0; i < print.length; i++){
		out.println(print[i] + "<br>");
	}
%>
<h2>Online</h2>
${viewProfileOnline }
<h2>Location</h2>
${viewProfileLocation}
<br>
<a href="filterView.jsp">Back to Search</a>
</body>
</html>