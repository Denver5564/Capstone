<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.*, models.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String seller=(String)session.getAttribute("Id");
	ProfileModel u= ProfileController.getProfile(Integer.parseInt(seller));
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="/IceCream/assets/css/seller_sidebaronly.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/seller_index.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
   <script src="/IceCream/assets/js/seller_datatables.js"></script>

</head>
<body>
   <div id="sidebar">
         <div class="sidebar-logo1">
            <img src="/IceCream/assets/images/index/logo.png" class="sidebar-logo">
         </div>
         
         <button class="accordion"><i class="fa fa-shopping-bag"></i> Products</button>
            <div class="panel">
               <a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=all"><button class="panel-button">Manage Products</button></a>
               <a href="http://localhost:8080/IceCream/account/seller/seller_add_product.jsp"><button class="panel-button">Add Product</button></a>
            </div>

         <button class="accordion"><i class="fa fa-list"></i> Orders</button>
            <div class="panel">
               <a href="seller_manage_order.jsp"><button class="panel-button">Manage Orders</button></a>
            </div>

         <button class="accordion"><i class="fa fa-question-circle"></i> Support</button>
         <div class="panel">
            <a href="#content3"><button class="panel-button">Help Center</button></a>
         </div>
            
         <button class="accordion"><i class="fa fa-user"></i> My Account</button>
            <div class="panel">
               <a href="#content3"><button class="panel-button">Account Settings</button></a>
            </div>
            
         
         <button class="logout"><i class="fa fa-sign-out"></i> Sign Out</button>

   </div>
 
<!-- PAGE CONTENT -->
<div id="content1" >
   <div id="welcome">
      <p>WELCOME BACK <%= u.getFirstName() %></p>
   </div>
</div>
</body>
<script src="js/url.js"></script>
<script src="/IceCream/assets/js/seller_sidebar.js"></script>
</html>