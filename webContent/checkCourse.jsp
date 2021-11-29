<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Check Classes that You Enrolled</title>
</head>
   <body> 
      <form action = "updateClasses" method = "POST">
      <p align="left" style="font-weight: bolder;">Choose Your Classes :
		</p>
		<%
		
		RequestDispatcher rd = request.getRequestDispatcher("courseList");
		rd.include(request, response);
		String[] course_names = (String[])session.getAttribute("courseList");
		if (course_names != null){
			for (String s : course_names){
				out.println("<input type = \"checkbox\" name = \"courses\" value = \"" + s + "\" /> " + s + " <BR>");	
			}	
		}
		
		%>
         
         <br><input type = "submit" value = "Select Courses" />
      </form>
   </body>