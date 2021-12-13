<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/styles.css" />
        <title>Admin Login</title>
    </head>

    <header>
        <%@include file="includes/navigation.jsp" %>
    </header>
    <body style="background-color: #114251;">
        <form action="adminlogin" style="margin-top: 50px">
            <label for="username" style="margin-left: 27%; color: WHITESMOKE">Admin Username</label><br>
            <input type="text" class="field" id="username" name="username"><br>
            <label for="password" style="margin-left: 27%; color: WHITESMOKE">Password</label><br>
            <input type="password" class="field" id="password" name="password"><br>
            <input type="Submit" class="loginbutton" value="Log In"><br>
        </form>
    </body>
</html>