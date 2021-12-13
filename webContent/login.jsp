<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/styles.css" />
    <title>Login</title>
</head>


<header>
    <%@include file="includes/navigation.jsp" %>
</header>



<body>
<%--
	<form action="login" style="background-color: lightblue;text-align: center">
		<label for="username">Username</label><br>
		<input type="text" id="username" name="username"><br>
		<label for="password">Password</label><br>
		<input type="password" id="password" name="password"><br>
		<input type="Submit" value="Log In"><br>
	</form>
 --%>

<form action="login" style="margin-top: 50px">
            <label for="username" style="margin-left: 27%; color: WHITESMOKE">Username</label><br>
            <input type="text" class="field" id="username" name="username"><br>
            <label for="password" style="margin-left: 27%; color: WHITESMOKE">Password</label><br>
            <input type="password" class="field" id="password" name="password"><br>
            <input type="Submit" class="loginbutton" value="Log In"><br>
        </form>

</body>
<a href="createAccount.jsp">Create Account</a>
</html>
