<%@ page import = "models.UserModel, controllers.AuthController, utils.StringUtils" %>

<jsp:useBean id = "user" class = "models.UserModel"></jsp:useBean>
<jsp:setProperty property = "*" name = "user" />

<%
	UserModel result = AuthController.Authenticate(user);

	switch (result.getUsertype()) {
		case 1:
			session.setAttribute("id", result.getId());
			session.setAttribute("username", result.getUsername());
			session.setAttribute("password", result.getPassword());
			session.setAttribute("session_id", StringUtils.generateUUID());
			
			response.sendRedirect("/IceCream/index.jsp");
			break;
		case 2:
			session.setAttribute("id", result.getId());
			session.setAttribute("username", result.getUsername());
			session.setAttribute("password", result.getPassword());
			session.setAttribute("session_id", StringUtils.generateUUID());
			
			response.sendRedirect("/IceCream/account/");
			break;
		default:
			response.sendRedirect("/IceCream/account/auth/login.jsp?error=invalid");
			break;
	}

%>