<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/IceCream/assets/css/fontawesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/IceCream/assets/css/login.css">
</head>
<body>

 <div class="container">
 	<div class="header">
 		<h1>LOG IN</h1>
 	</div>
 	<div class="main">
 		<form method="POST" action="/IceCream/assets/actions/Authentication.jsp">
 				<%
 				String status = request.getParameter("error");
 				
 				if (status != null) {
 					if (request.getParameter("error").equalsIgnoreCase("invalid")) {
 	 					out.println("<b>Invalid Account Details</b>");
 	 				} else {
 	 					out.println("");
 	 				}	
 				}
 				%>
 			<span>
 				<i class="fa fa-user"></i>
 				<input type="text" placeholder="Username" name="username">
 			</span><br>
 			<span>
 				<i class="fa fa-lock"></i>
 				<input type="password" placeholder="Password" name="password">
 			</span><br>
 				<button type="submit">LOGIN</button>
 		</form>
 	</div>
 </div>

</body>
</html>