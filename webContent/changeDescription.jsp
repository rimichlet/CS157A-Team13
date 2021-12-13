<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/styles.css" />
    <title>Change Description</title>
</head>
<header>
    <%@include file="includes/navigation.jsp" %>
</header>
    <body>
    <p>Edit Description</p>
    <form action="changeDescription" method="post">
        <p><input type="text" id="description" name="description"></p>
        <input type="submit" value="Confirm">
    </form>
    </body>
</html>
