<%@ page import="models.CartModel, models.ProductModel, controllers.CartController, controllers.ProductController, java.util.List, utils.StringUtils" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

	int id = (int) session.getAttribute("id");

	List<CartModel> cartList = CartController.getAllCart();
	request.setAttribute("cartList", cartList);

%>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Cart</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/cart.css" />
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

   <script src="/IceCream/assets/js/cartscript.js" async></script>

</head>

<body>
   <div id="sidebar">
      <div class="sidebar-logo1">
         <img src="images/3.png" class="sidebar-logo">
      </div>

      <button class="accordion"><i class="fas fa-shopping-bag"></i> Products</button>
      <div class="panel">
         <a href="#content1"><button class="panel-button">Manage Product</button></a>
         <a href="#content2"><button class="panel-button">Add Product</button></a>
      </div>

      <button class="accordion"><i class="fa-solid fa-list-check"></i> Orders</button>
      <div class="panel">
         <a href="order.html"><button class="panel-button">Manage Order</button></a>
         <a href="usermanage.html"><button class="panel-button">Manage Users</button></a>
      </div>

      <button class="accordion"><i class="fas fa-flag"></i> Order</button>
      <div class="panel">
         <a href="cart.html"><button class="panel-button">Cart</button></a>
      </div>

      <button class="accordion"><i class="fa fa-user"></i> My Account</button>
      <div class="panel">
         <a href="#content3"><button class="panel-button">Account Settings</button></a>
      </div>


      <button class="logout"><i class="fa fa-sign-out"></i> Sign Out</button>

   </div>

   <!-- PAGE CONTENT -->
   <div id="content1">
      <div id="page-header1">
         <div class="page-path">
            <span>Order > Cart </span>
         </div>
      </div>

      <div id="manage-navbar">
         <nav>
            <ul id="navbar">
               <li><button type="button" class="btn btn-primary" data-toggle="collapse"
                     data-target="#demo1">All</button></li>
               <li><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo2">To
                     Pay</button></li>
               <li><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo2">To
                     Ship</button></li>
               <li><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo3">To
                     Recieve</button></li>
               <li><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo4">To
                     Completed</button></li>
               <li><button type="button" class="btn btn-primary" data-toggle="collapse"
                     data-target="#demo5">Cancelled</button></li>
               <li><span class="glyphicon glyphicon-shopping-cart my-cart-icon"><span
                        class="badge badge-notify my-cart-badge"></span></span></li>
            </ul>
         </nav>
      </div>

      <div class="container-cart">
         <h2 class="container-header">YOUR CART</h2>
         <div class="cart-row">
            <span class="cart-item cart-header cart-column">ITEM</span>
            <span class="cart-vendor cart-header cart-column">VENDOR</span>
            <span class="cart-quantity cart-header cart-column">QUANTITY</span>
            <span class="cart-price cart-header cart-column">PRICE</span>
         </div>
         <div class="cart-items">
         <c:forEach items="${ cartList }" var="data">
         	<c:if test = "${ !cartList.isEmpty() }">
         		<c:if test = "${ data.getUserId() == id }">
		         	<div class="cart-row">
		               <div class="cart-item cart-column">
		                  <img class="cart-item-image" src="/IceCream/assets/images/index/${ ProductController.getProduct(data.getProductId()).getImagePath() }" width="100" height="100">
		                  <span class="cart-item-title">${ ProductController.getProduct(data.getProductId()).getName() }</span>
		               </div>
		               <span class="cart-vendor-name cart-column">${ ProductController.getProduct(data.getProductId()).getSeller_Id() }</span>
		               <div class="cart-quantity cart-column">
		                  <input class="cart-quantity-input" type="number" value="${ data.getQuantity() }">
		                  <button class="btn btn-danger" type="button">REMOVE</button>
		               </div>
		               <span class="cart-price cart-column">₱ ${ ProductController.getProduct(data.getProductId()).getPrice() * data.getQuantity() }</span>
		            </div>
         		</c:if>
         	</c:if>
         </c:forEach>

         <div class="cart-total">
            <strong class="cart-total-title">Total</strong>
            <span class="cart-total-price"></span>
         </div>
         <% 
         	if (CartController.getCartByUser((int) session.getAttribute("id")) != null) { 
         		int totalPrice = 0;
         		int seller_Id1 = 0;
         		for(CartModel cart : CartController.getAllCart()) {
         			if (cart.getUserId() == (int) session.getAttribute("id")) {
         				totalPrice += (ProductController.getProduct(cart.getProductId()).getPrice() * cart.getQuantity());
         				seller_Id1 = cart.getSeller_Id();
         			}
         		}
         %>
         	<form method="POST" action="/IceCream/assets/actions/saveOrder.jsp">
         		<input type="hidden" value="<%= session.getAttribute("id") %>" name="userId" />
         		<input type="hidden" value="<%= CartController.getCartByUser((int) session.getAttribute("id")).getSessionId() %>" name="sessionId" />
         		<input type="hidden" value="<%= seller_Id1 %>" name="seller_Id" />
         		<input type="hidden" value="<%= StringUtils.translateDateTime() %>" name="orderDate" />
         		<input type="hidden" value="<%= totalPrice %>" name="totalPrice" />
         		<input type="hidden" value="1" name="status" />
         		<input type="hidden" value="<%= StringUtils.translateDateTime() %>" name="createdAt" />
         		<button type="submit" class="btn btn-primary">PURCHASE</button>
         	</form>
         <% } %>
      </div>

   </div>

   <script src="/IceCream/assets/js/settings/sidebar.js"></script>
   <script src="/IceCream/assets/js/settings/seller_page_header.js"></script>
</body>

</html>