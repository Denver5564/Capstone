<%@ page import="models.*, controllers.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<jsp:useBean id = "cart" class = "models.CartModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "cart" />
	
	<jsp:useBean id = "order" class = "models.OrderModel"></jsp:useBean>
	<jsp:setProperty property = "*" name = "order" />

<%

	if (CartController.deleteCart(cart) && OrderController.SaveCart(order)) {
		response.sendRedirect("/IceCream/account/customer/purchase.jsp?order=Success");
	} else {
		response.sendRedirect("/IceCream/account/customer/cart.jsp?order=Error");
	}

%>