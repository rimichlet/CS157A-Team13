<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Info</title>
</head>
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
<h2>Name</h2>
Your name is ${studentAccountUser.studentName} 
<h2>Description</h2>
${userDescription}
<h2>Campus</h2>
${user_campus}
<br>
<h2>Enrollments</h2>
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
<h3>Online</h3>
${userOnlineOpt}<br>
<h3>Location</h3>
${userLocation }<br>
<h2>Interests</h2>
<%
	String[] list2 = (String[])session.getAttribute("userInterestsNames");
	if (list2 != null){
		for (String s : list2){
			out.println(s + "<br>");
		}
	}

%>
<a href="homepage.jsp">Home</a>

<form action="logout">
<input type="submit" value="Logout">
</form>
</body>
</html>