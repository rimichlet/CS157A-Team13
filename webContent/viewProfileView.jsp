<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css" />
<title>View Profile</title>
</head>
<header>
    <%@include file="includes/navigation.jsp" %>
</header>
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
<h2>Interests</h2>
<%
	String[] print2 = (String[])session.getAttribute("viewProfileInterests");
	for (int i = 0; i < print2.length; i++){
		out.println(print2[i] + "<br>");
	}
%>
<br>
<a href="filterView.jsp">Back to Search</a>
</body>
</html>
