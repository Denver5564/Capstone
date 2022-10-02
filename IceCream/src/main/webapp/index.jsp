<%@ page import="models.ProductModel, controllers.ProductController, controllers.CategoryController, java.util.List" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<% 
	int i = 1;
	List<ProductModel> productList = ProductController.getAllProduct();
	request.setAttribute("productList", productList);
	
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
  <link rel="icon" type="image" href="assets/images/index/logo.png">

  <!-- FONT AWESOME -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />

  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/style.css" />
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

  <header id="header">
    <a href="index.jsp"><img class="logo " src="assets/images/index/logo.png"> </a>
    <nav>
      <ul id="navbar">
        <li><a class="focus" href="#">Home</a></li>
        <li><a href="#product">Products</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="#">Review</a></li>
        <li class="icon">
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

  <main>
    <section id="hero">
      <div class="hero-container">
        <h2> The best Ice cream </h2>
        <h1>
          You can get!</h1>
        <p>Panlasang Pinoy para sa Pilipino </p>

        <div class="hero-btn">
          <a href=""><button>PROMO</button></a>
          <a href="category.jsp"><button>BUY NOW</button></a>
        </div>
      </div>
    </section>

    <section id="services" class="section-padding1">
      <div class="service-item">
        <img src="assets/images/index/services1.png" alt="">
        <h3>Online Order</h3>
      </div>
      <div class="service-item">
        <img src="assets/images/index/services2.png" alt="">
        <h3>Free Shipping</h3>
      </div>
      <div class="service-item">
        <img src="assets/images/index/services3.png" alt="">
        <h3>Thrifty</h3>
      </div>
      <div class="service-item">
        <img src="assets/images/index/services4.png" alt="">
        <h3>Promotions</h3>
      </div>
      <div class="service-item">
        <img src="assets/images/index/services5.png" alt="">
        <h3>Transactions</h3>
      </div>
      <div class="service-item">
        <img src="assets/images/index/services6.png" alt="">
        <h3>24/7 Chat bot</h3>
      </div>
    </section>

    <section id="product" class="section-padding1">
      <h2>Featured Products</h2>
      <div class="product-container">

		<c:forEach items="${ productList }" var="data">
			<c:if test = "${ data.getCategoryId() < 3 }">
				<div class="product-item">
					<a href="/IceCream/product.jsp?item=${ data.getId() }"><img src="/IceCream/assets/images/index/${ data.getImagePath() }" alt="" /></a>
					<span>${ CategoryController.getCategory(data.getCategoryId()).getCategoryName() }</span>
					<h4>${ data.getName() }</h4>
					<div class="star">
						<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
	              		<i class="fa-solid fa-star"></i>
					</div>
					<h3>P ${ data.getPrice() }.00</h3>
					<a href="/IceCream/product.jsp?item=${ data.getId() }"><i class="cart fa-solid fa-cart-plus"></i></a>
				</div>
			</c:if>
		</c:forEach>

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
					<a href="/IceCream/product.jsp?item=${ data.getId() }"><i class="cart fa-solid fa-cart-plus"></i></a>
				</div>
			</c:if>
		</c:forEach>

      </div>
    </section>
  </main>

  <footer id="footer">
    <p>Copyright Ice Cream. All rights Reserved</p>
  </footer>

  <script src="assets/js/script.js"></script>
</body>

</html>

