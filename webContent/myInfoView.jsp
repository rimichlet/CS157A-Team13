<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css" />
<title>My Info</title>
</head>
<header>
    <%@include file="includes/navigation.jsp" %>
</header>
<body>
<%
	if(session.getAttribute("user") == null){
		response.sendRedirect("login.jsp");
	}
	else
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("myInfo");
		dispatcher.include(request, response);
	}
	
%>
<h1>My Info</h1>
<a href="homepage.jsp">Home</a>
<table>
<tr><td><h2>Name</h2></td>
	<td>Your name is ${studentAccountUser.studentName}</td> 
</tr>

<tr>
<td><h2>Description</h2></td>
<td>${userDescription}</td>
<td><a href="changeDescription.jsp">edit</a></td>
</tr>

<tr>
<td><h2>Campus</h2></td>
<td>${user_campus}</td>
</tr>
</table>
	


<br>
<h2>Enrollments</h2>
<!-- insert copy here -->
<%
	String[] list = (String[])session.getAttribute("user_course_names");
	if (list != null){
		for (String s : list){
			out.println(s + "<br>");
		}
	}

%>
<br>
<a href="checkCourse.jsp">Update Enrollments</a>
<h2>Preferences</h2>
<table>
<tr>
<td><h3>Online</h3></td>
<td>${userOnlineOpt}</td>
</tr>

<tr>
<td><h3>Location</h3></td>
<td>${userLocation }</td>

</tr>

</table>

<a href="changePreferences.jsp">Edit preferences</a>
<h2>Interests</h2>
<%
	String[] list2 = (String[])session.getAttribute("userInterestsNames");
	if (list2 != null){
		for (String s : list2){
			out.println(s + "<br>");
		}
	}

%>

<br>
<a href="checkInterest.jsp">Update Interests</a>
<br><br>

<form action="logout">
<input type="submit" value="Logout">
</form>
</body>
</html>
