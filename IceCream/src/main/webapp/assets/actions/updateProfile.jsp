<%@ page import="models.*, controllers.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<jsp:useBean id = "user" class = "models.UserModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "user" />
	
	<jsp:useBean id = "profile" class = "models.ProfileModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "profile" />
	
	<jsp:useBean id = "address" class = "models.AddressModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "address" />

<%

	if (UserController.updateUser(user) && ProfileController.updateProfile(profile) && AddressController.updateAddress(address)) {
		response.sendRedirect("/IceCream/account/customer/profile.jsp");
	} else {
		response.sendRedirect("/IceCream/?error=ProfileUpdateError");
	}

%>