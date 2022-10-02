<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controllers.*, models.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
	ProductModel product = new ProductModel();
	List<ProductModel> list = ProductController.getAllProductCategory();
	request.setAttribute("list", list);
	
	List<ProductModel> productList = ProductController.getAllProduct();
	request.setAttribute("productList", productList);
	
	String username=(String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="/IceCream/assets/css/userHomepage.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <title>Document</title>
   
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
        <li><input type="text" class="search-bar"></li>

        <li class="icon">
          <a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
        </li>
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
      <div id="hp-content" class="section-padding1">         
         <section id="con-cat" class="con-category">
            <div class="cat-title">CATEGORIES</div>
            
			<c:forEach items="${list}" var="u">
			            <a href="">
			               <div class="con-category-item"> 
			                  <img src="assets/images/index/${ u.getCategory_image()}" alt="">
			                  <h3>${ u.getCategory_name()}</h3>
			               </div>
			            </a>
			</c:forEach>
			
         </section>

         <section id="con-reg1" class="con-reg">
            <div class="reg-title">PRODUCTS</div>

         <div class="con-reg1-container">
    
<c:forEach items="${productList}" var="u">
            <a href="/IceCream/product.jsp?item=${ u.getId() }">
            <div class="con-reg1-item">
               <img src="assets/images/index/${ u.getImagePath() }" alt="">
               <div class="con-reg1-description">
                 <span>${ u.getCategory_name() }</span>
                 <h4>${ u.getName()}</h4>
                 <h3>&#8369; ${ u.getPrice() }</h3>
               </div>
             </div>
            </a>
</c:forEach>
      
         </div>

         </section>
      </div>
   </main>
</body>
</html>