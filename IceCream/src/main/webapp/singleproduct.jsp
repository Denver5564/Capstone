<%@ page import="models.ProductModel, models.CartModel, controllers.ProductController, controllers.CartController, controllers.CategoryController, java.util.List, utils.StringUtils" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	
	int i = 1;
	ProductModel product = new ProductModel();
	CartModel cart = new CartModel();

	List<ProductModel> productList = ProductController.getAllProduct();
	List<CartModel> cartList = CartController.getAllCart();

	request.setAttribute("productList", productList);
	
	if (request.getParameter("item") != null) {
		product = ProductController.getProduct(Integer.parseInt(request.getParameter("item")));
	} else {
		response.sendRedirect("/IceCream/?error=invalid");	
	}
	
	String username=(String)session.getAttribute("username");
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ice Cream ni Denver</title>

    <!-- FAVICON -->
    <link rel="icon" type="image" href="images/logo.png">

    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- CSS -->
    <link rel="stylesheet" href="/IceCream/assets/css/product1.css" />

<style>
		.dropbtn {
		  background-color: transparent;
		  color: #603913;
		  padding: 16px;
		  font-size: 16px;
		  border: none;
		}
		
		.dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #f1f1f1;
		  min-width: 160px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		  z-index: 1;
		}
		
		.dropdown-content a {
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		}
		
		.dropdown-content a:hover {background-color: #ddd;}
		
		.dropdown:hover .dropdown-content {display: block;}
	</style>
	
  </head>

  <body>

<!-- Header -->
   <header id="header">
      <a href="#"><img class="logo " src="/IceCream/assets/images/index/logo.png"> </a>
      <nav >
        <ul id="navbar">
        <li><input type="text" class="search-bar"></li>

        <li class="icon">
          <a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
        </li>
        <li  class="icon">
          <a href="#"><i class="fa-solid fa-cart-plus"></i></a>
        </li>
        <%
			if(session.getAttribute("id")== null){ 
%> 
			
<%} else{%>
        <li class="icon">
          <div class="dropdown">
		  	<button class="dropbtn"><i class="fa-solid fa-user"></i></button>
			  <div class="dropdown-content">
			    <a href="#"><%= username %></a>
			    <a href="#">Purchases</a>
			    <a href="/IceCream/account/auth/logout.jsp">Logout</a>
			  </div>
		</div>
        </li>
        <% } %>
        <li>
            <a href="#"><i id="close" class="fa-solid fa-xmark"></i></a>
        </li>
    </ul>


      <div id="mobile">
         <i class="fa-solid fa-magnifying-glass"></i>
         <i class="fa-solid fa-cart-plus"></i>
         <i class="fa-solid fa-user"></i>
         <i id="bar" class="fa-solid fa-bars"></i>
      </div>
      </nav>
   </header>
<!-- Header last line -->

<main>
   <section id="product-single" class="section-padding1">
      <div class="product-single-container">

         <div class="product-info" >
            <img src="/IceCream/assets/images/index/<%= product.getImagePath() %>" alt="">
         </div>
         
         <div class="product-desc">
          <div class="product-cat-path">
            <span>Home / <%= CategoryController.getCategory(product.getCategoryId()).getCategoryName() %></span>
          </div>
            <div class="product-name">
               <h1><%= product.getName() %></h1>
            </div>

            <div class="product-rating">
               <span>250 Ratings</span>
               <span>2.2k Sold</span>
            </div>

            <div class="product-price">
               <h1>₱<%= product.getPrice() %>.00</h1>
            </div>
 <% if (session.getAttribute("id") != null) { 
          		int userId = (int) session.getAttribute("id");
          		String sessionId = (String) session.getAttribute("session_id");
          	%>
<form method="POST" action="/IceCream/assets/actions/saveCart.jsp">
            
            <div class="product-shop">
			      <input type="hidden" name="userId" value="<%= session.getAttribute("id") %>" />
			      <input type="hidden" name="sessionId" value="<%= CartController.getCartByUser(userId) == null ? sessionId : CartController.getCartByUser(userId).getSessionId() %>" />
			      <input type="hidden" name="productId" value="<%= product.getId() %>" />
			      <input type="hidden" name="createdAt" value="<%= StringUtils.translateDateTime() %>" />
			      <input type="hidden" name="seller_Id" value="<%= product.getSeller_Id() %>" />   	
			      <h2>Quantity</h2>
			      <input type="number" name="quantity" value="1" class="quantity" min="1" max="<%= product.getStock() %>">
			      <p>&nbsp;<%= product.getStock() %> pieces available</p>
            </div>
</form>
            <div class="product-shop">
              <button class="add-cart" style="margin-top: 30px;">
              	<span class="fa fa-shopping-cart"> Add to cart</span>
              </button>
            </div>
	         <% } else { %>
	         <div class="product-shop">
	         	<form action="/IceCream/account/auth/login.jsp">
	         	
		         	<button class="add-cart" type="submit">
		         		<span class="fa fa-shopping-cart"></span> Login Now!
		         	</button>		         
	         	</form>
	         	</div>
	         <% } %>
	         
         </div>
      </div>
   </section>

   <section id="store-section" class="store-section-padding2">
      <div class="store-section-container">
        <div class="store-dp" >
          <img src="images/IceCream1.jpg" alt="">
        </div>
        
        <div class="store-name" >
          <p class="name">Selecta Philippines
            <button class="view-store fa-solid fa-house">View Shop</button>
          </p>
        </div>
        
        <div class="store-details">
          <span>Joined 26 months ago</span>
          <span>Products 121</span>
          <span class="last-online">Active 5 mins ago</span>
        </div>
      </div>
    </section> 

    <section id="store-product-details" class="store-section-padding2">
      <div class="product-container">
        <div class="float-child1">
          <div class="product-spec">
            <span>Product Specification</span>
            <div class="spec-info">

              <table>
                <tr>
                  <th>Category</th>
                  <td>Ice Cream / Tubs</td>
                </tr>
                <tr>
                  <th>Brand</th>
                  <td>Selecta</td>
                </tr>
                <tr>
                  <th>Country of Origin</th>
                  <td>Philippines</td>
                </tr>
                <tr>
                  <th>Type</th>
                  <td>Tubs</td>
                </tr>
                <tr>
                  <th>Flavor</th>
                  <td>Cookies & Cream</td>
                </tr>
                <tr>
                  <th>Shelf Life</th>
                  <td>24 Months</td>
                </tr>
                <tr>
                  <th>Weight</th>
                  <td>1.75kg</td>
                </tr>
                <tr>
                  <th>Stock</th>
                  <td>3</td>
                </tr>
                <tr>
                  <th>Ship From</th>
                  <td>San Juan, Metro Manila</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="float-child2">
          <h3>Suggested Product</h3>
          <div class="suggested-product">
            <img src="images/CakeIceCream1.jpg">
            <h4>Sprinkles</h4>
            <h3>P30.00</h3>
          </div>

          <div class="suggested-product">
            <img src="images/CakeIceCream2.jpg">
            <h4>Maraschino cherries
            </h4>
            <h3>P30.00</h3>
          </div>

          <div class="suggested-product">
            <img src="images/CakeIceCream3.jpg">
            <h4>Chololate Nips
            </h4>
            <h3>P30.00</h3>
          </div>
        </div>
      </div>
    </section>


<section id="ingredients" class="section-padding1">
      <h2>Featured Ingredients</h2>
      <div class="ingredients-container">

		<c:forEach items="${ productList }" var="data">
			<c:if test = "${ data.getCategoryId() == 3 }">
				<div class="ingredients-item">
					<img src="/IceCream/assets/images/index/${ data.getImagePath() }" alt="" />
					<span>${ CategoryController.getCategory(data.getCategoryId()).getCategoryName() } <%= i++ %></span>
					<h4>${ data.getName() }</h4>
					<div class="star">
						<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
					</div>
					<h3>P ${ data.getPrice() }.00</h3>
					<a href="#"><i class="cart fa-solid fa-cart-plus"></i></a>
				</div>
			</c:if>
		</c:forEach>
        
      </div>
</section>
</main>

<footer id="footer">
  <p>ⓒ Copyright Ice Cream. All rights Reserved</p>
</footer>
























</main>

    <script src="/IceCream/assets/js/script.js"></script>
  </body>
</html>
