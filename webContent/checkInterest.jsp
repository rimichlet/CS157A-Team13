<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/styles.css" />
<title>Check Interests</title>
</head>
<header>
    <%@include file="includes/navigation.jsp" %>
</header>
<body>

<form action = "updateInterests" method = "POST">
      <p align="left" style="font-weight: bolder;">Choose Your Interests :
		</p>
		<%
		
		RequestDispatcher rd = request.getRequestDispatcher("interestList");
		rd.include(request, response);
		String[] interestNames = (String[])session.getAttribute("interestListNames");
		if (interestNames != null){
			for (String s : interestNames){
				out.println("<input type = \"checkbox\" name = \"interests\" value = \"" + s + "\" /> " + s + " <BR>");	
			}	
		}
		
		%>
         
         <br><input type = "submit" value = "Select interests" />
      </form>
</body>
</html>
