<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Handling Forward</title>
</head>
<body>
	<ul>
		<li><b>First Name</b>: <%=request.getParameter("first_name")%></li>
		<li><b>Last Name</b>: <%=request.getParameter("last_name")%></li>
	</ul>
	
	<a href="Home?redirect=yes">Redirect</a>
	
</body>
</html>