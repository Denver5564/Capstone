<%@ page import="models.*, controllers.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<jsp:useBean id = "cart" class = "models.CartModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "cart" />
	
	<jsp:useBean id = "cartlog" class = "models.CartModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "cartlog" />

<%

	if (CartController.SaveCart(cart) && CartLogController.SaveCart(cartlog)) {
		response.sendRedirect("/IceCream/account/customer/cart.jsp");
	} else {
		response.sendRedirect("/IceCream/?error=CartError");
	}

%>