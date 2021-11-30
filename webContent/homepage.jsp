<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<style>
body{
background-color: lightblue;
text-align: center;
}
</style>
<body>
<%
	if(session.getAttribute("user") == null){
		response.sendRedirect("login.jsp");
	}
	String[] filterInit = {"all", "all"};
	session.setAttribute("filters", filterInit);
%>
<h1>Welcome ${user.username}</h1>
<br>
You are now logged in
<br>
<a href="myInfoView.jsp">My Info</a><br>
<a href="filterView.jsp">Search for Students</a><br>
<form action="logout">
<input type="submit" value="Logout">
</form>
</body>
</html>