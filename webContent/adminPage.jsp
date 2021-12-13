<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css" />
<meta charset="ISO-8859-1">
<title>Admin Homepage</title>
</head>
<body>
<h1>Welcome ${user.username}</h1>
<br>
You are now logged in
<br>
<form action="logout">
<input type="submit" value="Logout">
<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Online</th>
<th>Delete Profile</th>
</tr>
 <%
	String[] filterInit = {"all", "all"};
	session.setAttribute("filters", filterInit);
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
			out.println("<td><form action=\"deleteProfile?profileID=" + displayedProfiles[i] + "\" method = \"post\"><input type=\"submit\" value=\"Delete\"></form><td>");
			out.println("</tr>");
		}	
	}  
	%>
	</table>
</body>
</html>