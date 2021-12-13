<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/styles.css" />
    <title>Edit Preferences</title>
</head>
<header>
    <%@include file="includes/navigation.jsp" %>
</header>
<body>
<form action="changePreferences" method="post">
<table>
<tr>
<td>Online</td>
<td>
<select name="online" id="online">
    <option value="YES">Yes</option>
    <option value="NO">No</option>
    <option value="BOTH">Both</option>
</select>
</td>
</tr>


<tr>
<td>Location</td>
<td><input type="text" id="location" name="location"></td>
</tr>
</table>


<input type="submit" value="Confirm">
</form>
</body>
</html>
