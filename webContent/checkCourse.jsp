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
		<!-- 
         <input type = "checkbox" name = "courses" value = "Data Structures" /> Data Structures <BR>
         <input type = "checkbox" name = "courses" value = "Object Oriented Programming"/> Object Oriented Programming <BR>
         <input type = "checkbox" name = "courses" value = "Computer Architecture" /> Computer Architecture <BR>
         <input type = "checkbox" name = "courses" value = "Database Management Systems" /> Database Management Systems<BR>
         <input type = "checkbox" name = "courses" value = "Operating Systems" /> Operating Systems<BR>
         <input type = "checkbox" name = "courses" value = "Discrete Math" /> Discrete Math <BR>
         <input type = "checkbox" name = "courses" value = "Linear Algebra" /> Linear Algebra<BR>
         <input type = "checkbox" name = "courses" value = "Applied Statistics" /> Applied Statistics<BR>
         <input type = "checkbox" name = "courses" value = "Computer Graphics" /> Computer Graphics<BR>
         <input type = "checkbox" name = "courses" value = "Machine Learning" /> Machine Learning<BR>
         <input type = "checkbox" name = "courses" value = "Artificial Intelligence" /> Artificial Intelligence<BR>
         <input type = "checkbox" name = "courses" value = "Cryptography" />Cryptography<BR>
         <input type = "checkbox" name = "courses" value = "Software Engineering" /> Software Engineering<BR>         
 		-->
         
         <br><input type = "submit" value = "Select Courses" />
      </form>
   </body>