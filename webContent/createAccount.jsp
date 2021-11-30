<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
</head>
<body>
	<form action="createAccount" method="post">
		<label for="username">Name</label><br>
		<input type="text" id="name" name="name"><br>
		
		<label for="campus">Campus</label><br>
		<select name="campus">
		  <%
			RequestDispatcher rd = request.getRequestDispatcher("campusList");
			rd.include(request, response);
			String[] campus_names = (String[])session.getAttribute("campusList");
			if (campus_names != null){
			for (String s : campus_names){
				out.println("<option value=\"" + s + "\">" + s + "</option>");	
				}	
			}  
  			%>
		</select>
		<br>
		
		<label for="username">Username</label><br>
		<input type="text" id="username" name="username"><br>
		
		
		<label for="password">Password</label><br>
		<input type="password" id="password" name="password"><br>
		
		
		<input type="Submit" value="Create Account"><br>
	</form>
</body>
</html>