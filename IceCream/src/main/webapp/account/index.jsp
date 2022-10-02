<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="models.UserModel, controllers.UserController, utils.StringUtils" %>

<%
	int userId = (int) session.getAttribute("id");
	UserModel userDetails = UserController.getUser(userId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	User ID: <%= userDetails.getId() %><br />
	Username: <%= userDetails.getUsername() %><br />
	Password: <%= userDetails.getPassword() %><br />
	Usertype: <%= StringUtils.translateUserType(userDetails.getUsertype()) %><br />
	Created At: <%= userDetails.getSqlDate() %><br />
</body>
</html>